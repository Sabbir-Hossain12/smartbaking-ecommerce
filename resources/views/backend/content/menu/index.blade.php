@extends('backend.master')

@section('maincontent')
@section('title')
    {{ env('APP_NAME') }}- Menu
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
                    <h6 class="mb-0">Menu List</h6>
                </div>
                <div class="" style="width: 50%;float:left;">
                    <a type="button" data-bs-toggle="modal" data-bs-target="#mainMenu" class="btn btn-primary m-2"
                        style="float: right"> + Create Menu</a>
                </div>
            </div>
        </div>

        <div class="col-sm-12 col-md-12 col-xl-12">
            <div class="bg-secondary rounded h-100 p-4">
                <div class="data-tables">
                    <table class="table table-dark" id="menuinfo" width="100%" style="text-align: center;">
                        <thead class="thead-light">
                            <tr>
                                <th>SL</th>
                                <th>Banner</th>
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
        <div class="modal fade" id="mainMenu" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content bg-secondary rounded h-100">
                    <div class="modal-header">
                        <h5 class="modal-title" style="color: red;">Create New Menu</h5>
                        <button type="button" class="btn-dark btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <form name="form" id="AddMenu" enctype="multipart/form-data">
                            @csrf
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" name="menu_name" id="menu_name"
                                    placeholder="Menu Name">
                                <label for="floatingInput">Menu Name</label>
                            </div>

                            <div class="mt-4 mb-4">
                                <input class="form-control form-control-lg bg-dark" name="menu_banner" id="menu_banner"
                                    type="file">
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
        <div class="modal fade" id="editmainMenu" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content bg-secondary rounded h-100">
                    <div class="modal-header">
                        <h5 class="modal-title" style="color: red;">Edit Menu</h5>
                        <button type="button" class="btn-dark btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <form name="form" id="EditMenu" enctype="multipart/form-data">
                            @csrf
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" name="menu_name" id="menu_name"
                                    placeholder="Menu Name">
                                <label for="floatingInput">Menu Name</label>
                            </div>

                            <div class="mt-4 mb-4">
                                <input class="form-control form-control-lg bg-dark" name="menu_banner" id="menu_banner"
                                    type="file">
                            </div>
                            <input type="text" name="menu_id" id="menu_id" hidden>

                            <div class="m-3 ms-0 mb-0"
                                style="text-align: center;height: 100px;margin-top:20px !important">
                                <h4 style="width:30%;float: left;text-align: left;">Banner Image : </h4>
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

        var menuinfo = $('#menuinfo').DataTable({
            order: [
                [0, 'desc']
            ],
            processing: true,
            serverSide: true,
            ajax: '{!! route('admin.menu.data') !!}',
            columns: [{
                    data: 'id'
                }, {
                    data: 'menu_banner',
                    name: 'menu_banner',
                    render: function(data, type, full, meta) {
                        return "<img src=../" + data + " height=\"40\" alt='No Image'/>";
                    }
                },
                {
                    data: 'menu_name'
                },
                {
                    "data": null,
                    render: function(data) {

                        if (data.status === 'Active') {
                            return '<button type="button" class="btn btn-success btn-sm btn-status" data-status="Inactive" id="menustatusBtn" data-id="' +
                                data.id + '">Active</button>';
                        } else {
                            return '<button type="button" class="btn btn-warning btn-sm btn-status" data-status="Active" id="menustatusBtn" data-id="' +
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


        //add menu

        $('#AddMenu').submit(function(e) {
            e.preventDefault();

            $.ajax({
                type: 'POST',
                uploadUrl: '{{ route('admin.menus.store') }}',
                processData: false,
                contentType: false,
                data: new FormData(this),

                success: function(data) {
                    $('#menu_name').val('');
                    $('#menu_banner').val('');

                    swal({
                        title: "Success!",
                        icon: "success",
                    });
                    menuinfo.ajax.reload();
                },
                error: function(error) {
                    console.log('error');
                }
            });
        });

        //edit menu
        $(document).on('click', '#editMenuBtn', function() {
            let menuId = $(this).data('id');

            $.ajax({
                type: 'GET',
                url: 'menus/' + menuId + '/edit',

                success: function(data) {
                    $('#EditMenu').find('#menu_name').val(data
                        .menu_name);
                    $('#EditMenu').find('#menu_id').val(data.id);

                    $('#previmg').html('');
                    $('#previmg').append(`
                        <img  src="../` + data.menu_banner + `" alt = "" style="height: 80px" />
                    `);

                    $('#EditMenu').attr('data-id', data.id);
                },
                error: function(error) {
                    console.log('error');
                }

            });
        });

        //update menu
        $('#EditMenu').submit(function(e) {
            e.preventDefault();
            let menuId = $('#menu_id').val();

            $.ajax({
                type: 'POST',
                url: 'menu/' + menuId,
                processData: false,
                contentType: false,
                data: new FormData(this),

                success: function(data) {
                    $('#EditMenu').find('#menu_name').val('');
                    $('#previmg').html('');

                    swal({
                        title: "Menu update successfully !",
                        icon: "success",
                        showCancelButton: true,
                        focusConfirm: false,
                        confirmButtonColor: "#DD6B55",
                        confirmButtonText: "Yes",
                        cancelButtonText: "No",
                    });
                    menuinfo.ajax.reload();

                },
                error: function(error) {
                    console.log('error');
                }
            });
        });

        // delete menu

        $(document).on('click', '#deleteMenuBtn', function() {
            let menuId = $(this).data('id');
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
                            url: 'menus/' + menuId,
                            data: {
                                '_token': token
                            },
                            success: function(data) {
                                swal("Menu has been deleted!", {
                                    icon: "success",
                                });
                                menuinfo.ajax.reload();
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

        $(document).on('click', '#menustatusBtn', function() {
            let menuId = $(this).data('id');
            let menuStatus = $(this).data('status');

            $.ajax({
                type: 'PUT',
                url: 'menu/status',
                data: {
                    menu_id: menuId,
                    status: menuStatus,
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
                    menuinfo.ajax.reload();
                },
                error: function(error) {
                    console.log('error');
                }

            });
        });

    });
</script>

@endsection
