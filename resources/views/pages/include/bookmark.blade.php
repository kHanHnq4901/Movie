@foreach ($bookmarks as $key => $bookmark)
    <li class="bookmark-list" id="bookmark-{{$bookmark->id}}">
        <a href="{{route('movie',$bookmark->movie->slug)}}">
            <img src="{{asset('uploads/movies/'.$bookmark->movie->image)}}" alt="{{$bookmark->movie->title}}">
            <span class="bookmark-title">{{$bookmark->movie->title}}</span>
            <span class="bookmark-date">{{$bookmark->created_at}}</span>
        </a>
        <span class="remove-bookmark box-shadow" data-bookmark-id="{{$bookmark->id}}">x</span>
    </li>
@endforeach