<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
  <head>
    <title>
      Admin
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta
      name="keywords"
      content="Admin web phim"
    />
    <script type="application/x-javascript">
      addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);

                      function hideURLbar() { window.scrollTo(0, 1); }
    </script>
    {{-- multiple genre --}}
    <link
    rel="stylesheet"
    href="https://cdn.jsdelivr.net/gh/habibmhamadi/multi-select-tag/dist/css/multi-select-tag.css"
    />
    <link
            rel="stylesheet"
            href="//cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css"
        />

    <!-- Bootstrap Core CSS -->
    <link href="{{asset('backend/css/bootstrap.css')}}" rel="stylesheet" type="text/css" />
    <!-- Custom CSS -->
    <link href="{{asset('backend/css/style.css')}}" rel="stylesheet" type="text/css" />
    <!-- font-awesome icons CSS -->
    <link href="{{asset('backend/css/font-awesome.css')}}" rel="stylesheet" />
    <!-- //font-awesome icons CSS-->
    <!-- side nav css file -->
    <link
      href="{{asset('backend/css/SidebarNav.min.css')}}"
      media="all"
      rel="stylesheet"
      type="text/css"
    />
    <!-- //side nav css file -->
    <!-- js-->
    <script src="{{asset('backend/js/jquery-1.11.1.min.js')}}"></script>
    <script src="{{asset('backend/js/modernizr.custom.js')}}"></script>
    <!--webfonts-->
    <link
      href="//fonts.googleapis.com/css?family=PT+Sans:400,400i,700,700i&amp;subset=cyrillic,cyrillic-ext,latin-ext"
      rel="stylesheet"
    />
    <!--//webfonts-->
    <!-- chart -->
    <script src="{{asset('backend/js/Chart.js')}}"></script>
    <!-- //chart -->
    <!-- Metis Menu -->
    <script src="{{asset('backend/js/metisMenu.min.js')}}"></script>
    <script src="{{asset('backend/js/custom.js')}}"></script>
    <link href="{{asset('backend/css/custom.css')}}" rel="stylesheet" />
    <!--//Metis Menu -->
    <style>
      #chartdiv {
        width: 100%;
        height: 295px;
      }
    </style>
    <!--pie-chart -->
    <!-- index page sales reviews visitors pie chart -->
    <script src="{{asset('backend/js/pie-chart.js')}}" type="text/javascript"></script>
    <!-- //pie-chart -->
    <!-- index page sales reviews visitors pie chart -->
    <!-- requried-jsfiles-for owl -->
    <link href="{{asset('backend/css/owl.carousel.css')}}" rel="stylesheet" />
    <script src="{{asset('backend/js/owl.carousel.js')}}"></script>
    <!-- //requried-jsfiles-for owl -->
  </head>

  <body class="cbp-spmenu-push">
    @if (Auth::check())
    <div class="main-content">
      <div
        class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-left"
        id="cbp-spmenu-s1"
      >
        <!--left-fixed -navigation-->
        <aside class="sidebar-left">
          <nav class="navbar navbar-inverse">
            <div class="navbar-header">
              <button
                type="button"
                class="navbar-toggle collapsed"
                data-toggle="collapse"
                data-target=".collapse"
                aria-expanded="false"
              >
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <h1>
                <a class="navbar-brand" href="{{url('/home')}}"
                  ><span class="fa fa-area-chart"></span> Glance<span
                    class="dashboard_text"
                    >Design dashboard</span
                  ></a
                >
              </h1>
            </div>
            <div
              class="collapse navbar-collapse"
              id="bs-example-navbar-collapse-1"
            >
              <ul class="sidebar-menu">
                <li class="header">MAIN NAVIGATION</li>
                <li class="treeview">
                  <a href="{{url('/home')}}">
                    <i class="fa fa-dashboard"></i> <span>Dashboard</span>
                  </a>
                </li>
                @php
                    $seagment = Request::segment(1);
                @endphp
                <li class="treeview {{($seagment == 'payments') ? 'active' : ''}}">
                  <a href="{{ route('payments.vip') }}">
                    <i class="fa fa-envelope"></i> <span>Giao dịch</span>
                  </a>
                </li>
                <li class="treeview {{($seagment == 'category') ? 'active' : ''}}">
                  <a href="#">
                    <i class="fa fa-envelope"></i> <span>Danh Mục </span>
                    <i class="fa fa-angle-left pull-right"></i>
                  <ul class="treeview-menu">
                    <li>
                      <a href="{{route('category.index')}}"
                        ><i class="fa fa-angle-right"></i> Liệt kê
                      </a>
                    </li>
                    <li>
                      <a href="{{route('category.create')}}"
                        ><i class="fa fa-angle-right"></i> Thêm danh mục
                      </a>
                    </li>
                  </ul>
                  </a>
                </li>
                <li class="treeview {{($seagment == 'genre') ? 'active' : ''}}">
                    <a href="#">
                      <i class="fa fa-envelope"></i> <span>Thể loại </span>
                      <i class="fa fa-angle-left pull-right"></i>
                    <ul class="treeview-menu">
                      <li>
                        <a href="{{route('genre.index')}}"
                          ><i class="fa fa-angle-right"></i> Liệt kê
                        </a>
                      </li>
                      <li>
                        <a href="{{route('genre.create')}}"
                          ><i class="fa fa-angle-right"></i> Thêm thể loại
                        </a>
                      </li>
                    </ul>
                    </a>
                </li>
                <li class="treeview {{($seagment == 'country') ? 'active' : ''}}">
                    <a href="#">
                      <i class="fa fa-envelope"></i> <span>Quốc Gia </span>
                      <i class="fa fa-angle-left pull-right"></i>
                    <ul class="treeview-menu">
                      <li>
                        <a href="{{route('country.index')}}"
                          ><i class="fa fa-angle-right"></i> Liệt kê
                        </a>
                      </li>
                      <li>
                        <a href="{{route('country.create')}}"
                          ><i class="fa fa-angle-right"></i> Thêm quốc gia
                        </a>
                      </li>
                    </ul>
                    </a>
                </li>
                <li class="treeview {{($seagment == 'movie') ? 'active' : ''}}">
                    <a href="#">
                      <i class="fa fa-envelope"></i> <span>Phim </span>
                      <i class="fa fa-angle-left pull-right"></i>
                    <ul class="treeview-menu">
                      <li>
                        <a href="{{route('movie.index')}}"
                          ><i class="fa fa-angle-right"></i> Liệt kê
                        </a>
                      </li>
                      <li>
                        <a href="{{route('movie.create')}}"
                          ><i class="fa fa-angle-right"></i> Thêm phim
                        </a>
                      </li>
                    </ul>
                    </a>
                </li>
                <li class="treeview {{($seagment == 'episode') ? 'active' : ''}}">
                    <a href="#">
                      <i class="fa fa-envelope"></i> <span>Tập phim </span>
                      <i class="fa fa-angle-left pull-right"></i>
                    <ul class="treeview-menu">
                      <li>
                        <a href="{{route('episode.index')}}"
                          ><i class="fa fa-angle-right"></i> Liệt kê
                        </a>
                      </li>
                      <li>
                        <a href="{{route('episode.create')}}"
                          ><i class="fa fa-angle-right"></i> Thêm tập phim
                        </a>
                      </li>
                    </ul>
                    </a>
                </li>
                <li class="treeview {{($seagment == 'link') ? 'active' : ''}}">
                  <a href="#">
                    <i class="fa fa-envelope"></i> <span>Link Phim </span>
                    <i class="fa fa-angle-left pull-right"></i>
                  <ul class="treeview-menu">
                    <li>
                      <a href="{{route('link.index')}}"
                        ><i class="fa fa-angle-right"></i> Xem
                      </a>
                    </li>
                    <li>
                      <a href="{{ route('link.create')}}"
                        ><i class="fa fa-angle-right"></i> Thêm
                      </a>
                    </li>
                  </ul>
                  </a>
              </li>
                <li class="treeview {{($seagment == 'info') ? 'active' : ''}}">
                    <a href="#">
                      <i class="fa fa-envelope"></i> <span>Thông tin web </span>
                      <i class="fa fa-angle-left pull-right"></i>
                    <ul class="treeview-menu">
                      <li>
                        <a href="{{route('info.index')}}"
                          ><i class="fa fa-angle-right"></i> Xem
                        </a>
                      </li>
                      <li>
                        <a href="{{ route('info.edit', ['info' => 1]) }}"
                          ><i class="fa fa-angle-right"></i> Chỉnh sửa
                        </a>
                      </li>
                    </ul>
                    </a>
                </li>
                    <li class="treeview">
                        <a href="#">
                          <i class="fa fa-folder"></i> <span>Examples</span>
                          <i class="fa fa-angle-left pull-right"></i>
                        </a>
                        <ul class="treeview-menu">
                          <li>
                            <a href="login.html"
                              ><i class="fa fa-angle-right"></i> Login</a
                            >
                          </li>
                          <li>
                            <a href="signup.html"
                              ><i class="fa fa-angle-right"></i> Register</a
                            >
                          </li>
                          <li>
                            <a href="404.html"
                              ><i class="fa fa-angle-right"></i> 404 Error</a
                            >
                          </li>
                          <li>
                            <a href="500.html"
                              ><i class="fa fa-angle-right"></i> 500 Error</a
                            >
                          </li>
                          <li>
                            <a href="blank-page.html"
                              ><i class="fa fa-angle-right"></i> Blank Page</a
                            >
                          </li>
                        </ul>
                      </li>
            </div>
            <!-- /.navbar-collapse -->
          </nav>
        </aside>
      </div>
      <!--left-fixed -navigation-->
      <!-- header-starts -->
      <!-- //header-ends -->
      <!-- main content start-->
      <div id="page-wrapper">
        <div class="main-page">
          <div class="col_3">
            <div class="col-md-3 widget widget1">
              <div class="r3_counter_box">
                <i class="pull-left fa fa-dollar icon-rounded"></i>
                <div class="stats">
                  <h5><strong>{{$category_total}}</strong></h5>
                  <span>Tổng danh mục</span>
                </div>
              </div>
            </div>
            <div class="col-md-3 widget widget1">
              <div class="r3_counter_box">
                <i class="pull-left fa fa-laptop user1 icon-rounded"></i>
                <div class="stats">
                  <h5><strong>{{$genre_total}}</strong></h5>
                  <span>Tổng thể loại</span>
                </div>
              </div>
            </div>
            <div class="col-md-3 widget widget1">
              <div class="r3_counter_box">
                <i class="pull-left fa fa-money user2 icon-rounded"></i>
                <div class="stats">
                  <h5><strong>{{$country_total}}</strong></h5>
                  <span>Tổng quốc gia</span>
                </div>
              </div>
            </div>
            <div class="col-md-3 widget widget1">
              <div class="r3_counter_box">
                <i class="pull-left fa fa-pie-chart dollar1 icon-rounded"></i>
                <div class="stats">
                  <h5><strong>{{$movie_total}}</strong></h5>
                  <span>Tổng phim</span>
                </div>
              </div>
            </div>
            <div class="col-md-3 widget">
              <div class="r3_counter_box">
                <i class="pull-left fa fa-users dollar2 icon-rounded"></i>
                <div class="stats">
                  <h5><strong>{{$episode_total}}</strong></h5>
                  <span>Tổng tập phim</span>
                </div>
              </div>
            </div>
            <div class="clearfix"></div>
          </div>
          <div class="row-one widgettable">
            {{-- <div class="col-md-7 content-top-2 card">
              <div class="agileinfo-cdr">
                <div class="card-header">
                  <h3>Weekly Sales</h3>
                </div>
                <div id="Linegraph" style="width: 98%; height: 350px"></div>
              </div>
            </div>
            <div class="col-md-3 stat">
              <div class="content-top-1">
                <div class="col-md-6 top-content">
                  <h5>Sales</h5>
                  <label>1283+</label>
                </div>
                <div class="col-md-6 top-content1">
                  <div
                    id="demo-pie-1"
                    class="pie-title-center"
                    data-percent="45"
                  >
                    <span class="pie-value"></span>
                  </div>
                </div>
                <div class="clearfix"></div>
              </div>
              <div class="content-top-1">
                <div class="col-md-6 top-content">
                  <h5>Reviews</h5>
                  <label>2262+</label>
                </div>
                <div class="col-md-6 top-content1">
                  <div
                    id="demo-pie-2"
                    class="pie-title-center"
                    data-percent="75"
                  >
                    <span class="pie-value"></span>
                  </div>
                </div>
                <div class="clearfix"></div>
              </div>
              <div class="content-top-1">
                <div class="col-md-6 top-content">
                  <h5>Visitors</h5>
                  <label>12589+</label>
                </div>
                <div class="col-md-6 top-content1">
                  <div
                    id="demo-pie-3"
                    class="pie-title-center"
                    data-percent="90"
                  >
                    <span class="pie-value"></span>
                  </div>
                </div>
                <div class="clearfix"></div>
              </div>
            </div>
            <div class="col-md-2 stat">
              <div class="content-top">
                <div class="top-content facebook">
                  <a href="#"><i class="fa fa-facebook"></i></a>
                </div>
                <ul class="info">
                  <li class="col-md-6">
                    <b>1,296</b>
                    <p>Friends</p>
                  </li>
                  <li class="col-md-6">
                    <b>647</b>
                    <p>Likes</p>
                  </li>
                  <div class="clearfix"></div>
                </ul>
              </div>
              <div class="content-top">
                <div class="top-content twitter">
                  <a href="#"><i class="fa fa-twitter"></i></a>
                </div>
                <ul class="info">
                  <li class="col-md-6">
                    <b>1,997</b>
                    <p>Followers</p>
                  </li>
                  <li class="col-md-6">
                    <b>389</b>
                    <p>Tweets</p>
                  </li>
                  <div class="clearfix"></div>
                </ul>
              </div>
              <div class="content-top">
                <div class="top-content google-plus">
                  <a href="#"><i class="fa fa-google-plus"></i></a>
                </div>
                <ul class="info">
                  <li class="col-md-6">
                    <b>1,216</b>
                    <p>Followers</p>
                  </li>
                  <li class="col-md-6">
                    <b>321</b>
                    <p>shares</p>
                  </li>
                  <div class="clearfix"></div>
                </ul>
              </div>
            </div> --}}
            <div class="clearfix"></div>
          </div>
          <!-- for amcharts js -->
          <script src="{{asset('backend/js/amcharts.js')}}"></script>
          <script src="{{asset('backend/js/serial.js')}}"></script>
          <script src="{{asset('backend/js/export.min.js')}}"></script>
          <link
            rel="stylesheet"
            href="{{asset('backend/css/export.css')}}"
            type="text/css"
            media="all"
          />
          <script src="{{asset('backend/js/light.js')}}"></script>
          <!-- for amcharts js -->
          <script src="{{asset('backend/js/index1.js')}}"></script>
          <div class="col-md-12" >
            @yield('content')
            </div>
        </div>
        <div class="clearfix"></div>
      </div>
      <!--footer-->
      <div class="footer">
        <p>
          &copy; 2018 Glance Design Dashboard. All Rights Reserved | Design by
          <a href="https://w3layouts.com/" target="_blank">w3layouts</a>
        </p>
      </div>
      <!--//footer-->
    </div>
    @else
        @yield('content_login')
    @endif

    <!-- new added graphs chart js-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
    <script src="{{asset('backend/js/Chart.bundle.js')}}"></script>
    <script src="{{asset('backend/js/utils.js')}}"></script>
    <!-- new added graphs chart js-->
    <!-- Classie -->
    <!-- for toggle left push menu script -->
    <script src="{{asset('backend/js/classie.js')}}"></script>
    <script>
      var menuLeft = document.getElementById('cbp-spmenu-s1'),
        showLeftPush = document.getElementById('showLeftPush'),
        body = document.body;

      function disableOther(button) {
        if (button !== 'showLeftPush') {
          classie.toggle(showLeftPush, 'disabled');
        }
      }
    </script>
    <!-- //Classie -->
    <!-- //for toggle left push menu script -->
    <!--scrolling js-->
    <script src="{{asset('backend/js/jquery.nicescroll.js')}}"></script>
    <script src="{{asset('backend/js/scripts.js')}}"></script>
    <!--//scrolling js-->
    <!-- side nav js -->
    <script src="{{asset('backend/js/SidebarNav.min.js')}}" type="text/javascript"></script>
    <script>
      $('.sidebar-menu').SidebarNav();
    </script>
    <!-- //side nav js -->
    <!-- for index page weekly sales java script -->

    <!-- //for index page weekly sales java script -->
    <!-- Bootstrap Core JavaScript -->
    <script src="{{asset('backend/js/bootstrap.js')}}"></script>
    <!-- //Bootstrap Core JavaScript -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script type="text/javascript" src="//cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
            <script type="text/javascript">
                $(document).ready(function () {
                    $("#tableMovie").DataTable();
                });
                function ChangeToSlug() {
                    var slug;

                    //Lấy text từ thẻ input title
                    slug = document.getElementById("slug").value;
                    slug = slug.toLowerCase();
                    //Đổi ký tự có dấu thành không dấu
                    slug = slug.replace(
                        /á|à|ả|ạ|ã|ă|ắ|ằ|ẳ|ẵ|ặ|â|ấ|ầ|ẩ|ẫ|ậ/gi,
                        "a"
                    );
                    slug = slug.replace(/é|è|ẻ|ẽ|ẹ|ê|ế|ề|ể|ễ|ệ/gi, "e");
                    slug = slug.replace(/i|í|ì|ỉ|ĩ|ị/gi, "i");
                    slug = slug.replace(
                        /ó|ò|ỏ|õ|ọ|ô|ố|ồ|ổ|ỗ|ộ|ơ|ớ|ờ|ở|ỡ|ợ/gi,
                        "o"
                    );
                    slug = slug.replace(/ú|ù|ủ|ũ|ụ|ư|ứ|ừ|ử|ữ|ự/gi, "u");
                    slug = slug.replace(/ý|ỳ|ỷ|ỹ|ỵ/gi, "y");
                    slug = slug.replace(/đ/gi, "d");
                    //Xóa các ký tự đặt biệt
                    slug = slug.replace(
                        /\`|\~|\!|\@|\#|\||\$|\%|\^|\&|\*|\(|\)|\+|\=|\,|\.|\/|\?|\>|\<|\'|\"|\:|\;|_/gi,
                        ""
                    );
                    //Đổi khoảng trắng thành ký tự gạch ngang
                    slug = slug.replace(/ /gi, "-");
                    //Đổi nhiều ký tự gạch ngang liên tiếp thành 1 ký tự gạch ngang
                    //Phòng trường hợp người nhập vào quá nhiều ký tự trắng
                    slug = slug.replace(/\-\-\-\-\-/gi, "-");
                    slug = slug.replace(/\-\-\-\-/gi, "-");
                    slug = slug.replace(/\-\-\-/gi, "-");
                    slug = slug.replace(/\-\-/gi, "-");
                    //Xóa các ký tự gạch ngang ở đầu và cuối
                    slug = "@" + slug + "@";
                    slug = slug.replace(/\@\-|\-\@|\@/gi, "");
                    //In slug ra textbox có id “slug”
                    document.getElementById("convert_slug").value = slug;
                }
            </script>
            <script type="text/javascript">
                $(".order_position").sortable({
                    placeholder: "ui-state-hightlight",
                    update: function (event, ui) {
                        var array_id = [];
                        $(".order_position tr").each(function () {
                            array_id.push($(this).attr("id"));
                        });
                        $.ajax({
                            headers: {
                                "X-CSRF-TOKEN": $(
                                    'meta[name="csrf-token"]'
                                ).attr("content"),
                            },
                            url: "{{route('resorting_category')}}",
                            method: "POST",
                            data: { array_id: array_id },
                            success: function (data) {
                                alert("Sap xep thanh cong");
                            },
                        });
                    },
                });
            </script>

            <script type="text/javascript">
                $(".select-year").change(function () {
                    var year = $(this).find(":selected").val();
                    var movie_id = $(this).attr("id");

                    $.ajax({
                        url: "{{url('/update-movie-year')}}",
                        method: "GET",
                        data: { year: year, movie_id: movie_id },
                        success: function () {
                            alert(
                                "Thay đổi năm phim theo năm" +
                                    year +
                                    " thành công"
                            );
                        },
                    });
                });
            </script>
            <script type="text/javascript">
                $(".select-topview").change(function () {
                    var topview = $(this).find(":selected").val();
                    var movie_id = $(this).attr("id");

                    if (topview == 0) {
                        var text = "Ngày";
                    } else if (topview == 1) {
                        var text = "Tuần";
                    } else {
                        var text = "Tháng";
                    }
                    $.ajax({
                        url: "{{url('/update-topview')}}",
                        method: "GET",
                        data: { topview: topview, movie_id: movie_id },
                        success: function () {
                            alert(
                                "Thay đổi phim theo topview" +
                                    text +
                                    " thành công"
                            );
                        },
                    });
                });
            </script>

            <script type="text/javascript">
              $(".select-movie, #link_server").ready(function () {
                  $(".select-movie, #link_server").change(function () {
                      var id = $(".select-movie").val();
                      var linkServer = $('#link_server').val();
                      if (linkServer === "") {
                        $("#show_episode").html('<option>---Chọn tập phim---</option>');
                        return;
                    }
                      $.ajax({
                          url: "{{ url('/select-movie') }}",
                          method: "GET",
                          data: { id: id, link_server: linkServer },
                          success: function (data) {
                              if (data === "") {
                                  alert("Phim đã được thêm hết số tập");
                                  $("#show_episode").empty();
                              } else {
                                  $("#show_episode").html(data);
                              }
                          },
                      });
                  });

                  $("#form_episode").submit(function (event) {
                      var selectedEpisode = $("#show_episode").val();
                      var linkPhim = $("#link").val();

                      if (
                          selectedEpisode === "---Chọn tập phim---" &&
                          linkPhim.trim() === ""
                      ) {
                          event.preventDefault();
                          Swal.fire(
                              "Thông báo",
                              "Chưa điền cả link phim và tập phim",
                              "error"
                          );
                      } else if (selectedEpisode === "---Chọn tập phim---") {
                          event.preventDefault();
                          Swal.fire(
                              "Thông báo",
                              "Vui lòng chọn tập phim",
                              "error"
                          );
                      } else if (linkPhim.trim() === "") {
                          event.preventDefault();
                          Swal.fire(
                              "Thông báo",
                              "Bắt buộc phải điền link phim",
                              "error"
                          );
                      }
                  });
              });
          </script>


            {{-- chon phim bo hoac phim le, bo ->duoc nhap, le auto = 1 --}}

            <script>
                $(document).ready(function () {
                    // Lắng nghe sự kiện thay đổi của trường "Danh Mục"
                    $("#category-select").change(function () {
                        var selectedCategory = $(this).val();
                        var episodeInput = $("#episode-input");

                        // Kiểm tra nếu danh mục là phim lẻ
                        if (selectedCategory == 16) {
                            episodeInput.val("1"); // Mặc định là 1 tập
                            episodeInput.prop("readonly", true); // Không cho phép chỉnh sửa
                        } else {
                            episodeInput.val(""); // Xóa giá trị
                            episodeInput.prop("readonly", false); // Cho phép chỉnh sửa
                        }
                    });
                });
            </script>
            <script type="text/javascript">
                function goBack() {
                    var previousValue = localStorage.getItem("country");
                    // Sử dụng giá trị previousValue để thực hiện hành động mong muốn

                    window.history.back();
                }
            </script>
        @yield('script')
  </body>
</html>

