@extends('backend.master')

@section('maincontent')
@section('title')
    {{ env('APP_NAME') }}- Policymenu
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
                    <h6 class="mb-0">Policy Menu List</h6>
                </div>
                <div class="" style="width: 50%;float:left;">
                    <a type="button" data-bs-toggle="modal" data-bs-target="#mainPolicymenu" class="btn btn-primary m-2"
                        style="float: right"> + Create Policy Menu</a>
                </div>
            </div>
        </div>

        <div class="col-sm-12 col-md-12 col-xl-12">
            <div class="bg-secondary rounded h-100 p-4">
                <div class="data-tables">
                    <table class="table table-dark" id="policymenuinfo" width="100%" style="text-align: center;">
                        <thead class="thead-light">
                            <tr>
                                <th>Name</th>
                                <th>Text</th>
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
        <div class="modal fade" id="mainPolicymenu" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content bg-secondary rounded h-100">
                    <div class="modal-header">
                        <h5 class="modal-title" style="color: red;">Create New Policymenu</h5>
                        <button type="button" class="btn-dark btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <form name="form" id="AddPolicymenu" enctype="multipart/form-data">
                            @csrf
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" name="policy_menu_name" id="policy_menu_name"
                                    placeholder="Policy Menu Name">
                                <label for="floatingInput">Policy Menu Name</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" name="policy_text" id="policy_text"
                                    placeholder="Policy Text">
                                <label for="floatingInput">Policy Text</label>
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
        <div class="modal fade" id="editmainPolicymenu" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content bg-secondary rounded h-100">
                    <div class="modal-header">
                        <h5 class="modal-title" style="color: red;">Edit Policymenu</h5>
                        <button type="button" class="btn-dark btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <form name="form" id="EditPolicymenu" enctype="multipart/form-data">
                            @csrf
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" name="policy_menu_name" id="policy_menu_name"
                                    placeholder="Policy Menu Name">
                                <label for="floatingInput">Policy Menu Name</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" name="policy_text" id="policy_text"
                                    placeholder="Policy Text">
                                <label for="floatingInput">Policy Text</label>
                            </div>
                            <input type="text" name="policymenu_id" id="policymenu_id" hidden>

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

        var policymenuinfo = $('#policymenuinfo').DataTable({
            order: [
                [0, 'desc']
            ],
            processing: true,
            serverSide: true,
            ajax: '{!! route('admin.policymenu.data') !!}',
            columns: [{
                    data: 'policy_menu_name',
                },
                {
                    data: 'policy_text'
                },
                {
                    "data": null,
                    render: function(data) {

                        if (data.status === 'Active') {
                            return '<button type="button" class="btn btn-success btn-sm btn-status" data-status="Inactive" id="policymenustatusBtn" data-id="' +
                                data.id + '">Active</button>';
                        } else {
                            return '<button type="button" class="btn btn-warning btn-sm btn-status" data-status="Active" id="policymenustatusBtn" data-id="' +
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


        //add policymenu

        $('#AddPolicymenu').submit(function(e) {
            e.preventDefault();

            $.ajax({
                type: 'POST',
                uploadUrl: '{{ route('admin.policymenus.store') }}',
                processData: false,
                contentType: false,
                data: new FormData(this),

                success: function(data) {
                    $('#policy_menu_name').val('');
                    $('#policy_text').val('');

                    swal({
                        title: "Success!",
                        icon: "success",
                    });
                    policymenuinfo.ajax.reload();
                },
                error: function(error) {
                    console.log('error');
                }
            });
        });

        //edit policymenu
        $(document).on('click', '#editPolicymenuBtn', function() {
            let policymenuId = $(this).data('id');

            $.ajax({
                type: 'GET',
                url: 'policymenus/' + policymenuId + '/edit',

                success: function(data) {
                    $('#EditPolicymenu').find('#policy_menu_name').val(data
                        .policy_menu_name);
                    $('#EditPolicymenu').find('#policy_text').val(data
                        .policy_text);
                    $('#EditPolicymenu').find('#policymenu_id').val(data.id);

                    $('#EditPolicymenu').attr('data-id', data.id);
                },
                error: function(error) {
                    console.log('error');
                }

            });
        });

        //update policymenu
        $('#EditPolicymenu').submit(function(e) {
            e.preventDefault();
            let policymenuId = $('#policymenu_id').val();

            $.ajax({
                type: 'POST',
                url: 'policymenu/' + policymenuId,
                processData: false,
                contentType: false,
                data: new FormData(this),

                success: function(data) {
                    $('#EditPolicymenu').find('#policy_menu_name').val('');
                    $('#EditPolicymenu').find('#policy_text').val('');
                    $('#previmg').html('');

                    swal({
                        title: "Policymenu update successfully !",
                        icon: "success",
                        showCancelButton: true,
                        focusConfirm: false,
                        confirmButtonColor: "#DD6B55",
                        confirmButtonText: "Yes",
                        cancelButtonText: "No",
                    });
                    policymenuinfo.ajax.reload();

                },
                error: function(error) {
                    console.log('error');
                }
            });
        });

        // delete policymenu

        $(document).on('click', '#deletePolicymenuBtn', function() {
            let policymenuId = $(this).data('id');
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
                            url: 'policymenus/' + policymenuId,
                            data: {
                                '_token': token
                            },
                            success: function(data) {
                                swal("Policymenu has been deleted!", {
                                    icon: "success",
                                });
                                policymenuinfo.ajax.reload();
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

        $(document).on('click', '#policymenustatusBtn', function() {
            let policymenuId = $(this).data('id');
            let policymenuStatus = $(this).data('status');

            $.ajax({
                type: 'PUT',
                url: 'policymenu/status',
                data: {
                    policymenu_id: policymenuId,
                    status: policymenuStatus,
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
                    policymenuinfo.ajax.reload();
                },
                error: function(error) {
                    console.log('error');
                }

            });
        });

    });
</script>

@endsection
