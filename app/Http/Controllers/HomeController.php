<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Movie;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $listColor = ['#EE0000', '#FFFF99', '#CCCCFF', '#00FFFF', '#FFCC99', '#33CC99', '#FF9933', '#FF66FF', '#9966FF', '#0000EE'];
        $movies = Movie::orderByDesc('views')->limit(5)->get();

        $arrayName = [];
        $arrayView = [];
        $arrayColor = [];

        foreach ($movies as $key => $movie) {
            array_push($arrayName, $movie->title);
            array_push($arrayView, $movie->views);
            array_push($arrayColor, $listColor[$key]);
        }

        return view('home', compact('arrayName', 'arrayView', 'arrayColor'));
    }
}
