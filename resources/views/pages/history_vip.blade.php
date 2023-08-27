@extends('layout')
@section('content')
    <div class="row container" id="wrapper">
        <div class="halim-panel-filter">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-xs-6">
                    </div>
                </div>
            </div>
            <div id="ajax-filter" class="panel-collapse collapse" aria-expanded="true" role="menu">
                <div class="ajax"></div>
            </div>
        </div>
        <main id="main-contents" class="col-xs-12 col-sm-12 col-md-8">
            <section>
                <div class="section-bar clearfix">
                    <h1 class="section-title" style="float: none !important;"><span style="float: none !important;">Lịch sử nâng cấp lên tài khoản vip</span></h1>
                </div>
                <div class="halim_box">
                    <div id="halim-ajax-popular-post" class="popular-post">
                        <p style="text-align: center; margin: 30px 0px; text-transform: uppercase">Danh sách giao dịch nâng cấp tài khoản của bạn</p>

                    </div>
                    <div class="col-12">
                        <table class="table table-bordered table-history-payment">
                            <thead>
                                <tr>
                                    <td scope="col">STT</td>
                                    <td scope="col">Mã giao dịch</td>
                                    <td scope="col">Code Vnpay</td>
                                    <td scope="col">Số tháng</td>
                                    <td scope="col">Số tiền</td>
                                    <td scope="col">Ngân hàng</td>
                                    <td scope="col">Thời gian TT</td>
                                    <td scope="col">Trạng thái</td>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($payments as $key => $payment)
                                    <tr>
                                        <td scope="row">{{ $key + 1 }}</td>
                                        <td>{{ $payment->transaction_code }}</td>
                                        <td>{{ $payment->code_vnpay }}</td>
                                        <td>{{ $payment->number_month }}</td>
                                        <td>{{ number_format($payment->money,0,',','.') }} đ</td>
                                        <td>{{ $payment->code_bank }}</td>
                                        <td>{{ date('Y-m-d H:i', strtotime($payment->time_payment)) }}</td>
                                        <td>{{ $payment->status == 1 ? 'Thành công' : 'Đã xảy ra lỗi' }}</td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="text-center">
                    {!! $payments->links("pagination::bootstrap-4") !!}
                </div>
            </section>
        </main>
        @include('pages.include.sidebar')
    </div>
@endsection
