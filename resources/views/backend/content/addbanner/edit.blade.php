@extends('backend.master')

@section('maincontent')
@section('title')
    {{ env('APP_NAME') }}- Edit Add Banners
@endsection
<style>
    div#roleinfo_length {
        color: red;
    }

    div#roleinfo_filter {
        color: red;
    }

    div#roleinfo_info {
        color: red;
    }

</style>

<div class="container-fluid pt-4 px-4">
    <div class="row">
        <div class="col-sm-12 col-md-12 col-xl-12">
            <div class="h-100 bg-secondary rounded p-4 pb-0">
                <div class="d-flex align-items-center justify-content-between" style="width: 50%;float:left;">
                    <h6 class="mb-0">Addbanners List</h6>
                </div>
            </div>
        </div>

        <div class="col-sm-12 col-md-12 col-xl-12">
            <div class="bg-secondary rounded h-100 p-4">
                <form name="form" action="{{ route('admin.addbanners.update', $addbanner->id) }}" method="POST"
                    enctype="multipart/form-data">
                    @csrf
                    @method('PUT')
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" name="add_link" id="add_link" placeholder="Add Link"
                            value="{{ $addbanner->add_link }}">
                        <label for="floatingInput">Add Link</label>
                    </div>
                    <div class="mt-4 mb-4">
                        <input class="form-control form-control-lg bg-dark" name="add_image" id="add_image" type="file">
                    </div>

                    <div class="m-3 ms-0 mb-0" style="text-align: center;height: 170px;margin-top:20px !important">
                        <h4 style="width:30%;float: left;text-align: left;">Image : </h4>
                        <div id="previmg" style="float: left;width:70%">
                            <img src="{{ asset($addbanner->add_image) }}" alt="" srcset="" style="height: 140px;">
                        </div>
                    </div>
                    <br>
                    <div class="form-group mt-4 pt-4" style="text-align: right">
                        <div class="submitBtnSCourse">
                            <a href="{{ route('admin.addbanners.index') }}" class="btn btn-dark btn-block"
                                style="float: left">Close</a>
                            <button type="submit" name="btn"
                                class="btn btn-primary AddCourierBtn btn-block">Update</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>


        <input type="hidden" name="_token" value="{{ csrf_token() }}" />
    </div>
</div>


@endsection
