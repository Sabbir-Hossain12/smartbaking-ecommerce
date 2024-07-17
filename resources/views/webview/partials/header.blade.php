<header class="header-style-1">

  
    <!-- ============================================== TOP MENU ============================================== -->
    <div class="top-barhead animate-dropdown" id="d-sm-none">
        <div class="container">
            <div class="header-top-inner">
                <div class="cnt-account">
                    <ul class="list-unstyled">  
                        @if (Auth::id())
                            <li><a href="{{ url('user/dashboard') }}"><i class="icon fas fa-user"></i>Dashboard</a></li>
                        @else
                            <li><a href="{{ url('login') }}">Sign In</a></li>
                            <li><a href="javascript:void(0);">|</a></li>
                            <li><a href="{{ url('register') }}">Sign Up</a></li>
                        @endif
                    </ul>
                </div> 
                <div class="cnt-account" style="float: left;">
                    <ul class="list-unstyled">   
                        <li><a href="tel:+88{{$basicinfo->phone_one}}"><i class="icon fas fa-phone"></i>Have any question? Call Us +88{{$basicinfo->phone_one}}</a></li> 
                    </ul>
                </div>
                <!-- /.cnt-cart -->
                <div class="clearfix"></div>
            </div>
            <!-- /.header-top-inner -->
        </div>
        <!-- /.container -->
    </div>
    <!-- /.header-top -->
    <!-- ============================================== TOP MENU : END ============================================== -->
    <div class="col-12" id="">
        <marquee behavior="" direction="" style="color:#818a91"> {{ $basicinfo->marquee_text }}</marquee>
    </div>
    
    <div class="main-header" id="myHeader" style="background: #fff;border-bottom: 1px solid #e9e9e9;">
        <div class="container">
            <div class="row" style="margin: 0">
                <div class="col-9 col-sm-9 col-md-9 col-lg-3 logo-holder ps-0">
                    <!-- ============================================================= LOGO ============================================================= -->
                    <div class="logo">
                        <button type="button" onclick="openNav()" id="menubutton" class="d-lg-none">
                            <img src="{{asset('public/menuooo.png')}}" style="width:40px">
                        </button>

                        <a href="{{ url('/') }}" id="logoimage">
                            <img src="{{ asset($basicinfo->logo) }}" alt="" id="logosm" style="width:58%">
                        </a>
                    </div>
                    <!-- /.logo -->
                    <!-- ============================================================= LOGO : END ============================================================= -->
                </div>
                <!-- /.logo-holder -->

                <div class="col-2 col-sm-2 col-md-2  col-lg-6 top-search-holder" id="d-sm-none">
                    <!-- /.contact-row -->
                    <!-- ============================================================= SEARCH AREA ============================================================= -->
                    <div class="search-area" id="d-sm-none">
                        <form method="GET" name="form" action="{{url('search')}}">
                            @csrf
                            <div class="control-group">

                                <input class="search-field" placeholder="Search here..." name="search">

                                <button class="search-button" type="submit"></button>

                            </div>
                        </form>
                    </div>
                    <!-- /.search-area -->
                    <!-- ============================================================= SEARCH AREA : END ============================================================= -->
                </div>
                <!-- /.top-search-holder -->

                <div class="col-3 col-sm-3 col-md-3  col-lg-3 animate-dropdown top-cart-row p-0">
                    <!-- ============================================================= SHOPPING CART DROPDOWN ============================================================= -->


                    <div class=" dropdown-cart" style="padding-left: 14px;">
                        <a href="#" class="dropdown" onclick="checkcart(this)" data-bs-toggle="dropdown"
                            id="smcarticon">
                            <div class="items-cart-inner">
                                <div class="basket" style="padding: 0;padding-top: 2px;display:flex;">
                                    <i class="fa-solid fa-basket-shopping" style="color: #F27336;font-size: 28px;"></i>
                                    <span class="d-none d-lg-block lbl"
                                        style="color: black;font-size: 13px;margin-top:13px">Cart</span>
                                </div>
                                <div class="nav-box-number" id="d-sm-none"><span
                                        class="count">{{ count(Cart::content()) }}</span></div>
                            </div>
                        </a>
                        <ul class="dropdown-menu">
                            <li id="checkcartview">
                            </li>
                        </ul>
                        <!-- /.dropdown-menu-->
                    </div>
                    <!-- /.dropdown-cart -->
 
                    <div class="d-none d-lg-inline-block" id="d-sm-none" style="float:right;padding-right: 15px;">
                        <div class="nav-wishlist-box" id="wishlist" style="    float: right;">
                            <a href="tel:09613100400" class="nav-box-link">
                                <i class="fa-solid fa-heart" id="bookmarkicon" style="color:#F27336"></i>  
                            </a>
                        </div>
                    </div>

                    <a type="button" class="search-button d-lg-none" data-bs-toggle="modal"
                        data-bs-target="#searchPopup" style="float: right;font-size: 23px; color: #b9b9b9;"
                        href="#" id="smsericon"> <i class="fas fa-search"
                            style="margin-top: 6px;margin-left: 7px;color:#F27336"></i></a>
                    <!-- ============================================================= SHOPPING CART DROPDOWN : END============================================================= -->
                </div>
                <!-- /.top-cart-row -->
            </div>
            <!-- /.row -->

        </div>
        <!-- /.container -->

    </div>


    <!-- side bar panel start -->
    <div id="mySidepanel" class="sidepanel d-lg-none">
        <div class="side-menu-header ">
            <div class="side-menu-close" onclick="closeNav()">
                <i class="fas fa-close"></i>
            </div>
            <div class="side-login px-3 pb-3" style="padding-top: 12px;padding-bottom: 15px; padding-left: 10px;">
                <a href=""></a>
                <a style="font-size: 16px" href="#">Categories</a>
            </div>
        </div>
        <ul class="level1-styles collapse show" id="id0">

            @forelse ($categories as $category)
                @if (count($category->subcategories) > 0)
                    <li>
                        <a href="{{ url('products/category/' . $category->slug) }}" class="collapsed"
                            data-bs-toggle="collapse"
                            data-bs-target="#id{{ $category->id }}">{{ $category->category_name }}<i
                                class="fas fa-plus" aria-hidden="true" id="plusicon"></i></a>
                        <ul class="collapse level2-styles" id="id{{ $category->id }}">
                            @foreach ($category->subcategories as $subcategory)
                                <li>
                                    <a
                                        href="{{ url('products/sub/category/' . $subcategory->slug) }}">{{ $subcategory->sub_category_name }}</a>
                                </li>
                            @endforeach
                        </ul>
                    </li>
                @else
                    <li>
                        <a
                            href="{{ url('products/category/' . $category->slug) }}">{{ $category->category_name }}</a>
                    </li>
                @endif
            @empty
            @endforelse
        </ul>
    </div>
    <!-- side bar panel end -->
</header>

<!-- Search Popup Modal -->
<div class="modal fade" id="searchPopup" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="border-radius: 0px !important">
            <div class="modal-body" style="padding: 0px;">
                <div class="modalsearch-area">
                    <div class="control-group d-flex justify-content-between">
                        <input class="search-field mb-0" id="modalsearchinput" onkeyup="searchproduct()"
                            placeholder="Search here...">
                        <a class="search-button" data-bs-dismiss="modal" href="#"></a>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <div id="searchproductlist" style="background: white;margin: 10px;height: auto;overflow: scroll;">

    </div>
</div>

<style>
    .modalsearch-area .search-field {
        border: medium none;
        padding: 10px;
        border-right: none;
        float: left;
    }

    .modalsearch-area .search-button {
        display: inline-block;
        float: left;
        margin-top: -1px;
        padding: 6px 15px 7px;
        text-align: center;
        background-color: #e62e04;
        border: 1px solid #e62e04;
    }

    .modalsearch-area .search-button:after {
        color: #fff;
        content: "\f00d";
        font-family: fontawesome;
        font-size: 24px;
        line-height: 9px;
        vertical-align: middle;
    }
</style>
