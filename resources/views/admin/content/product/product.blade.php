@extends('admin.master')

@section('maincontent')
    <main id="main" class="main">

        <div class="pagetitle row">
            <div class="col-6">
                <h1><a href="{{url('/admindashboard')}}">Dashboard</a></h1>
                <nav>
                    <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{url('/admindashboard')}}">Home</a></li>
                    <li class="breadcrumb-item active">Products</li>
                    </ol>
                </nav>
            </div>
            <div class="col-6" style="text-align: right">
                <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#mainProduct"><span style="font-weight: bold;">+</span>  Add New Product</button>
                <button type="button" class="btn btn-sync btn-info btn-sm waves-effect waves-light ml-2 float-right"><i class="fas fa-spinner fa-spin mr-1"></i> Product Sync</button>
            </div>
        </div><!-- End Page Title -->

        {{-- //popup modal for create Product --}}
        <div class="modal fade" id="mainProduct" tabindex="-1" data-bs-backdrop="false">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Add New Product</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <form name="form" id="AddProduct" enctype="multipart/form-data">
                            @csrf
                            <div class="successSMS"></div>

                            <div class="form-group mb-3">
                                <label for="productName">Product Name</label>
                                <input type="text" name="productName" id="productName" class="form-control" required>
                            </div>

                            <div class="form-group mb-3">
                                <label for="productCode">Product Code</label>
                                <input type="text" id="productCode" name="productCode" class="form-control" required>
                            </div>

                            <div class="form-group mb-3">
                                <label for="productPrice">Product Price</label>
                                <input type="number" id="productPrice" name="productPrice" class="form-control" required>
                            </div>

                            <div class="form-group mb-3">
                                <label for="ProductDetails">Product Image</label>
                                <button
                                    type="button"
                                    class="btn btn-success d-block mb-2"

                                >
                                    <input type="file" name="productImage" id="productImage" onchange="loadFile(event)">
                                </button>
                                <div class="single-image image-holder-wrapper clearfix">
                                    <div class="image-holder placeholder">
                                        <img id="prevImage" style="height: 100px; width:100px;background:white;display:none"/>
                                        <i class="mdi mdi-folder-image"></i>
                                    </div>
                                </div>
                            </div>


                            <div class="form-group" style="text-align: right">
                                <div class="submitBtnSCourse">
                                    <button type="submit" name="btn" class="btn btn-primary AddProductBtn btn-block">Save</button>
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
                        <table class="table table-centered table-borderless table-hover mb-0" id="productinfo" width="100%">
                            <thead class="thead-light">
                            <tr>
                                <th>ID</th>
                                <th>Product Image</th>
                                <th>Product Code</th>
                                <th>Product Name</th>
                                <th>Product Price</th>
                                <th>Status</th>
                                <th style="width:55px">Action</th>
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

          {{-- //popup modal for edit product --}}
        <div class="modal fade" id="editmainProduct" tabindex="-1" data-bs-backdrop="false">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Edit Product</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <form name="form" id="EditProduct" enctype="multipart/form-data">
                            @csrf
                            <div class="successSMS"></div>

                            <div class="form-group mb-3">
                                <label for="productName">Product Name</label>
                                <input type="text" name="productName" id="editproductName" class="form-control" required>
                            </div>

                            <div class="form-group mb-3">
                                <label for="productCode">Product Code</label>
                                <input type="text" id="editproductCode" name="productCode" class="form-control" required>
                            </div>

                            <div class="form-group mb-3">
                                <label for="productPrice">Product Price</label>
                                <input type="number" id="editproductPrice" name="productPrice" class="form-control" required>
                            </div>

                            <div class="form-group mb-3">
                                <label for="ProductDetails">Product Image</label>
                                <button type="button" class="btn btn-success d-block mb-2">
                                    <input type="file" name="productImage" id="editproductImage" onchange="editloadFile(event)">
                                </button>
                                <div class="single-image image-holder-wrapper clearfix">
                                    <div class="image-holder placeholder">
                                        <div id="previmg" >

                                        </div>
                                        <img id="editprevImage" style="height: 100px; width:100px;background:white;display:none"/>
                                        <i class="mdi mdi-folder-image"></i>
                                    </div>
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

           var productinfotbl = $('#productinfo').DataTable({
                order: [ [0, 'desc'] ],
                processing: true,
                serverSide: true,
                ajax: '{!! route('product.info') !!}',
                columns: [
                    { data: 'id' },
                    { data: 'productImage', name: 'productImage',
                        render: function( data, type, full, meta ) {
                            return "<img src="+ data +" height=\"100\" alt='No Image'/>";
                        }
                    },
                    { data: 'productCode' },
                    { data: 'productName' },
                    { data: 'productPrice' },
                    {
                        "data": null,
                        render: function (data) {

                            if (data.status === 'Active') {
                                return '<button type="button" class="btn btn-success btn-sm btn-status" data-status="Inactive" id="statusBtnProduct" data-id="'+data.id+'">Active</button>';
                            } else {
                                return '<button type="button" class="btn btn-warning btn-sm btn-status" data-status="Active" id="statusBtnProduct" data-id="'+data.id+'" >Inactive</button>';
                            }


                        }
                    },
                    { data: 'action', name: 'action', orderable: false, searchable: false},

                ]
            });


            //add Product

            $('#AddProduct').submit(function(e){
                e.preventDefault();

                $.ajax({
                    type:'POST',
                    uploadUrl:'{{route("products.store")}}',
                    processData: false,
                    contentType: false,
                    data:new FormData(this),

                    success: function (data) {
                        $('#productName').val('');
                        $('#productCode').val('');
                        $('#productPrice').val('');
                        $('#editproductImage').val('');
                        $('#prevImage').css('display', 'none');
                        $('#editprevImage').css('display', 'none');

                        swal({
                            title: "Success!",
                            icon: "success",
                            showCancelButton: true,
                            focusConfirm: false,
                            confirmButtonColor: "#DD6B55",
                            confirmButtonText: "Yes",
                            cancelButtonText: "No",
                        });
                        productinfotbl.ajax.reload();
                    },
                    error: function(error){
                        console.log('error');
                    }
                });
            });

            //edit user

            $(document).on('click', '#editProductBtn', function(){
                let productId = $(this).data('id');

                $.ajax({
                    type:'GET',
                    url:'products/'+productId+'/edit',

                    success: function (data) {
                        $('#EditProduct').find('#editproductName').val(data.productName);
                        $('#EditProduct').find('#editproductCode').val(data.productCode);
                        $('#EditProduct').find('#editproductPrice').val(data.productPrice);
                        $('#EditProduct').find('#idhidden').val(data.id);

                        $('#previmg').html('');
                        $('#previmg').append(`
                            <img  src="`+data.productImage+`" alt = "" style="height: 125px;width:125px" />
                        `);

                        $('#EditProduct').attr('data-id', data.id);
                    },
                    error: function(error){
                        console.log('error');
                    }

                });
            });

            //update
            $('#EditProduct').submit(function(e){
                e.preventDefault();
                let productId = $('#idhidden').val();

                $.ajax({
                    type:'POST',
                    url:'product/'+productId,
                    processData: false,
                    contentType: false,
                    data:new FormData(this),

                    success: function (data) {
                        $('#editproductName').val('');
                        $('#editproductCode').val('');
                        $('#editproductPrice').val('');
                        $('#productImage').val('');
                        $('#prevImage').css('display', 'none');

                        swal({
                            title: "Product update successfully !",
                            icon: "success",
                            showCancelButton: true,
                            focusConfirm: false,
                            confirmButtonColor: "#DD6B55",
                            confirmButtonText: "Yes",
                            cancelButtonText: "No",
                        });
                        productinfotbl.ajax.reload();
                        $('#EditProduct ').load(location.href + ' #EditProduct>*', '');

                    },
                    error: function(error){
                        console.log('error');
                    }
                });
            });

            //deleteuser

            $(document).on('click', '#deleteProductBtn', function(){
                let productId = $(this).data('id');
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
                            url:'products/'+productId,

                            success: function (data) {
                                swal("Poof! Your user has been deleted!", {
                                    icon: "success",
                                });
                                productinfotbl.ajax.reload();
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

             $(document).on('click', '#statusBtnProduct', function(){
                let productId = $(this).data('id');
                let productStatus = $(this).data('status');

                $.ajax({
                    type:'PUT',
                    url:'product/status',
                    data:{
                        product_id:productId,
                        status:productStatus,
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
                        productinfotbl.ajax.reload();
                    },
                    error: function(error){
                        console.log('error');
                    }

                });
            });

            //product sync

            $(document).on('click', '.btn-sync', function () {
                swal({
                    title: 'Auto sync start!',
                    text: 'It will close after all Products sync.',
                    buttons: true,
                    dangerMode: true,
                    buttons: "Please Wait ...",
                });

                $.ajax({
                    type:'GET',
                    url:'productSync',

                    success: function (data) {
                        var datas = JSON.parse(data);
                        if(datas.status == 'success'){
                            swal({
                                title: "Auto sync completed!",
                                text: datas.products+' product added by sync',
                                icon: "success",
                                buttons: true,
                                buttons: "Completed",
                            });
                        }else{
                            swal({
                                title: "Auto sync completed!",
                                text: 'O product added . Nothing to sync',
                                icon: "success",
                                buttons: true,
                                buttons: "Done",
                            });
                        }
                        productinfotbl.ajax.reload();
                    },
                    error: function(error){
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











        });




        //file load

        var loadFile = function(event) {
            $('#prevImage').css('display', 'inline');
            var output = document.getElementById('prevImage');
            output.src = URL.createObjectURL(event.target.files[0]);
            output.onload = function() {
            URL.revokeObjectURL(output.src) // free memory
            }
        };


        var editloadFile = function(event) {
            $('#previmg').html('');
            $('#editprevImage').css('display', 'inline');
            var output = document.getElementById('editprevImage');
            output.src = URL.createObjectURL(event.target.files[0]);
            output.onload = function() {
            URL.revokeObjectURL(output.src) // free memory
            }
        };
    </script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

@endsection
