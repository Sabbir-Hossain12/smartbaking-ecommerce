@if (count($cartProducts) > 0)
    <div class="cart-item product-summary">
        @forelse ($cartProducts as $item)
            <div class="row">
                <div class="col-4 col-xs-4">
                    <div class="image">
                        <a href="#"><img src="{{ asset($item->image) }}" alt=""></a>
                    </div>
                </div>
                <div class="col-7 col-xs-7" style="padding-left: 0">
                    <h3 class="name"><a href="#" style="font-size: 11px;color: black;">{{ $item->name }}</a>
                    </h3>
                    <div class="price">৳{{ $item->price }}</div>
                </div>
                <div class="col-1 col-xs-1 action"> <a type="button" style="cursor: pointer"
                        onclick="removeFromCartItemHead('{{ $item->rowId }}')"><i class="fa fa-trash"></i></a> </div>
            </div>
        @empty
        @endforelse

    </div>
    <!-- /.cart-item -->
    <div class="clearfix"></div>
    <hr>
    <div class="clearfix cart-total">
        <div class="pull-right"> <span class="text">Sub Total :</span><span
                class='price'>৳{{ Cart::subtotal() }}</span>
        </div>
        <div class="clearfix"></div>
        <a href="{{ url('/cart') }}" class="btn btn-upper btn-primary btn-block m-t-20" style="width: 100%;">View
            Cart</a>
    </div>
    <!-- /.cart-total-->
@else
    <div class="clearfix cart-total" style="    background: #e1dcdc;  padding: 10px; font-size: 22px;">
        Nothing here...!
    </div>
@endif
