@extends('layouts.app')

@section('content')
    <div class="row justify-content-center">
        <table class="table table-bordered table-hover" id="tableMovie">
            <thead class="thead-dark">
            <tr>
                <th scope="col">STT</th>
                <th scope="col">Mã giao dịch</th>
                <th scope="col">Code Vnpay</th>
                <th scope="col">Người dùng</th>
                <th scope="col">Gói mua</th>
                <th scope="col">Số tháng</th>
                <th scope="col">Số tiền</th>
                <th scope="col">Ngân hàng</th>
                <th scope="col">Thời gian TT</th>
                <th scope="col">Trạng thái</th>
                {{--<th scope="col">Hành Động</th>--}}
            </tr>
            </thead>
            <tbody class="order_position">
                @foreach($payments as $key => $payment)
                    <tr>
                        <td>{{ $key + 1 }}</td>
                        <td>{{ $payment->transaction_code }}</td>
                        <td>{{ $payment->code_vnpay }}</td>
                        <td>{{ isset($payment->publisher) ? $payment->publisher->name : '' }}</td>
                        <td>{{ isset($payment->product) ? $payment->product->name : '' }}</td>
                        <td>{{ $payment->number_month }}</td>
                        <td>{{ number_format($payment->money,0,',','.') }} đ</td>
                        <td>{{ $payment->code_bank }}</td>
                        <td>{{ date('Y-m-d H:i', strtotime($payment->time_payment)) }}</td>
                        <td>{{ $payment->status == 1 ? 'Thành công' : 'Đã xảy ra lỗi' }}</td>
                        {{--<td>--}}
                            {{--{!! Form::open(['method' => 'DELETE','route'=>['payment.destroy', $payment->id],'onsubmit'=> 'return confirm("Bạn có muốn xóa")']) !!}--}}
                            {{--{!! Form::submit('Xóa', ['class' => "btn btn-danger"]) !!}--}}
                            {{--{!! Form::close() !!}--}}
                        {{--</td>--}}
                    </tr>
                @endforeach
            </tbody>
        </table>

    </div>
@endsection
