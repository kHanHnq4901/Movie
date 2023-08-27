@extends('layouts.app')

@section('content')
<div class="container">
    <canvas id="myChart" style="width:100%; height: 500px"></canvas>
</div>
@endsection
@section('script')
<script>
    @php
        $name = implode(',', $arrayName);
        $view = implode(',', $arrayView);
        $color = implode(',', $arrayColor);
    @endphp
    var name = '{{ $name }}';
    var color = '{{ $color }}';
    var view = '{{ $view }}';
    var xValues = name.split(',');
    var yValues = view.split(',');
    var barColors = color.split(',');

    new Chart("myChart", {
        type: "bar",
        data: {
            labels: xValues,
            datasets: [{
                backgroundColor: barColors,
                data: yValues
            }]
        },
        options: {
            legend: {display: false},
            title: {
                display: true,
                text: "Tốp 5 phim có lượt xem nhiều nhất"
            }
        }
    });
</script>
@endsection
