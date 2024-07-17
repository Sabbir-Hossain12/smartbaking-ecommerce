<section class="content">

    <div class="row">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <strong>Customer Info</strong>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group" id="storenamepart">
                                <label for="storeID">Store Name</label><br>
                                <select id="storeID" class="form-control" disabled>
                                    <option value="1">{{ env('APP_NAME') }}</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="invoiceID">Invoice Number</label>
                                <input type="text" readonly class="form-control" style="cursor: not-allowed;"
                                    id="invoiceID" value="{{ $order->invoiceID }}">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="customerName">Customer Name</label>
                                <input type="text" class="form-control" id="customerName"
                                    value="{{ $order->customerName }}">
                            </div>
                        </div> 
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="customerPhone">Customer Phone</label>
                                <input type="text" class="form-control" id="customerPhone"
                                    value="{{ $order->customerPhone }}" >
                            </div>
                        </div> 
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="form-group">
                                <label for="customerAddress">Customer Address</label>
                                <textarea name="" class="form-control" placeholder="Customer Address" id="customerAddress" rows="2">{{ $order->customerAddress }}</textarea>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 mb-1">
                            <div class="form-group" id="courierdatatbl">
                                <label for="courierID">Courier Name</label><br>
                                <select id="courierID" class="form-control">
                                    <option value="{{ $order->courier_id }}">{{ $order->courierName }}</option>
                                </select>
                                <?php
                                use App\Models\Courier;
                                $couriers = Courier::all();

                                ?>
                                <script>
                                    var couriers = <?php echo json_encode($couriers); ?>;
                                </script>
                            </div>
                        </div>
                        <div class="col-lg-12 hasCity mb-1">
                            <div class="form-group" id="citydatatbl">
                                <label for="cityID">City Name</label><br>
                                <select id="cityID" type="text" class="form-control">
                                    <option value="{{ $order->city_id }}">{{ $order->cityName }}</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-12 hasZone mb-1">
                            <div class="form-group" id="xonedatatbl">
                                <label for="zoneID">Zone Name</label><br>
                                <select id="zoneID" type="text" class="form-control">
                                    <option value="{{ $order->zone_id }}">{{ $order->zoneName }}</option>
                                </select>
                            </div>
                        </div>

                        <div class="col-lg-12">
                            <div class="form-group">
                                <label for="customerNote">Customer Notes</label>
                                <textarea name="" class="form-control" placeholder="Customer Notes" id="customerNote" rows="2">{{ $order->customerNote }}</textarea>
                            </div>
                        </div>
                        <br>
                        <br>
                    </div>


                    <div class="row">
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="orderDate">Order Date</label>
                                <input type="text" class="form-control datepicker" value="{{ $order->orderDate }}"
                                    id="orderDate">
                            </div>
                        </div>
                        @if ($order->deliveryDate)
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label for="deliveryDate">Delivery Date</label>
                                    <input type="text" class="form-control datepicker" id="deliveryDate"
                                        value="{{ $order->deliveryDate }}">
                                </div>
                            </div>
                        @endif
                        @if ($order->completeDate)
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label for="completeDate">Complete Date</label>
                                    <input type="text" class="form-control datepicker" id="completeDate"
                                        value="{{ $order->completeDate }}">
                                </div>
                            </div>
                        @endif

                    </div>
                    <br>
                    <br>
                    <br>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <strong>Product Info</strong>
                </div>
                <div class="card-body">
                    <table id="productTable" style="width: 100% !important;"
                        class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Color</th>
                                <th>Size</th>
                                <th>Code</th>
                                <th>Product Name</th>
                                <th>Quantity</th>
                                <th>Price</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($order->products as $product)
                                <tr>
                                    <td style="display: none"><input type="text" class="productID"
                                            style="width:80px;" value="{{ $product->product_id }}"></td>
                                    <td><span class="Color"> <input type="text" name="color" id="ProductColor"
                                                value="{{ $product->color }}" style="    max-width: 60px;"> </span>
                                    </td>
                                    <td><span class="Size"><input type="text" name="size" id="ProductSize"
                                                value="{{ $product->size }}" style="    max-width: 40px;"> </span>
                                    </td>
                                    <td><span class="productCode">{{ $product->productCode }}</span></td>
                                    <td><span class="productName">{{ $product->productName }}</span></td>
                                    <td><input type="number" class="productQuantity form-control"
                                            style="width:80px;" value="{{ $product->quantity }}"></td>
                                    <td><span class="productPrice">{{ $product->productPrice }}</span></td>
                                    <td><button class="btn btn-sm btn-danger delete-btn"><i
                                                class="fa fa-trash"></i></button></td>
                                </tr>
                            @endforeach
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="5">
                                    <select id="productID" type="text" style="width: 100%;" class="form-control">
                                        <option value="">Select Product</option>
                                    </select>
                                </td>
                            </tr>
                        </tfoot>

                    </table>
                    <br>

                    <br>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group mb-2" id="paymntidname">
                                <label>Payment</label> <br>
                                <select id="paymentTypeID" class="form-control select2">
                                    <option value="{{ $order->payment_type_id }}">{{ $order->paymentTypeName }}
                                    </option>
                                </select>
                            </div>

                            <div class="form-group paymentID mb-2" id="paymentIDname">
                                <select id="paymentID" class="form-control mb-2" style="width: 100%;">
                                    <option value="{{ $order->payment_id }}">{{ $order->paymentNumber }}</option>
                                </select>
                                <button class="btn btn-info btn-block mt-2" id="sendmessage">Send SMS</button>
                            </div>
                            <div class="form-group paymentAgentNumber">
                                <input type="text" class="form-control" id="paymentAgentNumber"
                                    placeholder="Enter Bkash Agent Number" value="{{ $order->paymentAgentNumber }}">
                            </div>
                            <div class="form-group hide">
                                <label>Memo Number</label>
                                <input type="text" class="form-control" id="memo"
                                    placeholder="Enter Memo Number"
                                    @if ($order->memo) value="{{ $order->memo }}"
                                @else @endif>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group row mb-2">
                                <label for="fname" class="col-sm-4 text-right control-label col-form-label">Sub
                                    Total</label>
                                <div class="col-sm-8">
                                    <span class="form-control" id="subtotal"
                                        style="cursor: not-allowed;">{{ $order->subTotal }}</span>
                                </div>
                            </div>
                            <div class="form-group row mb-2">
                                <label for="fname"
                                    class="col-sm-4 text-right control-label col-form-label">Delivery</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" value="{{ $order->deliveryCharge }}"
                                        id="deliveryCharge">
                                </div>
                            </div>
                            <div class="form-group row mb-2">
                                <label for="fname"
                                    class="col-sm-4 text-right control-label col-form-label">Discount</label>
                                <div class="col-sm-8">
                                    <input type="text" value="{{ $order->discountCharge }}" class="form-control"
                                        id="discountCharge">
                                </div>
                            </div>

                            <div class="form-group row paymentAmount mb-2">
                                <label for="fname"
                                    class="col-sm-4 text-right control-label col-form-label">Payment</label>
                                <div class="col-sm-8">
                                    <input type="text" value="{{ $order->paymentAmount }}" class="form-control"
                                        id="paymentAmount">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="fname"
                                    class="col-sm-4 text-right control-label col-form-label">Total</label>
                                <div class="col-sm-8">
                                    <span class="form-control" id="total" style="cursor: not-allowed;">0</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card-footer">

                    <button type="button" id="btn-update" value="{{ $order->id }}"
                        class="btn btn-block btn-primary"><i class="fa fa-save"></i> Update Order</button>

                    <!--send message to user-->
                    <div class="form-group mb-2 mt-4" id="">
                        <input type="text" class="form-control" id="websiteLink"
                            placeholder="Enter Website Link">
                        <button class="btn btn-info btn-block mt-2" id="sendweblink">Send Website Link</button>
                    </div>
                </div>


            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-5">
            <div class="card">
                <div class="card-header">
                    <strong>Order Status</strong>
                </div>
                <div class="card-body">
                    <label for="status">Add Note</label>
                    <div class="input-group">
                        <input type="text" id="comment" class="form-control" placeholder="Add Notes">
                        <div class="input-group-append">
                            <button class="btn btn-success waves-effect waves-light" id="updateComment"
                                type="button">Update Note</button>
                        </div>
                    </div>
                    <br>
                    <table id="orderCommentTable" data-id="{{ $order->id }}" style="width: 100% !important;"
                        class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Created At</th>
                                <th>Notes</th>
                                <th>User</th>
                            </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>


                </div>
            </div>
        </div>
        <div class="col-md-7">
            <div class="card">
                <div class="card-header">
                    <strong>Old Order</strong>
                </div>
                <div class="card-body">
                    <table id="oldOrderTable" style="width: 100% !important;" data-id="{{ $order->id }}"
                        class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Invoice ID</th>
                                <th>Customer Info</th>
                                <th>Products</th>
                                <th>Total</th>
                                <th>Status</th>
                                <th>User</th>
                            </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>


                </div>
            </div>


        </div>
    </div>

</section>
