@extends('admin.master')

@section('maincontent')
    <main id="main" class="main">
        {{-- //popup modal for create user --}}
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Add New Complain</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                @if (session()->has('message'))
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        {{ session()->get('message') }}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                @endif

                @if (session()->has('error'))
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        {{ session()->get('error') }}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                @endif
                <div class="modal-body">

                    <form name="form" id="AddComplain" method="POST" action="{{ route('complains.store') }}"
                        enctype="multipart/form-data">
                        @csrf
                        <div class="successSMS"></div>

                        <div class="form-group mb-3">
                            <label for="menuName" class="control-label mt-2">Store Name</label>
                            <div class="">
                                <select disabled class="form-control" name="store_id" id="store_id" required>
                                    <option value="">{{ env('APP_NAME') }}</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="departmentName" class="control-label">Invoice No:</label>
                            <div class="">
                                <input type="text" class="form-control" name="order_invoice_id" id="order_invoice_id">
                                <span
                                    class="text-danger">{{ $errors->has('order_invoice_id') ? $errors->first('order_invoice_id') : '' }}</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="departmentName" class="control-label">Phone Number</label>
                            <div class="">
                                <input type="text" class="form-control" name="customer_phone" id="customer_phone">
                                <span
                                    class="text-danger">{{ $errors->has('customer_phone') ? $errors->first('customer_phone') : '' }}</span>
                            </div>
                        </div>
                        <div class="form-group mb-4" id="des">
                            <label for="description" class="control-label">Description</label>
                            <div class="">
                                <textarea class="form-control" name="complain_message" id="complain_message" row="6"
                                    placeholder="Write your message here ...."></textarea>
                                <span
                                    class="text-danger">{{ $errors->has('complain_message') ? $errors->first('complain_message') : '' }}
                            </div>
                        </div>
                        <div class="form-group" style="text-align: right">
                            <div class="submitBtnSCourse">
                                <button type="submit" name="btn"
                                    class="btn btn-primary AddComplainBtn btn-block">Save</button>
                            </div>
                        </div>
                    </form>

                </div>

            </div>
        </div>
    </main>

    {{-- <script>
   $(document).ready(function() {
      //add user

            $('#AddComplain').submit(function(e){
                e.preventDefault();

                $.ajax({
                    type:'POST',
                    uploadUrl:'{{route("complains.store")}}',
                    processData: false,
                    contentType: false,
                    data:new FormData(this),

                    success: function (data) {
                        if(data =='error'){
                            swal({
                            icon: 'error',
                            title: 'Can not create complain !',
                            text: 'Duplicate entry of invoice',
                            buttons: true,
                            buttons: "Thanks",
                        });
                        }else{
                            $('#store_id').val('');
                            $('#order_invoice_id').val('');
                            $('#customer_phone').val('');
                            $('#complain_message').val('');

                            swal({
                                title: "Success!",
                                icon: "success",
                                showCancelButton: true,
                                focusConfirm: false,
                                confirmButtonColor: "#DD6B55",
                                confirmButtonText: "Yes",
                                cancelButtonText: "No",
                            });
                            complaininfotbl.ajax.reload();
                        }

                    },
                    error: function(error){
                        console.log('error');
                    }
                });
            });
    });
 </script> --}}
@endsection
