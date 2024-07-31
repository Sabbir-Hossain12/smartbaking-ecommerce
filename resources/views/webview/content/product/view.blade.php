<style>
    #featureimageCt { 
        height: 180px;
        width: auto;
        padding: 2px;
        padding-top: 0;
    }
    @media only screen and (max-width: 600px) {
       #featureimageCt {
           height: 180px;
            width: auto;
            padding: 2px;
            padding-top: 0;
        }
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


<div class="row pt-2 pb-2" style="background: white;">

    @forelse ($categoryproducts as $categoryproduct)
{{--        <div class="col-6 col-lg-2 mb-4">--}}
{{--            <div class="product">--}}
{{--                <div class="product-micro">--}}
{{--                    <div class="row product-micro-row">--}}
{{--                        <div class="col-12">--}}
{{--                            <div class="product-image"  style="position: relative;">--}}
{{--                                <div class="image text-center">--}}
{{--                                    <a href="{{ url('product/' . $categoryproduct->ProductSlug) }}">--}}
{{--                                        <img src="{{ asset($categoryproduct->ProductImage) }}"--}}
{{--                                            alt="{{ $categoryproduct->ProductName }}" id="featureimageCt" >--}}
{{--                                    </a>--}}
{{--                                </div>--}}
{{--                                @if(count($categoryproduct->weights)>0)--}}
{{--                                <span id="discountpart"> <span id="discountparttwo"> <p id="pdis">-{{ $categoryproduct->weights[0]->discount }}%</p> </span></span>--}}
{{--                                @else--}}
{{--                                    <span id="discountpart"> <span id="discountparttwo"> <p id="pdis">-{{ $categoryproduct->Discount }}%</p> </span></span>--}}

{{--                                @endif--}}
{{--                            </div>--}}
{{--                            <!-- /.product-image -->--}}
{{--                        </div>--}}
{{--                        <!-- /.col -->--}}
{{--                        <div class="col-12">--}}
{{--                            <div class="infofe p-md-3 p-2" style="padding-bottom: 4px !important;">--}}
{{--                                <div class="product-info p-0">--}}
{{--                                    <h2 class="name text-truncate" id="f_name"><a--}}
{{--                                            href="{{ url('product/' . $categoryproduct->ProductSlug) }}"--}}
{{--                                            id="f_pro_name">{{ $categoryproduct->ProductName }}</a></h2>--}}
{{--                                </div>--}}
{{--                                <div class="price-box">--}}

{{--                                    @if(count($categoryproduct->weights)>0)--}}
{{--                                    <del class="old-product-price strong-400">৳{{ round($categoryproduct->weights[0]->productRegularPrice) }}</del>--}}
{{--                                    <span class="product-price strong-600">৳{{ round($categoryproduct->weights[0]->productSalePrice) }}</span>--}}
{{--                                    --}}
{{--                                    @else--}}
{{--                                        <del class="old-product-price strong-400">৳{{ round($categoryproduct->ProductRegularPrice) }}</del>--}}
{{--                                        <span class="product-price strong-600">৳{{ round($categoryproduct->ProductSalePrice) }}</span>--}}
{{--                                    @endif--}}
{{--                                </div>--}}
{{--                            </div>--}}
{{--                            <form name="form" action="{{url('add-to-cart')}}" method="POST" enctype="multipart/form-data"--}}
{{--                                style="width: 100%;float: left;text-align: center;">--}}
{{--                                @method('POST')--}}
{{--                                @csrf--}}
{{--                                <input type="text" name="color" id="product_colorold" hidden>--}}
{{--                                <input type="text" name="size" id="product_sizeold" hidden>--}}
{{--                                <input type="text" name="product_id" value=" {{ $categoryproduct->id }}"--}}
{{--                                    hidden>--}}

{{--                                @if(count($categoryproduct->weights)>0)--}}
{{--                                    <input type="text" name="productSalePrice" value="{{round($categoryproduct->weights[0]->productSalePrice)}}" hidden="">--}}
{{--                                @else--}}
{{--                                    <input type="text" name="productSalePrice" value="{{ round($categoryproduct->ProductSalePrice) }}" hidden="">--}}
{{--                                @endif--}}
{{--                                <input type="text" name="qty" value="1" id="qtyor" hidden>--}}
{{--                                <button class="btn btn-danger btn-sm mb-0 btn-block" --}}
{{--                                        style="width: 100%;border-radius: 0%;" id="purcheseBtn">অর্ডার করুন</button>--}}
{{--                            </form>--}}

{{--                        </div>--}}
{{--                        <!-- /.col -->--}}
{{--                    </div>--}}
{{--                    <!-- /.product-micro-row -->--}}
{{--                </div>--}}
{{--                <!-- /.product-micro -->--}}

{{--            </div>--}}
{{--        </div>--}}

        <div class="col-5 col-xs-6 col-md-2 col-lg-2 padding-zero product-hover-effect pb-4 m-2"
             style="background-color: #fff;padding: 0px;border: 1px solid #c6c6c6;">
            <a style="padding: 0px;overflow: hidden;"
               class="img-hover col-sm-12 padding-zero image_thum"
               href="{{ url('product/' . $categoryproduct->ProductSlug) }}" id="374">
                <img class="img-fluid" style="margin: 0 auto;padding:5px; height: 175px"
                     src="{{ asset($categoryproduct->ViewProductImage) }}">
            </a>
            <div class="col-sm-12 col-xs-12 product__item" style="">
                                    <span id="productName374"
                                          class="col-sm-12 text-center">{{$categoryproduct->ProductName}}</span>
                @if(count($categoryproduct->weights)>0)

                    <span id="productPrice374" class="col-sm-12  col-xs-12 text-center" style="">
                                                Tk. {{ round($categoryproduct->weights[0]->productSalePrice) }}   </span>
                @else
                    <span id="productPrice374" class="col-sm-12  col-xs-12 text-center" style="">
                                                Tk. {{$categoryproduct->ProductSalePrice}}   </span>

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
                                                         @if(count($categoryproduct->weights)>0)
                                                            <input type="text" name="weight" value="{{$categoryproduct->weights[0]->weight_name}}" hidden>
                                                        @else
                                                        @endif
                                                 <input type="text" name="product_id" value=" {{ $categoryproduct->id }}"
                                                        hidden>
                                                  @if(count($categoryproduct->weights)>0)
                                                            <input type="text" name="productSalePrice"
                                                                   value="{{round($categoryproduct->weights[0]->productSalePrice)}}"
                                                                   hidden="">
                                                        @else
                                                            <input type="text" name="productSalePrice"
                                                                   value="{{ round($categoryproduct->ProductSalePrice) }}"
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
        <h2 class="p-4 text-center"><b>No Products found...</b></h2>
    @endforelse
</div>
