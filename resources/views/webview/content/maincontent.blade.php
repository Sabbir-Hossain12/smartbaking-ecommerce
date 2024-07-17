@extends('webview.master')

@section('maincontent')
    @section('title')
        {{ env('APP_NAME') }}-Best online shop in Bangladesh
    @endsection

    @section('meta')
        <meta name="description"
              content="Online shopping in Bangladesh for beauty products, men, women, kids, fashion items, clothes, electronics, home appliances, gadgets, watch, many more.">
        <meta name="keywords"
              content="smartbaking, online store bd, online shop bd, Organic fruits, Thai, UK, Korea, China, cosmetics, Jewellery, bags, dress, mobile, accessories, automation Products,">


        <meta itemprop="name" content="Best Online Shopping in Bangladesh | smartbaking">
        <meta itemprop="description"
              content="Best online shopping in Bangladesh for beauty products, men, women, kids, fashion items, clothes, electronics, home appliances, gadgets, watch, many more.">
        <meta itemprop="image" content="https://smartbaking.com/{{\App\Models\Basicinfo::first()->logo}}">

        <meta property="og:url" content="https://smartbaking.com/">
        <meta property="og:type" content="website">
        <meta property="og:title" content="Best Online Shopping in Bangladesh | smartbaking">
        <meta property="og:description"
              content="Online shopping in BD for beauty products, men, women, kids, fashion items, clothes, electronics, home appliances, gadgets, watch, many more.">
        <meta property="og:image" content="https://smartbaking.com/{{\App\Models\Basicinfo::first()->logo}}">
        <meta property="image" content="https://smartbaking.com/{{\App\Models\Basicinfo::first()->logo}}"/>
        <meta property="url" content="https://smartbaking.com/">
        <meta itemprop="image" content="https://smartbaking.com/{{\App\Models\Basicinfo::first()->logo}}">
        <meta property="twitter:card" content="https://smartbaking.com/{{\App\Models\Basicinfo::first()->logo}}"/>
        <meta property="twitter:title" content="Best Online Shopping in Bangladesh | smartbaking"/>
        <meta property="twitter:url" content="https://smartbaking.com/">
        <meta name="twitter:image" content="https://smartbaking.com/{{\App\Models\Basicinfo::first()->logo}}">
    @endsection
    <style>
        .product {
            margin-top: 4px !important;

        }

        #featureimagess {
            width: 100%;
            padding: 2px;
            padding-top: 0;
            max-height: 200px;
        }
    </style>
    {{--Nav--}}
    <div class="container-fluid" style="padding:0;background:#F27336">
        <div class="container">
            <div class="row" style="background:#F27336">
                <div class="col-lg-3 d-none d-lg-block sidebar pe-0 ps-0">
                    <div class="side-menu animate-dropdown">
                        <div class="head"><i class="icon fas fa-align-justify fa-fw"></i> Categories</div>
                    </div>
                </div>
                <div class="col-lg-9 col-12 ps-0 pe-0" id="mainslider">
                    <div class="col-lg-12 position-static order-2 order-lg-0 d-none d-lg-block"
                         style="background: #F27336;">
                        <div id="menu">
                            <ul>
                                <li><a href="{{ url('/') }}">Home</a></li>
                                <li><a href="{{ url('/combo-offer') }}">Combo Offer</a></li>
                                <li><a href="{{ url('/') }}">News Feed</a></li>
                                <li><a href="{{ url('/track-order') }}">Order Track</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    {{--Category--}}
    <div class="container mt-3 d-none d-lg-none d-xl-none d-md-none d-sm-block">
        <div class="row">


            @forelse ($categories as $category)
                <div class="col-xl-2 col-3 col-md-2 col-lg-2" style="">
                    <a href="{{ url('products/category/' . $category->slug) }}">
                        <div id="" class="d-flex flex-column  align-items-center ">
                            <div class="">
                                <img src="{{ asset($category->category_icon) }}" id="catimg">
                            </div>
                            <p id="catp">{{ $category->category_name }}</p>

                        </div>
                    </a>
                </div>
            @empty

            @endforelse

        </div>

    </div>

    {{--  Slider Section  --}}
    <div class="container">
        <div class="row bg-white">
{{--            <div class="col-lg-3 d-none d-lg-block sidebar pe-0 ps-0">--}}
{{--                <div class="side-menu animate-dropdown outer-bottom-xs">--}}
{{--                    <nav class="yamm megamenu-horizontal" role="navigation" style="padding-top: 6px;">--}}
{{--                        <ul class="nav m-0">--}}
{{--                            @forelse ($categories as $maincategory)--}}
{{--                                @if (count($maincategory->subcategories) > 0)--}}
{{--                                    <li class="dropdown menu-item">--}}
{{--                                        <a href="{{ url('products/category/' . $maincategory->slug) }}"--}}
{{--                                           class="dropdown-toggle" data-bs-hover="dropdown"> <img--}}
{{--                                                    src="{{ asset($maincategory->category_icon) }}"--}}
{{--                                                    alt="{{ $maincategory->category_name }}"--}}
{{--                                                    style="width: 22px !important;margin-top: -5px;">--}}
{{--                                            <span style="margin-left:6px">{{ $maincategory->category_name }}</span></a>--}}
{{--                                        <ul class="dropdown-menu mega-menu">--}}
{{--                                            <li class="yamm-content" style="padding-bottom: 5px;padding-top: 5px;">--}}
{{--                                                <ul class="links list-unstyled">--}}
{{--                                                    <div class="row">--}}
{{--                                                        @foreach ($maincategory->subcategories as $subcategory)--}}
{{--                                                            <div class="col-sm-12 col-md-4 pt-1 pb-1"--}}
{{--                                                                 id="subcategoryhover" style="width: 100%;">--}}
{{--                                                                <li>--}}
{{--                                                                    <a href="{{ url('products/sub/category/' . $subcategory->slug) }}"--}}
{{--                                                                       style="color:#666666">{{ $subcategory->sub_category_name }}</a>--}}
{{--                                                                </li>--}}
{{--                                                            </div>--}}
{{--                                                        @endforeach--}}
{{--                                                    </div>--}}
{{--                                                </ul>--}}
{{--                                                <!-- /.row -->--}}
{{--                                            </li>--}}
{{--                                            <!-- /.yamm-content -->--}}
{{--                                        </ul>--}}
{{--                                        <!-- /.dropdown-menu -->--}}
{{--                                    </li>--}}
{{--                                @else--}}
{{--                                    <li class="dropdown menu-item">--}}
{{--                                        <a href="{{ url('products/category/' . $maincategory->slug) }}"--}}
{{--                                           class="dropdown-toggle text-truncate" data-bs-hover="dropdown"><img--}}
{{--                                                    src="{{ asset($maincategory->category_icon) }}"--}}
{{--                                                    alt="{{ $maincategory->category_name }}"--}}
{{--                                                    style="width: 22px !important;margin-top: -5px;"><span--}}
{{--                                                    style="margin-left:6px">{{ $maincategory->category_name }}</span></a>--}}
{{--                                        <!-- /.dropdown-menu -->--}}
{{--                                    </li>--}}
{{--                                @endif--}}
{{--                            @empty--}}
{{--                            @endforelse--}}
{{--                        </ul>--}}
{{--                    </nav>--}}
{{--                </div>--}}
{{--            </div>--}}
            <div class="col-lg-12 col-12 ps-0 pe-0" id="mainslider">

                <div class="col-12">
                    <div class="owl-carousel owl-theme" id="slider">
                        @forelse ($sliders as $slider)
                            <div class="item" style="margin:0 !important;">
                                <img src="{{ asset($slider->slider_image) }}"
                                     alt="{{ $slider->slider_title }}">
                            </div>
                        @empty
                        @endforelse
                    </div>

                </div>
            </div>
        </div>
    </div>

    <!-- Banner and Add section -->
    <div class="container mb-lg-3 mb-2 mt-2">
        <div class="row gutters-10">
            @if (count($adds) == '2')
                @forelse ($adds as $add)
                    <div class="col-lg-6 col-6 ps-0">
                        <div class="media-banner mb-1 mb-lg-0">
                            <a href="{{ $add->add_link }}" target="_blank" class="banner-container">
                                <img src="{{ asset($add->add_image) }}" alt="{{ env('APP_NAME') }}"
                                     class="img-fluid ls-is-cached lazyloaded">
                            </a>
                        </div>
                    </div>
                @empty
                @endforelse
            @else
                @forelse ($adds as $add)
                    <div class="col-lg-12 col-12 ps-0">
                        <div class="media-banner mb-1 mb-lg-0">
                            <a href="{{ $add->add_link }}" target="_blank" class="banner-container">
                                <img src="{{ asset($add->add_image) }}" alt="{{ env('APP_NAME') }}"
                                     class="img-fluid ls-is-cached lazyloaded">
                            </a>
                        </div>
                    </div>
                @empty
                @endforelse
            @endif
        </div>
    </div>

    @if(count($featuredproducts)>0)
        <!-- Promotional Products -->
        <div class="container pt-0 pb-4">
            <div class="row bg-white pb-4">
                <div class="col-12"
                     style="border-bottom: 1px solid #F27336;padding-left: 0;display: flex;justify-content: space-between;">
                    <div class="px-2 p-md-3 pt-0 d-flex justify-content-between"
                         style="padding-bottom:4px !important;padding-top: 8px !important;">
                        <h4 class="m-0"><b>Featured Products</b></h4>
                    </div>
                    <a href="{{ url('featured/products') }}" class="btn btn-danger btn-sm mb-0"
                       style="padding: 2px;height: 26px;color: white;font-weight: bold;margin-top:9px;background:#F27336;border:1px solid #F27336">VIEW
                        ALL</a>
                </div>
                <div class="col-12">
                    <div class="owl-carousel " id="featuredProductSlide">
                        @forelse ($featuredproducts as $promotional)
                            <div class="item" id="featuredproduct">
                                <div class="products best-product">
                                    <div class="product">
                                        <div class="product-micro">
                                            <div class="row product-micro-row">
                                                <div class="col-12">
                                                    <div class="product-image" style="position: relative;">
                                                        <div class="image text-center">
                                                            <a href="{{ url('product/' . $promotional->ProductSlug) }}">
                                                                <img src="{{ asset($promotional->ViewProductImage) }}"
                                                                     alt="{{ $promotional->ProductName }}"
                                                                     id="featureimagess" style="height: 175px">
                                                            </a>
                                                        </div>
                                                        <span id="discountpart"> <span id="discountparttwo"> <p
                                                                        id="pdis">-{{ $promotional->Discount }}%</p> </span></span>
                                                    </div>
                                                    <!-- /.product-image -->
                                                </div>
                                                <!-- /.col -->
                                                <div class="col-12">
                                                    <div class="infofe p-md-3 p-2"
                                                         style="padding-bottom: 4px !important;">
                                                        <div class="product-info">
                                                            <h2 class="name text-truncate" id="f_name"><a
                                                                        href="{{ url('product/' . $promotional->ProductSlug) }}"
                                                                        id="f_pro_name">{{ $promotional->ProductName }}
                                                                    </a></h2>
                                                        </div>
                                                        <div class="price-box">
{{--                                                            <!--<del class="old-product-price strong-400">৳{{ round($promotional->ProductRegularPrice) }}</del>-->--}}
                                                            
                                                              @if(count($promotional->weights)>0)

                                                                <span
                                                                        class="product-price strong-600">৳{{ round($promotional->weights[0]->productSalePrice) }}</span>
                                                                  
                                                                  
                                                            @else
                                                                <span
                                                                        class="product-price strong-600">৳{{ round($promotional->ProductSalePrice) }}</span>
                                                            @endif
                                                                  
                                                        </div>
                                                    </div>
                                                    <form name="form" action="{{url('add-to-cart')}}" method="POST"
                                                          enctype="multipart/form-data"
                                                          style="width: 100%;float: left;text-align: center;">
                                                        @method('POST')
                                                        @csrf
                                                        <input type="text" name="color" id="product_colorold" hidden>
                                                        <input type="text" name="size" id="product_sizeold" hidden>
                                                        <input type="text" name="product_id"
                                                               value=" {{ $promotional->id }}"
                                                               hidden>
                                                        <input type="text" name="qty" value="1" id="qtyor" hidden>
                                                        <button class="btn btn-danger btn-sm mb-0 btn-block"
                                                                style="width: 100%;border-radius: 0%;" id="purcheseBtn">
                                                            অর্ডার করুন
                                                        </button>
                                                    </form>

                                                </div>
                                                <!-- /.col -->
                                            </div>
                                            <!-- /.product-micro-row -->
                                        </div>
                                        <!-- /.product-micro -->

                                    </div>
                                </div>
                            </div>
                        @empty
                        @endforelse
                    </div>
                </div>
            </div>
        </div>
    @else

    @endif

  

    @if(count($topproducts)>0)
        <!-- Promotional Products -->
        <div class="container pt-0 pb-4">
            <div class="row bg-white pb-4">
                <div class="col-12"
                     style="border-bottom: 1px solid #F27336;padding-left: 0;display: flex;justify-content: space-between;">
                    <div class="px-2 p-md-3 pt-0 d-flex justify-content-between"
                         style="padding-bottom:4px !important;padding-top: 8px !important;">
                        <h4 class="m-0"><b>Promotional Offers</b></h4>
                    </div>
                    <a href="{{ url('promotional/products') }}" class="btn btn-danger btn-sm mb-0"
                       style="padding: 2px;height: 26px;color: white;font-weight: bold;margin-top:9px;">VIEW ALL</a>
                </div>
                <div class="col-12">
                    <div class="owl-carousel " id="promotionalofferSlide">
                        @forelse ($topproducts as $promotionals)
                            <div class="item" id="featuredproduct">
                                <div class="products best-product">
                                    <div class="product">
                                        <div class="product-micro">
                                            <div class="row product-micro-row">
                                                <div class="col-12">
                                                    <div class="product-image" style="position: relative;">
                                                        <div class="image text-center">
                                                            <a href="{{ url('product/' . $promotionals->ProductSlug) }}">
                                                                <img src="{{ asset($promotionals->ViewProductImage) }}"
                                                                     alt="{{ $promotionals->ProductName }}"
                                                                     id="featureimagess">
                                                            </a>
                                                        </div>
                                                        <span id="discountpart"> <span id="discountparttwo"> <p
                                                                        id="pdis">-{{ $promotionals->Discount }}%</p> </span></span>
                                                    </div>
                                                    <!-- /.product-image -->
                                                </div>
                                                <!-- /.col -->
                                                <div class="col-12">
                                                    <div class="infofe p-md-3 p-2"
                                                         style="padding-bottom: 4px !important;">
                                                        <div class="product-info">
                                                            <h2 class="name text-truncate" id="f_name"><a
                                                                        href="{{ url('product/' . $promotionals->ProductSlug) }}"
                                                                        id="f_pro_name">{{ $promotionals->ProductName }}
                                                                    s</a></h2>
                                                        </div>
                                                        <div class="price-box">
                                                            <!--<del class="old-product-price strong-400">৳{{ round($promotionals->ProductRegularPrice) }}</del>-->
                                                            <span
                                                                    class="product-price strong-600">৳{{ round($promotionals->ProductSalePrice) }}</span>
                                                        </div>
                                                    </div>
                                                    <form name="form" action="{{url('add-to-cart')}}" method="POST"
                                                          enctype="multipart/form-data"
                                                          style="width: 100%;float: left;text-align: center;">
                                                        @method('POST')
                                                        @csrf
                                                        <input type="text" name="color" id="product_colorold" hidden>
                                                        <input type="text" name="size" id="product_sizeold" hidden>
                                                        <input type="text" name="product_id"
                                                               value=" {{ $promotionals->id }}"
                                                               hidden>
                                                        <input type="text" name="qty" value="1" id="qtyor" hidden>
                                                        <button class="btn btn-danger btn-sm mb-0 btn-block"
                                                                style="width: 100%;border-radius: 0%;" id="purcheseBtn">
                                                            অর্ডার করুন
                                                        </button>
                                                    </form>

                                                </div>
                                                <!-- /.col -->
                                            </div>
                                            <!-- /.product-micro-row -->
                                        </div>
                                        <!-- /.product-micro -->

                                    </div>
                                </div>
                            </div>
                        @empty
                        @endforelse
                    </div>
                </div>
            </div>
        </div>
    @else

    @endif

    @forelse ($categoryproducts as $key=>$categoryproduct)
        @if (count($categoryproduct->products) > 0)
            <!-- Category Products -->
            <div class="container pt-0 pb-4">
                <div class="row bg-white pb-0">
                    <div class="col-12"
                         style="border-bottom: 1px solid #F27336;padding-left: 0;display: flex;justify-content: space-between;">
                        <div class="px-2 p-md-3 pt-0 d-flex justify-content-between"
                             style="padding-bottom:4px !important;padding-top: 8px !important;">
                            <h4 class="m-0"><b>{{ $categoryproduct->category_name }}</b></h4>
                        </div>
                        <a href="{{url('products/category/'.$categoryproduct->slug)}}"
                           class="btn btn-danger btn-sm mb-0"
                           style="padding: 2px;height: 26px;color: white;font-weight: bold;margin-top:9px;background: #F27336;border: 1px solid #F27336;">VIEW
                            ALL</a>
                    </div>


                    @forelse ($categoryproduct->products->take(12) as $product)
                        <div class="col-6 col-md-4 col-lg-2 mb-4">
                            <div class="product">
                                <div class="product-micro">
                                    <div class="row product-micro-row">
                                        <div class="col-12">
                                            <div class="product-image" style="position: relative;">
                                                <div class="image text-center">
                                                    <a href="{{ url('product/' . $product->ProductSlug) }}">
                                                        <img src="{{ asset($product->ViewProductImage) }}"
                                                             alt="{{ $product->ProductName }}" id="featureimage">
                                                    </a>
                                                </div>
                                                <span id="discountpart"> <span id="discountparttwo"> <p id="pdis">-{{ $product->Discount }}%</p> </span></span>
                                                <!-- /.image -->
                                            </div>
                                            <!-- /.product-image -->
                                        </div>
                                        <!-- /.col -->
                                        <div class="col-12">
                                            <div class="infofe p-md-3 p-2"
                                                 style="border: 1px solid #e3e1e1;border-top:none;">
                                                <div class="product-info">
                                                    <h2 class="name text-truncate" id="f_name"><a
                                                                href="{{ url('product/' . $product->ProductSlug) }}"
                                                                id="f_pro_name">{{ $product->ProductName }}</a>
                                                    </h2>
                                                </div>
                                                <div class="price-box">
                                                    <del class="old-product-price strong-400">৳
                                                        {{ round($product->ProductRegularPrice) }}</del>
                                                    <span class="product-price strong-600">৳
                                                        {{ round($product->ProductSalePrice) }}</span>
                                                </div>

                                            </div>

                                            <form name="form" action="{{url('add-to-cart')}}" method="POST"
                                                  enctype="multipart/form-data"
                                                  style="width: 100%;float: left;text-align: center;">
                                                @method('POST')
                                                @csrf
                                                <input type="text" name="color" id="product_colorold" hidden>
                                                <input type="text" name="size" id="product_sizeold" hidden>
                                                <input type="text" name="product_id" value=" {{ $product->id }}"
                                                       hidden>
                                                <input type="text" name="qty" value="1" id="qtyor" hidden>
                                                <button class="btn btn-danger btn-sm mb-0 btn-block"
                                                        style="width: 100%;border-radius: 0%;" id="purcheseBtn">অর্ডার
                                                    করুন
                                                </button>
                                            </form>
                                        </div>
                                        <!-- /.col -->
                                    </div>
                                    <!-- /.product-micro-row -->
                                </div>

                                <!-- /.product-micro -->

                            </div>
                        </div>
                    @empty
                    @endforelse

                </div>
            </div>
            </div>
        @else
        @endif

    @empty
    @endforelse

@endsection
