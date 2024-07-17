@extends('backend.master')

@section('maincontent')
@section('title')
    {{ env('APP_NAME') }}- Category
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
                    <h6 class="mb-0">Category List</h6>
                </div>
                <div class="" style="width: 50%;float:left;">
                    <a type="button" data-bs-toggle="modal" data-bs-target="#mainCategory" class="btn btn-primary m-2"
                        style="float: right"> + Create Category</a>
                </div>
            </div>
        </div>

        <div class="col-sm-12 col-md-12 col-xl-12">
            <div class="bg-secondary rounded h-100 p-4">
                <div class="data-tables">
                    <table class="table table-dark" id="categoryinfo" width="100%" style="text-align: center;">
                        <thead class="thead-light">
                            <tr>
                                <th>SL</th>
                                <th>Icon</th>
                                <th>Name</th>
                                <th>Front View</th>
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
        <div class="modal fade" id="mainCategory" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content bg-secondary rounded h-100">
                    <div class="modal-header">
                        <h5 class="modal-title" style="color: red;">Create New Category</h5>
                        <button type="button" class="btn-dark btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <form name="form" id="AddCategory" enctype="multipart/form-data">
                            @csrf
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" name="category_name" id="category_name"
                                    placeholder="Category Name">
                                <label for="floatingInput">Category Name</label>
                            </div>

                            <div class="mt-4 mb-4">
                                <input class="form-control form-control-lg bg-dark" name="category_icon"
                                    id="category_icon" type="file">
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
        <div class="modal fade" id="editmainCategory" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content bg-secondary rounded h-100">
                    <div class="modal-header">
                        <h5 class="modal-title" style="color: red;">Edit Category</h5>
                        <button type="button" class="btn-dark btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <form name="form" id="EditCategory" enctype="multipart/form-data">
                            @csrf
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" name="category_name" id="category_name"
                                    placeholder="Category Name">
                                <label for="floatingInput">Category Name</label>
                            </div>

                            <div class="mt-4 mb-4">
                                <input class="form-control form-control-lg bg-dark" name="category_icon"
                                    id="category_icon" type="file">
                            </div>
                            <input type="text" name="category_id" id="category_id" hidden>

                            <div class="m-3 ms-0 mb-0"
                                style="text-align: center;height: 100px;margin-top:20px !important">
                                <h4 style="width:30%;float: left;text-align: left;">Icon : </h4>
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

        var categoryinfo = $('#categoryinfo').DataTable({
            order: [
                [0, 'desc']
            ],
            processing: true,
            serverSide: true,
            ajax: '{!! route('admin.category.data') !!}',
            columns: [{
                    data: 'id'
                }, {
                    data: 'category_icon',
                    name: 'category_icon',
                    render: function(data, type, full, meta) {
                        return "<img src=../" + data + " height=\"40\" alt='No Image'/>";
                    }
                },
                {
                    data: 'category_name'
                },
                {
                    "data": null,
                    render: function(data) {

                        if (data.front_status == '0') {
                            return '<button type="button" class="btn btn-success btn-sm btn-status" data-status="1" id="categoryfrontstatusBtn" data-id="' +
                                data.id + '">Active</button>';
                        } else {
                            return '<button type="button" class="btn btn-warning btn-sm btn-status" data-status="0" id="categoryfrontstatusBtn" data-id="' +
                                data.id + '" >Inactive</button>';
                        }


                    }
                },
                {
                    "data": null,
                    render: function(data) {

                        if (data.status === 'Active') {
                            return '<button type="button" class="btn btn-success btn-sm btn-status" data-status="Inactive" id="categorystatusBtn" data-id="' +
                                data.id + '">Active</button>';
                        } else {
                            return '<button type="button" class="btn btn-warning btn-sm btn-status" data-status="Active" id="categorystatusBtn" data-id="' +
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


        //add category

        $('#AddCategory').submit(function(e) {
            e.preventDefault();

            $.ajax({
                type: 'POST',
                uploadUrl: '{{ route('admin.categorys.store') }}',
                processData: false,
                contentType: false,
                data: new FormData(this),

                success: function(data) {
                    $('#category_name').val('');
                    $('#category_icon').val('');

                    swal({
                        title: "Success!",
                        icon: "success",
                    });
                    categoryinfo.ajax.reload();
                },
                error: function(error) {
                    console.log('error');
                }
            });
        });

        //edit category
        $(document).on('click', '#editCategoryBtn', function() {
            let categoryId = $(this).data('id');

            $.ajax({
                type: 'GET',
                url: 'categorys/' + categoryId + '/edit',

                success: function(data) {
                    $('#EditCategory').find('#category_name').val(data
                        .category_name);
                    $('#EditCategory').find('#category_id').val(data.id);

                    $('#previmg').html('');
                    $('#previmg').append(`
                        <img  src="../` + data.category_icon + `" alt = "" style="height: 80px" />
                    `);

                    $('#EditCategory').attr('data-id', data.id);
                },
                error: function(error) {
                    console.log('error');
                }

            });
        });

        //update category
        $('#EditCategory').submit(function(e) {
            e.preventDefault();
            let categoryId = $('#category_id').val();

            $.ajax({
                type: 'POST',
                url: 'category/' + categoryId,
                processData: false,
                contentType: false,
                data: new FormData(this),

                success: function(data) {
                    $('#EditCategory').find('#category_name').val('');
                    $('#previmg').html('');

                    swal({
                        title: "Category update successfully !",
                        icon: "success",
                        showCancelButton: true,
                        focusConfirm: false,
                        confirmButtonColor: "#DD6B55",
                        confirmButtonText: "Yes",
                        cancelButtonText: "No",
                    });
                    categoryinfo.ajax.reload();

                },
                error: function(error) {
                    console.log('error');
                }
            });
        });

        // delete category

        $(document).on('click', '#deleteCategoryBtn', function() {
            let categoryId = $(this).data('id');
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
                            url: 'categorys/' + categoryId,
                            data: {
                                '_token': token
                            },
                            success: function(data) {
                                swal("Category has been deleted!", {
                                    icon: "success",
                                });
                                categoryinfo.ajax.reload();
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

        $(document).on('click', '#categorystatusBtn', function() {
            let categoryId = $(this).data('id');
            let categoryStatus = $(this).data('status');

            $.ajax({
                type: 'PUT',
                url: 'category/status',
                data: {
                    category_id: categoryId,
                    status: categoryStatus,
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
                    categoryinfo.ajax.reload();
                },
                error: function(error) {
                    console.log('error');
                }

            });
        });

        // front status update

        $(document).on('click', '#categoryfrontstatusBtn', function() {
            let categoryId = $(this).data('id');
            let categoryFrontStatus = $(this).data('status');

            $.ajax({
                type: 'PUT',
                url: 'category/status',
                data: {
                    category_id: categoryId,
                    front_status: categoryFrontStatus,
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
                    categoryinfo.ajax.reload();
                },
                error: function(error) {
                    console.log('error');
                }

            });
        });

    });
</script>

@endsection
