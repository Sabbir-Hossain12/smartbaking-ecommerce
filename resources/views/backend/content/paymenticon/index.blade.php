@extends('backend.master')

@section('maincontent')
@section('title')
    {{ env('APP_NAME') }}- Paymenticons
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
                    <h6 class="mb-0">Payment Icon List</h6>
                </div>
                <div class="" style="width: 50%;float:left;">
                    <a type="button" data-bs-toggle="modal" data-bs-target="#mainPaymenticon" class="btn btn-primary m-2"
                        style="float: right"> + Create Payment Icon</a>
                </div>
            </div>
        </div>

        <div class="col-sm-12 col-md-12 col-xl-12">
            <div class="bg-secondary rounded h-100 p-4">
                <div class="data-tables">
                    <table class="table table-dark" id="paymenticoninfo" width="100%" style="text-align: center;">
                        <thead class="thead-light">
                            <tr>
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
        <div class="modal fade" id="mainPaymenticon" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content bg-secondary rounded h-100">
                    <div class="modal-header">
                        <h5 class="modal-title" style="color: red;">Create New Paymenticon</h5>
                        <button type="button" class="btn-dark btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <form name="form" id="AddPaymenticon" enctype="multipart/form-data">
                            @csrf
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" name="payment_type_name"
                                    id="payment_type_name" placeholder="Payment Type Name">
                                <label for="floatingInput">Payment Type Name</label>
                            </div>

                            <div class="mt-4 mb-4">
                                <input class="form-control form-control-lg bg-dark" name="payment_icon"
                                    id="payment_icon" type="file">
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
        <div class="modal fade" id="editmainPaymenticon" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content bg-secondary rounded h-100">
                    <div class="modal-header">
                        <h5 class="modal-title" style="color: red;">Edit Paymenticon</h5>
                        <button type="button" class="btn-dark btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <form name="form" id="EditPaymenticon" enctype="multipart/form-data">
                            @csrf
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" name="payment_type_name"
                                    id="payment_type_name" placeholder="Payment Type Name">
                                <label for="floatingInput">Payment Type Name</label>
                            </div>

                            <div class="mt-4 mb-4">
                                <input class="form-control form-control-lg bg-dark" name="payment_icon"
                                    id="payment_icon" type="file">
                            </div>
                            <input type="text" name="paymenticon_id" id="paymenticon_id" hidden>

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

        var paymenticoninfo = $('#paymenticoninfo').DataTable({
            order: [
                [0, 'desc']
            ],
            processing: true,
            serverSide: true,
            ajax: '{!! route('admin.paymenticon.data') !!}',
            columns: [{
                    data: 'payment_icon',
                    name: 'payment_icon',
                    render: function(data, type, full, meta) {
                        return "<img src=../" + data + " height=\"40\" alt='No Image'/>";
                    }
                },
                {
                    data: 'payment_type_name'
                },
                {
                    "data": null,
                    render: function(data) {

                        if (data.status === 'Active') {
                            return '<button type="button" class="btn btn-success btn-sm btn-status" data-status="Inactive" id="paymenticonstatusBtn" data-id="' +
                                data.id + '">Active</button>';
                        } else {
                            return '<button type="button" class="btn btn-warning btn-sm btn-status" data-status="Active" id="paymenticonstatusBtn" data-id="' +
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


        //add paymenticon

        $('#AddPaymenticon').submit(function(e) {
            e.preventDefault();

            $.ajax({
                type: 'POST',
                uploadUrl: '{{ route('admin.paymenticons.store') }}',
                processData: false,
                contentType: false,
                data: new FormData(this),

                success: function(data) {
                    $('#payment_type_name').val('');
                    $('#payment_icon').val('');

                    swal({
                        title: "Success!",
                        icon: "success",
                    });
                    paymenticoninfo.ajax.reload();
                },
                error: function(error) {
                    console.log('error');
                }
            });
        });

        //edit paymenticon
        $(document).on('click', '#editPaymenticonBtn', function() {
            let paymenticonId = $(this).data('id');

            $.ajax({
                type: 'GET',
                url: 'paymenticons/' + paymenticonId + '/edit',

                success: function(data) {
                    $('#EditPaymenticon').find('#payment_type_name').val(data
                        .payment_type_name);
                    $('#EditPaymenticon').find('#paymenticon_id').val(data.id);

                    $('#previmg').html('');
                    $('#previmg').append(`
                        <img  src="../` + data.payment_icon + `" alt = "" style="height: 40px" />
                    `);

                    $('#EditPaymenticon').attr('data-id', data.id);
                },
                error: function(error) {
                    console.log('error');
                }

            });
        });

        //update paymenticon
        $('#EditPaymenticon').submit(function(e) {
            e.preventDefault();
            let paymenticonId = $('#paymenticon_id').val();

            $.ajax({
                type: 'POST',
                url: 'paymenticon/' + paymenticonId,
                processData: false,
                contentType: false,
                data: new FormData(this),

                success: function(data) {
                    $('#EditPaymenticon').find('#payment_type_name').val('');
                    $('#previmg').html('');

                    swal({
                        title: "Paymenticon update successfully !",
                        icon: "success",
                        showCancelButton: true,
                        focusConfirm: false,
                        confirmButtonColor: "#DD6B55",
                        confirmButtonText: "Yes",
                        cancelButtonText: "No",
                    });
                    paymenticoninfo.ajax.reload();

                },
                error: function(error) {
                    console.log('error');
                }
            });
        });

        // delete paymenticon

        $(document).on('click', '#deletePaymenticonBtn', function() {
            let paymenticonId = $(this).data('id');
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
                            url: 'paymenticons/' + paymenticonId,
                            data: {
                                '_token': token
                            },
                            success: function(data) {
                                swal("Paymenticon has been deleted!", {
                                    icon: "success",
                                });
                                paymenticoninfo.ajax.reload();
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

        $(document).on('click', '#paymenticonstatusBtn', function() {
            let paymenticonId = $(this).data('id');
            let paymenticonStatus = $(this).data('status');

            $.ajax({
                type: 'PUT',
                url: 'paymenticon/status',
                data: {
                    paymenticon_id: paymenticonId,
                    status: paymenticonStatus,
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
                    paymenticoninfo.ajax.reload();
                },
                error: function(error) {
                    console.log('error');
                }

            });
        });

    });
</script>

@endsection
