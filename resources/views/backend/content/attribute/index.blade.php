@extends('backend.master')

@section('maincontent')
@section('title')
    {{ env('APP_NAME') }}- Attribute
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
                    <h6 class="mb-0">Attribute List</h6>
                </div>
                {{-- <div class="" style="width: 50%;float:left;">
                    <a type="button" data-bs-toggle="modal" data-bs-target="#mainAttribute" class="btn btn-primary m-2"
                        style="float: right"> + Create Attribute</a>
                </div> --}}
            </div>
        </div>

        <div class="col-sm-12 col-md-12 col-xl-12">
            <div class="bg-secondary rounded h-100 p-4">
                <div class="data-tables">
                    <table class="table table-dark" id="attributeinfo" width="100%" style="text-align: center;">
                        <thead class="thead-light">
                            <tr>
                                <th>SL</th>
                                <th>Attribute</th>
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
        <div class="modal fade" id="mainAttribute" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content bg-secondary rounded h-100">
                    <div class="modal-header">
                        <h5 class="modal-title" style="color: red;">Create New Attribute</h5>
                        <button type="button" class="btn-dark btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <form name="form" id="AddAttribute" enctype="multipart/form-data">
                            @csrf
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" name="attribute_name" id="attribute_name"
                                    placeholder="Service Package Name">
                                <label for="floatingInput">Name</label>
                            </div>

                            <br>

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
        <div class="modal fade" id="editmainAttribute" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content bg-secondary rounded h-100">
                    <div class="modal-header">
                        <h5 class="modal-title" style="color: red;">Edit Attribute</h5>
                        <button type="button" class="btn-dark btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <form name="form" id="EditAttribute" enctype="multipart/form-data">
                            @csrf
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" name="attribute_name" id="attribute_name"
                                    placeholder="Service Package Name">
                                <label for="floatingInput">Name</label>
                            </div>

                            <input type="text" name="attribute_id" id="attribute_id" hidden>

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

        var attributeinfo = $('#attributeinfo').DataTable({
            order: [
                [0, 'desc']
            ],
            processing: true,
            serverSide: true,
            ajax: '{!! route('admin.attribute.data') !!}',
            columns: [{
                    data: 'id'
                }, {
                    data: 'attribute_name'
                },
                {
                    "data": null,
                    render: function(data) {

                        if (data.status === 'Active') {
                            return '<button type="button" class="btn btn-success btn-sm btn-status" data-status="Inactive" id="attributestatusBtn" data-id="' +
                                data.id + '">Active</button>';
                        } else {
                            return '<button type="button" class="btn btn-warning btn-sm btn-status" data-status="Active" id="attributestatusBtn" data-id="' +
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


        //add attribute

        $('#AddAttribute').submit(function(e) {
            e.preventDefault();

            $.ajax({
                type: 'POST',
                uploadUrl: '{{ route('admin.attributes.store') }}',
                processData: false,
                contentType: false,
                data: new FormData(this),

                success: function(data) {

                    $('#attribute_name').val('');

                    swal({
                        title: "Success!",
                        icon: "success",
                    });
                    attributeinfo.ajax.reload();

                },
                error: function(error) {
                    console.log('error');
                }
            });
        });

        //edit attribute
        $(document).on('click', '#editAttributeBtn', function() {
            let attributeId = $(this).data('id');

            $.ajax({
                type: 'GET',
                url: 'attributes/' + attributeId + '/edit',

                success: function(data) {
                    $('#EditAttribute').find('#attribute_name').val(data
                        .attribute_name);
                    $('#EditAttribute').find('#attribute_id').val(data.id);

                    $('#EditAttribute').attr('data-id', data.id);
                },
                error: function(error) {
                    console.log('error');
                }

            });
        });

        //update attribute
        $('#EditAttribute').submit(function(e) {
            e.preventDefault();
            let attributeId = $('#attribute_id').val();

            $.ajax({
                type: 'POST',
                url: 'attribute/' + attributeId,
                processData: false,
                contentType: false,
                data: new FormData(this),

                success: function(data) {
                    $('#EditAttribute').find('#attribute_name').val('');
                    $('#EditAttribute').find('#attribute_id').val('');

                    swal({
                        title: "Attribute update successfully !",
                        icon: "success",
                        showCancelButton: true,
                        focusConfirm: false,
                        confirmButtonColor: "#DD6B55",
                        confirmButtonText: "Yes",
                        cancelButtonText: "No",
                    });
                    attributeinfo.ajax.reload();

                },
                error: function(error) {
                    console.log('error');
                }
            });
        });


        // status update

        $(document).on('click', '#attributestatusBtn', function() {
            let attributeId = $(this).data('id');
            let attributeStatus = $(this).data('status');

            $.ajax({
                type: 'PUT',
                url: 'attribute/status',
                data: {
                    attribute_id: attributeId,
                    status: attributeStatus,
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
                    attributeinfo.ajax.reload();
                },
                error: function(error) {
                    console.log('error');
                }

            });
        });

        $(document).on('click', '#deleteAttributeBtn', function() {
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
                            url: 'sttributes/' + sliderId,
                            data: {
                                '_token': token
                            },
                            success: function(data) {
                                swal("Attribute has been deleted!", {
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

    });
</script>

@endsection
