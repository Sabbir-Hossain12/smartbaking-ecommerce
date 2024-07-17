@extends('webview.master')

@section('maincontent')
@section('title')
    {{ env('APP_NAME') }}-{{ $menus->menu_name }}
@endsection

<div class="container outer-top-xs outer-bottom-xs">
    <div class="row">
        <div class="col-md-12">
            @if (isset($value->value))
                {!! $value->value !!}
            @else
                <div class="nothinghas" style="text-align: center;padding: 58px;background: #e9e9e9;">
                    <h4 style="font-size:40px">Comming Soon !......</h4>
                </div>
            @endif
        </div>
    </div>
</div>
@endsection
