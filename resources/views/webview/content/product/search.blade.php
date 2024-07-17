<div class="products best-product">
    @if (count($searchcontents) > 0)
        @forelse ($searchcontents as $searchcontent)
            <div class="product" id="categoryslider">
                <div class="product-micro">
                    <div class="row product-micro-row">
                        <div class="col-4" style="padding-right:0;">
                            <div class="product-image">
                                <div class="image text-center">
                                    <a href="{{ url('product/' . $searchcontent->ProductSlug) }}">
                                        <img src="{{ asset($searchcontent->ProductImage) }}"
                                            alt="{{ $searchcontent->ProductName }}" id="bestsellingimage"
                                            style="height: 75px;width: 70px;">
                                    </a>
                                </div>
                                <!-- /.image -->
                            </div>
                            <!-- /.product-image -->
                        </div>
                        <!-- /.col -->
                        <div class="col-8 text-center" style="padding-top: 8px;">
                            <div class="infofe">
                                <div class="product-info">
                                    <h2 class="name text-truncate" id="f_name"><a
                                            href="{{ url('product/' . $searchcontent->ProductSlug) }}"
                                            id="f_pro_name">{{ $searchcontent->ProductName }}</a>
                                    </h2>
                                </div>
                                <div class="price-box">
                                    <del class="old-product-price strong-400">৳
                                        {{ round($searchcontent->ProductRegularPrice) }}</del>
                                    <span class="product-price strong-600">৳
                                        {{ round($searchcontent->ProductSalePrice) }}</span>
                                </div>
                            </div>
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.product-micro-row -->
                </div>
                <!-- /.product-micro -->

            </div>
        @empty
        @endforelse
    @else
        <div class="product" id="categoryslider" style="text-align: center">
            No Products found !............
        </div>
    @endif
</div>
