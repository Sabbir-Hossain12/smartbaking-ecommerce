<aside id="sidebar" class="sidebar">
    @php
        $admin = App\Models\Admin::where('id', Auth::guard('admin')->user()->id)->first();
    @endphp
    <ul class="sidebar-nav" id="sidebar-nav">


        @if ($admin->hasRole('user'))
        <li class="nav-item">
            <a class="nav-link " href="{{ url('order/dashboard') }}">
                <i class="bi bi-grid"></i>
                <span>Dashboard</span>
            </a>
        </li><!-- End Dashboard Nav -->
        @else
        <li class="nav-item">
            <a class="nav-link " href="{{ url('admin/dashboard') }}">
                <i class="bi bi-grid"></i>
                <span>Dashboard</span>
            </a>
        </li><!-- End Dashboard Nav -->
            <li class="nav-item">
                <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
                    <i class="bi bi-box"></i><span>Store</span><i class="bi bi-chevron-down ms-auto"></i>
                </a>
                <ul id="components-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">

                    <li>
                        <a href="{{ route('purchases.index') }}">
                            <span>Purchase</span>
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('stocks.index') }}">
                            <span>Stock</span>
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('suppliers.index') }}">
                            <span>Supplier</span>
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('payments.index') }}">
                            <span>Payment</span>
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('paymenttypes.index') }}">
                            <span>Payment Method</span>
                        </a>
                    </li>
                </ul>
            </li><!-- End Components Nav -->

            <li class="nav-item">
                <a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
                    <i class="bi bi-truck"></i><span>Courier</span><i class="bi bi-chevron-down ms-auto"></i>
                </a>
                <ul id="forms-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                    <li>
                        <a href="{{ route('couriers.index') }}">
                            <span>Courier</span>
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('cities.index') }}">
                            <span>City</span>
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('zones.index') }}">
                            <span>Zone</span>
                        </a>
                    </li>
                </ul>
            </li><!-- End Forms Nav -->
        @endif

        <li class="nav-item">
            <a class="nav-link collapsed" href="{{ url('admin_order/Processing') }}">
                <i class="bi bi-cart"></i>
                <span>Order</span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link collapsed" href="{{ url('admin_order/Pending Invoiced') }}">
                <i class="bi bi-file-richtext"></i>
                <span>Invoiced</span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link collapsed" href="{{ url('admin_order/Delivered') }}">
                <i class="bi bi-truck-flatbed"></i>
                <span>Delivered</span>
            </a>
        </li>
        @if ($admin->hasRole('manager') || $admin->hasRole('user'))
            <li class="nav-item">
                <a class="nav-link collapsed" href="{{ url('order/complain') }}">
                    <i class="bi bi-truck-flatbed"></i>
                    <span>Complain</span>
                </a>
            </li>
        @else
        @endif

        <li class="nav-item">
            <a class="nav-link collapsed" href="{{ url('complain/Pending') }}">
                <i class="bi bi-truck-flatbed"></i>
                <span>Complain Box</span>
            </a>
        </li>

        <li class="nav-item">
            <a class="nav-link collapsed" href="{{ url('/orderby-product') }}">
                <i class="bi bi-person"></i>
                <span>Product Orders</span>
            </a>
        </li>

        @if ($admin->hasRole('manager') || $admin->hasRole('user'))
        @else
            <li class="nav-item">
                <a class="nav-link collapsed" data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
                    <i class="bi bi-truck"></i><span>Report</span><i class="bi bi-chevron-down ms-auto"></i>
                </a>
                <ul id="tables-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                    <li>
                        <a href="{{ route('courieruserreport') }}">
                            <span>Courier User Report</span>
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('courierreport') }}">
                            <span>Courier Report</span>
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('userreport') }}">
                            <span>User Report</span>
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('productreport') }}">
                            <span>Product</span>
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('paymentreport') }}">
                            <span>Payment</span>
                        </a>
                    </li>
                </ul>
            </li><!-- End Tables Nav -->

            <li class="nav-item">
                <a class="nav-link collapsed" href="{{ route('orderchange.bybarcode') }}">
                    <i class="bi bi-person"></i>
                    <span>OR Scanner</span>
                </a>
            </li>
        @endif


    </ul>

</aside>
