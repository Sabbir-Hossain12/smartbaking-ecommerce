@extends('backend.master')

@section('maincontent')
@section('title')
    {{ env('APP_NAME') }}- Information {{ $title }}
@endsection

<div class="container-fluid pt-4 px-4">
    <div class="row">

        <div class="col-sm-12 col-md-12 col-xl-12 mb-4">
            <div class="bg-secondary rounded h-100 p-4">

                <h2 class="mb-4" style="text-align: center;color:red">{{ $title }} Page Info</h2>
                <form action="{{ url('/admin/information/update', $slug) }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    <input type="text" name="key" value="{{ $slug }}" hidden>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-floating mb-3">
                                <textarea class="form-control ckeditor" name="value" id="value" style="height: 150px;">{{ $value->value }}</textarea>
                            </div>
                        </div>
                        <div class="mt-3">
                            <button type="submit" class="btn btn-primary btn-lg w-100">Update</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

    </div>
</div>

<script type="text/javascript">
    initSample();
    $(document).ready(function() {
        $('.ckeditor').ckeditor();
    });
</script>

@endsection
