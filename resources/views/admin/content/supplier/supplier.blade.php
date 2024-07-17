@extends('admin.master')

@section('maincontent')
    <main id="main" class="main">

        <div class="pagetitle row">
            <div class="col-6">
                <h1><a href="{{url('/admindashboard')}}">Dashboard</a></h1>
                <nav>
                    <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{url('/admindashboard')}}">Home</a></li>
                    <li class="breadcrumb-item active">Suppliers</li>
                    </ol>
                </nav>
            </div>
            <div class="col-6" style="text-align: right">
                <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#mainSupplier"><span style="font-weight: bold;">+</span>  Add New Supplier</button>
            </div>
        </div><!-- End Page Title -->

        {{-- //popup modal for create user --}}
        <div class="modal fade" id="mainSupplier" tabindex="-1" data-bs-backdrop="false">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Add New Supplier</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <form name="form" id="AddSupplier" enctype="multipart/form-data">
                            @csrf
                            <div class="successSMS"></div>

                            <div class="form-group pb-3">
                                <label for="websiteTitle" class="control-label">Supplier Name</label>
                                <div class="webtitle">
                                    <input type="text" class="form-control" name="supplierName" id="supplierName" required>
                                    <span class="text-danger">{{ $errors->has('supplierName')? $errors->first('supplierName'):'' }}</span>
                                </div>
                            </div>

                            <div class="form-group pb-4">
                                <label for="websiteTitle" class="control-label">Supplier Phone</label>
                                <div class="webtitle">
                                    <input type="text" class="form-control" name="supplierPhone" id="supplierPhone" required>
                                    <span class="text-danger">{{ $errors->has('supplierPhone')? $errors->first('supplierPhone'):'' }}</span>
                                </div>
                            </div>

                            <div class="form-group" style="text-align: right">
                                <div class="submitBtnSCourse">
                                    <button type="submit" name="btn" class="btn btn-primary AddSupplierBtn btn-block">Save</button>
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
                        <table class="table table-centered table-borderless table-hover mb-0" id="supplierinfo" width="100%">
                            <thead class="thead-light">
                            <tr>
                                <th>ID</th>
                                <th>Supplier Name</th>
                                <th>Supplier Phone</th>
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
        <div class="modal fade" id="editmainSupplier" tabindex="-1" data-bs-backdrop="false">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Edit Supplier</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <form name="form" id="EditSupplier" enctype="multipart/form-data">
                            @csrf
                            <div class="successSMS"></div>

                            <div class="form-group pb-3">
                                <label for="websiteTitle" class="control-label">Supplier Name</label>
                                <div class="webtitle">
                                    <input type="text" class="form-control" name="supplierName" id="editsupplierName" required>
                                    <span class="text-danger">{{ $errors->has('supplierName')? $errors->first('supplierName'):'' }}</span>
                                </div>
                            </div>

                            <div class="form-group pb-4">
                                <label for="websiteTitle" class="control-label">Supplier Phone</label>
                                <div class="webtitle">
                                    <input type="text" class="form-control" name="supplierPhone" id="editsupplierPhone" required>
                                    <span class="text-danger">{{ $errors->has('supplierPhone')? $errors->first('supplierPhone'):'' }}</span>
                                </div>
                            </div>

                            <input type="text" name="id" id="idhidden" hidden>

                            <div class="form-group" style="text-align: right">
                                <div class="submitBtnSCourse">
                                    <button type="submit" name="btn" class="btn btn-primary btn-block">Update</button>
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

           var supplierinfotbl = $('#supplierinfo').DataTable({
                order: [ [0, 'desc'] ],
                processing: true,
                serverSide: true,
                ajax: '{!! route('supplier.info') !!}',
                columns: [
                    { data: 'id' },
                    { data: 'supplierName' },
                    { data: 'supplierPhone' },
                    {
                        "data": null,
                        render: function (data) {

                            if (data.status === 'Active') {
                                return '<button type="button" class="btn btn-success btn-sm btn-status" data-status="Inactive" id="statusBtnSupplier" data-id="'+data.id+'">Active</button>';
                            } else {
                                return '<button type="button" class="btn btn-warning btn-sm btn-status" data-status="Active" id="statusBtnSupplier" data-id="'+data.id+'" >Inactive</button>';
                            }


                        }
                    },
                    { data: 'action', name: 'action', orderable: false, searchable: false},

                ]
            });


            //add store

            $('#AddSupplier').submit(function(e){
                e.preventDefault();

                $.ajax({
                    type:'POST',
                    uploadUrl:'{{route("suppliers.store")}}',
                    processData: false,
                    contentType: false,
                    data:new FormData(this),

                    success: function (data) {
                        $('#supplierName').val('');
                        $('#supplierPhone').val('');
                        swal({
                            title: "Success!",
                            icon: "success",
                            showCancelButton: true,
                            focusConfirm: false,
                            confirmButtonColor: "#DD6B55",
                            confirmButtonText: "Yes",
                            cancelButtonText: "No",
                        });
                        supplierinfotbl.ajax.reload();
                    },
                    error: function(error){
                        console.log('error');
                    }
                });
            });

            //edit store

            $(document).on('click', '#editSupplierBtn', function(){
                let supplierId = $(this).data('id');

                $.ajax({
                    type:'GET',
                    url:'suppliers/'+supplierId+'/edit',

                    success: function (data) {
                        $('#EditSupplier').find('#editsupplierName').val(data.supplierName);
                        $('#EditSupplier').find('#editsupplierPhone').val(data.supplierPhone);
                        $('#EditSupplier').find('#idhidden').val(data.id);
                        $('#EditSupplier').attr('data-id', data.id);
                    },
                    error: function(error){
                        console.log('error');
                    }

                });
            });

            //update store
            $('#EditSupplier').submit(function(e){
                e.preventDefault();
                let supplierId = $('#idhidden').val();

                $.ajax({
                    type:'POST',
                    url:'supplier/'+supplierId,
                    processData: false,
                    contentType: false,
                    data:new FormData(this),

                    success: function (data) {
                        $('#editsupplierName').val('');
                        $('#editsupplierPhone').val('');

                        swal({
                            title: "Supplier update successfully !",
                            icon: "success",
                            showCancelButton: true,
                            focusConfirm: false,
                            confirmButtonColor: "#DD6B55",
                            confirmButtonText: "Yes",
                            cancelButtonText: "No",
                        });
                        supplierinfotbl.ajax.reload();
                    },
                    error: function(error){
                        console.log('error');
                    }
                });
            });

            //delete store

            $(document).on('click', '#deleteSupplierBtn', function(){
                let supplierId = $(this).data('id');
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
                            url:'suppliers/'+supplierId,

                            success: function (data) {
                                swal("Poof! Your supplier has been deleted!", {
                                    icon: "success",
                                });
                                supplierinfotbl.ajax.reload();
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

            //status update store

             $(document).on('click', '#statusBtnSupplier', function(){
                let supplierId = $(this).data('id');
                let supplierStatus = $(this).data('status');

                $.ajax({
                    type:'PUT',
                    url:'supplier/status',
                    data:{
                        supplier_id:supplierId,
                        status:supplierStatus,
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
                        supplierinfotbl.ajax.reload();
                    },
                    error: function(error){
                        console.log('error');
                    }

                });
            });











        });



    </script>

<!-- summernote css/js -->
{{-- <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function() {
            $('#storeDetails').summernote();
            });
    </script> --}}

@endsection
