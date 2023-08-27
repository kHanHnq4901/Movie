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
                    <h1 class="section-title" style="float: none !important;"><span style="float: none !important;">Nâng cấp lên tài khoản vip</span></h1>
                </div>
                <div class="halim_box" style="margin: auto; width: 60%">
                    <div id="halim-ajax-popular-post" class="popular-post">
                        <p style="text-align: center; margin: 30px 0px; text-transform: uppercase">Thực hiện chọn gói để nâng cấp tài khoản của bạn</p>
                        <div>
                            <p>Khi mua gói theo tháng thời gian sẽ được cộng thêm số ngày đã có</p>
                            @php
                                $end_vip = Session::get('end_vip');
                                $currentTime = \Carbon\Carbon::now();
                            @endphp
                            @if ($end_vip >= $currentTime)
                                <p style="margin-bottom: 20px">Tài khoản {{ Session::get('username') }} sẽ hết hạn vip vào ngày <b>{{ Session::get('end_vip') }}</b></p>
                            @endif
                        </div>
                        <form action="{{ route('register.vip') }}" method="POST">
                            <div class="form-group {{ $errors->first('product') ? 'has-error' : '' }}">
                                <label for="product"> Chọn gói nâng cấp <span class="text-danger">(*)</span></label>
                                <select class="form-control" name="product">
                                    <option value="">Chọn số tháng muốn nâng cấp</option>
                                    @foreach($products as $product)
                                        @php
                                            $price = $product->price;
                                            if ($product->discount) {
                                                $price = ((100 - $product->discount) * $product->price)  /  100 ;
                                            }
                                        @endphp
                                        <option value="{{ $product->id }}" price="{{ number_format($product->price,0,',','.') }} đ" price_discount="{{ number_format($price,0,',','.') }} đ">{{ $product->name }} - {{ number_format($price,0,',','.') }} đ</option>
                                    @endforeach
                                </select>
                                @if ($errors->first('product'))
                                    <span class="text-danger">{{ $errors->first('product') }}</span>
                                @endif
                            </div>
                            <div class="form-group text-center">
                                @csrf
                                <button type="submit" class="btn btn-warning">
                                    THANH TOÁN DỊCH VỤ
                                </button>

                            </div>
                        </form>
                    </div>
                    <div class="text-center">
                    </div>
                </div>
            </section>
        </main>
        @include('pages.include.sidebar')
    </div>
@endsection
