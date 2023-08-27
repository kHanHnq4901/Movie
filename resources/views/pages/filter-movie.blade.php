@extends('layout')
@section('content')
<div class="row container" id="wrapper">
            <div class="halim-panel-filter">
               <div class="panel-heading">
                  <div class="row">
                     <div class="col-xs-6">
                        <div class="yoast_breadcrumb hidden-xs"><span><span><a href="">Lọc Phim</a> » <span class="breadcrumb_last" aria-current="page"></span></span></span></div>
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
                     <h1 class="section-title"><span>Lọc Phim</span></h1>
                  </div>
                  <div class="halim_box">
                     @if ($movie->isEmpty())
                           <p class="text-center">Không tìm thấy kết quả.</p>
                        @else
                        @foreach ($movie as $key =>$category_movie)
                        <article class="col-md-3 col-sm-3 col-xs-6 thumb grid-item post-27021">
                           <div class="halim-item">
                              <a class="halim-thumb" href="{{route('movie',$category_movie->slug)}}" title="{{$category_movie->title}}">
                                 <figure><img class="lazy img-responsive" src="{{asset('uploads/movies/'.$category_movie->image)}}" alt="{{$category_movie->title}}" title="{{$category_movie->title}}"></figure>
                                 <span class="status">
                                    @if ($category_movie ->episode_count == $category_movie->number_episode)
                                       @if ($category_movie ->episode_count == 1)
                                          Hoàn Thành
                                          @else
                                          Full ({{$category_movie ->episode_count}}/{{$category_movie->number_episode}}) Tập
                                       @endif

                                    @elseif($category_movie ->episode_count == 0)
                                       Đang Cập Nhật
                                    @else
                                       Tập {{$category_movie ->episode[0]->episode}}
                                    @endif
                                    </span>
                                       <span class="episode"><i class="fa fa-play" aria-hidden="true"></i>
                                       @if ($category_movie ->subtitle == 0)
                                          VietSub
                                       @elseif($category_movie ->subtitle == 1)
                                          Thuyết Minh
                                    @endif
                                 </span>
                                 <div class="icon_overlay"></div>
                                 <div class="halim-post-title-box">
                                    <div class="halim-post-title ">
                                       <p class="entry-title">{{$category_movie->title}}</p>
                                       <p class="original_title">The Mire Season 1</p>
                                    </div>
                                 </div>
                              </a>
                           </div>
                        </article>
                        @endforeach
                     @endif
                  </div>
                  <div class="clearfix"></div>
                  <div class="text-center">
                     {!!$movie->links("pagination::bootstrap-4") !!}
                  </div>
               </section>
            </main>
            @include('pages.include.sidebar')
         </div>
@endsection
