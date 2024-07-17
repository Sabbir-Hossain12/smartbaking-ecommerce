@extends('webview.master')

@section('maincontent')
@section('title')
    {{ env('APP_NAME') }}-Cart List
@endsection
<style>
    .col {
        -ms-flex-preferred-size: 0;
        flex-basis: 0;
        -ms-flex-positive: 1;
        flex-grow: 1;
        max-width: 100%;
        position: relative;
        width: 100%;
        min-height: 1px;
        padding-right: 15px;
        padding-left: 15px;
    }

    .slice-xs {
        padding-top: 1rem;
        padding-bottom: 1rem;
        position: relative;
    }

    .border-bottom {
        border-bottom: 1px solid #dee2e6 !important;
    }

    .sct-color-2 {
        background-color: #fcfcfc;
    }

    .icon-block--style-1-v5 {
        position: relative;
    }

    .icon-block {
        position: relative;
    }

    .text-center {
        text-align: center !important;
    }

    .icon-block--style-1-v5 .block-icon {
        display: block;
        margin-bottom: 1rem;
    }

    .mb-0,
    .my-0 {
        margin-bottom: 0 !important;
    }

    .strong-300 {
        font-weight: 300 !important;
    }

    .text-capitalize {
        text-transform: capitalize !important;
    }

    .c-gray-light {
        color: #818a91 !important;
    }

    .heading-sm {
        font-size: 0.875rem !important;
    }

    .heading {
        margin: 0 0 6px;
        padding: 0;
        text-transform: none;
        font-family: "Open Sans", sans-serif;
        font-weight: 600;
        color: #111111;
        line-height: 1.46;
    }

    .justify-content-center {
        -ms-flex-pack: center !important;
        justify-content: center !important;
    }

    .icon-block--style-1-v5 {
        position: relative;
    }

    .heading-sm {
        font-size: 0.875rem !important;
    }

    .bg-white {
        filter: drop-shadow(3px 4px 6px #eee);
    }

    .bg-white {
        background-color: #fff !important;
    }

    .table-cart {
        width: 100%;
    }

    .border-bottom {
        border-bottom: 1px solid #dee2e6 !important;
    }

    .table-cart>thead>tr>th {
        font-size: 12px;
        font-weight: bold;
        line-height: 1.2;
        text-transform: uppercase;
        letter-spacing: .3px;
        padding: 0 0 10px;
        border-bottom: 1px solid #e7e7e7;
    }

    .table-cart tbody tr td {
        font-size: 1rem !important;
        font-weight: bold;
        line-height: 1.2;
        letter-spacing: -0.5px;
        text-transform: none;
        padding: 1.25rem 0;
        vertical-align: middle;
        color: #2b2b2c;
        border: none;
    }

    .table-cart tbody tr td {
        padding: 1rem 0;
    }

    .table-cart tbody tr td.product-image a {
        width: 45px;
        height: 45px;
    }

    .table-cart tbody tr td.product-image a {
        position: relative;
        overflow: hidden;
        display: block;
        width: 80px;
        height: 80px;
    }

    .text-right {
        text-align: right !important;
    }
</style>
<section class="slice-xs sct-color-2 border-bottom">
    <div class="container container-sm">
        <div class="row d-flex justify-content-center">
            <div class="col">
                <div class="icon-block icon-block--style-1-v5 text-center active">
                    <div class="block-icon mb-0">
                        <i style="font-size: 34px;color: #e62e04" class="fas fa-shopping-cart" aria-hidden="true"></i>
                    </div>
                    <div class="block-content d-none d-md-block">
                        <h3 style="font-size: 1.2rem !important"
                            class="heading heading-sm strong-300 c-gray-light text-capitalize">1. My Cart</h3>
                    </div>
                </div>
            </div>

            <div class="col">
                <div class="icon-block icon-block--style-1-v5 text-center">
                    <div class="block-icon c-gray-light mb-0">
                        <i class="fas fa-map" style="font-size: 34px" aria-hidden="true"></i>
                    </div>
                    <div class="block-content d-none d-md-block">
                        <h3 style="font-size: 1.2rem !important"
                            class="heading heading-sm strong-300 c-gray-light text-capitalize">2. Shipping info</h3>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="icon-block icon-block--style-1-v5 text-center">
                    <div class="block-icon c-gray-light mb-0">
                        <i style="font-size: 34px" class="fas fa-credit-card" aria-hidden="true"></i>
                    </div>
                    <div class="block-content d-none d-md-block">
                        <h3 style="font-size: 1.2rem !important"
                            class="heading heading-sm strong-300 c-gray-light text-capitalize">3. Payment</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="py-4 gry-bg" id="cart-summary" style="margin-top: 0px;margin-bottom: 30px;">

</section>

<script>
    $(document).ready(function() {
        $.ajax({
            type: 'get',
            url: '{{ url('load-cart') }}',

            success: function(response) {
                $('#cart-summary').empty().append(
                    response);
            },
            error: function(error) {
                console.log('error');
            }
        });
    });


    function updateQuantity(rowId) {
        var quantity = $('#proQuantity' + rowId).val();
        var price = $('#priceOf' + rowId).val();

        $.ajax({
            type: 'POST',
            url: 'update-cart',

            data: {
                _token: '{{ csrf_token() }}',
                rowId: rowId,
                qty: quantity,
            },

            success: function(data) {
                viewcart();
                updatecart();

            },
            error: function(error) {
                console.log('error');
            }
        });

    }


    function updatecart() {
        $.ajax({
            type: 'get',
            url: '{{ url('update-cart') }}',

            success: function(response) {
                $('.basket-item-count').html(response.item);
                $('.cartamountvalue').html(response.amount);
            },
            error: function(error) {
                console.log('error');
            }
        });
    }

    function upQuantity(id) {
        var qty = $('#proQuantity' + id).val();
        if (qty >= 10) {

        } else {
            var b = parseInt(qty);
            var cq = b + 1;
            $('#proQuantity' + id).val(cq);
            $('#qty').val(cq);
            $('#qtyor').val(cq);
        }
    }

    function downQuantity(id) {
        var qty = $('#proQuantity' + id).val();
        if (qty <= 1) {

        } else {
            var b = parseInt(qty);
            var cq = b - 1;
            $('#proQuantity' + id).val(cq);
            $('#qty').val(cq);
            $('#qtyor').val(cq);
        }


    }
</script>

<style>
    .ml-lg-auto,
    .mx-lg-auto {
        margin-left: auto !important;
    }

    .sticky-top {
        position: sticky;
        top: 0;
        z-index: 99;
    }

    .card {
        position: relative;
        border: 1px solid #f1f1f1;
        border-radius: 0.25rem;
        background: #fff;
        -webkit-transition: all 0.3s linear;
        transition: all 0.3s linear;
    }

    .card>.card-title,
    .card>.card-header {
        padding: 1.5rem 1.5rem;
        border-bottom: 1px solid rgba(0, 0, 0, 0.05);
        margin-bottom: 0;
    }

    .pb-3,
    .py-3 {
        padding-bottom: 1rem !important;
    }

    .pt-3,
    .py-3 {
        padding-top: 1rem !important;
    }

    .align-items-center {
        -ms-flex-align: center !important;
        align-items: center !important;
    }

    .card-title .heading,
    .card-header .heading {
        margin: 0;
        display: inline-block;
    }

    .strong-400 {
        font-weight: 400 !important;
    }

    .heading-3 {
        font-size: 1.5rem !important;
        line-height: 1.3;
    }

    .heading {
        margin: 0 0 6px;
        padding: 0;
        text-transform: none;
        font-family: "Open Sans", sans-serif;
        font-weight: 600;
        color: #111111;
        line-height: 1.46;
    }

    .mb-0,
    .my-0 {
        margin-bottom: 0 !important;
    }

    .text-right {
        text-align: right !important;
    }

    .badge-md {
        padding: 0.65em 1em;
    }

    .badge {
        padding: 0.45em 0.45em;
        font-size: 0.625rem;
        font-weight: 400;
    }

    .badge-success {
        color: #fff;
        background-color: #28a745;
    }

    .badge {
        display: inline-block;
        padding: 0.25em 0.4em;
        font-size: 75%;
        font-weight: 700;
        line-height: 1;
        text-align: center;
        white-space: nowrap;
        vertical-align: baseline;
        border-radius: 0.25rem;
    }

    .card-body {
        position: relative;
        padding: 1.5rem 1.5rem;
    }

    .card-body {
        -ms-flex: 1 1 auto;
        flex: 1 1 auto;
        padding: 1.25rem;
    }

    .table-cart {
        width: 100%;
    }

    table {
        border-collapse: collapse;
    }



    * .card-title {
        margin-bottom: 0.75rem;
    }

    #proQuantity {
        width: 125px;
    }

    #quantityup {
        width: 80px;
    }

    .col-6 {
        width: 50%;
        float: left;
    }

    @media only screen and (max-width: 600px) {
        #smp {
            padding: 0;
        }

        #proQuantity {
            width: 28px;
        }

        #quantityup {
            width: 45px;
        }

        .btn {
            display: inline-block;
            padding: 6px 12px;
            margin-bottom: 0;
            font-size: 13px;
            font-weight: 400;
            line-height: 1.42857143;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            cursor: pointer;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            background-image: none;
            border: 1px solid transparent;
            border-radius: 4px;
        }

        .table-cart>thead>tr>th {
            font-size: 9px;
            font-weight: bold;
            line-height: 1.2;
            text-transform: uppercase;
            letter-spacing: .3px;
            padding: 0 0 10px;
            border-bottom: 1px solid #e7e7e7;
        }

        .table-cart tbody tr td {
            font-size: 12px;
            font-weight: bold;
            line-height: 1.2;
            letter-spacing: -0.5px;
            text-transform: none;
            padding: 1.25rem 0;
            vertical-align: middle;
            color: #2b2b2c;
            border: none;
        }

        .table-cart tbody tr td {
            padding: 1rem 0;
        }

        .table-cart tbody tr td.product-image a {
            position: relative;
            overflow: hidden;
            display: block;
            width: 54px;
            height: 54px;
        }

        #cartpron {
            width: 100px !important;
        }

        #cartproname {
            font-size: 10px
        }
    }
</style>
@endsection
