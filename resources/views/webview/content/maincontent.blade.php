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

        @media screen and (max-width: 480px) {
            .cat__bg .col-xs-3 {
                width: 20% !important;
            }
        }

        .col-xs-3 {
            width: 20%;
        }

        .cat__img {
            border-radius: 50%;
            margin-bottom: 5px;
        }

        /*   Featured Product */
        .image_thum {
            width: 183px;
            height: 183px;
        }

        .image_thum img {
            width: 100%;
            height: 100%;
            min-height: 140px;
            object-fit: contain;
        }

        .product__item {
            padding: 0;
            padding-top: 0px;
            background: #fee3e4;
        }

        @media screen and (max-width: 480px) {
            #productName374 {
                height: 18px;
            }
        }

        #productName374 {
            padding: 0;
            padding-bottom: 0px;
            display: block;
            line-height: 28px;
            color: #6E151C;
            font-size: 12px;
            height: 28px;
            overflow: hidden;
        }

        #productPrice374 {
            padding: 0;
            padding-bottom: 10px;
            display: block;
            height: 28px;
            line-height: 28px;
            color: #6E151C;
            font-size: 14px;
            font-weight: bold;
        }

        .product_form {
            padding: 0;
            display: block;
            height: 21px;
            font-size: 12px;
            font-weight: bold !important;
        }

        /*    Button*/
        button, input, select, textarea {
            font-family: inherit;
            font-size: inherit;
            line-height: inherit;
        }

        button, html input[type=button], input[type=reset], input[type=submit] {
            -webkit-appearance: button;
            cursor: pointer;
        }

        button, select {
            text-transform: none;
        }

        button {
            overflow: visible;
        }

        button, input, optgroup, select, textarea {
            margin: 0;
            font: inherit;
            color: inherit;
        }

        .col-xs-12 {
            width: 100%;
        }

    </style>
    {{--Nav--}}
    <div class="container-fluid mb-0 pb-0" style="padding:0;background:#F27336">
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
                                {{--                                <li><a href="{{ url('/') }}">Home</a></li>--}}
                                {{--                                <li><a href="{{ url('/combo-offer') }}">Combo Offer</a></li>--}}
                                {{--                                <li><a href="{{ url('/') }}">News Feed</a></li>--}}
                                {{--                                <li><a href="{{ url('/track-order') }}">Order Track</a></li>--}}

                                @foreach($navCategories as $navCategory)

                                    <li>
                                        <a href="{{  url('products/category/' . $navCategory->slug) }}">{{$navCategory->category_name}}</a>
                                    </li>
                                @endforeach
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    {{--Category--}}
    <div class="container d-none d-lg-none d-xl-none d-md-none d-sm-block">
        <div class="row">


            @forelse ($categories as $category)
                {{--                <div class="col-xl-2 col-3 col-md-2 col-lg-2" style="">--}}
                <div class="col-md-2 col-xs-3" style="margin-bottom:10px">
                    <a href="{{ url('products/category/' . $category->slug) }}">
                        <div id="" class="">
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
    <div class="container mt-1">
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


    {{--    Featured Products --}}
    @if(count($featuredproducts)>0)
        <!-- Featured Products -->
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
                <div class="col-12 mt-2">
                    <div class="owl-carousel " id="featuredProductSlide">
                        @forelse ($featuredproducts as $promotional)
                            <div class="col-sm-12 col-xs-12 padding-zero product-hover-effect pb-4"
                                 style="background-color: #fff;padding: 0px;border: 1px solid #c6c6c6;">
                                <a style="padding: 0px;overflow: hidden;"
                                   class="img-hover col-sm-12 padding-zero image_thum"
                                   href="{{ url('product/' . $promotional->ProductSlug) }}" id="374">
                                    <img class="img-fluid" style="margin: 0 auto;padding:5px; height: 175px"
                                         src="{{ asset($promotional->ViewProductImage) }}">
                                </a>
                                <div class="col-sm-12 col-xs-12 product__item" style="">
                                    <span id="productName374"
                                          class="col-sm-12 text-center">{{$promotional->ProductName}}</span>
                                    @if(count($promotional->weights)>0)

                                        <span id="productPrice374" class="col-sm-12  col-xs-12 text-center" style="">
                                                Tk. {{ round($promotional->weights[0]->productSalePrice) }}   </span>
                                    @else
                                        <span id="productPrice374" class="col-sm-12  col-xs-12 text-center" style="">
                                                Tk. {{round($promotional->ProductSalePrice)}}   </span>

                                    @endif

                                    <span class="col-sm-12  col-xs-12 text-center product_form" style="">
                                           
                                                <div class="btn col-xs-12 col-sm-12 col-md-12"
                                                     style="font-size: 21px;margin-bottom: 20px;background:#C50009;color:#fff">
                                                  
                                                    <form name="form" action="{{url('add-to-cart')}}" method="POST"
                                                          enctype="multipart/form-data"
                                                          style="width: 100%;float: left;text-align: center;">
                                                  @method('POST')
                                                        @csrf
                                                 <input type="text" name="color" id="product_colorold" hidden>
                                                 <input type="text" name="size" id="product_sizeold" hidden>
                                                        
                                                        @if(count($promotional->weights)>0)
                                                            <input type="text" name="weight" value="{{$promotional->weights[0]->weight_name}}" hidden>
                                                        @else
                                                        @endif
                                                
                                                 <input type="text" name="product_id" value=" {{ $promotional->id }}"
                                                        hidden>
                                                  @if(count($promotional->weights)>0)
                                                            <input type="text" name="productSalePrice"
                                                                   value="{{round($promotional->weights[0]->productSalePrice)}}"
                                                                   hidden="">
                                                        @else
                                                            <input type="text" name="productSalePrice"
                                                                   value="{{ round($promotional->ProductSalePrice) }}"
                                                                   hidden="">
                                                        @endif
                                                  <input type="text" name="qty" value="1" id="qtyor" hidden>
                                               <button class="add-to-cart p-0 m-0"
                                                       style="background-color:transparent;border:0px;font-size:14px; font-weight: 500;"
                                                       type="submit">
                                                                                                        Buy Now
                                               </button>
                                                                                                  
                                               </form>
                                                </div>
                                                </span>
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

{{--Promotional Products--}}
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
                <div class="col-12 mt-2">
                    <div class="owl-carousel " id="promotionalofferSlide">
                        @forelse ($topproducts as $promotional)
                            <div class="col-sm-12 col-xs-12 padding-zero product-hover-effect pb-4"
                                 style="background-color: #fff;padding: 0px;border: 1px solid #c6c6c6;">
                                <a style="padding: 0px;overflow: hidden;"
                                   class="img-hover col-sm-12 padding-zero image_thum"
                                   href="{{ url('product/' . $promotional->ProductSlug) }}" id="374">
                                    <img class="img-fluid" style="margin: 0 auto;padding:5px; height: 175px"
                                         src="{{ asset($promotional->ViewProductImage) }}">
                                </a>
                                <div class="col-sm-12 col-xs-12 product__item" style="">
                                    <span id="productName374"
                                          class="col-sm-12 text-center">{{$promotional->ProductName}}</span>
                                    @if(count($promotional->weights)>0)

                                        <span id="productPrice374" class="col-sm-12  col-xs-12 text-center" style="">
                                                Tk. {{ round($promotional->weights[0]->productSalePrice) }}   </span>
                                    @else
                                        <span id="productPrice374" class="col-sm-12  col-xs-12 text-center" style="">
                                                Tk. {{round($promotional->ProductSalePrice)}}   </span>

                                    @endif

                                    <span class="col-sm-12  col-xs-12 text-center product_form" style="">
                                           
                                                <div class="btn col-xs-12 col-sm-12 col-md-12"
                                                     style="font-size: 21px;margin-bottom: 20px;background:#C50009;color:#fff">
                                                  
                                                    <form name="form" action="{{url('add-to-cart')}}" method="POST"
                                                          enctype="multipart/form-data"
                                                          style="width: 100%;float: left;text-align: center;">
                                                  @method('POST')
                                                        @csrf
                                                 <input type="text" name="color" id="product_colorold" hidden>
                                                 <input type="text" name="size" id="product_sizeold" hidden>
                                                           @if(count($promotional->weights)>0)
                                                            <input type="text" name="weight" value="{{$promotional->weights[0]->weight_name}}" hidden>
                                                        @else
                                                        @endif
                                                 <input type="text" name="product_id" value=" {{ $promotional->id }}"
                                                        hidden>
                                                  @if(count($promotional->weights)>0)
                                                            <input type="text" name="productSalePrice"
                                                                   value="{{round($promotional->weights[0]->productSalePrice)}}"
                                                                   hidden="">
                                                        @else
                                                            <input type="text" name="productSalePrice"
                                                                   value="{{ round($promotional->ProductSalePrice) }}"
                                                                   hidden="">
                                                        @endif
                                                  <input type="text" name="qty" value="1" id="qtyor" hidden>
                                               <button class="add-to-cart p-0 m-0"
                                                       style="background-color:transparent;border:0px;font-size:14px; font-weight: 500;"
                                                       type="submit">
                                                                                                        Buy Now
                                               </button>
                                                                                                  
                                               </form>
                                                </div>
                                                </span>
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

{{--    @forelse ($categoryproduct->products->take(12) as $product)--}}
{{--    Category Products --}}
    
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


                    <div class="owl-carousel bestsellingproductSlide mt-2" >
                        @forelse ($categoryproduct->products->take(12) as $product)
                            <div class="col-sm-12 col-xs-12 padding-zero product-hover-effect pb-4"
                                 style="background-color: #fff;padding: 0px;border: 1px solid #c6c6c6;">
                                <a style="padding: 0px;overflow: hidden;"
                                   class="img-hover col-sm-12 padding-zero image_thum"
                                   href="{{ url('product/' . $product->ProductSlug) }}" id="374">
                                    <img class="img-fluid" style="margin: 0 auto;padding:5px; height: 175px"
                                         src="{{ asset($product->ViewProductImage) }}">
                                </a>
                                <div class="col-sm-12 col-xs-12 product__item" style="">
                                    <span id="productName374"
                                          class="col-sm-12 text-center">{{$product->ProductName}}</span>
                                    @if(count($product->weights)>0)

                                        <span id="productPrice374" class="col-sm-12  col-xs-12 text-center" style="">
                                                Tk. {{ round($product->weights[0]->productSalePrice) }}   </span>
                                    @else
                                        <span id="productPrice374" class="col-sm-12  col-xs-12 text-center" style="">
                                                Tk. {{round($product->ProductSalePrice)}}   </span>

                                    @endif

                                    <span class="col-sm-12  col-xs-12 text-center product_form" style="">
                                           
                                                <div class="btn col-xs-12 col-sm-12 col-md-12"
                                                     style="font-size: 21px;margin-bottom: 20px;background:#C50009;color:#fff">
                                                  
                                                    <form name="form" action="{{url('add-to-cart')}}" method="POST"
                                                          enctype="multipart/form-data"
                                                          style="width: 100%;float: left;text-align: center;">
                                                  @method('POST')
                                                        @csrf
                                                 <input type="text" name="color" id="product_colorold" hidden>
                                                 <input type="text" name="size" id="product_sizeold" hidden>
                                                        @if(count($product->weights)>0)
                                                            <input type="text" name="weight" value="{{$product->weights[0]->weight_name}}" hidden>
                                                        @else
                                                        @endif
                                                 <input type="text" name="product_id" value=" {{ $product->id }}"
                                                        hidden>
                                                  @if(count($product->weights)>0)
                                                            <input type="text" name="productSalePrice"
                                                                   value="{{round($product->weights[0]->productSalePrice)}}"
                                                                   hidden="">
                                                        @else
                                                            <input type="text" name="productSalePrice"
                                                                   value="{{ round($product->ProductSalePrice) }}"
                                                                   hidden="">
                                                        @endif
                                                  <input type="text" name="qty" value="1" id="qtyor" hidden>
                                               <button class="add-to-cart p-0 m-0"
                                                       style="background-color:transparent;border:0px;font-size:14px; font-weight: 500;"
                                                       type="submit">
                                                                                                        Buy Now
                                               </button>
                                                                                                  
                                               </form>
                                                </div>
                                                </span>
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
