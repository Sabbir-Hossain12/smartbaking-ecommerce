@extends('backend.master')

@section('maincontent')
@section('title')
    {{ env('APP_NAME') }}- Subcategory
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
                    <h6 class="mb-0">Subcategory List</h6>
                </div>
                <div class="" style="width: 50%;float:left;">
                    <a type="button" data-bs-toggle="modal" data-bs-target="#mainSubcategory"
                        class="btn btn-primary m-2" style="float: right"> + Create Subcategory</a>
                </div>
            </div>
        </div>

        <div class="col-sm-12 col-md-12 col-xl-12">
            <div class="bg-secondary rounded h-100 p-4">
                <div class="data-tables">
                    <table class="table table-dark" id="subcategoryinfo" width="100%" style="text-align: center;">
                        <thead class="thead-light">
                            <tr>
                                <th>SL</th>
                                <th>Icon</th>
                                <th>Name</th>
                                <th>Category Name</th>
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
        <div class="modal fade" id="mainSubcategory" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content bg-secondary rounded h-100">
                    <div class="modal-header">
                        <h5 class="modal-title" style="color: red;">Create New Subcategory</h5>
                        <button type="button" class="btn-dark btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <form name="form" id="AddSubcategory" enctype="multipart/form-data">
                            @csrf
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" name="sub_category_name"
                                    id="sub_category_name" placeholder="Subcategory Name">
                                <label for="floatingInput">Subcategory Name</label>
                            </div>

                            <div class="mt-4 mb-4">
                                <select name="category_id" id="category_id" class="form-select form-select-lg mb-3"
                                    aria-label=".form-select-lg example">
                                    <option value="">Choose Category</option>
                                    @forelse ($categories as $category)
                                        <option value="{{ $category->id }}">{{ $category->category_name }}</option>
                                    @empty
                                    @endforelse
                                </select>
                            </div>
                            <div class="mt-4 mb-4">
                                <input class="form-control form-control-lg bg-dark" name="subcategory_icon"
                                    id="subcategory_icon" type="file">
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
        <div class="modal fade" id="editmainSubcategory" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content bg-secondary rounded h-100">
                    <div class="modal-header">
                        <h5 class="modal-title" style="color: red;">Edit Subcategory</h5>
                        <button type="button" class="btn-dark btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <form name="form" id="EditSubcategory" enctype="multipart/form-data">
                            @csrf
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" name="sub_category_name"
                                    id="sub_category_name" placeholder="Subcategory Name">
                                <label for="floatingInput">Subcategory Name</label>
                            </div>

                            <div class="mt-4 mb-4">
                                <select name="category_id" id="category_id" class="form-select form-select-lg mb-3"
                                    aria-label=".form-select-lg example">
                                    <option value="">Choose Category</option>
                                    @forelse ($categories as $category)
                                        <option value="{{ $category->id }}">{{ $category->category_name }}</option>
                                    @empty
                                    @endforelse
                                </select>
                            </div>
                            <div class="mt-4 mb-4">
                                <input class="form-control form-control-lg bg-dark" name="subcategory_icon"
                                    id="subcategory_icon" type="file">
                            </div>
                            <div class="m-3 ms-0 mb-0"
                                style="text-align: center;height: 100px;margin-top:20px !important">
                                <h4 style="width:30%;float: left;text-align: left;">Icon : </h4>
                                <div id="previmg" style="float: left;"></div>
                            </div>
                            <input type="text" name="subcategory_id" id="subcategory_id" hidden>
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

        var subcategoryinfo = $('#subcategoryinfo').DataTable({
            order: [
                [0, 'desc']
            ],
            processing: true,
            serverSide: true,
            ajax: '{!! route('admin.subcategory.data') !!}',
            columns: [{
                    data: 'id'
                }, {
                    data: 'subcategory_icon',
                    name: 'subcategory_icon',
                    render: function(data, type, full, meta) {
                        return "<img src=../" + data + " height=\"40\" alt='No Image'/>";
                    }
                },
                {
                    data: 'sub_category_name',
                },
                {
                    data: 'categories.category_name'
                },
                {
                    "data": null,
                    render: function(data) {

                        if (data.status === 'Active') {
                            return '<button type="button" class="btn btn-success btn-sm btn-status" data-status="Inactive" id="subcategorystatusBtn" data-id="' +
                                data.id + '">Active</button>';
                        } else {
                            return '<button type="button" class="btn btn-warning btn-sm btn-status" data-status="Active" id="subcategorystatusBtn" data-id="' +
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


        //add subcategory

        $('#AddSubcategory').submit(function(e) {
            e.preventDefault();

            $.ajax({
                type: 'POST',
                uploadUrl: '{{ route('admin.subcategorys.store') }}',
                processData: false,
                contentType: false,
                data: new FormData(this),

                success: function(data) {
                    $('#sub_category_name').val('');
                    $('#category_id').val('');

                    swal({
                        title: "Success!",
                        icon: "success",
                    });
                    subcategoryinfo.ajax.reload();
                },
                error: function(error) {
                    console.log('error');
                }
            });
        });

        //edit subcategory
        $(document).on('click', '#editSubcategoryBtn', function() {
            let subcategoryId = $(this).data('id');

            $.ajax({
                type: 'GET',
                url: 'subcategorys/' + subcategoryId + '/edit',

                success: function(data) {
                    $('#EditSubcategory').find('#sub_category_name').val(data
                        .sub_category_name);
                    $('#EditSubcategory').find('#category_id').val(data.category_id);
                    $('#EditSubcategory').find('#subcategory_id').val(data.id);

                    $('#EditSubcategory').attr('data-id', data.id);
                },
                error: function(error) {
                    console.log('error');
                }

            });
        });

        //update subcategory
        $('#EditSubcategory').submit(function(e) {
            e.preventDefault();
            let subcategoryId = $('#subcategory_id').val();

            $.ajax({
                type: 'POST',
                url: 'subcategory/' + subcategoryId,
                processData: false,
                contentType: false,
                data: new FormData(this),

                success: function(data) {
                    $('#EditSubcategory').find('#sub_category_name').val('');
                    $('#EditSubcategory').find('#category_id').val('');

                    swal({
                        title: "Subcategory update successfully !",
                        icon: "success",
                        showCancelButton: true,
                        focusConfirm: false,
                        confirmButtonColor: "#DD6B55",
                        confirmButtonText: "Yes",
                        cancelButtonText: "No",
                    });
                    subcategoryinfo.ajax.reload();

                },
                error: function(error) {
                    console.log('error');
                }
            });
        });

        // delete subcategory

        $(document).on('click', '#deleteSubcategoryBtn', function() {
            let subcategoryId = $(this).data('id');
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
                            url: 'subcategorys/' + subcategoryId,
                            data: {
                                '_token': token
                            },
                            success: function(data) {
                                swal("Subcategory has been deleted!", {
                                    icon: "success",
                                });
                                subcategoryinfo.ajax.reload();
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

        $(document).on('click', '#subcategorystatusBtn', function() {
            let subcategoryId = $(this).data('id');
            let subcategoryStatus = $(this).data('status');

            $.ajax({
                type: 'PUT',
                url: 'subcategory/status',
                data: {
                    subcategory_id: subcategoryId,
                    status: subcategoryStatus,
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
                    subcategoryinfo.ajax.reload();
                },
                error: function(error) {
                    console.log('error');
                }

            });
        });

    });
</script>

@endsection
