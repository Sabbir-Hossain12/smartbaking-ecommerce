@extends('backend.master')

@section('maincontent')
@section('title')
    {{ env('APP_NAME') }}- Attrvalue
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
                    <h6 class="mb-0">Attrvalue List</h6>
                </div>
                <div class="" style="width: 50%;float:left;">
                    <a type="button" data-bs-toggle="modal" data-bs-target="#mainAttrvalue" class="btn btn-primary m-2"
                        style="float: right"> + Create Attrvalue</a>
                </div>
            </div>
        </div>

        <div class="col-sm-12 col-md-12 col-xl-12">
            <div class="bg-secondary rounded h-100 p-4">
                <div class="data-tables">
                    <table class="table table-dark" id="attrvalueinfo" width="100%" style="text-align: center;">
                        <thead class="thead-light">
                            <tr>
                                <th>SL</th>
                                <th>Attribute</th>
                                <th>Attrvalue</th>
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
        <div class="modal fade" id="mainAttrvalue" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content bg-secondary rounded h-100">
                    <div class="modal-header">
                        <h5 class="modal-title" style="color: red;">Create New Attrvalue</h5>
                        <button type="button" class="btn-dark btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <form name="form" id="AddAttrvalue" enctype="multipart/form-data">
                            @csrf
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" name="value" id="value" placeholder="Name">
                                <label for="floatingInput">Name</label>
                            </div>
                            <div class="form-floating mb-3">
                                <select class="form-select mb-4" name="attribute_id" id="attribute_id"
                                    style="font-size: 1rem;" aria-label=".form-select-lg example">
                                    <option value="" style="color: red">Select Attributes</option>
                                    @forelse ($attributes as $attribute)
                                        <option value="{{ $attribute->id }}">{{ $attribute->attribute_name }}
                                        </option>
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
        <div class="modal fade" id="editmainAttrvalue" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content bg-secondary rounded h-100">
                    <div class="modal-header">
                        <h5 class="modal-title" style="color: red;">Edit Attrvalue</h5>
                        <button type="button" class="btn-dark btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <form name="form" id="EditAttrvalue" enctype="multipart/form-data">
                            @csrf
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" name="value" id="value"
                                    placeholder="Service Package Name">
                                <label for="floatingInput">Name</label>
                            </div>

                            <div class="form-floating mb-3">
                                <select class="form-select mb-4" name="attribute_id" id="attribute_id"
                                    style="font-size: 1rem;" aria-label=".form-select-lg example">
                                    <option value="" style="color: red">Select Attributes</option>
                                    @forelse ($attributes as $attribute)
                                        <option value="{{ $attribute->id }}">{{ $attribute->attribute_name }}
                                        </option>
                                    @empty
                                    @endforelse
                                </select>
                            </div>

                            <input type="text" name="attrvalue_id" id="attrvalue_id" hidden>

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

        var attrvalueinfo = $('#attrvalueinfo').DataTable({
            order: [
                [0, 'desc']
            ],
            processing: true,
            serverSide: true,
            ajax: '{!! route('admin.attrvalue.data') !!}',
            columns: [{
                    data: 'id'
                }, {
                    data: 'attribute_name'
                },
                {
                    data: 'value'
                },
                {
                    "data": null,
                    render: function(data) {

                        if (data.status === 'Active') {
                            return '<button type="button" class="btn btn-success btn-sm btn-status" data-status="Inactive" id="attrvaluestatusBtn" data-id="' +
                                data.id + '">Active</button>';
                        } else {
                            return '<button type="button" class="btn btn-warning btn-sm btn-status" data-status="Active" id="attrvaluestatusBtn" data-id="' +
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


        //add attrvalue

        $('#AddAttrvalue').submit(function(e) {
            e.preventDefault();

            $.ajax({
                type: 'POST',
                uploadUrl: '{{ route('admin.attrvalues.store') }}',
                processData: false,
                contentType: false,
                data: new FormData(this),

                success: function(data) {

                    $('#value').val('');

                    swal({
                        title: "Success!",
                        icon: "success",
                    });
                    attrvalueinfo.ajax.reload();

                },
                error: function(error) {
                    console.log('error');
                }
            });
        });

        //edit attrvalue
        $(document).on('click', '#editAttrvalueBtn', function() {
            let attrvalueId = $(this).data('id');

            $.ajax({
                type: 'GET',
                url: 'attrvalues/' + attrvalueId + '/edit',

                success: function(data) {
                    $('#EditAttrvalue').find('#attribute_id').val(data
                        .attribute_id);
                    $('#EditAttrvalue').find('#value').val(data
                        .value);
                    $('#EditAttrvalue').find('#attrvalue_id').val(data.id);

                    $('#EditAttrvalue').attr('data-id', data.id);
                },
                error: function(error) {
                    console.log('error');
                }

            });
        });

        //update attrvalue
        $('#EditAttrvalue').submit(function(e) {
            e.preventDefault();
            let attrvalueId = $('#attrvalue_id').val();

            $.ajax({
                type: 'POST',
                url: 'attrvalue/' + attrvalueId,
                processData: false,
                contentType: false,
                data: new FormData(this),

                success: function(data) {
                    $('#EditAttrvalue').find('#value').val('');
                    $('#EditAttrvalue').find('#attribute_id').val('');
                    $('#EditAttrvalue').find('#attrvalue_id').val('');

                    swal({
                        title: "Attrvalue update successfully !",
                        icon: "success",
                        showCancelButton: true,
                        focusConfirm: false,
                        confirmButtonColor: "#DD6B55",
                        confirmButtonText: "Yes",
                        cancelButtonText: "No",
                    });
                    attrvalueinfo.ajax.reload();

                },
                error: function(error) {
                    console.log('error');
                }
            });
        });


        // status update

        $(document).on('click', '#attrvaluestatusBtn', function() {
            let attrvalueId = $(this).data('id');
            let attrvalueStatus = $(this).data('status');

            $.ajax({
                type: 'PUT',
                url: 'attrvalue/status',
                data: {
                    attrvalue_id: attrvalueId,
                    status: attrvalueStatus,
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
                    attrvalueinfo.ajax.reload();
                },
                error: function(error) {
                    console.log('error');
                }

            });
        });

        $(document).on('click', '#deleteAttrvalueBtn', function() {
            let attrvalueId = $(this).data('id');
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
                            url: 'attrvalues/' + attrvalueId,
                            data: {
                                '_token': token
                            },
                            success: function(data) {
                                swal("Attrvalue has been deleted!", {
                                    icon: "success",
                                });
                                attrvalueinfo.ajax.reload();
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
