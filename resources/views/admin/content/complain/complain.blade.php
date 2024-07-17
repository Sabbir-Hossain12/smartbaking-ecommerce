@extends('admin.master')

@section('maincontent')

@section('subcss')
    <link rel="stylesheet" type="text/css"
        href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.0-alpha1/css/bootstrap.min.css">
    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/jquery-datatables-checkboxes@1.2.13/css/dataTables.checkboxes.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.4/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
@endsection
<?php
use App\Models\Admin;
$admin = Admin::where('email', Auth::guard('admin')->user()->email)->first();
$users = Admin::where('status', 'Active')
    ->inRandomOrder()
    ->get();
?>
<main id="main" class="main">

    <div class="pagetitle row">
        <div class="col-6">
            <h1><a href="{{ url('/admindashboard') }}">Dashboard</a></h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{ url('/admindashboard') }}">Home</a></li>
                    <li class="breadcrumb-item active">Complains</li>
                </ol>
            </nav>
        </div>
        <div class="col-6" style="text-align: right">
        </div>
    </div><!-- End Page Title -->



    {{-- //popup modal for edit user --}}
    <div class="modal fade" id="editmainComplain" tabindex="-1" data-bs-backdrop="false">
        <div class="modal-dialog" style="width: 92%;max-width: none;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Edit Complain</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">


                </div>

            </div>
        </div>
    </div><!-- End popup Modal-->

    {{-- //table section for category --}}
    <input type="hidden" name="_token" value="{{ csrf_token() }}" />
    <section class="section">
        <div class="row">
            <div class="col-lg-12">

                <div class="card">
                    <div class="card-body pt-4" style="text-align: center;">
                        @if (\Session::has('success'))
                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                <i class="bi bi-check-circle me-1"></i>
                                {{ \Session::get('success') }}
                                <button type="button" class="btn-close" data-bs-dismiss="alert"
                                    aria-label="Close"></button>
                            </div>
                        @endif

                        <div class="buttonsec">
                            @if ($admin->hasrole('admin') || $admin->hasrole('superadmin') || $admin->hasrole('manager'))
                                <a href="{{ url('complain/complainall') }}" class="btn btn-info btn-sm">Complain All</a>
                            @else
                            @endif
                            <a href="{{ url('complain/Pending') }}" class="btn btn-primary btn-sm">Pending Complain</a>
                            <a href="{{ url('complain/Solved') }}" class="btn btn-primary btn-sm">Solved Complain</a>
                            <a href="{{ url('complain/create/complain') }}" class="btn btn-primary btn-sm"><span
                                    style="font-weight: bold;">+</span> Add New Complain</a>

                            <div class="btn-group dropdown">
                                <a href="javascript: void(0);" style="color: white"
                                    class="table-action-btn dropdown-toggle arrow-none btn bg-success btn-sm"
                                    data-bs-toggle="dropdown" aria-expanded="false"><i
                                        class="fas fa-user-check mr-1"></i> Assign User</a>
                                <div class="dropdown-menu dropdown-menu-right">

                                    @foreach ($users as $user)
                                        <a class="dropdown-item assign-usertocomplain" data-id="{{ $user->id }}"
                                            href="#">{{ $user->name }}</a>
                                    @endforeach
                                </div>
                            </div>
                        </div>
                        <!-- Table with stripped rows -->
                        <div class="table-responsive">
                            <table class="table table-centered table-borderless table-hover mb-0" id="complaininfo"
                                width="100%">
                                <thead class="thead-light">
                                    <tr>
                                        <th></th>
                                        <th>Invoice ID</th>
                                        <th>Customer Phone</th>
                                        <th>Message</th>
                                        <th>Site Name</th>
                                        <th>User</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody></tbody>
                            </table>
                        </div>
                        <!-- End Table with stripped rows -->

                    </div>
                </div>

            </div>
        </div>
    </section>


    @if ($status)
        <input type="text" class="form-control" name="complain_status" id="complain_status"
            value="{{ $status }}" hidden>
    @else
        <input type="text" class="form-control" name="complain_status" id="complain_status" value="all" hidden>
    @endif
</main>


@section('subscript')
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/select/1.3.4/js/dataTables.select.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-datatables-checkboxes@1.2.13/js/dataTables.checkboxes.min.js"></script>
@endsection
<script>
    $(document).ready(function() {
        var statuscomplain = $('#complain_status').val();

        var complaininfotbl = $('#complaininfo').DataTable({
            order: [
                [0, 'desc']
            ],
            processing: true,
            serverSide: true,
            ajax: {
                url: "{{ url('complain/data/') }}" + '/' + statuscomplain,
            },
            columnDefs: [{
                targets: 0,
                checkboxes: {
                    selectRow: false,
                },
            }, ],
            columns: [{
                    data: 'id'
                },
                {
                    data: 'order_invoice_id'
                },
                {
                    data: 'customer_phone'
                },
                {
                    data: 'complain_message'
                },
                {
                    data: 'site_name'
                },
                {
                    data: 'user'
                },
                {
                    "data": null,
                    render: function(data) {

                        if (data.status === 'Solved') {
                            return '<button type="button" class="btn btn-success btn-sm btn-status" data-status="Pending" id="complainstatusBtn" data-id="' +
                                data.id + '">Solved</button>';
                        } else {
                            return '<button type="button" class="btn btn-warning btn-sm btn-status" data-status="Solved" id="complainstatusBtn" data-id="' +
                                data.id + '" >Pending</button>';
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

        //assign user
        $(document).on('click', '.assign-usertocomplain', function(e) {
            e.preventDefault();

            var rows_selected = complaininfotbl.column(0).checkboxes.selected();
            var ids = [];
            $.each(rows_selected, function(index, rowId) {
                ids[index] = rowId;
            });
            var admin_id = $(this).attr('data-id');

            jQuery.ajax({
                type: "GET",
                url: "{{ url('assign_user_complain') }}",
                contentType: "application/json",
                data: {
                    action: "assigncomplain",
                    ids: ids,
                    admin_id: admin_id
                },
                success: function(response) {
                    var data = JSON.parse(response);
                    if (data["status"] == "success") {
                        swal(data["message"]);
                        complaininfotbl.ajax.reload();
                    } else {
                        if (data["status"] == "failed") {
                            swal(data["message"]);
                        } else {
                            swal("Something wrong ! Please try again.");
                        }
                    }
                }
            });

        });


        //sync complain

        $(document).on('click', '.btn-synccomplain', function() {

            swal({
                html: true,
                title: 'Auto sync start!',
                text: 'It will close after all Complains sync.',
                buttons: true,
                dangerMode: true,
                buttons: "Please Wait ...",
            });

            $.ajax({
                type: 'GET',
                url: "{{ url('complain/complain/Sync') }}",

                success: function(data) {
                    var datas = JSON.parse(data);

                    if (datas.status == 'success') {
                        swal({
                            title: "Auto sync completed!",
                            text: datas.complainCount + ' complain added by sync',
                            icon: "success",
                            buttons: true,
                            buttons: "Completed",
                        });
                    } else {
                        swal({
                            title: "Auto sync completed!",
                            text: 'O complain added . Nothing to sync',
                            icon: "success",
                            buttons: true,
                            buttons: "Done",
                        });
                    }
                    complaininfotbl.ajax.reload();
                },
                error: function(error) {
                    swal({
                        icon: 'error',
                        title: 'Cant process auto sync !',
                        text: 'Connection Error . Please wait for internet',
                        buttons: true,
                        buttons: "Thanks",
                    });
                }

            });
        });


        $(document).on('click', '.btn-editcomplain', function(e) {
            e.preventDefault();
            var id = $(this).attr('data-id');
            $.ajax({
                type: "get",
                url: "{{ url('complain/complains') }}/" + id + "/edit",
                success: function(response) {

                    $('.modal .modal-body').empty().append(response);
                    $('.modal').modal('toggle');
                    $('.modal-footer').hide();


                    var ComplainCommentTable = $("#ComplainCommentTable").DataTable({
                        ajax: "{{ url('complain/comment/get') }}?id=" + $(
                            '#ComplainCommentTable').attr('data-id'),
                        ordering: false,
                        lengthChange: false,
                        bFilter: false,
                        search: false,
                        info: false,
                        columns: [{
                                data: "date"
                            },
                            {
                                data: "comment"
                            },
                            {
                                data: "name"
                            }
                        ],
                    });

                    $(document).on("click", "#updateComplainComment", function() {
                        var note = $('#complaincomment');
                        var id = $('#complain_id').val();
                        var token = $("input[name='_token']").val();

                        if (note.val() == '') {
                            note.css('border', '1px solid red');
                            return;
                        } else if (id == '') {
                            toastr.success('Something Wrong , Try again ! ');
                            return;
                        } else {
                            $.ajax({
                                type: "GET",
                                url: "{{ url('complain/comment/update') }}",
                                data: {
                                    'comment': note.val(),
                                    'complain_id': id,
                                    '_token': token
                                },
                                success: function(response) {
                                    var data = JSON.parse(response);
                                    if (data['status'] == 'success') {
                                        toastr.success(data["message"]);
                                        ComplainCommentTable.ajax
                                            .reload();
                                    } else {
                                        if (data['status'] ==
                                            'failed') {
                                            toastr.error(data[
                                                "message"]);
                                        } else {
                                            toastr.error(
                                                'Something wrong ! Please try again.'
                                            );
                                        }
                                    }
                                }
                            });
                            return;
                        }


                    });





                },
                error: function(error) {
                    swal({
                        icon: 'error',
                        title: 'Cant Open Complain !',
                        text: 'Complain Phone number is not valid',
                        buttons: true,
                        buttons: "Thanks",
                    });
                }
            });
        });

        //update
        $('#EditCourier').submit(function(e) {
            e.preventDefault();
            let courierId = $('#idhidden').val();

            $.ajax({
                type: 'POST',
                url: 'courier/' + courierId,
                processData: false,
                contentType: false,
                data: new FormData(this),

                success: function(data) {
                    $('#editcourierName').val('');
                    $('#editcourierCharge').val('');

                    swal({
                        title: "Courier update successfully !",
                        icon: "success",
                        showCancelButton: true,
                        focusConfirm: false,
                        confirmButtonColor: "#DD6B55",
                        confirmButtonText: "Yes",
                        cancelButtonText: "No",
                    });
                    courierinfotbl.ajax.reload();
                },
                error: function(error) {
                    console.log('error');
                }
            });
        });

        //delete complain

        $(document).on('click', '#deleteComplainBtn', function() {
            let complainsId = $(this).data('id');
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
                            url: 'complains/' + complainsId,

                            success: function(data) {
                                swal("Poof! Your complain has been deleted!", {
                                    icon: "success",
                                });
                                complaininfotbl.ajax.reload();
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

        //status update

        $(document).on('click', '#complainstatusBtn', function() {
            let complainsId = $(this).data('id');
            let complainStatus = $(this).data('status');

            $.ajax({
                type: 'PUT',
                url: 'complainstatus',
                data: {
                    complain_id: complainsId,
                    status: complainStatus,
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
                    complaininfotbl.ajax.reload();
                },
                error: function(error) {
                    console.log('error');
                }

            });
        });











    });
</script>

@if (Auth::user()->role == 0 || Auth::user()->role == 1)
    <style>
        .btn-delete {
            display: none;
        }
    </style>
@else
@endif
@endsection
