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
</style>
<div class="row pt-2 pb-2" style="background: white;">

    @forelse ($categoryproducts as $categoryproduct)
        <div class="col-6 col-lg-2 mb-4">
            <div class="product">
                <div class="product-micro">
                    <div class="row product-micro-row">
                        <div class="col-12">
                            <div class="product-image"  style="position: relative;">
                                <div class="image text-center">
                                    <a href="{{ url('product/' . $categoryproduct->ProductSlug) }}">
                                        <img src="{{ asset($categoryproduct->ProductImage) }}"
                                            alt="{{ $categoryproduct->ProductName }}" id="featureimageCt" >
                                    </a>
                                </div>
                                @if(count($categoryproduct->weights)>0)
                                <span id="discountpart"> <span id="discountparttwo"> <p id="pdis">-{{ $categoryproduct->weights[0]->discount }}%</p> </span></span>
                                @else
                                    <span id="discountpart"> <span id="discountparttwo"> <p id="pdis">-{{ $categoryproduct->Discount }}%</p> </span></span>

                                @endif
                            </div>
                            <!-- /.product-image -->
                        </div>
                        <!-- /.col -->
                        <div class="col-12">
                            <div class="infofe p-md-3 p-2" style="padding-bottom: 4px !important;">
                                <div class="product-info p-0">
                                    <h2 class="name text-truncate" id="f_name"><a
                                            href="{{ url('product/' . $categoryproduct->ProductSlug) }}"
                                            id="f_pro_name">{{ $categoryproduct->ProductName }}</a></h2>
                                </div>
                                <div class="price-box">

                                    @if(count($categoryproduct->weights)>0)
                                    <del class="old-product-price strong-400">৳{{ round($categoryproduct->weights[0]->productRegularPrice) }}</del>
                                    <span class="product-price strong-600">৳{{ round($categoryproduct->weights[0]->productSalePrice) }}</span>
                                    
                                    @else
                                        <del class="old-product-price strong-400">৳{{ round($categoryproduct->ProductRegularPrice) }}</del>
                                        <span class="product-price strong-600">৳{{ round($categoryproduct->ProductSalePrice) }}</span>
                                    @endif
                                </div>
                            </div>
                            <form name="form" action="{{url('add-to-cart')}}" method="POST" enctype="multipart/form-data"
                                style="width: 100%;float: left;text-align: center;">
                                @method('POST')
                                @csrf
                                <input type="text" name="color" id="product_colorold" hidden>
                                <input type="text" name="size" id="product_sizeold" hidden>
                                <input type="text" name="product_id" value=" {{ $categoryproduct->id }}"
                                    hidden>

                                @if(count($categoryproduct->weights)>0)
                                    <input type="text" name="productSalePrice" value="{{round($categoryproduct->weights[0]->productSalePrice)}}" hidden="">
                                @else
                                    <input type="text" name="productSalePrice" value="{{ round($categoryproduct->ProductSalePrice) }}" hidden="">
                                @endif
                                <input type="text" name="qty" value="1" id="qtyor" hidden>
                                <button class="btn btn-danger btn-sm mb-0 btn-block" 
                                        style="width: 100%;border-radius: 0%;" id="purcheseBtn">অর্ডার করুন</button>
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
        <h2 class="p-4 text-center"><b>No Products found...</b></h2>
    @endforelse
</div>
