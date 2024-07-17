@extends('webview.master')

@section('maincontent')
@section('title')
    {{ env('APP_NAME') }}-{{ $categorysingle->brand_name }}
@endsection

<div class="body-content outer-top-xs">
    <div class="breadcrumb pt-2">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumb-inner p-0">
                        <ul class="list-inline list-unstyled mb-0">
                            <li><a href="#"
                                    style="text-transform: capitalize !important;color: #888;padding-right: 12px;font-size: 12px;">Home
                                    > bramd > <span class="active"></span>{{ $categorysingle->brand_name }}</span>
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
                <div class="container">
                    <style>
                        #featureimageCt { 
                            height: 200px;
                            width: auto;
                            padding: 2px;
                            padding-top: 0;
                        }
                        @media only screen and (max-width: 600px) {
                           #featureimageCt {
                               height: 200px;
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
                                                        <span
                                                            class="product-price strong-600">৳{{ round($categoryproduct->ProductSalePrice) }}</span>
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

                </div>
            </div>
            <!-- /.col -->
        </div>

        <!-- ============================================== BRANDS CAROUSEL : END ============================================== -->
    </div>
    <!-- /.container -->

</div>



{{-- csrf --}}
<input type="hidden" name="_token" value="{{ csrf_token() }}" />

<script>
    var token = $("input[name='_token']").val();
 

 
</script>

<style>
    @media only screen and (max-width: 768px) {
        #cateoryProSidebar {
            padding-right: 0;
        }

        #cateoryPro {
            padding-left: 0;
        }
    }

    #cateoryProSidebar {
        padding-left: 0;
    }

    #cateoryPro {
        padding-right: 0px;
    }

    .sidebar-widget .sidebar-widget-body .accordion .accordion-group .accordion-heading .accordion-toggle.collapsed:after {
        color: #636363;
        content: "\f067";
        font-family: fontawesome;
        font-weight: normal;
    }

    .sidebar .sidebar-module-container .sidebar-widget .sidebar-widget-body .accordion .accordion-group .accordion-heading .accordion-toggle:after {
        content: "\f068";
        float: right;
        font-family: fontawesome;
    }

    .widget-title {
        font-size: 16px;
        text-align: center;
        border-bottom: 1px solid #e9e9e9;
        padding-bottom: 10px;
        margin: 0;
    }

    .list {
        list-style: none;
    }

    #liaside {
        color: #858585;
        font-weight: bold;
    }

    .breadcrumb {
        padding: 5px 0;
        border-bottom: 1px solid #e9e9e9;
        background-color: #fafafa;
    }
</style>

@endsection
