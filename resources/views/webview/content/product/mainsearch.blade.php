@extends('webview.master')

@section('maincontent')
@section('title')
    {{ env('APP_NAME') }}-Search Products
@endsection
<style>
    #featureimageCt {
        height: 300px;
        width: auto;
        padding: 2px;
        padding-top: 0;
    }
    @media only screen and (max-width: 600px) {
       #featureimageCt {
            height: 220px;
            width: auto;
            padding: 2px;
            padding-top: 0;
        }
    }
</style>
<div class="body-content outer-top-xs">
    <div class="breadcrumb pt-2">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumb-inner p-0">
                        <ul class="list-inline list-unstyled mb-0">
                            <li><a href="#"
                                    style="text-transform: capitalize !important;color: #888;padding-right: 12px;font-size: 12px;">Home
                                    > Search > <span class="active"></span>Products</span>
                                </a></li>
                        </ul>
                    </div>
                </div>
                <!-- /.breadcrumb-inner -->
            </div>
        </div>
        <!-- /.container -->
    </div>
  
    
    <div class='container'>
        <div class='row'> 
            <!-- /.sidebar -->
            <div class='col-md-12' id="cateoryPro">
                <div class="container" >
                    
                    <div class="row pt-2 pb-2" style="background: white;">
                    
                        @forelse ($searchproducts as $categoryproduct)
                            <div class="col-6 col-lg-2 mb-4">
                                <div class="product">
                                    <div class="product-micro">
                                        <div class="row product-micro-row">
                                            <div class="col-12">
                                                <div class="product-image">
                                                    <div class="image text-center">
                                                        <a href="{{ url('product/' . $categoryproduct->ProductSlug) }}">
                                                            <img src="{{ asset($categoryproduct->ProductImage) }}"
                                                                alt="{{ $categoryproduct->ProductName }}" id="featureimage" >
                                                        </a>
                                                    </div>
                                                    <!-- /.image -->
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
                                                        <del
                                                            class="old-product-price strong-400">৳{{ round($categoryproduct->ProductRegularPrice) }}</del>
                                                        <span
                                                            class="product-price strong-600">৳{{ round($categoryproduct->ProductSalePrice) }}</span>
                                                    </div>
                                                </div>
                                                <button class="btn btn-danger btn-sm mb-0 btn-block"
                                                    onclick="buynow({{ $categoryproduct->id }})" style="width: 100%;border-radius: 0%;color: white;"
                                                    id="purcheseBtn">অর্ডার করুন</button>
                    
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

                </div>
                <!-- /.category-product -->


                <!-- /.tab-content -->
                <div class="clearfix filters-container">
                    <div class="text-right">
                        <div class="pagination-container">

                        </div>
                        <!-- /.pagination-container -->
                    </div>
                    <!-- /.text-right -->

                </div>
                <!-- /.filters-container -->

            </div>
            <!-- /.col -->
        </div>

        <!-- ============================================== BRANDS CAROUSEL : END ============================================== -->
    </div>
    <!-- /.container -->

</div>

@endsection
