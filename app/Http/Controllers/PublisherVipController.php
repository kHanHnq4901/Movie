<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Bookmark;
use App\Models\Payment;
use App\Models\Category;
use App\Models\Genre;
use App\Models\Country;
use App\Models\Publisher;
use Session;
use App\Http\Requests\RegisterVipRequest;
use Carbon\Carbon;

class PublisherVipController extends Controller
{
    //

    public function index()
    {

        if (!Session::has('publisher_id')) {
            toastr()->error('Để nâng cấp tài khoản', 'Vui lòng đăng nhập !!!');
            return redirect()->route('homepage');
        }

        $meta_title = 'Nâng cấp tài khoản';
        $products = Product::where('status', 1)->get();
        $bookmark = Bookmark::with('publisher')->with('movie')->where('publisher_id',Session::get('publisher_id'))->get();
        $category = Category::orderBy('id','ASC') ->where('status', 1)->get();
        $genre = Genre::orderBy('id','DESC') ->get();
        $country = Country::orderBy('id','DESC') ->get();

        return view('pages.vip', compact('products', 'meta_title', 'bookmark', 'category', 'genre', 'country'));
    }

    public function registerVip(RegisterVipRequest $request)
    {
        $product_id = $request->product;
        $product = Product::find($product_id);

        if (!$product) {
            toastr()->error('Thông báo', 'Thông tin gói không hợp lệ');
            return redirect()->back();
        }

        $price = $product->price;
        if ($product->discount) {
            $price = ((100 - $product->discount) * $product->price)  /  100 ;
        }
        $username = Session::get('username');
        Session::put('product_id', $product->id);

        $vnp_TxnRef = $this->randString(15); //Mã đơn hàng. Trong thực tế Merchant cần insert đơn hàng vào DB và gửi mã này sang VNPAY
        $vnp_OrderInfo = 'Tai khoan '. $username . ' thuc hien nang cap them '. $product->number_month . 'thang.';
        $vnp_OrderType = 'billpayment';
        $vnp_Amount = $price * 100;
        $vnp_Locale = 'vn';
        $vnp_IpAddr = $_SERVER['REMOTE_ADDR'];
        $startTime = date("YmdHis");

        $inputData = array(
            "vnp_Version" => "2.1.0",
            "vnp_TmnCode" => Payment::VNP_TMN_CODE,
            "vnp_Amount" => $vnp_Amount,
            "vnp_Command" => "pay",
            "vnp_CreateDate" => $startTime,
            "vnp_CurrCode" => "VND",
            "vnp_IpAddr" => $vnp_IpAddr,
            "vnp_Locale" => $vnp_Locale,
            "vnp_OrderInfo" => "Thanh toan GD: " . $vnp_OrderInfo ,
            "vnp_OrderType" => $vnp_OrderType,
            "vnp_ReturnUrl" => route('vnpay.return'),
            "vnp_TxnRef" => $vnp_TxnRef
        );

        if (isset($vnp_BankCode) && $vnp_BankCode != "") {
            $inputData['vnp_BankCode'] = $vnp_BankCode;
        }

        ksort($inputData);
        $query = "";
        $i = 0;
        $hashdata = "";
        foreach ($inputData as $key => $value) {
            if ($i == 1) {
                $hashdata .= '&' . urlencode($key) . "=" . urlencode($value);
            } else {
                $hashdata .= urlencode($key) . "=" . urlencode($value);
                $i = 1;
            }
            $query .= urlencode($key) . "=" . urlencode($value) . '&';
        }

        $vnp_Url = Payment::VNP_URL . "?" . $query;

        if (Payment::VNP_HASH_SECRET) {

            $vnpSecureHash =  hash_hmac('sha512', $hashdata, Payment::VNP_HASH_SECRET);//
            $vnp_Url .= 'vnp_SecureHash=' . $vnpSecureHash;
        }

        return redirect($vnp_Url);
    }

    public function vnpayReturn(Request $request)
    {
        if (session()->has('product_id')) {

            $product_id = Session::get('product_id');
            $publisher_id = Session::get('publisher_id');

            $product = Product::find($product_id);

            if (!$product) {
                toastr()->error('Thông báo', 'Thông tin gói không hợp lệ');
                return redirect()->back();
            }

            $price = $product->price;
            if ($product->discount) {
                $price = ((100 - $product->discount) * $product->price)  /  100 ;
            }

            $vnpayData = $request->except('payment');
            $dataPayment = [
                'publisher_id' => $publisher_id,
                'product_id' => $product->id,
                'number_month' => $product->number_month,
                'discount' => $product->discount,
                'transaction_code' => $vnpayData['vnp_TxnRef'],
                'money' => $price,
                'note' => $vnpayData['vnp_OrderInfo'],
                'vnp_response_code' => $vnpayData['vnp_ResponseCode'],
                'code_vnpay' => $vnpayData['vnp_TransactionNo'],
                'code_bank' => $vnpayData['vnp_BankCode'],
                'time_payment' => date('Y-m-d H:i', strtotime($vnpayData['vnp_PayDate'])),
                'method' => 'METHOD_VNPAY',
            ];

            $dataPayment['status'] = 1;

            if ($request->vnp_ResponseCode !== '00') {
                $dataPayment['status'] = 0;
            }

            \DB::beginTransaction();
            try {

                if (Payment::insert($dataPayment)) {
                    $publisher = Publisher::find($publisher_id);

                    $currentTime = Carbon::now()->format('Y-m-d');
                    if ($publisher->end_vip < $currentTime) {
                        $start_vip = $currentTime;
                        $end_vip = Carbon::now()->addMonth($product->number_month)->format('Y-m-d');
                        $publisher->start_vip = $start_vip;
                        $publisher->end_vip = $end_vip;
                    } else {
                        $end_vip = Carbon::parse($publisher->end_vip)->addMonth($product->number_month)->format('Y-m-d');
                        $publisher->end_vip = $end_vip;
                    }

                    $publisher->save();

                    Session::put('end_vip', $end_vip);
                    Session::put('is_vip', 1);
                    Session::forget('product_id');
                }

                \DB::commit();
                toastr()->success('Đăng ký nâng cấp dịch vụ thành công !', 'Chúc mừng');
                return redirect()->route('user.vip.index');

            } catch (\Exception $exception) {

                \DB::rollBack();
                toastr()->error('Thông báo', 'Đã xảy ra lỗi không thể thanh toán dịch vụ');
                return redirect()->route('user.vip.index');
            }
        }

        toastr()->error('Thông báo', 'Đã xảy ra lỗi không thể thanh toán dịch vụ');
        return redirect()->back();
    }

    public function historyRegisterVip()
    {
        if (!Session::has('publisher_id')) {
            toastr()->error('Để nâng cấp tài khoản', 'Vui lòng đăng nhập !!!');
            return redirect()->route('homepage');
        }
        $publisher_id =  Session::get('publisher_id');

        $meta_title = 'Lịch sử nâng cấp tài khoản';
        $bookmark = Bookmark::with('publisher')->with('movie')->where('publisher_id', $publisher_id)->get();
        $category = Category::orderBy('id','ASC') ->where('status', 1)->get();
        $genre = Genre::orderBy('id','DESC') ->get();
        $country = Country::orderBy('id','DESC') ->get();

        $payments = Payment::with(['product'])->where('publisher_id', $publisher_id)->orderByDesc('id')->paginate(20);

        return view('pages.history_vip', compact('meta_title', 'bookmark', 'category', 'genre', 'country', 'payments'));
    }

    public function randString($length){
        $chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        $str = '';
        $size = strlen($chars);
        for ($i = 0; $i < $length; $i++) {
            $str .= $chars[rand(0, $size - 1)];
        }

        return $str;
    }

    public function payments(Request $request)
    {
        $payments = Payment::with(['product', 'publisher'])->orderByDesc('id')->paginate(20);

        return view('admincp.payment.index', compact('payments'));
    }

    public function paymentDestroy($id)
    {
        $payment = Payment::find($id);
        if (!$payment) {
            toastr()->error('Đã xảy ra lỗi không thể xóa giao dịch !!!', 'Thông báo !!');
            return redirect()->back();
        }

        \DB::beginTransaction();
        try {
            $payment->delte();
            \DB::commit();
            toastr()->success('Xóa thành công !!!', 'Thông báo !!');
        } catch (\Exception $exception) {
            \DB::rollBack();
            toastr()->error('Đã xảy ra lỗi không thể xóa giao dịch !!!', 'Thông báo !!');
            return redirect()->back();
        }
    }
}
