<div class="sidebar pe-4 pb-3">
    <nav class="navbar bg-secondary navbar-dark">
        <a href="{{ url('/admin/dashboard') }}" class="navbar-brand mx-4 mb-3">
            <h3 class="text-primary"><img src="{{asset(\App\Models\Basicinfo::first()->logo)}}" alt="logo" style="width:100%"></h3>
        </a>
        <div class="d-flex align-items-center ms-4 mb-4">
            <div class="position-relative">
                @if(isset(Auth::guard('admin')->user()->profile))
                <img class="rounded-circle" src="{{ asset(Auth::guard('admin')->user()->profile) }}" alt=""
                    style="width: 40px; height: 40px;">
                @else
                <img class="rounded-circle" src="{{ asset('public/backend/') }}/img/user.jpg" alt=""
                    style="width: 40px; height: 40px;">
                @endif
                <div
                    class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1">
                </div>
            </div>
            <div class="ms-3">
                <h6 class="mb-0">{{Auth::user()->name}}</h6>
                <span>Admin</span>
            </div>
        </div>
        <div class="navbar-nav w-100">
            <a href="{{ url('/admin/dashboard') }}" class="nav-item nav-link active"><i
                    class="fa fa-tachometer-alt me-2"></i>Dashboard</a>
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i
                        class="fa fa-laptop me-2"></i>Admins</a>
                <div class="dropdown-menu bg-transparent border-0">
                    <a href="{{ route('admin.roles.index') }}" class="dropdown-item">Roles & Permissions</a>
                    <a href="{{ route('admin.admins.index') }}" class="dropdown-item">Admins</a>
                </div>
            </div>
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i
                        class="fa fa-laptop me-2"></i>Users</a>
                <div class="dropdown-menu bg-transparent border-0">
                    <a href="{{ route('admin.userroles.index') }}" class="dropdown-item">Roles & Permissions</a>
                    <a href="{{ route('admin.users.index') }}" class="dropdown-item">Users</a>
                </div>
            </div>

            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i
                        class="far fa-file-alt me-2"></i>Menu & Brand</a>
                <div class="dropdown-menu bg-transparent border-0">
                    <a href="{{ route('admin.menus.index') }}" class="dropdown-item">Menu</a>
                    <a href="{{ route('admin.categorys.index') }}" class="dropdown-item">Category</a>
                    <a href="{{ route('admin.subcategorys.index') }}" class="dropdown-item">Sub Category</a>
                    <a href="{{ route('admin.brands.index') }}" class="dropdown-item">Bottom Brand</a>
                </div>
            </div>
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i
                        class="far fa-file-alt me-2"></i>Slider & Banner</a>
                <div class="dropdown-menu bg-transparent border-0">
                    <a href="{{ route('admin.sliders.index') }}" class="dropdown-item">Sliders</a>
                    <a href="{{ route('admin.addbanners.index') }}" class="dropdown-item">Add Banners</a>
                </div>
            </div>
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i
                        class="far fa-file-alt me-2"></i>Attributes</a>
                <div class="dropdown-menu bg-transparent border-0">
                    <a href="{{ route('admin.attributes.index') }}" class="dropdown-item">Attribute Name</a>
                    <a href="{{ route('admin.attrvalues.index') }}" class="dropdown-item">Attribute Value</a>
                </div>
            </div>

            <a href="{{ route('admin.products.index') }}" class="nav-item nav-link"><i
                    class="fa fa-keyboard me-2"></i>Products</a>
            <a href="{{ url('order/dashboard') }}" class="nav-item nav-link"><i class="fa fa-table me-2"></i>Order
                Panel</a>
            <a href="chart.html" class="nav-item nav-link"><i class="fa fa-chart-bar me-2"></i>Charts</a>
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i
                        class="far fa-file-alt me-2"></i>Pages</a>
                <div class="dropdown-menu bg-transparent border-0">

                    <a href="{{ url('admin/information/about_us') }}" class="dropdown-item">About Us</a>
                    <a href="{{ url('admin/information/contact_us') }}" class="dropdown-item">Contact Us</a>
                    <a href="{{ url('admin/information/terms_codition') }}" class="dropdown-item">Terms Conditions</a>
                    <a href="{{ url('admin/information/shipping_guide') }}" class="dropdown-item">Shipping Guide</a>
                    <a href="{{ url('admin/information/investor_relation') }}"
                        class="dropdown-item">Investor-Relation</a>
                    <a href="{{ url('admin/information/company') }}" class="dropdown-item">Company</a>
                    <a href="{{ url('admin/information/customer_service') }}" class="dropdown-item">Customer
                        Service</a>
                    <a href="{{ url('admin/information/help_center') }}" class="dropdown-item">Help Center</a>
                    <a href="{{ url('admin/information/faq') }}" class="dropdown-item">FAQ</a>
                </div>
            </div>
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i
                        class="far fa-file-alt me-2"></i>Menu Pages</a>
                <div class="dropdown-menu bg-transparent border-0">
                    @forelse ($menus as $menu)
                        <a href="{{ url('admin/menu/page/' . $menu->slug) }}"
                            class="dropdown-item">{{ $menu->menu_name }}</a>
                    @empty
                    @endforelse
                </div>
            </div>
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i
                        class="fas fa-cog fa-spin me-2"></i>Web Settings</a>
                <div class="dropdown-menu bg-transparent border-0">
                    <a href="{{ route('admin.servicepackages.index') }}" class="dropdown-item">Service Package</a>
                    <a href="{{ route('admin.basicinfos.index') }}" class="dropdown-item">Basic Info</a>
                    <a href="{{ route('admin.paymenticons.index') }}" class="dropdown-item">Payment Icon</a>
                    <a href="{{ route('admin.policymenus.index') }}" class="dropdown-item">Policy Menu</a>
                </div>
            </div>
        </div>
    </nav>
</div>

 
