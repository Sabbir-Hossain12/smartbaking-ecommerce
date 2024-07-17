@extends('admin.master')

@section('maincontent')
    @section('subcss')
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.0-alpha1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/jquery-datatables-checkboxes@1.2.13/css/dataTables.checkboxes.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.11.4/css/jquery.dataTables.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    @endsection

    <main id="main" class="main">

        <div class="pagetitle row">
            <div class="col-6">
                <h1><a href="{{url('/admindashboard')}}">Dashboard</a></h1>
                <nav>
                    <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{url('/admindashboard')}}">Home</a></li>
                    <li class="breadcrumb-item active">Orders</li>
                    </ol>
                </nav>
            </div>
        </div><!-- End Page Title -->

        <div class="row">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <strong>Customer Info</strong>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="storeID">Store Name</label>
                                    <select id="storeID"  class="form-control">
                                        <option value="1" selected >Viralimport.Com</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="invoiceID">Invoice Number</label>
                                    <input type="text" readonly class="form-control" style="cursor: not-allowed;" id="invoiceID" value="{{ $uniqueId }}">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="customerName">Customer Name</label>
                                    <input type="text" class="form-control" id="customerName">
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="customerPhone">Customer Phone</label>
                                    <input type="text" class="form-control" id="customerPhone">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="customerAddress">Customer Address</label>
                                    <textarea name="" class="form-control" placeholder="Customer Address" id="customerAddress" rows="2"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="courierID">Courier Name</label>
                                    <select id="courierID"  class="form-control">
                                        <option value="">Courier Name</option>
                                    </select>
                                    <script>
                                        var couriers = <?php echo json_encode($couriers) ?>;
                                    </script>
                                </div>
                            </div>
                            <div class="col-lg-12 hasCity">
                                <div class="form-group">
                                    <label for="cityID">City Name</label>
                                    <select id="cityID"  class="form-control">
                                        <option value="">City Name</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-12 hasZone">
                                <div class="form-group">
                                    <label for="zoneID">Zone Name</label>
                                    <select id="zoneID"  class="form-control">
                                        <option value="">Zone Name</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="orderDate">Order Date</label>
                                    <input type="text" class="form-control datepicker" value="{{ date('Y-m-d') }}" id="orderDate">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <strong>Product Info</strong>
                    </div>
                    <div class="card-body">
                        <table id="productTable" style="width: 100% !important;" class="table table-bordered table-striped">
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
                            </tbody>
                            <tfoot>
                            <tr>
                                <td colspan="5">
                                    <select id="productID" style="width: 100%;">
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
                                <div class="form-group mb-2">
                                    <label>Payment</label>
                                    <select id="paymentTypeID" class="form-control select2">
                                        <option value="">Select payment Type</option>
                                    </select>
                                </div>
                                <div class="form-group mb-2 paymentID">
                                    <select id="paymentID" class="form-control" style="width: 100%;">
                                        <option value="">Select Number</option>
                                    </select>
                                </div>
                                <div class="form-group mb-2 paymentAgentNumber">
                                    <input type="text" class="form-control" id="paymentAgentNumber" placeholder="Enter Bkash Agent Number">
                                </div>
                                <div class="form-group mb-2 hide">
                                    <label>Memo Number</label>
                                    <input type="text" class="form-control" id="memoNumber" placeholder="Enter Memo Number">
                                </div>

                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label for="fname" class="col-sm-4 text-right control-label col-form-label">Sub Total</label>
                                    <div class="col-sm-8">
                                        <span class="form-control" id="subtotal" style="cursor: not-allowed;"></span>
                                    </div>
                                </div>
                                <div class="form-group row mb-2">
                                    <label for="fname" class="col-sm-4 text-right control-label col-form-label">Delivery</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" value="100" id="deliveryCharge">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="fname" class="col-sm-4 text-right control-label col-form-label">Discount</label>
                                    <div class="col-sm-8">
                                        <input type="text" value="0" class="form-control" id="discountCharge">
                                    </div>
                                </div>

                                <div class="form-group row paymentAmount">
                                    <label for="fname" class="col-sm-4 text-right control-label col-form-label">Payment</label>
                                    <div class="col-sm-8">
                                        <input type="text" value="0" class="form-control" id="paymentAmount">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="fname" class="col-sm-4 text-right control-label col-form-label">Total</label>
                                    <div class="col-sm-8">
                                        <span class="form-control" id="total" style="cursor: not-allowed;"   >100</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <button type="button" id="submit" class="btn btn-primary btn-block" data-style="expand-left">Save</button>
                    </div>
                </div>
            </div>
        </div>

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


            $(".paymentID").hide();
            $(".paymentAgentNumber").hide();
            $(".paymentAmount").hide();


            $(document).on("click", "#submit", function () {

                var invoiceID = $("#invoiceID");
                var customerName = $("#customerName");
                var customerPhone = $("#customerPhone");
                var customerAddress = $("#customerAddress");
                var storeID = $("#storeID");
                var total = +$("#total").text();
                var deliveryCharge = +$("#deliveryCharge").val();
                var discountCharge = +$("#discountCharge").val();
                var paymentTypeID = $("#paymentTypeID").val();
                var paymentID = $("#paymentID").val();
                var paymentAmount = +$("#paymentAmount").val();
                var paymentAgentNumber = $("#paymentAgentNumber").val();
                var orderDate = $("#orderDate");
                var courierID = $("#courierID");
                var cityID = +$("#cityID").val();
                var zoneID = +$("#zoneID").val();
                var product = [];
                var productCount = 0 ;
                $("#productTable tbody tr").each(function (index, value) {
                    var currentRow = $(this);
                    var obj = {};
                    obj.productColor = currentRow.find("#ProductColor").val();
                    obj.productSize = currentRow.find("#ProductSize").val();
                    obj.productID = currentRow.find(".productID").val();
                    obj.productCode = currentRow.find(".productCode").text();
                    obj.productName = currentRow.find(".productName").text();
                    obj.productQuantity = currentRow.find(".productQuantity").val();
                    obj.productPrice = currentRow.find(".productPrice").text();
                    product.push(obj);
                    productCount++;
                });

                if(storeID.val() == ''){
                    toastr.error('Store Should Not Be Empty');
                    storeID.closest('.form-group').find('.select2-selection').css('border','1px solid red');
                    return;
                }
                storeID.closest('.form-group').find('.select2-selection').css('border','1px solid #ced4da');

                if(invoiceID.val() == ''){
                    toastr.error('Invoice ID Should Not Be Empty');
                    invoiceID.css('border','1px solid red');
                    return;
                }
                invoiceID.css('border','1px solid #ced4da');

                if(customerName.val() == ''){
                    toastr.error('Customer Name Should Not Be Empty');
                    customerName.css('border','1px solid red');
                    return;
                }
                customerName.css('border','1px solid #ced4da');

                if(customerPhone.val() == ''){
                    toastr.error('Customer Phone Should Not Be Empty');
                    customerPhone.css('border','1px solid red');
                    return;
                }
                customerPhone.css('border','1px solid #ced4da');

                if(customerAddress.val() == ''){
                    toastr.error('Customer Address Should Not Be Empty');
                    customerAddress.css('border','1px solid red');
                    return;
                }
                customerAddress.css('border','1px solid #ced4da');

                if(orderDate.val() == ''){
                    toastr.error('Order Date Should Not Be Empty');
                    orderDate.css('border','1px solid red');
                    return;
                }
                orderDate.css('border','1px solid #ced4da');

                if(courierID.val() == ''){
                    toastr.error('Courier Should Not Be Empty');
                    courierID.closest('.form-group').find('.select2-selection').css('border','1px solid red');
                    return;
                }
                courierID.css('border','1px solid #ced4da');

                if(productCount == 0){
                    toastr.error('Product Should Not Be Empty');
                    return;
                }

                var data = {};
                data["invoiceID"] = invoiceID.val();
                data["storeID"] = storeID.val();
                data["customerName"] = customerName.val();
                data["customerPhone"] = customerPhone.val();
                data["customerAddress"] = customerAddress.val();
                data["total"] = total;
                data["deliveryCharge"] = deliveryCharge;
                data["discountCharge"] = discountCharge;
                data["paymentTypeID"] = paymentTypeID;
                data["paymentID"] = paymentID;
                data["paymentAmount"] = paymentAmount;
                data["paymentAgentNumber"] = paymentAgentNumber;
                data["orderDate"] = orderDate.val();
                data["courierID"] = +courierID.val();
                data["cityID"] = cityID;
                data["zoneID"] = zoneID;
                data["userID"] = $('#user_id').val();
                data["products"] = product;
                $.ajax({
                    type: "POST",
                    url: '{{url('admin/order/store')}}',
                    data: {
                        'data': data,
                        '_token': token
                    },
                    success: function (response) {
                        var data = JSON.parse(response);
                        if (data["status"] === "success") {
                            toastr.success(data["message"]);
                            window.location.href = "{{ url('admin_order/Processing') }}";

                        } else {
                            toastr.error(data["message"])
                        }
                    }
                });



            });


            $("#productID").select2({
                placeholder: "Select a Product",
                templateResult: function (state) {
                    if (!state.id) {
                        return state.text;
                    }
                    var $state = $(
                        '<span><img width="60px" src="' +
                        state.image +
                        '" class="img-flag" /> ' +
                        state.text +
                        "</span>"
                    );
                    return $state;
                },
                ajax: {
                    type:'GET',
                    url: '{{url('admin_order/products')}}',
                    processResults: function (data) {
                        var data = $.parseJSON(data);
                        return {
                            results: data.data
                        };
                    }
                }
            }).trigger("change").on("select2:select", function (e) {
                $("#productTable tbody").append(
                    "<tr>" +
                    '<td  style="display: none"><input type="text" class="productID" style="width:80px;" value="' + e.params.data.id + '"></td>' +
                    '<td><input type="text" name="color" id="ProductColor" value="" style="    max-width: 60px;"> </td>' +
                    '<td><input type="text" name="size" id="ProductSize" value="" style="    max-width: 40px;"></td>' +
                    '<td><span class="productCode">' + e.params.data.productCode + '</span></td>' +
                    '<td><span class="productName">' + e.params.data.text + '</span></td>' +
                    '<td><input type="number" class="productQuantity form-control" style="width:80px;" value="1"></td>' +
                    '<td><span class="productPrice">' + e.params.data.productPrice + '</span></td>' +
                    '<td><button class="btn btn-sm btn-danger delete-btn"><i class="fa fa-trash"></i></button></td>\n' +
                    "</tr>"
                );
                calculation();
            });

            //storeID

            $("#storeID").select2({
                placeholder: "Select a Store",
                ajax: {
                    type:'GET',
                    url: '{{url('admin_order/stores')}}',
                    processResults: function (data) {
                        var data = $.parseJSON(data);
                        return {
                            results: data
                        };
                    }
                }
            });

            //courier
            $("#courierID").select2({
                placeholder: "Select a Courier",
                ajax: {
                    url: '{{url('admin_order/couriers')}}',
                    processResults: function (data) {
                        var data = $.parseJSON(data);
                        return {
                            results: data
                        };
                    }
                }
            }).trigger("change").on("select2:select", function (e) {
                    $("#zoneID").empty();
                    for (var i = 0; i < couriers.length; i++) {
                    if (couriers[i]['courierName'] == e.params.data.text) {
                            if (couriers[i]['hasCity'] == 'on') {
                            jQuery(".hasCity").show();
                        } else {
                            jQuery(".hasCity").hide();
                        }
                        if (couriers[i]["hasZone"] == 'on') {
                            jQuery(".hasZone").show();
                        } else {
                            jQuery(".hasZone").hide();
                            $("#zoneID").empty();
                        }
                    }

                    if (e.params.data.text == 'Pathao') {
                        $("#cityID").empty().append('<option value="8">Dhaka</option>');
                    } else {
                        $("#cityID").empty();
                    }
                }

            });

            if ($("#courierID").text()) {
                var courier = $("#courierID").text().trim();
                    for (var i = 0; i < couriers.length; i++) {
                    if (couriers[i]['courierName'] == courier) {
                            if (couriers[i]['hasCity'] == 'on') {
                            jQuery(".hasCity").show();
                        } else {
                            jQuery(".hasCity").hide();
                        }

                        if (couriers[i]["hasZone"] == 'on') {
                            jQuery(".hasZone").show();
                        } else {
                            jQuery(".hasZone").hide();
                            $("#zoneID").empty();
                        }
                    }
                }
            }

            $("#cityID").select2({
                placeholder: "Select a City",
                ajax: {
                    data: function (params) {
                        var query = {
                            q: params.term,
                            courierID: $("#courierID").val()
                        };
                        return query;
                    },
                    type:'GET',
                    url: '{{url('admin_order/cities')}}',
                    processResults: function (data) {
                        var data = $.parseJSON(data);
                        return {
                            results: data
                        };
                    }
                }
            });

            $("#zoneID").select2({
                placeholder: "Select a Zone",
                ajax: {
                    data: function (params) {
                        var query = {
                            q: params.term,
                            courierID: $("#courierID").val(),
                            cityID: $("#cityID").val()
                        };
                        return query;
                    },
                    type:'GET',
                    url: '{{url('admin_order/zones')}}',
                    processResults: function (data) {
                        var data = $.parseJSON(data);
                        return {
                            results: data
                        };
                        console.log(data);
                    }
                }
            });

            $("#paymentTypeID").select2({
                placeholder: "Select a payment Type",
                allowClear: true,
                ajax: {
                    data: function (params) {
                        return {
                            q: params.term
                        };
                        console.log(params);
                    },
                    url: '{{url('admin_order/paymenttype')}}',
                    processResults: function (data) {

                        var data = $.parseJSON(data);
                        return {
                            results: data
                        };
                    }
                }
            }).trigger("change").on("select2:select", function (e) {
                if (e.params.data.text == "") {
                    $(".paymentID").hide();
                    $(".paymentAgentNumber").hide();
                    $(".paymentAmount").hide();
                } else {
                    $(".paymentID").show();
                    $(".paymentAgentNumber").show();
                    $(".paymentAmount").show();
                }
            }).on("select2:unselect", function (e) {
                $(".paymentID").hide();
                $(".paymentAgentNumber").hide();
                $(".paymentAmount").hide();
                calculation();
            });

            $("#paymentID").select2({
                placeholder: "Select a payment Number",
                allowClear: true,
                ajax: {
                    data: function (params) {
                        return {
                            q: params.term,
                            paymentTypeID: $("#paymentTypeID").val(),
                        };
                    },
                    type:'GET',
                    url: '{{url('admin_order/paymentnumber')}}',

                    processResults: function (data) {
                        var data = $.parseJSON(data);
                        return {
                            results: data
                        };
                    }
                }
            });

            $(document).on("change", ".productQuantity", function () {
                calculation();
            });
            $(document).on("input", "#paymentAmount", function () {
                calculation();
            });
            $(document).on("input", "#deliveryCharge", function () {
                calculation();
            });
            $(document).on("input", "#discountCharge", function () {
                calculation();
            });
            calculation();
            //calculation part
            function calculation() {
                var subtotal = 0;
                var deliveryCharge = +$("#deliveryCharge").val();
                var discountCharge = +$("#discountCharge").val();
                var paymentAmount = +$("#paymentAmount").val();
                $("#productTable tbody tr").each(function (index) {
                    subtotal = subtotal + +$(this).find(".productPrice").text() * +$(this).find(".productQuantity").val();
                });
                $("#subtotal").text(subtotal);
                $("#total").text(subtotal + deliveryCharge - paymentAmount - discountCharge);
            }
            //delete select order
            $(document).on("click", ".delete-btn", function () {
                $(this).closest("tr").remove();
                calculation();
            });

            //end js


            function countorder(){
                $.ajax({
                    type: "get",
                    url: "{{url('admin_order/count')}}",
                    contentType: "application/json",
                    success: function (response) {
                        var data = JSON.parse(response);

                        if (data["status"] == "success") {

                            $('#delivered').text(data["delivered"]);
                            $('#customerConfirm').text(data["customerConfirm"]);
                            $('#paid').text(data["paid"]);
                            $('#return').text(data["return"]);
                            $('#lost').text(data["lost"]);
                            $('#pendingInvoiced').text(data["pendingInvoiced"]);
                            $('#invoiced').text(data["invoiced"]);
                            $('#stockOut').text(data["stockOut"]);
                            $('#all').text(data["all"]);
                            $('#processing').text(data["processing"]);
                            $('#pendingPayment').text(data["pendingPayment"]);
                            $('#onHold').text(data["onHold"]);
                            $('#canceled').text(data["canceled"]);
                            $('#completed').text(data["completed"]);

                            // console.log(data)
                        } else {
                            if (data["status"] == "failed") {
                                swal(data["message"]);
                            } else {
                                swal("Something wrong ! Please try again.");
                            }
                        }
                    }
                });
            }




            //change order status
            var token = $("input[name='_token']").val();


            //order edit

            $(document).on('click', '.btn-editorder', function (e) {
                e.preventDefault();
                var id = $(this).attr('data-id');
                $.ajax({
                    type: "get",
                    url: "{{url('admin_orders')}}/"+id+"/edit",
                    success: function (response) {

                        $('.modal .modal-body').empty().append(response);
                        $('.modal').modal('toggle');
                        $('.modal-footer').hide();

                        $(".datepicker").flatpickr();

                        $("#productID").select2({
                            placeholder: "Select a Product",
                            templateResult: function (state) {
                                if (!state.id) {
                                    return state.text;
                                }
                                var $state = $(
                                    '<span><img width="60px" src="' +
                                    state.image +
                                    '" class="img-flag" /> ' +
                                    state.text +
                                    "</span>"
                                );
                                return $state;
                            },
                            ajax: {
                                type:'GET',
                                url: '{{url('admin_order/products')}}',
                                processResults: function (data) {
                                    var data = $.parseJSON(data);
                                    return {
                                        results: data.data
                                    };
                                }
                            }
                        }).trigger("change").on("select2:select", function (e) {
                            $("#productTable tbody").append(
                                "<tr>" +
                                '<td  style="display: none"><input type="text" class="productID" style="width:80px;" value="' + e.params.data.id + '"></td>' +
                                '<td><input type="text" name="color" id="ProductColor" value="" style="    max-width: 60px;"> </td>' +
                                '<td><input type="text" name="size" id="ProductSize" value="" style="    max-width: 40px;"></td>' +
                                '<td><span class="productCode">' + e.params.data.productCode + '</span></td>' +
                                '<td><span class="productName">' + e.params.data.text + '</span></td>' +
                                '<td><input type="number" class="productQuantity form-control" style="width:80px;" value="1"></td>' +
                                '<td><span class="productPrice">' + e.params.data.productPrice + '</span></td>' +
                                '<td><button class="btn btn-sm btn-danger delete-btn"><i class="fa fa-trash"></i></button></td>\n' +
                                "</tr>"
                            );
                            calculation();
                        });

                        $("#storeID").select2({
                            placeholder: "Select a Store",
                            ajax: {
                                type:'GET',
                                url: '{{url('admin_order/stores')}}',
                                processResults: function (data) {
                                    var data = $.parseJSON(data);
                                    return {
                                        results: data
                                    };
                                }
                            }
                        });


                        $("#courierID").select2({
                            placeholder: "Select a Courier",
                            ajax: {
                                url: '{{url('admin_order/couriers')}}',
                                processResults: function (data) {
                                    var data = $.parseJSON(data);
                                    return {
                                        results: data
                                    };
                                }
                            }
                        }).trigger("change").on("select2:select", function (e) {
                              $("#zoneID").empty();
                              for (var i = 0; i < couriers.length; i++) {
                                if (couriers[i]['courierName'] == e.params.data.text) {
                                     if (couriers[i]['hasCity'] == 'on') {
                                        jQuery(".hasCity").show();
                                    } else {
                                        jQuery(".hasCity").hide();
                                    }
                                    if (couriers[i]["hasZone"] == 'on') {
                                        jQuery(".hasZone").show();
                                    } else {
                                        jQuery(".hasZone").hide();
                                        $("#zoneID").empty();
                                    }
                                }

                                if (e.params.data.text == 'Pathao') {
                                    $("#cityID").empty().append('<option value="8">Dhaka</option>');
                                } else {
                                    $("#cityID").empty();
                                }
                            }

                        });

                        if ($("#courierID").text()) {
                            var courier = $("#courierID").text().trim();
                             for (var i = 0; i < couriers.length; i++) {
                                if (couriers[i]['courierName'] == courier) {
                                     if (couriers[i]['hasCity'] == 'on') {
                                        jQuery(".hasCity").show();
                                    } else {
                                        jQuery(".hasCity").hide();
                                    }

                                    if (couriers[i]["hasZone"] == 'on') {
                                        jQuery(".hasZone").show();
                                    } else {
                                        jQuery(".hasZone").hide();
                                        $("#zoneID").empty();
                                    }
                                }
                            }
                        }

                        $("#cityID").select2({
                            placeholder: "Select a City",
                            ajax: {
                                data: function (params) {
                                    var query = {
                                        q: params.term,
                                        courierID: $("#courierID").val()
                                    };
                                    return query;
                                },
                                type:'GET',
                                url: '{{url('admin_order/cities')}}',
                                processResults: function (data) {
                                    var data = $.parseJSON(data);
                                    return {
                                        results: data
                                    };
                                }
                            }
                        });

                        $("#zoneID").select2({
                            placeholder: "Select a Zone",
                            ajax: {
                                data: function (params) {
                                    var query = {
                                        q: params.term,
                                        courierID: $("#courierID").val(),
                                        cityID: $("#cityID").val()
                                    };
                                    return query;
                                },
                                type:'GET',
                                url: '{{url('admin_order/zones')}}',
                                processResults: function (data) {
                                    var data = $.parseJSON(data);
                                    return {
                                        results: data
                                    };
                                    console.log(data);
                                }
                            }
                        });


                        var orderCommentTable = $("#orderCommentTable").DataTable({
                            ajax: "{{url('admin_order/getComment')}}?id=" + $('#orderCommentTable').attr('data-id'),
                            ordering: false,
                            lengthChange: false,
                            bFilter:false,
                            search:false,
                            info:false,
                            columns: [
                                {data: "date"},
                                {data: "comment"},
                                {data: "name"}
                            ],
                        });

                        var oldOrderTable = $("#oldOrderTable").DataTable({
                            ajax: "{{url('admin_order/previous_orders')}}?id=" + $('#oldOrderTable').attr('data-id'),
                            ordering: false,
                            lengthChange: false,
                            bFilter:false,
                            search:false,
                            info:false,
                            columns: [
                                {data: "invoiceID"},
                                {
                                        data: null,
                                        width: "15%",
                                        render: function (data) {
                                            return '<i class="fas fa-user mr-2 text-grey-dark"></i>'+data.customerName +'<br> <i class="fas fa-phone  mr-2 text-grey-dark"></i>'+data.customerPhone+'<br><i class="fas fa-map-marker mr-2 text-grey-dark"></i>' + data.customerAddress;
                                        }
                                },
                                {data: "products"},
                                {data: "subTotal"},
                                {data: "status"}
                            ]
                        });

                        $(document).on("click", "#updateComment", function () {
                            var note = $('#comment');
                            var id = $('#btn-update').val();
                            if(note.val() == ''){
                                note.css('border','1px solid red');
                                return;
                            }else if( id == ''){
                                toastr.success('Something Wrong , Try again ! ');
                                return;
                            }else{
                                $.ajax({
                                    type: "GET",
                                    url: "{{url('admin_order/updateComment')}}",
                                    data: {
                                        'comment': note.val(),
                                        'id': id,
                                        '_token': token
                                    },
                                    success: function (response) {
                                        var data = JSON.parse(response);
                                        if (data['status'] == 'success') {
                                            toastr.success(data["message"]);
                                            orderCommentTable.ajax.reload();
                                        } else {
                                            if (data['status'] == 'failed') {
                                                toastr.error(data["message"]);
                                            } else {
                                                toastr.error('Something wrong ! Please try again.');
                                            }
                                        }
                                    }
                                });
                                return;
                            }


                        });


                        if ($("#paymentTypeID").text()) {
                            var paymentType = $("#paymentTypeID").val();
                            if (paymentType == "") {
                                $(".paymentID").hide();
                                $(".paymentAgentNumber").hide();
                                $(".paymentAmount").hide();
                            } else {
                                $(".paymentID").show();
                                $(".paymentAgentNumber").show();
                                $(".paymentAmount").show();
                            }
                        }

                        $("#paymentTypeID").select2({
                            placeholder: "Select a payment Type",
                            allowClear: true,
                            ajax: {
                                data: function (params) {
                                    return {
                                        q: params.term
                                    };
                                    console.log(params);
                                },
                                url: '{{url('admin_order/paymenttype')}}',
                                processResults: function (data) {

                                    var data = $.parseJSON(data);
                                    return {
                                        results: data
                                    };
                                }
                            }
                        }).trigger("change").on("select2:select", function (e) {
                            if (e.params.data.text == "") {
                                $(".paymentID").hide();
                                $(".paymentAgentNumber").hide();
                                $(".paymentAmount").hide();
                            } else {
                                $(".paymentID").show();
                                $(".paymentAgentNumber").show();
                                $(".paymentAmount").show();
                            }
                        }).on("select2:unselect", function (e) {
                            $(".paymentID").hide();
                            $(".paymentAgentNumber").hide();
                            $(".paymentAmount").hide();
                            calculation();
                        });

                        $("#paymentID").select2({
                            placeholder: "Select a payment Number",
                            allowClear: true,
                            ajax: {
                                data: function (params) {
                                    return {
                                        q: params.term,
                                        paymentTypeID: $("#paymentTypeID").val(),
                                    };
                                },
                                type:'GET',
                                url: '{{url('admin_order/paymentnumber')}}',

                                processResults: function (data) {
                                    var data = $.parseJSON(data);
                                    return {
                                        results: data
                                    };
                                }
                            }
                        });

                        $(document).on("change", ".productQuantity", function () {
                             calculation();
                        });
                        $(document).on("input", "#paymentAmount", function () {
                            calculation();
                        });
                        $(document).on("input", "#deliveryCharge", function () {
                            calculation();
                        });
                        $(document).on("input", "#discountCharge", function () {
                            calculation();
                        });
                        calculation();



                    }
                });
            });


            $(document).on("click", "#btn-update", function () {
                var id =  $(this).val();
                var invoiceID = $("#invoiceID");
                var customerName = $("#customerName");
                var customerPhone = $("#customerPhone");
                var customerAddress = $("#customerAddress");
                var storeID = $("#storeID");
                var total = +$("#total").text();
                var deliveryCharge = +$("#deliveryCharge").val();
                var discountCharge = +$("#discountCharge").val();
                var paymentTypeID = $("#paymentTypeID").val();
                var paymentID = $("#paymentID").val();
                var paymentAmount = +$("#paymentAmount").val();
                var paymentAgentNumber = $("#paymentAgentNumber").val();
                var orderDate = $("#orderDate");
                var courierID = $("#courierID");
                var cityID = +$("#cityID").val();
                var zoneID = +$("#zoneID").val();
                var memo = +$("#memo").val();
                var product = [];
                var productCount = 0 ;

                $("#productTable tbody tr").each(function (index, value) {
                    var currentRow = $(this);
                    var obj = {};
                    obj.productColor = currentRow.find("#ProductColor").val();
                    obj.productSize = currentRow.find("#ProductSize").val();
                    obj.productID = currentRow.find(".productID").val();
                    obj.productCode = currentRow.find(".productCode").text();
                    obj.productName = currentRow.find(".productName").text();
                    obj.productQuantity = currentRow.find(".productQuantity").val();
                    obj.productPrice = currentRow.find(".productPrice").text();
                    product.push(obj);
                    productCount++;
                });

                if(storeID.val() == ''){
                    toastr.error('Store Should Not Be Empty');
                    storeID.closest('.form-group').find('.select2-selection').css('border','1px solid red');
                    return;
                }
                storeID.closest('.form-group').find('.select2-selection').css('border','1px solid #ced4da');

                if(invoiceID.val() == ''){
                    toastr.error('Invoice ID Should Not Be Empty');
                    invoiceID.css('border','1px solid red');
                    return;
                }
                invoiceID.css('border','1px solid #ced4da');

                if(customerName.val() == ''){
                    toastr.error('Customer Name Should Not Be Empty');
                    customerName.css('border','1px solid red');
                    return;
                }
                customerName.css('border','1px solid #ced4da');

                if(customerPhone.val() == ''){
                    toastr.error('Customer Phone Should Not Be Empty');
                    customerPhone.css('border','1px solid red');
                    return;
                }
                customerPhone.css('border','1px solid #ced4da');

                if(customerAddress.val() == ''){
                    toastr.error('Customer Address Should Not Be Empty');
                    customerAddress.css('border','1px solid red');
                    return;
                }
                customerAddress.css('border','1px solid #ced4da');

                if(orderDate.val() == ''){
                    toastr.error('Order Date Should Not Be Empty');
                    orderDate.css('border','1px solid red');
                    return;
                }
                orderDate.css('border','1px solid #ced4da');

                if(courierID.val() == ''){
                    toastr.error('Courier Should Not Be Empty');
                    courierID.closest('.form-group').find('.select2-selection').css('border','1px solid red');
                    return;
                }
                courierID.css('border','1px solid #ced4da');

                if(productCount == 0){
                    toastr.error('Product Should Not Be Empty');
                    return;
                }

                var data = {};
                data["invoiceID"] = invoiceID.val();
                data["storeID"] = storeID.val();
                data["customerName"] = customerName.val();
                data["customerPhone"] = customerPhone.val();
                data["customerAddress"] = customerAddress.val();
                data["total"] = total;
                data["deliveryCharge"] = deliveryCharge;
                data["discountCharge"] = discountCharge;
                data["paymentTypeID"] = paymentTypeID;
                data["paymentID"] = paymentID;
                data["paymentAmount"] = paymentAmount;
                data["paymentAgentNumber"] = paymentAgentNumber;
                data["orderDate"] = orderDate.val();
                data["courierID"] = +courierID.val();
                data["cityID"] = cityID;
                data["zoneID"] = zoneID;
                data["userID"] = $('#user_id').val();
                data["products"] = product;
                data["memo"] = memo;
                $.ajax({
                    type: "PUT",
                    url: "{{url('admin_orders')}}/" + id,
                    data: {
                        'data': data,
                        '_token': token
                    },
                    success: function (response) {
                        var data = JSON.parse(response);
                        if (data["status"] === "success") {
                            toastr.success(data["message"]);
                            $('.modal').modal('toggle');
                        } else {
                            toastr.error(data["message"]);
                        }
                        orderinfotbl.ajax.reload();
                    }
                });


            });


            $(".datepicker").flatpickr();




        });



    </script>



<style>
    .card-box {
    background-color: #fff;
    padding: 1.5rem;
    -webkit-box-shadow: 0 1px 4px 0 rgb(0 0 0 / 10%);
    box-shadow: 0 1px 4px 0 rgb(0 0 0 / 10%);
    margin-bottom: 24px;
    border-radius: 0.25rem;
}
a {
    text-decoration: none;
}
</style>


@endsection
