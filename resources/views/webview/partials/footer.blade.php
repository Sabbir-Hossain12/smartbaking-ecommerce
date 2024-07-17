<footer id="footer" class="footer color-bg">


    <div class="footer-bottom">
        <div class="container">
            <div class="row">
                <div class="col-6 col-md-3" id="left">
                    <div class="module-heading">
                        <h4 class="module-title">Contact Us</h4>
                    </div>
                    <!-- /.module-heading -->

                    <div class="module-body">
                        <ul class="toggle-footer" style="font-size: 13px;">
                            <li class="media">
                                <small style="color: white;">Address:</small>
                                <div class="media-body" style="color: white;">
                                    {{ $basicinfo->address }}
                                </div>
                            </li>

                            <li class="media">
                                <small style="color: white;">Phone:</small>
                                <div class="media-body" style="color: white;">
                                    +(88) {{ $basicinfo->phone_one }}<br> +(88) {{ $basicinfo->phone_two }}
                                </div>
                            </li>

                            <li class="media">
                                <small style="color: white;">Email:</small>
                                <div class="media-body">
                                    <span><a href="mailto:{{ $basicinfo->email }}" style="color: white;">{{ $basicinfo->email }}</a></span>
                                </div>
                            </li>

                        </ul>
                    </div>
                    <!-- /.module-body -->
                </div>
                <!-- /.col -->

                <div class="col-6 col-md-3" id="left">
                    <div class="module-heading">
                        <h4 class="module-title">Informations</h4>
                    </div>
                    <!-- /.module-heading -->

                    <div class="module-body">
                        <ul class='list-unstyled' style="font-size: 13px;">
                            <li class="first"><a title="Your Account" href="{{ url('venture/about_us') }}" style="color: white;">About us</a>
                            </li>
                            <li><a href="{{ url('venture/contact_us') }}" title="Suppliers" style="color: white;">Contact
                                    Us</a></li>
                            <li><a href="{{ url('venture/terms_codition') }}" title="Terms & Conditions" style="color: white;">Terms &
                                    Conditions</a></li>
                            <li><a href="{{ url('venture/faq') }}" title="faq" style="color: white;">FAQ</a></li>
                        </ul>
                    </div>
                    <!-- /.module-body -->
                </div>
                <!-- /.col -->

                <div class="col-6 col-md-3" id="left">
                    <div class="module-heading">
                        <h4 class="module-title">My Account</h4>
                    </div>
                    <!-- /.module-heading -->

                    <div class="module-body">
                        <ul class='list-unstyled' style="font-size: 13px;">
                            @if (Auth::id())
                                <li class="first"><a href="#" title="Dashboard" style="color: white;">Dashboard</a></li>
                            @else
                                <li class="first"><a href="#" title="Login" style="color: white;">Login</a></li>
                            @endif
                            <li><a href="{{ url('track-order') }}" title="Order History" style="color: white;">Order History</a></li>
                            <li class="last"><a href="{{ url('venture/company') }}" title="Company" style="color: white;">Company</a></li>
                        </ul>
                    </div>
                    <!-- /.module-body -->
                </div>
                <!-- /.col -->

                <div class="col-6 col-md-3" id="left">
                    <div class="module-heading">
                        <h4 class="module-title">Why Choose Us</h4>
                    </div>
                    <!-- /.module-heading -->

                    <div class="module-body">
                        <ul class='list-unstyled' style="font-size: 13px;">
                            <li class="first"><a href="{{ url('venture/help_center') }}" title="Help Center" style="color: white;">Help
                                    Center</a>
                            </li>
                            <li><a title="Customer
                                    Service"
                                    href="{{ url('venture/customer_service') }}" style="color: white;">Customer
                                    Service</a>
                            </li>
                            <li><a href="{{ url('venture/shipping_guide') }}" style="color: white;"
                                    title="Shopping
                                    Guide">Shopping
                                    Guide</a></li>

                        </ul>
                    </div>
                    <!-- /.module-body -->
                </div>

            </div>
            <div class="col-12 d-block d-sm-none">
                <div class="module-heading">
                    <p class="module-title text-center">Copyright © 2022 - <a href="https://danpite.tech/" target="_blank">{{strtoupper('danpite.tech')}}</a></p>
                </div>
            </div>
            <div class="row" id="d-lg-none">

                <div class="col-xs-12 col-sm-12 col-md-3">
                    <div class="module-heading">
                        <p class="module-title text-center">Copyright © 2022 - <a href="https://danpite.tech/" target="_blank">{{strtoupper('danpite.tech')}}</a></p>
                    </div>
                    <!-- /.module-heading -->
                    <ul id="footerul" style="font-size: 13px;">
                        <li id="footerli"><a id="footera" href="{{ url('venture/terms_codition') }}">Terms &
                                Conditions</a></li>
                        <li id="footerli"><a id="footera" href="{{ url('venture/about_us') }}">About Us</a></li>
                        <li id="footerli"><a id="footera" href="{{ url('venture/contact_us') }}">Contact Us</a>
                        </li>
                    </ul>
                    <!-- /.module-body -->
                </div>
            </div>
        </div>
    </div>
</footer>

<!-- /.footer  bottom nav bar mobile-->
<div class="bottom-navbar d-block d-lg-none">
    <div class="container" style="padding: 0px !important;">
        <div class="row p-0">
            <div class="logo-bar-icons col-lg-12 col" style="margin: 0px">
                <ul class="inline-links d-lg-inline-block d-flex justify-content-between">

                    <li class="text-center">
                        <a class="nav-cart-box" href="javascript:void(0);"  onclick="openNav()" >
                            <i class=" nav-box-icon fas fa-th"></i>
                            <div style="font-size: 14px;">Category</div>
                        </a>
                    </li>
                    <li class="text-center">
                        <a class="nav-cart-box" href="{{ url('/') }}">
                            <i class="nav-box-icon fas fa-home"></i>
                            <div style="font-size: 14px;">Home</div>
                        </a>
                    </li>
                    <li class="text-center">
                        <a class="nav-cart-box" href="{{url('checkout')}}">
                            <i class=" nav-box-icon fas fa-shopping-bag"></i>
                            <div style="font-size: 14px;">Cart</div>
                        </a>
                    </li>
                    @if (Auth::id())
                        <li class="text-center">
                            <a class="nav-cart-box" href="{{ url('user/dashboard') }}">
                                <i class="nav-box-icon fas fa-user"></i>
                                <div style="font-size: 14px;">Account</div>
                            </a>
                        </li>
                    @else
                        <li class="text-center">
                            <a class="nav-cart-box" href="{{ url('login') }}">
                                <i class="nav-box-icon fas fa-user"></i>
                                <div style="font-size: 14px;">Account</div>
                            </a>
                        </li>
                    @endif
                </ul>
            </div>
        </div>
    </div>
</div>
