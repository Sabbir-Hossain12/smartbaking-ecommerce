@extends('admin.master')

@section('maincontent')
    <main id="main" class="main">

        <div class="pagetitle row">
            <div class="col-6">
                <h1><a href="{{url('/admindashboard')}}">Dashboard</a></h1>
                <nav>
                    <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{url('/admindashboard')}}">Home</a></li>
                    <li class="breadcrumb-item active">Stores</li>
                    </ol>
                </nav>
            </div>
            <div class="col-6" style="text-align: right">
                <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#mainStore"><span style="font-weight: bold;">+</span>  Add New Store</button>
            </div>
        </div><!-- End Page Title -->

        {{-- //popup modal for create user --}}
        <div class="modal fade" id="mainStore" tabindex="-1" data-bs-backdrop="false">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Add New Store</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <form name="form" id="AddStore" enctype="multipart/form-data">
                            @csrf
                            <div class="successSMS"></div>

                            <div class="form-group pb-3">
                                <label for="websiteTitle" class="control-label">Store Name</label>
                                <div class="webtitle">
                                    <input type="text" class="form-control" name="storeName" id="storeName" required>
                                    <span class="text-danger">{{ $errors->has('storeName')? $errors->first('storeName'):'' }}</span>
                                </div>
                            </div>

                            <div class="form-group pb-3">
                                <label for="websiteTitle" class="control-label">Store Url</label>
                                <div class="webtitle">
                                    <input type="text" class="form-control" name="storeUrl" id="storeUrl" required>
                                    <span class="text-danger">{{ $errors->has('storeUrl')? $errors->first('storeUrl'):'' }}</span>
                                </div>
                            </div>

                            <div class="form-group mb-3">
                                <label for="storeDetails">Store Details <span class="text-danger">*</span></label>
                                <textarea class="form-control" id="storeDetails" name="storeDetails" rows="5" ></textarea>
                            </div>

                            <div class="form-group" style="text-align: right">
                                <div class="submitBtnSCourse">
                                    <button type="submit" name="btn" class="btn btn-primary AddStoreBtn btn-block">Save</button>
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
                        <table class="table table-centered table-borderless table-hover mb-0" id="storeinfo" width="100%">
                            <thead class="thead-light">
                            <tr>
                                <th>ID</th>
                                <th>Store Name</th>
                                <th>Store Url</th>
                                <th>Store Details</th>
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
        <div class="modal fade" id="editmainStore" tabindex="-1" data-bs-backdrop="false">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Edit Store</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <form name="form" id="EditStore" enctype="multipart/form-data">
                            @csrf
                            <div class="successSMS"></div>

                            <div class="form-group pb-3">
                                <label for="websiteTitle" class="control-label">Store Name</label>
                                <div class="webtitle">
                                    <input type="text" class="form-control" name="storeName" id="editstoreName" required>
                                    <span class="text-danger">{{ $errors->has('storeName')? $errors->first('storeName'):'' }}</span>
                                </div>
                            </div>

                            <div class="form-group pb-3">
                                <label for="websiteTitle" class="control-label">Store Url</label>
                                <div class="webtitle">
                                    <input type="text" class="form-control" name="storeUrl" id="editstoreUrl" required>
                                    <span class="text-danger">{{ $errors->has('storeUrl')? $errors->first('storeUrl'):'' }}</span>
                                </div>
                            </div>

                            <div class="form-group mb-3">
                                <label for="storeDetails">Store Details <span class="text-danger">*</span></label>
                                <textarea class="form-control" id="editstoreDetails" name="storeDetails" rows="5" ></textarea>
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

           var storeinfotbl = $('#storeinfo').DataTable({
                order: [ [0, 'desc'] ],
                processing: true,
                serverSide: true,
                ajax: '{!! route('store.info') !!}',
                columns: [
                    { data: 'id' },
                    { data: 'storeName' },
                    { data: 'storeUrl' },
                    { data: 'storeDetails' },
                    {
                        "data": null,
                        render: function (data) {

                            if (data.status === 'Active') {
                                return '<button type="button" class="btn btn-success btn-sm btn-status" data-status="Inactive" id="statusBtnStore" data-id="'+data.id+'">Active</button>';
                            } else {
                                return '<button type="button" class="btn btn-warning btn-sm btn-status" data-status="Active" id="statusBtnStore" data-id="'+data.id+'" >Inactive</button>';
                            }


                        }
                    },
                    { data: 'action', name: 'action', orderable: false, searchable: false},

                ]
            });


            //add store

            $('#AddStore').submit(function(e){
                e.preventDefault();

                $.ajax({
                    type:'POST',
                    uploadUrl:'{{route("stores.store")}}',
                    processData: false,
                    contentType: false,
                    data:new FormData(this),

                    success: function (data) {
                        $('#storeName').val('');
                        $('#storeUrl').val('');
                        $('#storeDetails').val('');
                        swal({
                            title: "Success!",
                            icon: "success",
                            showCancelButton: true,
                            focusConfirm: false,
                            confirmButtonColor: "#DD6B55",
                            confirmButtonText: "Yes",
                            cancelButtonText: "No",
                        });
                        storeinfotbl.ajax.reload();
                    },
                    error: function(error){
                        console.log('error');
                    }
                });
            });

            //edit store

            $(document).on('click', '#editStoreBtn', function(){
                let storeId = $(this).data('id');

                $.ajax({
                    type:'GET',
                    url:'stores/'+storeId+'/edit',

                    success: function (data) {
                        $('#EditStore').find('#editstoreName').val(data.storeName);
                        $('#EditStore').find('#editstoreUrl').val(data.storeUrl);
                        $('#EditStore').find('#editstoreDetails').val(data.storeDetails);
                        $('#EditStore').find('#idhidden').val(data.id);
                        $('#EditStore').attr('data-id', data.id);
                    },
                    error: function(error){
                        console.log('error');
                    }

                });
            });

            //update store
            $('#EditStore').submit(function(e){
                e.preventDefault();
                let storeId =$('#idhidden').val();

                $.ajax({
                    type:'POST',
                    url:'store/'+storeId,
                    processData: false,
                    contentType: false,
                    data:new FormData(this),

                    success: function (data) {
                        $('#editstoreName').val('');
                        $('#editstoreUrl').val('');
                        $('#editstoreDetails').val('');

                        swal({
                            title: "Store update successfully !",
                            icon: "success",
                            showCancelButton: true,
                            focusConfirm: false,
                            confirmButtonColor: "#DD6B55",
                            confirmButtonText: "Yes",
                            cancelButtonText: "No",
                        });
                        storeinfotbl.ajax.reload();
                    },
                    error: function(error){
                        console.log('error');
                    }
                });
            });

            //delete store

            $(document).on('click', '#deleteStoreBtn', function(){
                let storeId = $(this).data('id');
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
                            url:'stores/'+storeId,

                            success: function (data) {
                                swal("Poof! Your store has been deleted!", {
                                    icon: "success",
                                });
                                storeinfotbl.ajax.reload();
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

             $(document).on('click', '#statusBtnStore', function(){
                let storeId = $(this).data('id');
                let storeStatus = $(this).data('status');

                $.ajax({
                    type:'PUT',
                    url:'store/status',
                    data:{
                        store_id:storeId,
                        status:storeStatus,
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
                        storeinfotbl.ajax.reload();
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
