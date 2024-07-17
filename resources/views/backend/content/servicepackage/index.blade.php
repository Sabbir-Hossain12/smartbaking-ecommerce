@extends('backend.master')

@section('maincontent')
@section('title')
    {{ env('APP_NAME') }}- Servicepackage
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
                    <h6 class="mb-0">Servicepackage List</h6>
                </div>
                <div class="" style="width: 50%;float:left;">
                    <a type="button" data-bs-toggle="modal" data-bs-target="#mainServicepackage"
                        class="btn btn-primary m-2" style="float: right"> + Create Servicepackage</a>
                </div>
            </div>
        </div>

        <div class="col-sm-12 col-md-12 col-xl-12">
            <div class="bg-secondary rounded h-100 p-4">
                <div class="data-tables">
                    <table class="table table-dark" id="servicepackageinfo" width="100%" style="text-align: center;">
                        <thead class="thead-light">
                            <tr>
                                <th>SL</th>
                                <th>Package</th>
                                <th>Role</th>
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
        <div class="modal fade" id="mainServicepackage" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content bg-secondary rounded h-100">
                    <div class="modal-header">
                        <h5 class="modal-title" style="color: red;">Create New Servicepackage</h5>
                        <button type="button" class="btn-dark btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <form name="form" id="AddServicepackage" enctype="multipart/form-data">
                            @csrf
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" name="servicepackage_name"
                                    id="servicepackage_name" placeholder="Service Package Name">
                                <label for="floatingInput">Service Package Name</label>
                            </div>

                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" name="package_text" id="package_text"
                                    placeholder="Package Text">
                                <label for="floatingInput">Package Text</label>
                            </div>

                            <div class="form-floating mb-3">
                                <select class="form-select mb-4" name="roles" id="role" style="font-size: 1rem;"
                                    aria-label=".form-select-lg example">
                                    <option value="" style="color: red">Select Roles</option>
                                    @forelse ($roles as $role)
                                        <option value="{{ $role->id }}">{{ $role->name }}</option>
                                    @empty
                                    @endforelse
                                </select>
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
        <div class="modal fade" id="editmainServicepackage" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content bg-secondary rounded h-100">
                    <div class="modal-header">
                        <h5 class="modal-title" style="color: red;">Edit Servicepackage</h5>
                        <button type="button" class="btn-dark btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <form name="form" id="EditServicepackage" enctype="multipart/form-data">
                            @csrf
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" name="servicepackage_name"
                                    id="servicepackage_name" placeholder="Servicepackage Name">
                                <label for="floatingInput">Servicepackage Name</label>
                            </div>

                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" name="package_text" id="package_text"
                                    placeholder="Package Text">
                                <label for="floatingInput">Package Text</label>
                            </div>

                            <input type="text" name="servicepackage_id" id="servicepackage_id" hidden>

                            <div class="form-floating mb-3">
                                <select class="form-select mb-4" name="roles" id="role" disabled
                                    style="font-size: 1rem;" aria-label=".form-select-lg example">
                                    <option value="" style="color: red">Select Roles</option>
                                    @forelse ($roles as $role)
                                        <option value="{{ $role->id }}">{{ $role->name }}</option>
                                    @empty
                                    @endforelse
                                </select>
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

        var servicepackageinfo = $('#servicepackageinfo').DataTable({
            order: [
                [0, 'desc']
            ],
            processing: true,
            serverSide: true,
            ajax: '{!! route('admin.servicepackage.data') !!}',
            columns: [{
                    data: 'id'
                }, {
                    data: 'servicepackage_name'
                }, {
                    data: 'role'
                },
                {
                    "data": null,
                    render: function(data) {

                        if (data.status === 'Active') {
                            return '<button type="button" class="btn btn-success btn-sm btn-status" data-status="Inactive" id="servicepackagestatusBtn" data-id="' +
                                data.id + '">Active</button>';
                        } else {
                            return '<button type="button" class="btn btn-warning btn-sm btn-status" data-status="Active" id="servicepackagestatusBtn" data-id="' +
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


        //add servicepackage

        $('#AddServicepackage').submit(function(e) {
            e.preventDefault();

            $.ajax({
                type: 'POST',
                uploadUrl: '{{ route('admin.servicepackages.store') }}',
                processData: false,
                contentType: false,
                data: new FormData(this),

                success: function(data) {
                    if (data == 'exist') {
                        swal({
                            icon: 'error',
                            title: 'Can not process !',
                            text: 'Already have a package with this role',
                            buttons: true,
                            buttons: "Thanks",
                        });
                    } else {
                        $('#servicepackage_name').val('');
                        $('#package_text').val('');
                        $('#roles').val('');

                        swal({
                            title: "Success!",
                            icon: "success",
                        });
                        servicepackageinfo.ajax.reload();
                    }
                },
                error: function(error) {
                    console.log('error');
                }
            });
        });

        //edit servicepackage
        $(document).on('click', '#editServicepackageBtn', function() {
            let servicepackageId = $(this).data('id');

            $.ajax({
                type: 'GET',
                url: 'servicepackages/' + servicepackageId + '/edit',

                success: function(data) {
                    $('#EditServicepackage').find('#servicepackage_name').val(data
                        .servicepackage_name);
                    $('#EditServicepackage').find('#package_text').val(data
                        .package_text);
                    $('#EditServicepackage').find('#servicepackage_id').val(data.id);
                    $('#EditServicepackage').find('#role').val(data.roles);

                    $('#EditServicepackage').attr('data-id', data.id);
                },
                error: function(error) {
                    console.log('error');
                }

            });
        });

        //update servicepackage
        $('#EditServicepackage').submit(function(e) {
            e.preventDefault();
            let servicepackageId = $('#servicepackage_id').val();

            $.ajax({
                type: 'POST',
                url: 'servicepackage/' + servicepackageId,
                processData: false,
                contentType: false,
                data: new FormData(this),

                success: function(data) {
                    $('#EditServicepackage').find('#servicepackage_name').val('');
                    $('#EditServicepackage').find('#package_text').val('');
                    $('#EditServicepackage').find('#servicepackage_id').val('');
                    $('#EditServicepackage').find('#role').val('');

                    swal({
                        title: "Servicepackage update successfully !",
                        icon: "success",
                        showCancelButton: true,
                        focusConfirm: false,
                        confirmButtonColor: "#DD6B55",
                        confirmButtonText: "Yes",
                        cancelButtonText: "No",
                    });
                    servicepackageinfo.ajax.reload();

                },
                error: function(error) {
                    console.log('error');
                }
            });
        });


        // status update

        $(document).on('click', '#servicepackagestatusBtn', function() {
            let servicepackageId = $(this).data('id');
            let servicepackageStatus = $(this).data('status');

            $.ajax({
                type: 'PUT',
                url: 'servicepackage/status',
                data: {
                    servicepackage_id: servicepackageId,
                    status: servicepackageStatus,
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
                    servicepackageinfo.ajax.reload();
                },
                error: function(error) {
                    console.log('error');
                }

            });
        });

    });
</script>

@endsection
