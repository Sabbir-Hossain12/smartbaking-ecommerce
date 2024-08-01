<!doctype html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

    <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Invoice</title>
    <link href="{{ asset('public/admin/css/bootstrap.min.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{ asset('public/admin/css/icons.min.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{ asset('public/admin/css/app.min.css') }}" rel="stylesheet" type="text/css" />
    <style>
        * {
            margin: 0px;
            padding: 0px;
        }

        table {
            width: 100%;
        }

        table,
        th,
        td {
            border: 1px solid gray;
            border-collapse: collapse;
        }

        th,
        td {
            padding: 5px;
            text-align: left;
        }

        table.table-with-info tr:nth-child(even) {
            background-color: #eee;
        }

        table.table-with-info tr:nth-child(odd) {
            background-color: #fff;
        }

        table.table-with-info th {
            background-color: black;
            color: white;
        }

        hr {
            border-top: 1px dashed red;
        }

        table.table-with-info,
        table.table-with-info td,
        table.table-with-info th {
            border: 0px solid black;
        }

        @media print {

            .section {
                display: flex;
                flex-direction: column;
                width: 100%;
                height: 100vh;
                justify-content: space-between;
            }
        }
    </style>
</head>

<body>
    <?php
    use Illuminate\Support\Facades\DB;
    $orderIDs = unserialize($invoice->order_id); ?>


    <?php $count = 1; foreach ($orderIDs as $orderID) {


    $order  = DB::table('orders')
        ->select('orders.*', 'customers.customerName', 'customers.customerPhone', 'customers.customerAddress', 'couriers.courierName', 'cities.cityName', 'zones.zoneName', 'users.name', 'paymenttypes.paymentTypeName', 'payments.paymentNumber')
        ->leftJoin('customers', 'orders.id', '=', 'customers.order_id')
        ->leftJoin('couriers', 'orders.courier_id', '=', 'couriers.id')
        ->leftJoin('paymenttypes', 'orders.payment_type_id', '=', 'paymenttypes.id')
        ->leftJoin('payments', 'orders.payment_id', '=', 'payments.id')
        ->leftJoin('cities', 'orders.city_id', '=', 'cities.id')
        ->leftJoin('zones', 'orders.zone_id', '=', 'zones.id')
        ->leftJoin('users', 'orders.user_id', '=', 'users.id')
        ->where('orders.id', '=', $orderID)->get()->first();
    if($count == 1) {
        echo '<div class="section">';
        $last = true;
    }
     ?>
    <div class="div-section" style="    font-size: 17px;">
        <table class="table-with-info" cellspacing="0" cellpadding="0">
            <tr>
                <td style="width: 25%;">
                    <h4>CUSTOMER INFO</h4>
                    {{ $order->customerName }} <br>
                    {{ $order->customerPhone }}<br>
                    @if ($order->courierName == 'Sa Paribahan' || $order->courierName == 'Sundorban')

                        {{ $order->courierName }} @if ($order->cityName)
                            >> {{ $order->cityName }}
                            @endif @if ($order->zoneName)
                                >> {{ $order->zoneName }}
                            @endif
                        @else
                            {{ $order->customerAddress }} <br>
                            {{ $order->courierName }} @if ($order->cityName)
                                >> {{ $order->cityName }}
                                @endif @if ($order->zoneName)
                                    >> {{ $order->zoneName }}
                                @endif
                            @endif
                </td>
                <td style="text-align:center">
                    <h4>COMPANY INFO</h4>
                    <strong>
                       <img src="{{asset(App\Models\Basicinfo::first()->logo)}}" style="width:200px">
                    </strong>
                    <br>
                    <strong>
                       {{App\Models\Basicinfo::first()->address}}
                        <br>যে কোনো প্রয়োজনে কল করুন: {{App\Models\Basicinfo::first()->phone_one}}
                    </strong>
                </td>
                <td style="width: 30%;text-align:right">
                    <?php
                    echo '<img src="data:image/png;base64,' . DNS1D::getBarcodePNG($order->invoiceID, 'C39') . '" alt="barcode"   />';
                    ?>
                    <h4>Invoice #{{ $order->invoiceID }}</h4>
                    Order Date : {{ $order->orderDate }}<br>
                    @if ($order->courierName == 'Sa Paribahan' || $order->courierName == 'Sundorban')
                        Payment Method : Courier Condition
                    @else
                        Payment Method : Cash On Delivery
                    @endif

                </td>

            </tr>
        </table>
        <table class="">
            <tr>
                <th style="width: 60%">Product</th>
                <th style="width: 20%">Quantity</th>
                <th style="width: 20%">Price</th>
            </tr>
            <?php
            $products = DB::table('orderproducts')->where('order_id', '=', $orderID)->get();
            foreach ($products as $product) { ?>
            <tr>
                <td>{{ $product->productName }} @if ($product->color && $product->size && $product->weight)
                        (Colour: {{ $product->color }} , Size: {{ $product->size }} , Weight: {{ $product->weight }})
                    @elseif($product->size)
                        (Size: {{ $product->size }})
                    @elseif($product->color)
                        (Color: {{ $product->color }})  
                    @elseif($product->weight)
                        (Weight: {{ $product->weight }})
                                                    
                    @else
                    @endif
                </td>
                <td>{{ $product->quantity }}</td>
                <td>{{ $product->productPrice }} Tk</td>
            </tr>
            <?php } ?>
            <tfoot>
                <tr>
                    <td colspan="1" style="border: none;"></td>
                    <th>Delivery : </th>
                    <td>{{ $order->deliveryCharge }} Tk</td>
                </tr>
                <tr>
                    <td colspan="1" style="border: none;"></td>
                    <th>Total : </th>
                    <td>{{ $order->subTotal }} Tk</td>
                </tr>

        </table>
        <div style=" display: flex; flex-direction: row; justify-content: space-between; ">
            <p>NB: This invoice will be used as a Warranty Card from purchase date ({{ date('Y-m-d') }}). </p>
            <p>Order Recived By : {{ App\Models\Admin::where('id',$order->admin_id)->first()->name }}</p>
        </div>
    </div>
    <hr>
    <?php
    if($count == 3 ) {
        echo '</div>';
        $count = 1;
    }else{
        $count++;
    }
    } ?>
    </div>

    <script src="{{ asset('public/admin/js/jquery.min.js') }}"></script>
    <script src="{{ asset('public/admin/js/vendor.min.js') }}"></script>
    <!-- App js -->
    <script src="{{ asset('public/admin/js/app.min.js') }}"></script>
    <script>
        $(function() {
            window.print();
            window.onfocus = function() {
                window.close();
            }
            window.onafterprint = function() {
                window.close();
            };


        });
    </script>
</body>

</html>
