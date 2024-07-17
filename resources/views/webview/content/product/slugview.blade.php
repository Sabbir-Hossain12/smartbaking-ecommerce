<div class="row pt-2 pb-2" style="background: white;">

    @forelse ($slugproducts as $categoryproduct)
    <div class="col-6 col-lg-2 mb-4">
        <div class="product">
            <div class="product-micro">
                <div class="row product-micro-row">
                    <div class="col-12">
                        <div class="product-image"  style="position: relative;">
                            <div class="image text-center">
                                <a href="{{ url('product/' . $categoryproduct->ProductSlug) }}">
                                    <img src="{{ asset($categoryproduct->ProductImage) }}"
                                        alt="{{ $categoryproduct->ProductName }}" id="featureimage" >
                                </a>
                            </div>
                            <span id="discountpart"> <span id="discountparttwo"> <p id="pdis">-{{ $categoryproduct->Discount }}%</p> </span></span>
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
                                <del class="old-product-price strong-400">৳{{ round($categoryproduct->ProductRegularPrice) }}</del>
                                <span class="product-price strong-600">৳{{ round($categoryproduct->ProductSalePrice) }}</span>
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
