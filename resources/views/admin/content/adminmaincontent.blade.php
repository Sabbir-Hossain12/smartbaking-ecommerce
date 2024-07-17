@extends('admin.master')

@section('maincontent')
    <main id="main" class="main">

        <div class="pagetitle">
            <h1><a href="{{ url('admin/dashboard') }}">Dashboard</a></h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{ url('admin/dashboard') }}">Home</a></li>
                    <li class="breadcrumb-item active">Dashboard</li>
                </ol>
            </nav>
        </div><!-- End Page Title -->

        <?php
        use App\Models\Comment;
        use App\Models\Admin;
        $admin = Admin::where('email', Auth::guard('admin')->user()->email)->first();
        $users = Admin::whereHas('roles', function ($q) {
            $q->where('name', 'user');
        })->count();
        $ordercount = DB::table('orders')->count();
        $orderamount = DB::table('orders')
            ->where('status', 'Paid')
            ->sum('subTotal');
        $comments = Comment::latest()
            ->take(100)
            ->get();

        ?>
        <section class="section dashboard">

            @if ($admin->hasRole('user'))
                <div class="row">
                    @if ($admin->hasRole('user'))
                        <div class="col-md-6 col-xl-2">

                            <a href="{{ url('order/complain') }}">
                            <div class="widget-rounded-circle card-box order pt-1 pb-1">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="float-left">
                                            <h3 class="text-dark mt-1 mb-0">
                                                <span id="allorderss">{{App\Models\Order::get()->count()}}</span>
                                            </h3>
                                            <p class="text-muted mb-1 text-truncate">All Orders</p>
                                        </div>
                                    </div>
                                </div> <!-- end row-->
                            </div> <!-- end widget-rounded-circle-->
                            </a>
                        </div> <!-- end col-->
                    @endif
                    <!-- Revenue Card -->
                    <div class="col-md-6 col-xl-2">

                        <a href="{{ url('admin_order/orderall') }}">
                        <div class="widget-rounded-circle card-box order pt-1 pb-1">
                            <div class="row">
                                <div class="col-12">
                                    <div class="float-left">
                                        <h3 class="text-dark mt-1 mb-0">
                                            <span id="all">0</span>
                                        </h3>
                                        <p class="text-muted mb-1 text-truncate">My Orders</p>
                                    </div>
                                </div>
                            </div> <!-- end row-->
                        </div> <!-- end widget-rounded-circle-->
                        </a>
                    </div> <!-- end col-->

                    <div class="col-md-6 col-xl-2">
                        <a href="{{ url('admin_order/Processing') }}">
                            <div class="widget-rounded-circle card-box order pt-1 pb-1">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="float-left">
                                            <h3 class="text-dark mt-1 mb-0">
                                                <span id="processing" data-plugin="counterup">0</span>
                                            </h3>
                                            <p class="text-muted mb-1 text-truncate">Processing</p>
                                        </div>
                                    </div>
                                </div> <!-- end row-->
                            </div> <!-- end widget-rounded-circle-->
                        </a>
                    </div> <!-- end col-->

                    <div class="col-md-6 col-xl-2">
                        <a href="{{ url('admin_order/Payment Pending') }}">

                            <div class="widget-rounded-circle card-box order pt-1 pb-1">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="float-left">
                                            <h3 class="text-dark mt-1 mb-0">
                                                <span id="pendingPayment" data-plugin="counterup">0</span>
                                            </h3>
                                            <p class="text-muted mb-1 text-truncate">Payment Pending</p>
                                        </div>
                                    </div>
                                </div> <!-- end row-->
                            </div> <!-- end widget-rounded-circle-->
                        </a>
                    </div> <!-- end col-->

                    <div class="col-md-6 col-xl-2">
                        <a href="{{ url('admin_order/On Hold') }}">

                            <div class="widget-rounded-circle card-box order pt-1 pb-1">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="float-left">
                                            <h3 class="text-dark mt-1 mb-0">
                                                <span id="onHold" data-plugin="counterup">0</span>
                                            </h3>
                                            <p class="text-muted mb-1 text-truncate">On Hold</p>
                                        </div>
                                    </div>
                                </div> <!-- end row-->
                            </div> <!-- end widget-rounded-circle-->
                        </a>
                    </div> <!-- end col-->

                    <div class="col-md-6 col-xl-2">
                        <a href="{{ url('admin_order/Canceled') }}">
                            <div class="widget-rounded-circle card-box order pt-1 pb-1">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="float-left">
                                            <h3 class="text-dark mt-1 mb-0">
                                                <span id="canceled" data-plugin="counterup">0</span>
                                            </h3>
                                            <p class="text-muted mb-1 text-truncate">Canceled</p>
                                        </div>
                                    </div>
                                </div> <!-- end row-->
                            </div> <!-- end widget-rounded-circle-->
                        </a>
                    </div> <!-- end col-->

                    <div class="col-md-6 col-xl-2">
                        <a href="{{ url('admin_order/Completed') }}">

                            <div class="widget-rounded-circle card-box order pt-1 pb-1">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="float-left">
                                            <h3 class="text-dark mt-1 mb-0">
                                                <span id="completed" data-plugin="counterup">0</span>
                                            </h3>
                                            <p class="text-muted mb-1 text-truncate">Completed</p>
                                        </div>
                                    </div>
                                </div> <!-- end row-->
                            </div> <!-- end widget-rounded-circle-->
                        </a>
                    </div> <!-- end col-->
                    <div class="col-md-6 col-xl-2">
                        <a href="{{ url('admin_order/Pending Invoiced') }}">
                            <div class="widget-rounded-circle card-box order pt-1 pb-1">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="float-left">
                                            <h3 class="text-dark mt-1 mb-0">
                                                <span id="pendingInvoiced" data-plugin="counterup">0</span>
                                            </h3>
                                            <p class="text-muted mb-1 text-truncate">Pending Invoiced</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-6 col-xl-2">
                        <a href="{{ url('admin_order/Invoiced') }}">
                            <div class="widget-rounded-circle card-box order pt-1 pb-1">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="float-left">
                                            <h3 class="text-dark mt-1 mb-0">
                                                <span id="invoiced" data-plugin="counterup">0</span>
                                            </h3>
                                            <p class="text-muted mb-1 text-truncate">Invoiced</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-6 col-xl-2">
                        <a href="{{ url('admin_order/Stock Out') }}">
                            <div class="widget-rounded-circle card-box order pt-1 pb-1">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="float-left">
                                            <h3 class="text-dark mt-1 mb-0">
                                                <span id="stockOut" data-plugin="counterup">0</span>
                                            </h3>
                                            <p class="text-muted mb-1 text-truncate">Stock Out</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>

                </div>

                <div class="row">
                    <div class="col-md-6 col-xl-2">
                        <a href="{{ url('admin_order/Delivered') }}">
                            <div class="widget-rounded-circle card-box order pt-1 pb-1">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="float-left">
                                            <h3 class="text-dark mt-1 mb-0">
                                                <span id="delivered" data-plugin="counterup">0</span>
                                            </h3>
                                            <p class="text-muted mb-1 text-truncate">Delivered</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>

                    <div class="col-md-6 col-xl-2">
                        <a href="{{ url('admin_order/Customer On Hold') }}">
                            <div class="widget-rounded-circle card-box order pt-1 pb-1">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="float-left">
                                            <h3 class="text-dark mt-1 mb-0">
                                                <span id="customerOnHold" data-plugin="counterup">0</span>
                                            </h3>
                                            <p class="text-muted mb-1 text-truncate">Customer On Hold</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-6 col-xl-2">
                        <a href="{{ url('admin_order/Customer Confirm') }}">
                            <div class="widget-rounded-circle card-box order pt-1 pb-1">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="float-left">
                                            <h3 class="text-dark mt-1 mb-0">
                                                <span id="customerConfirm" data-plugin="counterup">0</span>
                                            </h3>
                                            <p class="text-muted mb-1 text-truncate">Customer Confirm</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-6 col-xl-2">
                        <a href="{{ url('admin_order/Request to Return') }}">
                            <div class="widget-rounded-circle card-box order pt-1 pb-1">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="float-left">
                                            <h3 class="text-dark mt-1 mb-0">
                                                <span id="requestToReturn" data-plugin="counterup">0</span>
                                            </h3>
                                            <p class="text-muted mb-1 text-truncate">Request to Return</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-6 col-xl-2">
                        <a href="{{ url('admin_order/Paid') }}">
                            <div class="widget-rounded-circle card-box order pt-1 pb-1">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="float-left">
                                            <h3 class="text-dark mt-1 mb-0">
                                                <span id="paid" data-plugin="counterup">0</span>
                                            </h3>
                                            <p class="text-muted mb-1 text-truncate">Paid</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-6 col-xl-2">
                        <a href="{{ url('admin_order/Return') }}">
                            <div class="widget-rounded-circle card-box order pt-1 pb-1">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="float-left">
                                            <h3 class="text-dark mt-1 mb-0">
                                                <span id="return" data-plugin="counterup">0</span>
                                            </h3>
                                            <p class="text-muted mb-1 text-truncate">Return</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-6 col-xl-2">
                        <a href="{{ url('admin_order/Lost') }}">
                            <div class="widget-rounded-circle card-box order pt-1 pb-1">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="float-left">
                                            <h3 class="text-dark mt-1 mb-0">
                                                <span id="lost" data-plugin="counterup">0</span>
                                            </h3>
                                            <p class="text-muted mb-1 text-truncate">Lost</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            @else
                <div class="row">

                    <!-- Left side columns -->
                    <div class="col-lg-12">
                        <div class="row">

                            <!-- Revenue Card -->
                            <div class="col-xxl-4 col-md-4">
                                <div class="card info-card revenue-card">

                                    <div class="card-body">
                                        <h5 class="card-title">Revenue</h5>

                                        <div class="d-flex align-items-center">
                                            <div
                                                class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                                TK
                                            </div>
                                            <div class="ps-3">
                                                <h6> ৳ {{ $orderamount }}</h6>

                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div><!-- End Revenue Card -->

                            <!-- Order Card -->
                            <div class="col-xxl-4 col-md-4">
                                <div class="card info-card sales-card">

                                    <div class="card-body">
                                        <h5 class="card-title">Orders <span></span></h5>

                                        <div class="d-flex align-items-center">
                                            <div
                                                class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                                <i class="bi bi-basket2"></i>
                                            </div>
                                            <div class="ps-3">
                                                <h6>{{ $ordercount }}</h6>

                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div><!-- End Sales Card -->


                            <!-- Customers Card -->
                            <div class="col-xxl-4 col-md-4">

                                <div class="card info-card customers-card">

                                    <div class="card-body">
                                        <h5 class="card-title">User <span></span></h5>

                                        <div class="d-flex align-items-center">
                                            <div
                                                class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                                <i class="bi bi-people"></i>
                                            </div>
                                            <div class="ps-3">
                                                <h6>{{ $users }}</h6>

                                            </div>
                                        </div>

                                    </div>
                                </div>

                            </div><!-- End Customers Card -->




                        </div>
                    </div><!-- End Left side columns -->

                    <!-- Right side columns -->


                </div>

                <div class="row">
                    <!-- Reports -->
                    <div class="col-md-6">
                        <div class="card">

                            <div class="filter">
                                <a class="icon" href="#" data-bs-toggle="dropdown"><i
                                        class="bi bi-three-dots"></i></a>
                                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                    <li class="dropdown-header text-start">
                                        <h6>Filter</h6>
                                    </li>

                                    <li><a class="dropdown-item" type="button" onclick="orderfilter(0)">Today</a></li>
                                    <li><a class="dropdown-item" type="button" onclick="orderfilter(1)">This Month</a>
                                    </li>
                                    <li><a class="dropdown-item" type="button" onclick="orderfilter(2)">This Year</a>
                                    </li>
                                </ul>
                            </div>

                            <div class="card-body">
                                <h5 class="card-title">Reports <span id="orderFilter"></span></h5>


                                <div class="table-responsive" style="max-height: 420px;overflow:auto">
                                    <table class="table table-striped table-sm table-nowrap table-centered mb-0">
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <h5 class="font-15 my-1 font-weight-normal"><a
                                                            href="{{ url('admin_order/orderall') }}"> All Order</a></h5>
                                                </td>
                                                <td><span id="allorder">0</span></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h5 class="font-15 my-1 font-weight-normal"><a
                                                            href="{{ url('admin_order/Processing') }}"> Today Order</a>
                                                    </h5>
                                                </td>
                                                <td><span id="all">0</span></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h5 class="font-15 my-1 font-weight-normal"><a
                                                            href="{{ url('admin_order/Processing') }}">Processing</a></h5>
                                                </td>
                                                <td><span id="processing">0</span></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h5 class="font-15 my-1 font-weight-normal"><a
                                                            href="{{ url('admin_order/Payment Pending') }}">Payment
                                                            Pending</h5>
                                                </td>
                                                <td><span id="pendingPayment">0</span></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h5 class="font-15 my-1 font-weight-normal"><a
                                                            href="{{ url('admin_order/On Hold') }}">On Hold</a></h5>
                                                </td>
                                                <td><span id="onHold">0</span></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h5 class="font-15 my-1 font-weight-normal"><a
                                                            href="{{ url('admin_order/Canceled') }}">Canceled</a></h5>
                                                </td>
                                                <td><span id="canceled">0</span></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h5 class="font-15 my-1 font-weight-normal"><a
                                                            href="{{ url('admin_order/Completed') }}">Completed</a></h5>
                                                </td>
                                                <td><span id="completed">0</span></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h5 class="font-15 my-1 font-weight-normal"><a
                                                            href="{{ url('admin_order/Pending Invoiced') }}">Pending
                                                            Invoiced</a></h5>
                                                </td>
                                                <td><span id="pendingInvoiced">0</span></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h5 class="font-15 my-1 font-weight-normal"><a
                                                            href="{{ url('admin_order/Invoiced') }}">Invoiced</a></h5>
                                                </td>
                                                <td><span id="invoiced">0</span></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h5 class="font-15 my-1 font-weight-normal"><a
                                                            href="{{ url('admin_order/Stock Out') }}">Stock Out</a></h5>
                                                </td>
                                                <td><span id="stockOut">0</span></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h5 class="font-15 my-1 font-weight-normal"><a
                                                            href="{{ url('admin_order/Delivered') }}">Delivered</a></h5>
                                                </td>
                                                <td><span id="delivered">0</span></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h5 class="font-15 my-1 font-weight-normal"><a
                                                            href="{{ url('admin_order/Customer On Hold') }}">Customer On
                                                            Hold</a></h5>
                                                </td>
                                                <td><span id="customerOnHold">0</span></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h5 class="font-15 my-1 font-weight-normal"><a
                                                            href="{{ url('admin_order/Customer Confirm') }}">Customer
                                                            Confirm</a></h5>
                                                </td>
                                                <td><span id="customerConfirm">0</span></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h5 class="font-15 my-1 font-weight-normal"><a
                                                            href="{{ url('admin_order/Request to Return') }}">Request To
                                                            Return</a></h5>
                                                </td>
                                                <td><span id="requestToReturn">0</span></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h5 class="font-15 my-1 font-weight-normal"><a
                                                            href="{{ url('admin_order/Paid') }}">Paid</a></h5>
                                                </td>
                                                <td><span id="paid">0</span></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h5 class="font-15 my-1 font-weight-normal"><a
                                                            href="{{ url('admin_order/Return') }}">Return</a></h5>
                                                </td>
                                                <td><span id="return">0</span></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h5 class="font-15 my-1 font-weight-normal"><a
                                                            href="{{ url('admin_order/Lost') }}">Lost</a></h5>
                                                </td>
                                                <td><span id="lost">0</span></td>
                                            </tr>
                                        </tbody>
                                    </table>

                                </div>

                            </div>

                        </div>
                    </div><!-- End Reports -->



                    <div class="col-md-6">
                        <div class="card top-selling">

                            <div class="filter">
                                <a class="icon" href="#" data-bs-toggle="dropdown"><i
                                        class="bi bi-three-dots"></i></a>
                                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                    <li class="dropdown-header text-start">
                                        <h6>Filter</h6>
                                    </li>

                                    <li><a class="dropdown-item" type="button" onclick="topsellfilter(0)">Today</a></li>
                                    <li><a class="dropdown-item" type="button" onclick="topsellfilter(1)">This Month</a>
                                    </li>
                                    <li><a class="dropdown-item" type="button" onclick="topsellfilter(2)">This Year</a>
                                    </li>
                                </ul>
                            </div>

                            <div class="card-body pb-0">
                                <h5 class="card-title">Top Selling <span id="topsellProduct">| Today</span></h5>
                                <div class="table-responsive" style="height: 420px;overflow:auto">
                                    <table class="table table-borderless">
                                        <thead>
                                            <tr>
                                                <th scope="col">SKU</th>
                                                <th scope="col">Preview</th>
                                                <th scope="col">Product</th>
                                                <th scope="col">Price</th>
                                                <th scope="col">QTY</th>
                                            </tr>
                                        </thead>
                                        <tbody id="topsellProductTbl">

                                        </tbody>
                                    </table>
                                </div>
                            </div>

                        </div>
                    </div><!-- End Top Selling -->





                </div>
            @endif

        </section>

    </main>

    @php
        $admin=Admin::where('email',Auth::guard('admin')->user()->email)->first();
    @endphp

    @if($admin->hasRole('user'))
        <input type="text" name="role" value="User" id="rolecheck" hidden>
    @else
        <input type="text" name="role" value="Admin" id="rolecheck" hidden>
    @endif

    <script>
        $(document).ready(function() {
            $('#orderFilter').text('/Today');
            $('#topsellProduct').text('/Today');
            var role= $('#rolecheck').val();
            if(role=='User'){
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
                            $('#allorder').text(data["allorder"]);
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
            }else{
                $.ajax({
                type: "get",
                url: "{{ url('admin_order/count/') }}" + '/' + 0,
                contentType: "application/json",
                success: function(response) {
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
                        $('#allorder').text(data["allorder"]);
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




            //topsell products
            $.ajax({
                type: "get",
                url: "{{ url('admin_order/product/topsell/0') }}",
                contentType: "application/json",
                success: function(response) {
                    var data = JSON.parse(response);
                    $('#topsellProductTbl').html('');
                    if (data["status"] == "success") {
                        for (let i = 0; i < data["orders"].length; i++) {
                            $('#topsellProductTbl').append(
                                `
                                <tr>
                                    <th>` + data["orders"][i].productCode + `</th>
                                    <td scope="row"><a href="#"><img src="{{ asset('public/image/default.png') }}" alt=""></a></td>
                                    <td><a href="#" class="text-primary fw-bold">` + data["orders"][i].productName + `</a></td>
                                    <td>TK. ` + data["orders"][i].productPrice + `</td>
                                    <td class="fw-bold">` + data["orders"][i].total_amount + `</td>
                                </tr>
                            `);
                        }
                    } else {
                        if (data["status"] == "failed") {
                            swal(data["message"]);
                        } else {
                            swal("Something wrong ! Please try again.");
                        }
                    }
                }
            });


            // recent sale
            $.ajax({
                type: "get",
                url: "{{ url('admin_order/product/recentsell/0') }}",
                contentType: "application/json",
                success: function(response) {
                    var data = JSON.parse(response);
                    $('#recentselltitle').text('/Today');
                    $('#recentsellProductTbl').html('');
                    if (data["status"] == "success") {
                        for (let i = 0; i < data["orders"].length; i++) {
                            $('#recentsellProductTbl').append(
                                `
                                <tr>
                                    <th>` + data["orders"][i].invoiceID + `</th>
                                    <td>` + data["orders"][i].customers.customerName + `</td>
                                    <td id="recentsellproname` + data["orders"][i].id + `">
                                    </td>
                                    <td>TK. ` + data["orders"][i].subTotal + `</td>
                                    <td class="fw-bold">` + data["orders"][i].status + `</td>
                                </tr>
                            `);
                        }

                        for (let i = 0; i < data["orders"].length; i++) {
                            for (let j = 0; j < data["orders"][i].orderproducts.length; j++) {
                                $('#recentsellproname' + data["orders"][i].id).append(
                                    `
                                <a href="#" class="text-primary fw-bold">` + j + `.` + data["orders"][i].orderproducts[
                                        j].productName + `</a><br>
                                `);
                            }
                        }

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

        function recentsellfilter(id) {
            // recent sale
            $.ajax({
                type: "get",
                url: "{{ url('admin_order/product/recentsell/') }}" + '/' + id,
                contentType: "application/json",
                success: function(response) {
                    var data = JSON.parse(response);
                    $('#recentselltitle').text(data.title);
                    $('#recentsellProductTbl').html('');
                    if (data["status"] == "success") {
                        for (let i = 0; i < data["orders"].length; i++) {
                            $('#recentsellProductTbl').append(
                                `
                                <tr>
                                    <th>` + data["orders"][i].invoiceID + `</th>
                                    <td>` + data["orders"][i].customers.customerName + `</td>
                                    <td id="recentsellproname` + data["orders"][i].id + `">
                                    </td>
                                    <td>TK. ` + data["orders"][i].subTotal + `</td>
                                    <td class="fw-bold">` + data["orders"][i].status + `</td>
                                </tr>
                            `);
                        }

                        for (let i = 0; i < data["orders"].length; i++) {
                            for (let j = 0; j < data["orders"][i].orderproducts.length; j++) {
                                $('#recentsellproname' + data["orders"][i].id).append(
                                    `
                                <a href="#" class="text-primary fw-bold">` + j + `.` + data["orders"][i].orderproducts[
                                        j].productName + `</a><br>
                                `);
                            }
                        }

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

        function topsellfilter(id) {
            $.ajax({
                type: "get",
                url: "{{ url('admin_order/product/topsell/') }}" + '/' + id,
                contentType: "application/json",
                success: function(response) {
                    var data = JSON.parse(response);
                    $('#topsellProductTbl').html('');
                    if (data["status"] == "success") {
                        for (let i = 0; i < data["orders"].length; i++) {
                            $('#topsellProductTbl').append(
                                `
                                <tr>
                                    <th>` + data["orders"][i].productCode + `</th>
                                    <td scope="row"><a href="#"><img src="{{ asset('public/image/default.png') }}" alt=""></a></td>
                                    <td><a href="#" class="text-primary fw-bold">` + data["orders"][i].productName + `</a></td>
                                    <td>TK. ` + data["orders"][i].productPrice + `</td>
                                    <td class="fw-bold">` + data["orders"][i].total_amount + `</td>
                                </tr>
                            `);
                        }
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

        function orderfilter(id) {

            $.ajax({
                type: "GET",
                url: "{{ url('admin_order/count/') }}" + '/' + id,
                contentType: "application/json",
                success: function(response) {

                    var data = JSON.parse(response);
                    console.log(data);
                    if (data["status"] == "success") {
                        $('#orderFilter').text(data["title"]);
                        $('orderFilter').text('Today');
                        $('#delivered').text(data["delivered"]);
                        $('#customerConfirm').text(data["customerConfirm"]);
                        $('#paid').text(data["paid"]);
                        $('#return').text(data["return"]);
                        $('#lost').text(data["lost"]);
                        $('#pendingInvoiced').text(data["pendingInvoiced"]);
                        $('#invoiced').text(data["invoiced"]);
                        $('#stockOut').text(data["stockOut"]);
                        $('#all').text(data["all"]);
                        $('#allorder').text(data["allorder"]);
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
        };
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
