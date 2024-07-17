@extends('backend.master')

@section('maincontent')
@section('title')
    {{ env('APP_NAME') }}- Slider
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
                    <h6 class="mb-0">Slider List</h6>
                </div>
                <div class="" style="width: 50%;float:left;">
                    <a type="button" data-bs-toggle="modal" data-bs-target="#mainSlider" class="btn btn-primary m-2"
                        style="float: right"> + Create Slider</a>
                </div>
            </div>
        </div>

        <div class="col-sm-12 col-md-12 col-xl-12">
            <div class="bg-secondary rounded h-100 p-4">
                <div class="data-tables">
                    <table class="table table-dark" id="sliderinfo" width="100%" style="text-align: center;">
                        <thead class="thead-light">
                            <tr>
                                <th>SL</th>
                                <th>Icon</th>
                                <th>Name</th>
                                <th>status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        {{-- create payment icon --}}
        <div class="modal fade" id="mainSlider" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content bg-secondary rounded h-100">
                    <div class="modal-header">
                        <h5 class="modal-title" style="color: red;">Create New Slider</h5>
                        <button type="button" class="btn-dark btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <form name="form" id="AddSlider" enctype="multipart/form-data">
                            @csrf
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" name="slider_title" id="slider_title"
                                    placeholder="Title" required>
                                <label for="floatingInput">Title</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" name="slider_small_title"
                                    id="slider_small_title" placeholder="Small Title">
                                <label for="floatingInput">Small Title</label>
                            </div>
                            <div class="form-floating mb-3">
                                <textarea class="form-control" placeholder="Text" name="slider_text" id="slider_text" style="height: 80px;"></textarea>
                                <label for="floatingTextarea">Text</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" name="slider_btn_name" id="slider_btn_name"
                                    placeholder="Button Name">
                                <label for="floatingInput">Button Name</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" name="slider_btn_link" id="slider_btn_link"
                                    placeholder="Button Link">
                                <label for="floatingInput">Button Link</label>
                            </div>

                            <div class="mt-4 mb-4">
                                <input class="form-control form-control-lg bg-dark" name="slider_image"
                                    id="slider_image" type="file">
                            </div>
                            <div class="form-group mt-2" style="text-align: right">
                                <div class="submitBtnSCourse">
                                    <button type="submit" name="btn" data-bs-dismiss="modal"
                                        class="btn btn-dark btn-block" style="float: left">Close</button>
                                    <button type="submit" name="btn"
                                        class="btn btn-primary AddCourierBtn btn-block">Save</button>
                                </div>
                            </div>
                        </form>

                    </div>

                </div>
            </div>
        </div><!-- End popup Modal-->

        {{-- edit payment icon --}}
        <div class="modal fade" id="editmainSlider" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content bg-secondary rounded h-100">
                    <div class="modal-header">
                        <h5 class="modal-title" style="color: red;">Edit Slider</h5>
                        <button type="button" class="btn-dark btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <form name="form" id="EditSlider" enctype="multipart/form-data">
                            @csrf
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" name="slider_title" id="slider_title"
                                    placeholder="Title" required>
                                <label for="floatingInput">Title</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" name="slider_small_title"
                                    id="slider_small_title" placeholder="Small Title">
                                <label for="floatingInput">Small Title</label>
                            </div>
                            <div class="form-floating mb-3">
                                <textarea class="form-control" placeholder="Text" name="slider_text" id="slider_text" style="height: 80px;"></textarea>
                                <label for="floatingTextarea">Text</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" name="slider_btn_name"
                                    id="slider_btn_name" placeholder="Button Name">
                                <label for="floatingInput">Button Name</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" name="slider_btn_link"
                                    id="slider_btn_link" placeholder="Button Link">
                                <label for="floatingInput">Button Link</label>
                            </div>
                            <div class="mt-4 mb-4">
                                <input class="form-control form-control-lg bg-dark" name="slider_image"
                                    id="slider_image" type="file">
                            </div>
                            <input type="text" name="slider_id" id="slider_id" hidden>

                            <div class="m-3 ms-0 mb-0"
                                style="text-align: center;height: 100px;margin-top:20px !important">
                                <h4 style="width:30%;float: left;text-align: left;">Image : </h4>
                                <div id="previmg" style="float: left;"></div>
                            </div>
                            <br>
                            <div class="form-group mt-2" style="text-align: right">
                                <div class="submitBtnSCourse">
                                    <button type="submit" name="btn" data-bs-dismiss="modal"
                                        class="btn btn-dark btn-block" style="float: left">Close</button>
                                    <button type="submit" name="btn"
                                        class="btn btn-primary AddCourierBtn btn-block">Update</button>
                                </div>
                            </div>
                        </form>

                    </div>

                </div>
            </div>
        </div><!-- End popup Modal-->
        <input type="hidden" name="_token" value="{{ csrf_token() }}" />
    </div>
</div>

<script>
    $(document).ready(function() {
        var token = $("input[name='_token']").val();

        var sliderinfo = $('#sliderinfo').DataTable({
            order: [
                [0, 'desc']
            ],
            processing: true,
            serverSide: true,
            ajax: '{!! route('admin.slider.data') !!}',
            columns: [{
                    data: 'id'
                }, {
                    data: 'slider_image',
                    name: 'slider_image',
                    render: function(data, type, full, meta) {
                        return "<img src=../" + data + " height=\"40\" alt='No Image'/>";
                    }
                },
                {
                    data: 'slider_title'
                },
                {
                    "data": null,
                    render: function(data) {

                        if (data.status === 'Active') {
                            return '<button type="button" class="btn btn-success btn-sm btn-status" data-status="Inactive" id="sliderstatusBtn" data-id="' +
                                data.id + '">Active</button>';
                        } else {
                            return '<button type="button" class="btn btn-warning btn-sm btn-status" data-status="Active" id="sliderstatusBtn" data-id="' +
                                data.id + '" >Inactive</button>';
                        }


                    }
                },
                {
                    data: 'action',
                    name: 'action',
                    orderable: false,
                    searchable: false
                },

            ]
        });


        //add slider

        $('#AddSlider').submit(function(e) {
            e.preventDefault();

            $.ajax({
                type: 'POST',
                uploadUrl: '{{ route('admin.sliders.store') }}',
                processData: false,
                contentType: false,
                data: new FormData(this),

                success: function(data) {
                    if (data == 'error') {
                        swal({
                            icon: 'error',
                            title: 'Can not save Slider',
                            text: 'Please fill Title Name',
                            buttons: true,
                            buttons: "Thanks",
                        });
                    } else {
                        $('#slider_small_title').val('');
                        $('#slider_title').val('');
                        $('#slider_text').val('');
                        $('#slider_btn_name').val('');
                        $('#slider_btn_link').val('');
                        $('#slider_image').val('');

                        swal({
                            title: "Success!",
                            icon: "success",
                        });
                        sliderinfo.ajax.reload();
                    }

                },
                error: function(error) {
                    console.log('error');
                }
            });
        });

        //edit slider
        $(document).on('click', '#editSliderBtn', function() {
            let sliderId = $(this).data('id');

            $.ajax({
                type: 'GET',
                url: 'sliders/' + sliderId + '/edit',

                success: function(data) {
                    $('#EditSlider').find('#slider_small_title').val(data
                        .slider_small_title);
                    $('#EditSlider').find('#slider_title').val(data.slider_title);
                    $('#EditSlider').find('#slider_text').val(data.slider_text);
                    $('#EditSlider').find('#slider_btn_name').val(data.slider_btn_name);
                    $('#EditSlider').find('#slider_btn_link').val(data.slider_btn_link);

                    $('#EditSlider').find('#slider_id').val(data.id);

                    $('#previmg').html('');
                    $('#previmg').append(`
                        <img  src="../` + data.slider_image + `" alt = "" style="height: 80px" />
                    `);

                    $('#EditSlider').attr('data-id', data.id);
                },
                error: function(error) {
                    console.log('error');
                }

            });
        });

        //update slider
        $('#EditSlider').submit(function(e) {
            e.preventDefault();
            let sliderId = $('#slider_id').val();

            $.ajax({
                type: 'POST',
                url: 'slider/' + sliderId,
                processData: false,
                contentType: false,
                data: new FormData(this),

                success: function(data) {
                    if (data == 'error') {
                        swal({
                            icon: 'error',
                            title: 'Can not update Slider',
                            text: 'Please fill Title Name',
                            buttons: true,
                            buttons: "Thanks",
                        });
                    } else {
                        $('#EditSlider').find('#slider_small_title').val('');
                        $('#EditSlider').find('#slider_title').val('');
                        $('#EditSlider').find('#slider_text').val('');
                        $('#EditSlider').find('#slider_btn_name').val('');
                        $('#EditSlider').find('#slider_btn_link').val('');
                        $('#EditSlider').find('#slider_image').val('');
                        $('#previmg').html('');

                        swal({
                            title: "Slider update successfully !",
                            icon: "success",
                            showCancelButton: true,
                            focusConfirm: false,
                            confirmButtonColor: "#DD6B55",
                            confirmButtonText: "Yes",
                            cancelButtonText: "No",
                        });
                        sliderinfo.ajax.reload();
                    }

                },
                error: function(error) {
                    console.log('error');
                }
            });
        });

        // delete slider

        $(document).on('click', '#deleteSliderBtn', function() {
            let sliderId = $(this).data('id');
            swal({
                    title: "Are you sure?",
                    text: "Once deleted, you will not be able to recover this !",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                .then((willDelete) => {
                    if (willDelete) {
                        $.ajax({
                            type: 'DELETE',
                            url: 'sliders/' + sliderId,
                            data: {
                                '_token': token
                            },
                            success: function(data) {
                                swal("Slider has been deleted!", {
                                    icon: "success",
                                });
                                sliderinfo.ajax.reload();
                            },
                            error: function(error) {
                                console.log('error');
                            }

                        });


                    } else {
                        swal("Your data is safe!");
                    }
                });

        });

        // status update

        $(document).on('click', '#sliderstatusBtn', function() {
            let sliderId = $(this).data('id');
            let sliderStatus = $(this).data('status');

            $.ajax({
                type: 'PUT',
                url: 'slider/status',
                data: {
                    slider_id: sliderId,
                    status: sliderStatus,
                    '_token': token
                },

                success: function(data) {
                    swal({
                        title: "Status updated !",
                        icon: "success",
                        showCancelButton: true,
                        focusConfirm: false,
                        confirmButtonColor: "#DD6B55",
                        confirmButtonText: "Yes",
                        cancelButtonText: "No",
                    });
                    sliderinfo.ajax.reload();
                },
                error: function(error) {
                    console.log('error');
                }

            });
        });

    });
</script>

@endsection
