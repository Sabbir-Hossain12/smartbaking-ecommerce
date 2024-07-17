@extends('webview.master')

@section('maincontent')
@section('title')
    {{ env('APP_NAME') }}- Categories
@endsection
{{-- category slug --}} 

<!-- /.breadcrumb -->
<div class="body-content outer-top-xs">
 
    @if(count($categories)>0)
        <section class="mt-1 mb-3">
            <div class="container">
                <div class="row mt-4 pb-4 mb-4" style="background: white;">
                    <div class="col-12"> <h2 class="m-0">Category List</h2> </div>
                    @forelse ($categories as $ctlist)
                        <div class="col-lg-3 col-4 mb-4">
                            <div class="products best-product">
                                <div class="product" id="categoryslider">
                                    <div class="product-micro">
                                        <div class="row product-micro-row">
                                            <div class="col-12">
                                                <div class="product-image">
                                                    <div class="image text-center">
                                                        <a href="{{ url('products/category/' . $ctlist->slug) }}"
                                                            type="button">
                                                            @if (isset($ctlist->category_icon))
                                                                <img data-original="{{ asset($ctlist->category_icon) }}"
                                                                    alt="{{ $ctlist->category_name }}"
                                                                    id="categoryimage">
                                                            @else
                                                                <img data-original="{{ asset('public/webview/assets/images/categoryimage.jpg') }}"
                                                                    alt="{{ $ctlist->category_name }}"
                                                                    id="categoryimage">
                                                            @endif
                                                        </a>
                                                    </div>
                                                    <!-- /.image -->
                                                </div>
                                                <!-- /.product-image -->
                                            </div>
                                            <!-- /.col -->
                                            <div class="col-12 text-center" style="padding-top: 8px;">
                                                <div class="product-info">
                                                    <h3 class="name" id="categoryNameinfo"><a
                                                            onclick="viewcategoryproduct('{{ $ctlist->slug }}')"
                                                            type="button"
                                                            id="category_name">{{ $ctlist->category_name }}</a>
                                                    </h3>
                                                </div>
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
        </section>
    @else
         <h2 class="p-4 text-center"><b>Nothing found...</b></h2>
    @endif 

</div>

  

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
