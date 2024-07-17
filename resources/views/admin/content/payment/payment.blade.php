@extends('admin.master')

@section('maincontent')
    <main id="main" class="main">

        <div class="pagetitle row">
            <div class="col-6">
                <h1><a href="{{url('/admindashboard')}}">Dashboard</a></h1>
                <nav>
                    <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{url('/admindashboard')}}">Home</a></li>
                    <li class="breadcrumb-item active">Payment</li>
                    </ol>
                </nav>
            </div>
            <div class="col-6" style="text-align: right">
                <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#mainPayment"><span style="font-weight: bold;">+</span>  Add New Payment</button>
            </div>
        </div><!-- End Page Title -->

        {{-- //popup modal for create user --}}
        <div class="modal fade" id="mainPayment" tabindex="-1" data-bs-backdrop="false">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Add New Payment</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <form name="form" id="AddPayment" enctype="multipart/form-data">
                            @csrf
                            <div class="successSMS"></div>
                            <div class="form-group mb-3">
                                <label for="menuName" class="control-label mt-2">Payment Type Name</label>
                                <div class="">
                                    <select class="form-control" name="payment_type_id" id="payment_type_id" required >
                                        <option value="">Select a payment type</option>
                                        @forelse ($paymenttypes as $paymenttype)
                                            <option value="{{$paymenttype->id}}">{{$paymenttype->paymentTypeName}}</option>
                                        @empty

                                        @endforelse
                                    </select>
                                </div>
                            </div>

                            <div class="form-group pb-3">
                                <label for="websiteTitle" class="control-label">Payment Number</label>
                                <div class="webtitle">
                                    <input type="text" class="form-control" name="paymentNumber" id="paymentNumber" required>
                                    <span class="text-danger">{{ $errors->has('paymentNumber')? $errors->first('paymentNumber'):'' }}</span>
                                </div>
                            </div>

                            <div class="form-group" style="text-align: right">
                                <div class="submitBtnSCourse">
                                    <button type="submit" name="btn" class="btn btn-primary AddPaymentBtn btn-block">Save</button>
                                </div>
                            </div>
                        </form>

                    </div>

                </div>
            </div>
        </div><!-- End popup Modal-->

        {{-- //table section for category --}}

        <section class="section">
            <div class="row">
                <div class="col-lg-12">

                <div class="card">
                    <div class="card-body pt-4">
                    @if(\Session::has('success'))
                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                            <i class="bi bi-check-circle me-1"></i>
                            {{ \Session::get('success') }}
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    @endif
                    <!-- Table with stripped rows -->
                    <div class="table-responsive">
                        <table class="table table-centered table-borderless table-hover mb-0" id="paymentinfotbl" width="100%">
                            <thead class="thead-light">
                            <tr>
                                <th>ID</th>
                                <th>Payment Type Name</th>
                                <th>Payment Number</th>
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

          {{-- //popup modal for edit user --}}
        <div class="modal fade" id="editmainPayments" tabindex="-1" data-bs-backdrop="false">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Edit Payment</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <form name="form" id="EditPayment" enctype="multipart/form-data">
                            @csrf
                            <div class="successSMS"></div>

                            <div class="form-group mb-3">
                                <label for="menuName" class="control-label mt-2">Payment Type Name</label>
                                <div class="">
                                    <select class="form-control" name="payment_type_id" id="editpayment_type_id" required >
                                        <option value="">Select a payment type</option>
                                        @forelse ($paymenttypes as $paymenttype)
                                            <option value="{{$paymenttype->id}}">{{$paymenttype->paymentTypeName}}</option>
                                        @empty

                                        @endforelse
                                    </select>
                                </div>
                            </div>

                            <div class="form-group pb-3">
                                <label for="websiteTitle" class="control-label">Payment Number</label>
                                <div class="webtitle">
                                    <input type="text" class="form-control" name="paymentNumber" id="editpaymentNumber" required>
                                    <span class="text-danger">{{ $errors->has('paymentNumber')? $errors->first('paymentNumber'):'' }}</span>
                                </div>
                            </div>
                            <input type="text" name="id" id="idhidden" hidden>
                            <div class="form-group" style="text-align: right">
                                <div class="submitBtnSCourse">
                                    <button type="submit" name="btn" class="btn btn-primary btn-block">Save</button>
                                </div>
                            </div>
                        </form>

                    </div>

                </div>
            </div>
        </div><!-- End popup Modal-->

    </main>



    <script>
        $(document).ready(function() {

           var paymentinfotbl = $('#paymentinfotbl').DataTable({
                order: [ [0, 'desc'] ],
                processing: true,
                serverSide: true,
                ajax: '{!! route('payment.info') !!}',
                columns: [
                    { data: 'id' },
                    { data: 'paymenttypes.paymentTypeName' },
                    { data: 'paymentNumber' },
                    {
                        "data": null,
                        render: function (data) {

                            if (data.status === 'Active') {
                                return '<button type="button" class="btn btn-success btn-sm btn-status" data-status="Inactive" id="statusBtnPayment" data-id="'+data.id+'">Active</button>';
                            } else {
                                return '<button type="button" class="btn btn-warning btn-sm btn-status" data-status="Active" id="statusBtnPayment" data-id="'+data.id+'" >Inactive</button>';
                            }


                        }
                    },
                    { data: 'action', name: 'action', orderable: false, searchable: false},

                ]
            });


            //add user

            $('#AddPayment').submit(function(e){
                e.preventDefault();

                $.ajax({
                    type:'POST',
                    uploadUrl:'{{route("payments.store")}}',
                    processData: false,
                    contentType: false,
                    data:new FormData(this),

                    success: function (data) {
                        $('#paymentNumber').val('');
                        $('#payment_type_id').val('');

                        swal({
                            title: "Success!",
                            icon: "success",
                            showCancelButton: true,
                            focusConfirm: false,
                            confirmButtonColor: "#DD6B55",
                            confirmButtonText: "Yes",
                            cancelButtonText: "No",
                        });
                        paymentinfotbl.ajax.reload();
                    },
                    error: function(error){
                        console.log('error');
                    }
                });
            });

            //edit city

            $(document).on('click', '#editPaymentBtn', function(){
                let paymentId = $(this).data('id');

                $.ajax({
                    type:'GET',
                    url:'payments/'+paymentId+'/edit',

                    success: function (data) {
                        $('#EditPayment').find('#editpayment_type_id').val(data.payment_type_id);
                        $('#EditPayment').find('#editpaymentNumber').val(data.paymentNumber);
                        $('#EditPayment').find('#idhidden').val(data.id);
                        $('#EditPayment').attr('data-id', data.id);
                    },
                    error: function(error){
                        console.log('error');
                    }

                });
            });

            //update city
            $('#EditPayment').submit(function(e){
                e.preventDefault();
                let paymentId = $('#idhidden').val();

                $.ajax({
                    type:'POST',
                    url:'payment/'+paymentId,
                    processData: false,
                    contentType: false,
                    data:new FormData(this),

                    success: function (data) {
                        $('#editpayment_type_id').val('');
                        $('#editpaymentNumber').val('');


                        swal({
                            title: "Payment update successfully !",
                            icon: "success",
                            showCancelButton: true,
                            focusConfirm: false,
                            confirmButtonColor: "#DD6B55",
                            confirmButtonText: "Yes",
                            cancelButtonText: "No",
                        });
                        paymentinfotbl.ajax.reload();
                    },
                    error: function(error){
                        console.log('error');
                    }
                });
            });

            //deleteuser

            $(document).on('click', '#deletePaymentBtn', function(){
                let paymentId = $(this).data('id');
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
                            type:'DELETE',
                            url:'payments/'+paymentId,

                            success: function (data) {
                                swal("Poof! Your payment has been deleted!", {
                                    icon: "success",
                                });
                                paymentinfotbl.ajax.reload();
                            },
                            error: function(error){
                                console.log('error');
                            }

                        });


                    } else {
                        swal("Your data is safe!");
                    }
                });

            });

            //status update

             $(document).on('click', '#statusBtnPayment', function(){
                let paymentId = $(this).data('id');
                let paymentStatus = $(this).data('status');

                $.ajax({
                    type:'PUT',
                    url:'payment/status',
                    data:{
                        payment_id:paymentId,
                        status:paymentStatus,
                    },

                    success: function (data) {
                        swal({
                            title: "Status updated !",
                            icon: "success",
                            showCancelButton: true,
                            focusConfirm: false,
                            confirmButtonColor: "#DD6B55",
                            confirmButtonText: "Yes",
                            cancelButtonText: "No",
                        });
                        paymentinfotbl.ajax.reload();
                    },
                    error: function(error){
                        console.log('error');
                    }

                });
            });











        });



    </script>


@endsection
