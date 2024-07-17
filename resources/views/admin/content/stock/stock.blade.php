@extends('admin.master')

@section('maincontent')
    <main id="main" class="main">

        <div class="pagetitle row">
            <div class="col-6">
                <h1><a href="{{url('/admindashboard')}}">Dashboard</a></h1>
                <nav>
                    <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{url('/admindashboard')}}">Home</a></li>
                    <li class="breadcrumb-item active">Stocks</li>
                    </ol>
                </nav>
            </div>
            <div class="col-6" style="text-align: right">
                {{-- <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#mainStock"><span style="font-weight: bold;">+</span>  Add New Stock</button> --}}
            </div>
        </div><!-- End Page Title -->


        {{-- //popup modal for create user --}}
        {{-- <div class="modal fade" id="mainStock" tabindex="-1" data-bs-backdrop="false">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Add New Stock</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <form name="form" id="AddStock" enctype="multipart/form-data">
                            @csrf
                                <div class="form-group">
                                    <label for="date">Date</label>
                                    <input type="text" name="date" class="form-control" id="date">
                                </div>
                                <div class="form-group pb-2">
                                    <label for="invoiceID">Invoice ID</label>
                                    <input type="text" name="invoiceID" class="form-control" id="invoiceID">
                                </div>
                                <div class="form-group pb-2">
                                    <label for="productID">Product Name</label>
                                    <select name="product_id" id="product_id" class="form-control" style="width: 100%" >
                                         <option value="">Select a Product</option>
                                        @forelse ($products as $product)
                                            <option value="{{$product->id}}" style="padding:10px">{{$product->productName}}</option>
                                        @empty

                                        @endforelse
                                    </select>
                                </div>
                                <div class="form-group pb-2">
                                    <label for="productID">Supplier Name</label>
                                    <select name="supplier_id" id="supplier_id" class="form-control" style="width: 100%" >
                                         <option value="">Select a Supplier</option>
                                        @forelse ($suppliers as $supplier)
                                            <option value="{{$supplier->id}}" style="padding:10px">{{$supplier->supplierName}}</option>
                                        @empty

                                        @endforelse
                                    </select>
                                </div>
                                <div class="form-group pb-2">
                                    <label for="quantity">Quantity</label>
                                    <input type="text" name="quantity" class="form-control" id="quantity">
                                </div>

                            <div class="form-group" style="text-align: right">
                                <div class="submitBtnSCourse">
                                    <button type="submit" name="btn" class="btn btn-primary AddPurcheseBtn btn-block">Save</button>
                                </div>
                            </div>
                        </form>

                    </div>

                </div>
            </div>
        </div><!-- End popup Modal--> --}}

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
                        <table class="table table-centered table-borderless table-hover mb-0" id="stocksinfotbl" width="100%">
                            <thead class="thead-light">
                            <tr>
                                <th>ID</th>
                                <th>Product Name</th>
                                <th>Purchase</th>
                                <th>Stock</th>
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
        {{-- <div class="modal fade" id="editmainPurchase" tabindex="-1" data-bs-backdrop="false">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Edit Purchase</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <form name="form" id="EditPurchase" enctype="multipart/form-data">
                            @csrf
                            <div class="successSMS"></div>

                             <div class="form-group">
                                    <label for="date">Date</label>
                                    <input type="text" name="date" class="form-control" id="editdate">
                                </div>
                                <div class="form-group pb-2">
                                    <label for="invoiceID">Invoice ID</label>
                                    <input type="text" name="invoiceID" class="form-control" id="editinvoiceID">
                                </div>
                                <div class="form-group pb-2">
                                    <label for="productID">Product Name</label>
                                    <select name="product_id" id="editproduct_id" class="form-control" style="width: 100%" >
                                         <option value="">Select a Product</option>
                                        @forelse ($products as $product)
                                            <option value="{{$product->id}}" style="padding:10px">{{$product->productName}}</option>
                                        @empty

                                        @endforelse
                                    </select>
                                </div>
                                <div class="form-group pb-2">
                                    <label for="productID">Supplier Name</label>
                                    <select name="supplier_id" id="editsupplier_id" class="form-control" style="width: 100%" >
                                         <option value="">Select a Supplier</option>
                                        @forelse ($suppliers as $supplier)
                                            <option value="{{$supplier->id}}" style="padding:10px">{{$supplier->supplierName}}</option>
                                        @empty

                                        @endforelse
                                    </select>
                                </div>
                                <div class="form-group pb-2">
                                    <label for="quantity">Quantity</label>
                                    <input type="text" name="quantity" class="form-control" id="editquantity">
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
        </div><!-- End popup Modal--> --}}

    </main>



    <script>
        $(document).ready(function() {

           var stockseinfotbl = $('#stocksinfotbl').DataTable({
                order: [ [0, 'desc'] ],
                processing: true,
                serverSide: true,
                ajax: '{!! route('stock.info') !!}',
                columns: [
                    { data: 'id' },
                    { data: 'products.productName' },
                    { data: 'purchase' },
                    { data: 'stock' },

                ]
            });

        });

    </script>

@endsection
