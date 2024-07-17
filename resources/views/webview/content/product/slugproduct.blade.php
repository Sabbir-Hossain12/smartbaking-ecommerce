@extends('webview.master')

@section('maincontent')
@section('title')
    {{ env('APP_NAME') }}- @if($slug=='best') Best Selling  @elseif($slug=='featured') Featured @elseif($slug=='promotional') Promotional @else @endif Product
@endsection
{{-- category slug --}}
<input type="hidden" name="category" id="categoryslug" value="{{ $slug }}">

<!-- /.breadcrumb -->
<div class="body-content outer-top-xs">

    <div class="breadcrumb pt-2">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumb-inner p-0">
                        <ul class="list-inline list-unstyled mb-0">
                            <li><a href="#"
                                    style="text-transform: capitalize !important;color: #888;padding-right: 12px;font-size: 12px;">Home
                                    > list > <span class="active"></span> @if($slug=='best') Best Selling  @elseif($slug=='featured') Featured @elseif($slug=='promotional') Promotional @else @endif Product</span>
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
                <div class="container" id="viewCategoryProduct">

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



{{-- csrf --}}
<input type="hidden" name="_token" value="{{ csrf_token() }}" />

<script>
    var token = $("input[name='_token']").val();

    $(document).ready(function() {

        var slug = $('#categoryslug').val();
        $('#processing').modal('show');

        $.ajax({
            type: 'GET',
            url: '{{ url('get/slug/products/') }}',
            data: {
                _token: token,
                slug: slug,
            },

            success: function(response) {
                $('#processing').modal('hide');
                $('#viewCategoryProduct').empty().append(response);
            },
            error: function(error) {
                console.log('error');
            }
        });

    });

    function shownowpro() {
        $('#processing').modal('show');
        var pricerange = $('.price-slider').val();
        var categorynow = $('#categoryslug').val();
        $.ajax({
            type: 'GET',
            url: '{{ url('get/products/by-category') }}',
            data: {
                _token: token,
                category: categorynow,
                price_range: pricerange
            },

            success: function(response) {
                $('#processing').modal('hide');
                $('#viewCategoryProduct').empty().append(response);
            },
            error: function(error) {
                console.log('error');
            }
        });
    }


    function viewcategoryproduct(categoryslug) {
        $('#processing').modal('show');

        $.ajax({
            type: 'GET',
            url: '{{ url('get/products/by-category') }}',
            data: {
                _token: token,
                category: categoryslug,
            },

            success: function(response) {
                $('#processing').modal('hide');
                $('#viewCategoryProduct').empty().append(response);
            },
            error: function(error) {
                console.log('error');
            }
        });
    }

    function shownow() {
        $('#processing').modal('show');
        var pricerange = $('.price-slider').val();
        var categoryslg = $('#categoryslug').val();
        $.ajax({
            type: 'GET',
            url: '{{ url('get/products/by-category') }}',
            data: {
                _token: token,
                category: categoryslg,
                price_range: pricerange
            },

            success: function(response) {
                $('#processing').modal('hide');
                $('#viewCategoryProduct').empty().append(response);
            },
            error: function(error) {
                console.log('error');
            }
        });
    }

    function viewsubcategoryproduct(subcategoryslug) {
        $('#processing').modal('show');
        var pricerange = $('.price-slider').val();

        $.ajax({
            type: 'GET',
            url: '{{ url('get/products/by-subcategory') }}',
            data: {
                _token: token,
                subcategory: subcategoryslug,
                price_range: pricerange
            },

            success: function(response) {
                $('#processing').modal('hide');
                $('#viewCategoryProduct').empty().append(response);
            },
            error: function(error) {
                console.log('error');
            }
        });
    }

    function viewcategoryproduct(categoryslug) {
        $('#processing').modal('show');

        $.ajax({
            type: 'GET',
            url: '{{ url('get/products/by-category') }}',
            data: {
                _token: token,
                category: categoryslug,
            },

            success: function(response) {
                $('#processing').modal('hide');
                $('#viewCategoryProduct').empty().append(response);
            },
            error: function(error) {
                console.log('error');
            }
        });
    }
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
