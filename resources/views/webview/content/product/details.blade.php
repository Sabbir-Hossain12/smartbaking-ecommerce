@extends('webview.master')

@section('maincontent')
@section('title')
    {{ env('APP_NAME') }}-{{ $productdetails->ProductName }}
@endsection

@section('meta')
    <meta name="description" content="Online shopping in Bangladesh for beauty products, men, women, kids, fashion items, clothes, electronics, home appliances, gadgets, watch, many more.">
    <meta name="keywords" content="arishatex, online store bd, online shop bd, Organic fruits, Thai, UK, Korea, China, cosmetics, Jewellery, bags, dress, mobile, accessories, automation Products,">


    <meta itemprop="name" content="{{ $productdetails->ProductName }}">
    <meta itemprop="description" content="Best online shopping in Bangladesh for beauty products, men, women, kids, fashion items, clothes, electronics, home appliances, gadgets, watch, many more.">
    <meta itemprop="image" content="https://arishatex.com/{{ $productdetails->ProductImage }}">

    <meta property="og:url" content="https://arishatex.com/product/{{$productdetails->ProductSlug}}">
    <meta property="og:type" content="website">
    <meta property="og:title" content="{{ $productdetails->ProductName }}">
    <meta property="og:description" content="Online shopping in BD for beauty products, men, women, kids, fashion items, clothes, electronics, home appliances, gadgets, watch, many more.">
    <meta property="og:image" content="https://arishatex.com/{{ $productdetails->ProductImage }}">
    <meta property="image" content="https://arishatex.com/{{ $productdetails->ProductImage }}" />
    <meta property="url" content="https://arishatex.com/product/{{$productdetails->ProductSlug}}">
    <meta itemprop="image" content="https://arishatex.com/{{ $productdetails->ProductImage }}">
    <meta property="twitter:card" content="https://arishatex.com/{{ $productdetails->ProductImage }}" />
    <meta property="twitter:title" content="{{ $productdetails->ProductName }}" />
    <meta property="twitter:url" content="https://arishatex.com/product/{{$productdetails->ProductSlug}}">
    <meta name="twitter:image" content="https://arishatex.com/{{ $productdetails->ProductImage }}">
@endsection
<style>
    .sizetext {
        color: 000;
        background: #fff;
    }
    .colortext {
        color: #000;
        background: #fff;
    }

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

  #relatedCarousel  .col-xs-12 {
        width: 100%;
    }
    
    
</style>
<!-- Body -->

<div class="body-content mt-4" id="top-banner-and-menu">
    <div class='container'>
        <div class='row single-product'>
            <div class='col-md-12 p-0'>
                <div class="detail-block">
                    <div class="row  wow fadeInUp">

                        <div class="col-xs-12 col-sm-12 col-md-6 gallery-holder">
                            <div class="product-item-holder size-big single-product-gallery small-gallery">

                                @if (isset($productdetails->PostImage))
                                    <div id="sync1" class="owl-carousel owl-theme">
                                        <div class="items">
                                            <img class="w-100 h-100" src="{{ asset($productdetails->ProductImage) }}" alt="" style="border-radius: 4px;">
                                        </div>
                                        @forelse (json_decode($productdetails->PostImage) as $productImage)
                                            <div class="items">
                                                <img class="w-100 h-100"
                                                    src="{{ asset('public/images/product/slider/') }}/{{ $productImage }}" alt="" style="border-radius: 4px;">
                                            </div>
                                        @empty
                                        @endforelse
                                    </div>
                                    <div id="sync2" class="owl-carousel owl-theme" style="padding-top: 10px;">
                                        @forelse (json_decode($productdetails->PostImage) as $productImage)
                                            <div class="items">
                                                <img class="w-100 h-100" style="padding:10px;border:1px solid;border-radius: 4px;"
                                                    src="{{ asset('public/images/product/slider/') }}/{{ $productImage }}" alt="">
                                            </div>
                                        @empty
                                        @endforelse
                                    </div>
                                @else
                                    <div class="items">
                                        <img class="w-100 h-100" src="{{ asset($productdetails->ProductImage) }}" alt="" style="border-radius: 4px;">
                                    </div>
                                @endif

                            </div>
                            <!-- /.single-product-gallery -->
                        </div>
                        <!-- /.gallery-holder -->
                        <div class="col-sm-12 col-md-6 product-info-block" id="paddingnone">
                            <div class="product-info">
                                <h1 class="name"
                                    style="margin-top:16px !important;padding-bottom: 6px;border-bottom: 1px solid #dfd6d6;font-size: 20px !important; line-height: 22px;">
                                    {{ $productdetails->ProductName }}</h1>


                                <!-- /.rating-reviews -->

                                <div class="stock-container info-container m-t-10"
                                    style="margin-top:10px;border-bottom: 1px solid #dfd6d6;">
                                    <div class="row" style="margin-bottom:10px;">
                                        <div class="col-2 col-sm-2">
                                            <div class="product-description-label" id="productPricetitle">Price:</div>
                                        </div>
                                        <div class="col-9 col-sm-9">
                                            <div class="product-price strong-700" id="productPriceAmount">
                                                
                                                @if(count($productdetails->weights)>0)
                                                    
                                                <del id="pRegularPrice" style="font-size: 20px;color: red;" >৳{{round($productdetails->weights[0]->productRegularPrice)}}</del> &nbsp;&nbsp;
                                              <span id="pSalePrice">  ৳ {{ $productdetails->weights[0]->productSalePrice }} </span>
                                                    <input id="psprice" type="text" value="{{ $productdetails->weights[0]->productSalePrice }}" hidden/>
                                                @else
                                                    <del style="font-size: 20px;color: red;">৳{{round($productdetails->ProductRegularPrice)}}</del> &nbsp;&nbsp;
                                                    ৳ {{ round($productdetails->ProductSalePrice) }}

                                                @endif
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /.row -->
                                </div>
                                <!-- /.stock-container -->
                                <div class="quantity-container info-container"
                                    style="border-bottom: 1px solid #dfd6d6;">
                                    <div class="row">

                                        <div class="col-3 col-sm-3">
                                            <span class="label bg-none">Quantity :</span>
                                        </div>

                                        <div class="col-3 col-sm-3">
                                            <div class="cart-quantity">
                                                <div class="quant-input">

                                                    <input type="number" value="1" min="1">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-6 col-sm-6">

                                        </div>


                                    </div>
                                    <!-- /.row -->
                                </div>
                                <div class="row mb-2 mt-2">
                                    @if (empty($productdetails->color))
                                    @else
                                        <div class="col-12 col-md-12 colorpart mb-2">
                                            <div class="d-flex">
                                                <h4 id="resellerprice" class="m-0"><b style="font-size:20px">কালার:&nbsp;&nbsp;&nbsp;</b></h4>
                                                <div class="colorinfo">
                                                    @forelse (json_decode($productdetails->color) as $color)
                                                        <input type="radio" class="m-0" id="color{{ $color }}" hidden name="color" onclick="getcolor('{{ $color }}')">
                                                        <label class="colortext ms-0" id="colortext{{ $color }}" for="color{{ $color }}" style="border: 1px solid #613EEA;font-size:20px;font-weight:bold;padding: 0px 12px;border-radius: 4px;" onclick="getcolor('{{ $color }}')">{{ $color }}</label>
                                                    @empty
                                                    @endforelse
                                                </div>
                                            </div>
                                        </div>
                                    @endif
                                    @if (empty($productdetails->size))
                                    @else
                                        <div class="col-12 col-md-12 colorpart">
                                            <div class="d-flex">
                                                <h4 id="resellerprice" class="m-0"><b style="font-size:20px">সাইজ: &nbsp;&nbsp;&nbsp;</b></h4>
                                                <div class="sizeinfo">
                                                    @forelse (json_decode($productdetails->size) as $size)
                                                        <input type="radio" class="m-0" hidden id="size{{ $size }}" name="size" onclick="getsize('{{ $size }}')">
                                                        <label class="sizetext ms-0" id="sizetext{{ $size }}" for="size{{ $size }}" style="border: 1px solid #613EEA;font-size:20px;font-weight:bold;padding: 0px 12px;border-radius: 4px;" onclick="getsize('{{ $size }}')">{{ $size }}</label>
                                                    @empty
                                                    @endforelse
                                                </div>
                                            </div>
                                        </div>
                                    @endif

                                {{--  Weight Field   --}}
                                        @if (count($productdetails->weights)>0)

                                            <div class="col-12 col-md-12 colorpart mt-2">
                                                <div class="d-flex">
                                                    <h4 id="resellerprice" class="m-0"><b style="font-size:20px">ওজন: &nbsp;&nbsp;&nbsp;</b></h4>
                                                    <div class="weightinfo">
                                                        @forelse ($productdetails->weights as $weight)
                                                            <input type="radio" class="m-0" hidden id="sizeWeight{{ $weight->weight_name }}" name="weight" onclick="getWeight('{{ $weight->weight_name }}')"/>
                                                            <label class="weighttext ms-0" id="weightText{{ $weight->weight_name }}" for="sizeWeight{{ $weight->weight_name }}" style="border: 1px solid #613EEA;font-size:20px;font-weight:bold;padding: 0px 12px;border-radius: 4px;">{{ $weight->weight_name }}</label>
                                                        @empty
                                                        @endforelse
                                                    </div>
                                                </div>
                                            </div>
                                        @else
                                    
                                        @endif
                                </div>
                                <!-- /.stock-container -->
                                <div class="quantity-container info-container text-center"
                                    style="width: 100%;border-bottom: 1px solid #dfd6d6; float: left;">



                                    <form name="form" id="AddToCartForm" method="POST" enctype="multipart/form-data"
                                        style="width: 50%;float: left;text-align: center;">
                                        @method('POST')
                                        @csrf
                                        <input type="text" name="color" id="product_color" hidden>
                                        <input type="text" name="size" id="product_size" hidden>
                                        <input type="text" name="weight" id="product_weight" hidden>
                                        <input type="text" id="pID" name="product_id" value="{{ $productdetails->id }}" hidden>

                                        @if(count($productdetails->weights)>0)
                                            <input type="text" name="productSalePrice" id="cartProductPrice" value="{{ $productdetails->weights[0]->productSalePrice }}" hidden>
                                        @else
                                            <input type="text" name="productSalePrice" id="cartProductPrice" value="{{ $productdetails->ProductSalePrice }}" hidden>

                                        @endif
                                        
                                        <input type="text" name="qty" value="1" id="qtyor" hidden>
                                        <button type="submit"
                                            class=" mb-0  ml-2 btn btn-styled btn-base-1 btn-icon-left strong-700 hov-bounce hov-shaddow buy-now" style="background:#F27336;color:white;width: 95%;font-size: 17px;">
                                            কার্টে যোগ করুন
                                        </button>
                                    </form>
                                    
                                    <form name="form" action="{{url('add-to-cart')}}" method="POST" enctype="multipart/form-data"
                                        style="width: 50%;float: left;text-align: center;">
                                        @method('POST')
                                        @csrf
                                        <input type="text" name="color" id="product_colorOr" hidden>
                                        <input type="text" name="size" id="product_sizeOr" hidden>
                                        @if(count($productdetails->weights)>0) 
                                        <input type="text" name="weight" id="product_weightOr" value="{{$productdetails->weights[0]->weight_name}}" hidden>
                                        @else

                                        @endif
                                        <input type="text" name="product_id" value=" {{ $productdetails->id }}"
                                            hidden>
                                        
                                        @if(count($productdetails->weights)>0)
                                            <input type="text" name="productSalePrice" id="orderProductPrice" value="{{ $productdetails->weights[0]->productSalePrice }}" hidden>
                                        @else
                                            <input type="text" name="productSalePrice" id="orderProductPrice" value="{{ $productdetails->ProductSalePrice }}" hidden>

                                        @endif
                                        <input type="text" name="qty" value="1" id="qtyor" hidden>
                                        <button type="submit"
                                            class=" mb-0  ml-2 btn btn-styled btn-base-1 btn-icon-left strong-700 hov-bounce hov-shaddow buy-now" style="background:green;color:white;width: 95%;font-size: 17px;">
                                            অর্ডার করুন
                                        </button>
                                    </form>

                                    <!-- /.row -->
                                </div>

                                <div class="quantity-container info-container text-center"
                                    style="border-bottom: 1px solid #dfd6d6;">
                                    <div class="row no-gutters pt-2">
                                        <div class="col-2 col-sm-2" style="margin-top: -2px;">
                                            <div class="product-description-label mt-2">Charge:</div>
                                        </div>
                                        <div class="col-10 col-sm-10">
                                            <div class="product-description-label"
                                                style="font-size: 13px;text-align: left;color: gray;">
                                                <i class="fas fa-dot-circle " style="padding-right: 4px;"></i>ঢাকা
                                                সিটির মধ্যে ডেলিভারি চার্জ
                                                {{ $numto->bnNum($shipping->inside_dhaka_charge) }}
                                                টাকা<br>
                                                <i class="fas fa-dot-circle" style="padding-right: 4px;"></i>ঢাকা
                                                সিটির বাইরে ডেলিভারি চার্জ
                                                {{ $numto->bnNum($shipping->outside_dhaka_charge) }} টাকা
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                 <div class="quantity-container info-container text-center"
                                    style="border-bottom: 1px solid #dfd6d6;">
                                    <div class="row no-gutters pt-2">
                                        <div class="col-12 col-md-12 mb-2">
                                            <a class="btn btn-success" id="formText" href="tel:{{App\Models\Basicinfo::first()->phone_one}}" style="width: 85%;font-size: 22px; "> কল করুন {{App\Models\Basicinfo::first()->phone_one}}</a>
                                        </div>
                                         
                                    </div>
                                </div>

                            </div>
                            <!-- /.product-info -->
                        </div> 
                        <!-- /.col-sm-7 -->
                    </div>
                    <!-- /.row -->
                </div>
            </div>
            <!-- /.col -->
            <div class="clearfix"></div>
        </div>
        <div class="row single-product">
            <div class="col-md-12 p-0">
                <div class="product-tabs inner-bottom-xs  wow fadeInUp">
                    <div class="row">
                        <div class="col-sm-12">
                            <ul id="product-tabs" class="nav nav-tabs nav-tab-cell" style="display: inline-flex;">
                                <li class="active"><a data-bs-toggle="tab" id="istteb"
                                        href="#description">DESCRIPTION</a></li>
                                <li><a data-bs-toggle="tab" href="#review">REVIEW</a></li>
                                <li class="d-lg-none"><a data-bs-toggle="tab" href="#shipping-info">SHIPPING INFO</a>
                                </li>
                            </ul>
                            <!-- /.nav-tabs #product-tabs -->
                        </div>
                        <div class="col-sm-12">

                            <div class="tab-content">

                                <div id="description" class="tab-pane active">
                                    <div class="product-tab">
                                        <p class="text">{!! $productdetails->ProductDetails !!}</p>
                                        @if (isset($productdetails->youtube_embade))
                                            <br>
                                            <div class="card">
                                                <div class="card-body">
                                                    <iframe width="100%" height="315"
                                                        src="https://www.youtube.com/embed/{{ $productdetails->youtube_embade }}">
                                                    </iframe>
                                                </div>
                                            </div>
                                        @else

                                        @endif
                                    </div>
                                </div>
                                <!-- /.tab-pane -->

                                <div id="review" class="tab-pane">
                                    <div class="product-tab">

                                        <div class="product-reviews">

                                            <div class="row">
                                                <div class="review">

                                                </div>

                                            </div>
                                            <!-- /.reviews -->
                                        </div>

                                    </div>
                                    <!-- /.product-tab -->
                                </div>
                                <!-- /.tab-pane -->

                                <div id="shipping-info" class="tab-pane">
                                    <div class="product-tag">

                                        <div class="row">
                                            <div class='p-0 col-sm-12 col-md-3 product-info-block d-lg-none'
                                                style="padding: 0;">
                                                <div class="row no-gutters mt-2 ">
                                                    <div class="col-1 col-sm-1">
                                                        <i class="fas fa-phone" aria-hidden="true"
                                                            style="font-size: 18px;color: #8a8686;"></i>
                                                    </div>
                                                    <div class="col-5 col-sm-5">
                                                        <div class="product-description-label" id="textsize">
                                                            Contact Us:</div>
                                                    </div>
                                                    <div class="col-5 col-sm-5" id="textsize">
                                                        <a href="tel:" target="_blank" id="textsize">
                                                            {{ $shipping->contact }}
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="row no-gutters mt-2">
                                                    <div class="col-1 col-sm-1">
                                                        <i class="fas fa-motorcycle" aria-hidden="true"
                                                            style="font-size: 16px;col-smor: #8a8686;"></i>
                                                    </div>
                                                    <div class="col-5 col-sm-5 pe-0">
                                                        <div class="product-description-label" id="textsize">

                                                            Inside Dhaka:</div>
                                                    </div>
                                                    <div class="col-5 col-sm-5" id="textsize">
                                                        {{ $shipping->insie_dhaka }}
                                                    </div>
                                                </div>
                                                <div class="row no-gutters mt-2">
                                                    <div class="col-1 col-sm-1">
                                                        <i class="fas fa-truck" aria-hidden="true"
                                                            style="font-size: 18px;col-smor: #8a8686;"></i>
                                                    </div>
                                                    <div class="col-5 col-sm-5">
                                                        <div class="product-description-label" id="textsize">

                                                            Outside Dhaka:</div>
                                                    </div>
                                                    <div class="col-5 col-sm-5" id="textsize">
                                                        {{ $shipping->outside_dhaka }}

                                                    </div>
                                                </div>
                                                <div class="row no-gutters mt-2">
                                                    <div class="col-1 col-sm-1">
                                                        <i class="fas fa-money-bill-alt" aria-hidden="true"
                                                            style="font-size: 18px;col-smor: #8a8686;"></i>
                                                    </div>

                                                    <div class="col-5 col-sm-5">
                                                        <div class="product-description-label" id="textsize"> Cash on
                                                            Delivery :</div>
                                                    </div>
                                                    <div class="col-5 col-sm-5" id="textsize">
                                                        @if ($shipping->cash_on_delivery == 'ON')
                                                            Available
                                                        @else
                                                            Unavailable
                                                        @endif
                                                    </div>

                                                </div>
                                                <div class="row no-gutters mt-2">
                                                    <div class="col-1 col-sm-1">
                                                        <i class="fas fa-refresh" aria-hidden="true"
                                                            style="font-size: 18px;col-smor: #8a8686;"></i>
                                                    </div>
                                                    <div class="col-5 col-sm-5">
                                                        <div class="product-description-label" id="textsize">Refund
                                                            Rules:</div>
                                                    </div>
                                                    <div class="col-5 col-sm-5" id="textsize">
                                                        {{ $shipping->refund_rule }}<a
                                                            href="#" class="ml-2"
                                                            target="_blank">View Policy</a>
                                                    </div>
                                                </div>
                                                <div class="row no-gutters mt-2">
                                                    <div class="col-2 col-sm-2" id="textsize">
                                                        <div class="product-description-label pt-2"
                                                            style="padding-top: 14px;">Payment:</div>
                                                    </div>
                                                    <div class="col-10 col-sm-10">
                                                        <ul class="inline-links">
                                                            <li>
                                                                <img src="{{ asset('public/webview/assets/images/Payment-Methods.gif') }}"
                                                                    width="98%" class=" ">
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <!-- /.product-tab -->
                                </div>
                                <!-- /.tab-pane -->

                            </div>
                            <!-- /.tab-content -->
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.product-tabs -->

                <!-- ============================================== UPSELL PRODUCTS ============================================== -->
                <section class="pb-2 section featured-product wow fadeInUp" style="margin-bottom:0px !important">
                    <h3 class="section-title" style="border-bottom: 1px solid #e62e04;    padding: 8px;margin-bottom: 0;">Related
                        products</h3>
                    <div class="owl-carousel related-owl-carousel featured-carousel owl-theme outer-top-xs"
                        id="relatedCarousel">
                        @forelse ($relatedproducts as $relatedproduct)
                            <div class="col-sm-12 col-xs-12 padding-zero product-hover-effect pb-4"
                                 style="background-color: #fff;padding: 0px;border: 1px solid #c6c6c6;">
                                <a style="padding: 0px;overflow: hidden;"
                                   class="img-hover col-sm-12 padding-zero image_thum"
                                   href="{{ url('product/' . $relatedproduct->ProductSlug) }}" id="374">
                                    <img class="img-fluid" style="margin: 0 auto;padding:5px; height: 175px"
                                         src="{{ asset($relatedproduct->ViewProductImage) }}">
                                </a>
                                <div class="col-sm-12 col-xs-12 product__item" style="">
                                    <span id="productName374"
                                          class="col-sm-12 text-center">{{$relatedproduct->ProductName}}</span>
                                    @if(count($relatedproduct->weights)>0)

                                        <span id="productPrice374" class="col-sm-12  col-xs-12 text-center" style="">
                                                Tk. {{ round($relatedproduct->weights[0]->productSalePrice) }}   </span>
                                    @else
                                        <span id="productPrice374" class="col-sm-12  col-xs-12 text-center" style="">
                                                Tk. {{$relatedproduct->ProductSalePrice}}   </span>

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
                                              
                                                        @if(count($relatedproduct->weights)>0)
                                                            <input type="text" name="weight" value="{{$relatedproduct->weights[0]->weight_name}}"  hidden>
                                                        @else
                                                            
                                                        @endif
                                                        
                                                 <input type="text" name="product_id" value=" {{ $relatedproduct->id }}"
                                                        hidden>
                                                  @if(count($relatedproduct->weights)>0)
                                                            <input type="text" name="productSalePrice"
                                                                   value="{{round($relatedproduct->weights[0]->productSalePrice)}}"
                                                                   hidden="">
                                                        @else
                                                            <input type="text" name="productSalePrice"
                                                                   value="{{ round($relatedproduct->ProductSalePrice) }}"
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
                    <!-- /.home-owl-carousel -->
                </section>
                <!-- ============================================== UPSELL PRODUCTS : END ============================================== -->

            </div>
        </div>
        <!-- ============================================== BRANDS CAROUSEL : END ============================================== -->
    </div>
    <!-- /.container -->
</div>
<!-- /.body-content -->

{{--<div class="container mt-4">--}}

{{--    <div class="row">--}}
{{--        <div class="col-sm-12 p-0">--}}
{{--            <section class="pb-2 section featured-product wow fadeInUp">--}}
{{--                <div class="col-12" style="border-bottom: 1px solid #e62e04;padding-left: 0;display: flex;justify-content: space-between;">--}}
{{--                    <div class="px-2 p-md-3 pt-0 d-flex justify-content-between" style="padding-bottom:4px !important;padding-top: 8px !important;">--}}
{{--                        <h4 class="m-0"><b>Promotional Offers</b></h4>--}}
{{--                    </div>--}}
{{--                    <a href="{{ url('promotional/products') }}" class="btn btn-danger btn-sm mb-0" style="padding: 2px;height: 26px;color: white;font-weight: bold;margin-top:9px;">VIEW ALL</a>--}}
{{--                </div>--}}
{{--                <div class="owl-carousel " id="promotionalofferSlide">--}}
{{--                    @forelse ($topproducts as $promotional)--}}
{{--                        <div class="col-sm-12 col-xs-12 padding-zero product-hover-effect pb-4"--}}
{{--                             style="background-color: #fff;padding: 0px;border: 1px solid #c6c6c6;">--}}
{{--                            <a style="padding: 0px;overflow: hidden;"--}}
{{--                               class="img-hover col-sm-12 padding-zero image_thum"--}}
{{--                               href="{{ url('product/' . $promotional->ProductSlug) }}" id="374">--}}
{{--                                <img class="img-fluid" style="margin: 0 auto;padding:5px; height: 175px"--}}
{{--                                     src="{{ asset($promotional->ViewProductImage) }}">--}}
{{--                            </a>--}}
{{--                            <div class="col-sm-12 col-xs-12 product__item" style="">--}}
{{--                                    <span id="productName374"--}}
{{--                                          class="col-sm-12 text-center">{{$promotional->ProductName}}</span>--}}
{{--                                @if(count($promotional->weights)>0)--}}

{{--                                    <span id="productPrice374" class="col-sm-12  col-xs-12 text-center" style="">--}}
{{--                                                Tk. {{ round($promotional->weights[0]->productSalePrice) }}   </span>--}}
{{--                                @else--}}
{{--                                    <span id="productPrice374" class="col-sm-12  col-xs-12 text-center" style="">--}}
{{--                                                Tk. {{$promotional->ProductSalePrice}}   </span>--}}

{{--                                @endif--}}

{{--                                <span class="col-sm-12  col-xs-12 text-center product_form" style="">--}}
{{--                                           --}}
{{--                                                <div class="btn col-xs-12 col-sm-12 col-md-12"--}}
{{--                                                     style="font-size: 21px;margin-bottom: 20px;background:#C50009;color:#fff">--}}
{{--                                                  --}}
{{--                                                    <form name="form" action="{{url('add-to-cart')}}" method="POST"--}}
{{--                                                          enctype="multipart/form-data"--}}
{{--                                                          style="width: 100%;float: left;text-align: center;">--}}
{{--                                                  @method('POST')--}}
{{--                                                        @csrf--}}
{{--                                                 <input type="text" name="color" id="product_colorold" hidden>--}}
{{--                                                 <input type="text" name="size" id="product_sizeold" hidden>--}}
{{--                                              --}}
{{--                                                        @if(count($promotional->weights)>0)--}}
{{--                                                            <input type="text" name="weight" value="{{$promotional->weights[0]->weight_name}}"  hidden>--}}
{{--                                                        @else--}}

{{--                                                        @endif--}}
{{--                                                        --}}
{{--                                                 <input type="text" name="product_id" value=" {{ $promotional->id }}"--}}
{{--                                                        hidden>--}}
{{--                                                  @if(count($promotional->weights)>0)--}}
{{--                                                            <input type="text" name="productSalePrice"--}}
{{--                                                                   value="{{round($promotional->weights[0]->productSalePrice)}}"--}}
{{--                                                                   hidden="">--}}
{{--                                                        @else--}}
{{--                                                            <input type="text" name="productSalePrice"--}}
{{--                                                                   value="{{ round($promotional->ProductSalePrice) }}"--}}
{{--                                                                   hidden="">--}}
{{--                                                        @endif--}}
{{--                                                  <input type="text" name="qty" value="1" id="qtyor" hidden>--}}
{{--                                               <button class="add-to-cart p-0 m-0"--}}
{{--                                                       style="background-color:transparent;border:0px;font-size:14px; font-weight: 500;"--}}
{{--                                                       type="submit">--}}
{{--                                                                                                        Buy Now--}}
{{--                                               </button>--}}
{{--                                                                                                  --}}
{{--                                               </form>--}}
{{--                                                </div>--}}
{{--                                                </span>--}}
{{--                            </div>--}}
{{--                        </div>--}}
{{--                    @empty--}}
{{--                    @endforelse--}}
{{--                </div>--}}
{{--                <!-- /.home-owl-carousel -->--}}
{{--            </section>--}}
{{--        </div>--}}
{{--    </div>--}}

{{--</div>--}}
<!-- Body end -->


{{-- modal for process and cart --}}




{{-- csrf --}}
<input type="hidden" name="_token" value="{{ csrf_token() }}" />

<script>
    $(document).ready(function() {

        var sync1 = $("#sync1");
        var sync2 = $("#sync2");
        var slidesPerPage = 4; //globaly define number of elements per page
        var syncedSecondary = true;

        sync1.owlCarousel({
            items: 1,
            slideSpeed: 2000,
            autoplay: true,
            dots: false,
            loop: true,
            responsiveRefreshRate: 200,
            navText: [
                '<svg width="100%" height="100%" viewBox="0 0 11 20"><path style="fill:none;stroke-width: 1px;stroke: #000;" d="M9.554,1.001l-8.607,8.607l8.607,8.606"/></svg>',
                '<svg width="100%" height="100%" viewBox="0 0 11 20" version="1.1"><path style="fill:none;stroke-width: 1px;stroke: #000;" d="M1.054,18.214l8.606,-8.606l-8.606,-8.607"/></svg>'
            ],
        }).on('changed.owl.carousel', syncPosition);

        sync2
            .on('initialized.owl.carousel', function() {
                sync2.find(".owl-item").eq(0).addClass("current");
            })
            .owlCarousel({
                margin:6,
                items: slidesPerPage,
                dots: false,
                nav: true,
                smartSpeed: 200,
                slideSpeed: 500,
                slideBy: slidesPerPage, //alternatively you can slide by 1, this way the active slide will stick to the first item in the second carousel
                responsiveRefreshRate: 100
            }).on('changed.owl.carousel', syncPosition2);

        function syncPosition(el) {
            //if you set loop to false, you have to restore this next line
            //var current = el.item.index;

            //if you disable loop you have to comment this block
            var count = el.item.count - 1;
            var current = Math.round(el.item.index - (el.item.count / 2) - .5);

            if (current < 0) {
                current = count;
            }
            if (current > count) {
                current = 0;
            }

            //end block

            sync2
                .find(".owl-item")
                .removeClass("current")
                .eq(current)
                .addClass("current");
            var onscreen = sync2.find('.owl-item.active').length - 1;
            var start = sync2.find('.owl-item.active').first().index();
            var end = sync2.find('.owl-item.active').last().index();

            if (current > end) {
                sync2.data('owl.carousel').to(current, 100, true);
            }
            if (current < start) {
                sync2.data('owl.carousel').to(current - onscreen, 100, true);
            }
        }

        function syncPosition2(el) {
            if (syncedSecondary) {
                var number = el.item.index;
                sync1.data('owl.carousel').to(number, 100, true);
            }
        }

        sync2.on("click", ".owl-item", function(e) {
            e.preventDefault();
            var number = $(this).index();
            sync1.data('owl.carousel').to(number, 300, true);
        });


        $('#AddToCartForm').submit(function(e) {
            e.preventDefault();
            $('#processing').css({
                'display': 'flex',
                'justify-content': 'center',
                'align-items': 'center'
            })
            $('#processing').modal('show');
            $.ajax({
                type: 'POST',
                url: '{{ url('add-to-cart') }}',
                processData: false,
                contentType: false,
                data: new FormData(this),

                success: function(data) {
                    updatecart();
                    $.ajax({
                        type: 'GET',
                        url: '{{ url('get-cart-content') }}',

                        success: function(response) {
                            $('#cartViewModal .modal-body').empty().append(
                                response);
                        },
                        error: function(error) {
                            console.log('error');
                        }
                    });
                    $('#processing').modal('hide');
                    $('#cartViewModal').modal('show');
                },
                error: function(error) {
                    console.log('error');
                }
            });
        });

        $('#OrderNow').submit(function(e) {
            e.preventDefault();
            $('#processing').css({
                'display': 'flex',
                'justify-content': 'center',
                'align-items': 'center'
            })
            $('#processing').modal('show');
            $.ajax({
                type: 'POST',
                url: '{{ url('add-to-cart') }}',
                processData: false,
                contentType: false,
                data: new FormData(this),

                success: function(data) {
                    updatecart();
                    if (data == 'success') {
                        window.location.href = 'https://arishatex.com/checkout';
                        $('#processing').modal('hide');
                    }
                },
                error: function(error) {
                    console.log('error');
                }
            });
        });


        // document.getElementById("istteb").click();
        $('#owl-single-product').owlCarousel({
            items: 1,
            itemsTablet: [768, 1],
            itemsDesktop: [1199, 1],
            autoplay: true,
            loop:true,
            autoplayTimeout: 1000,
            autoplayHoverPause: true,
            responsiveClass: true,
            dots: true,

        });
        $('#relatedCarousel').owlCarousel({
            loop: true,
            margin: 10,
            autoplay: true,
            autoplayTimeout: 1000,
            autoplayHoverPause: true,
            responsiveClass: true,
            nav: true,
            dots: false,
            responsive: {
                0: {
                    items: 3,
                },
                600: {
                    items: 3,
                },
                1000: {
                    items: 6,
                }
            }
        });
        $('#featuredCarousel').owlCarousel({
            loop: true,
            margin: 10,
            autoplay: true,
            autoplayTimeout: 1000,
            autoplayHoverPause: true,
            responsiveClass: true,
            nav: true,
            dots: false,
            responsive: {
                0: {
                    items: 2,
                },
                600: {
                    items: 2,
                },
                1000: {
                    items: 6,
                }
            }
        });

        $('#BestSelling').owlCarousel({
            loop: true,
            margin: 10,
            autoplay: true,
            autoplayTimeout: 1000,
            autoplayHoverPause: true,
            responsiveClass: true,
            dots: false,
            nav: true,
            responsive: {
                0: {
                    items: 2,
                },
                600: {
                    items: 2,
                },
                1000: {
                    items: 6,
                }
            }
        });





    });

    function getcolor(color) {
        $('#product_color').val(color);

        $('#product_colorOr').val(color);
        
        $('.colortext').css('color','#000');
        $('.colortext').css('background','#fff');
        $('#colortext'+color).css('color','#fff');
        $('#colortext'+color).css('background','#613EEA');
    }

    function getsize(size) {
        $('#product_size').val(size);
        $('#product_sizeOr').val(size);
        
        $('.sizetext').css('color','#000');
        $('.sizetext').css('background','#fff');
        $('#sizetext'+size).css('color','#fff');
        $('#sizetext'+size).css('background','#613EEA');
    }

    function encodeID(id) {
        return id.replace(/[^a-zA-Z0-9]/g, '_');
    }
    
    function getWeight(weight) {
        // console.log(weight);

        var encodeWeight=encodeID(weight);
        $.ajax({
            type: 'GET',
            url: '{{ url('/get/price-by-weight') }}',
            data: {
                _token: token,
                product_id: $('#pID').val(),
                weight_name: weight
            },

            success: function(res) {
                // console.log(weight);
                $('#pSalePrice').text('৳ ' + res.productSalePrice);
                $('#pRegularPrice').text('৳ ' + res.productRegularPrice);

                $('#orderProductPrice').val(res.productSalePrice);
                $('#cartProductPrice').val(res.productSalePrice);
                
                $('#product_weight').val(weight);
                $('#product_weightOr').val(weight);
                
                $('.weighttext').css('color','#000');
                $('.weighttext').css('background','#fff');

                $('#weightText' + weight).css('color','#fff');
                $('#weightText'+ weight).css('background','#613EEA');

                // console.log('Styles applied to:', '#weightText' + weight);
                // console.log('Color:', $('#weightText' + weight).css('#fff'));
                // console.log('Background:', $('#weightText' + weight).css('#613EEA'));
                
                
            },
            error: function(error) {
                console.log('error');

            
            }
        });

     
    }
    
    
    

</script>

@endsection
