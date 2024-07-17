@extends('webview.master')

@section('maincontent')
@section('title')
    {{ env('APP_NAME') }}-{{ $subcategorysingle->sub_category_name }}
@endsection
{{-- category slug --}}
<input type="hidden" name="subcategory" id="subcategoryslug" value="{{ $subcategorysingle->slug }}">

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
                                    > subcategory > <span
                                        class="active"></span>{{ $subcategorysingle->sub_category_name }}</span>
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

        var subcategory = $('#subcategoryslug').val();
        $('#processing').modal('show');

        $.ajax({
            type: 'GET',
            url: '{{ url('get/products/by-subcategory') }}',
            data: {
                _token: token,
                subcategory: subcategory,
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
        var subcategorynow = $('#subcategoryslug').val();
        $.ajax({
            type: 'GET',
            url: '{{ url('get/products/by-subcategory') }}',
            data: {
                _token: token,
                subcategory: subcategorynow,
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

    function addtocart(product_id) {
        $('#processing').css({
            'display': 'flex',
            'justify-content': 'center',
            'align-items': 'center'
        })
        $('#processing').modal('show');
        $.ajax({
            type: 'POST',
            url: '{{ url('add-to-cart') }}',
            data: {
                _token: token,
                product_id: product_id,
                qty: '1',
            },

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
    }

    function buynow(product_id) {
        $('#processing').css({
            'display': 'flex',
            'justify-content': 'center',
            'align-items': 'center'
        })
        $('#processing').modal('show');
        $.ajax({
            type: 'POST',
            url: '{{ url('add-to-cart') }}',
            data: {
                _token: token,
                product_id: product_id,
                qty: '1',
            },

            success: function(data) {
                updatecart();
                if (data == 'success') {
                    window.location.href = 'https://danpite.xyz/checkout';
                    $('#processing').modal('hide');
                }
            },
            error: function(error) {
                console.log('error');
            }
        });
    }


    function removeFromCartItem(rowId) {

        $.ajax({
            type: 'POST',
            url: '{{ url('remove-cart') }}',
            data: {
                _token: token,
                rowId: rowId,
            },

            success: function(response) {

                updatecart();
                swal({
                    position: 'top-end',
                    icon: 'success',
                    title: 'Product remove from your Cart',
                    showConfirmButton: false,
                    timer: 1500
                });
                if (response == 'empty') {
                    $('#loadingreload').css({
                        'display': 'flex',
                        'justify-content': 'center',
                        'align-items': 'center'
                    })
                    $('#loadingreload').modal('show');
                    $('#cartViewModal').modal('hide');
                    location.reload();
                } else {
                    $('#cartViewModal .modal-body').empty().append(
                        response);
                    $('#cartViewModal').modal('show');
                }


            },
            error: function(error) {
                console.log('error');
            }
        });
    }



    function upQuantity() {
        var qty = $('#proQuantity').val();
        if (qty >= 10) {

        } else {
            var b = parseInt(qty);
            var cq = b + 1;
            $('#proQuantity').val(cq);
            $('#qty').val(cq);
            $('#qtyor').val(cq);
        }
    }

    function downQuantity() {
        var qty = $('#proQuantity').val();
        if (qty <= 1) {

        } else {
            var b = parseInt(qty);
            var cq = b - 1;
            $('#proQuantity').val(cq);
            $('#qty').val(cq);
            $('#qtyor').val(cq);
        }


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
