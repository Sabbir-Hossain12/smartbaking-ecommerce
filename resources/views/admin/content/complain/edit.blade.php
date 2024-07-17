<section class="content">
    <div class="row">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <strong> Complain Customer Info</strong>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="storeID">Store Name</label>
                                <input type="text" readonly class="form-control" style="cursor: not-allowed;"
                                    id="storename" value="{{ $complain->site_name }}">
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="invoiceID">Invoice Number</label>
                                <input type="text" readonly class="form-control" style="cursor: not-allowed;"
                                    id="invoiceID" value="{{ $complainorder->invoiceID }}">
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        @if ($customer->customerName)
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="customerName">Customer Name</label>
                                    <input type="text" class="form-control" id="customerName"
                                        value="{{ $customer->customerName }}" readonly>
                                </div>
                            </div>
                        @else
                        @endif

                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="customerPhone">Customer Phone</label>
                                <input type="text" class="form-control" id="customerPhone"
                                    value="{{ $complain->customer_phone }}" readonly>
                            </div>
                        </div>
                    </div>
                    <br>

                    <div class="row">
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="orderDate">Complain Date</label>
                                <input type="text" class="form-control datepicker"
                                    value="{{ $complain->complainDate }}" id="orderDate" readonly>
                            </div>
                        </div>

                        @if ($complainorder->completeDate)
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label for="completeDate">Order Completed Date</label>
                                    <input type="text" class="form-control datepicker" id="completeDate"
                                        value="{{ $complainorder->completeDate }}" readonly>
                                </div>
                            </div>
                        @endif

                        @if ($complainorder->deliveryDate)
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label for="deliveryDate">Order Delivery Date</label>
                                    <input type="text" class="form-control datepicker" id="deliveryDate"
                                        value="{{ $complainorder->deliveryDate }}" readonly>
                                </div>
                            </div>
                        @endif


                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="form-group">
                                <label for="customerAddress">Complain Message</label>
                                <textarea name="" class="form-control" placeholder="Customer " id="" rows="2" readonly>{{ $complain->complain_message }}</textarea>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <strong>Complain Status</strong>
                </div>
                <div class="card-body">
                    <label for="status">Add Note</label>
                    <input type="text" id="complain_id" value="{{ $complain->id }}" class="form-control" hidden>

                    <div class="input-group">
                        <input type="text" id="complaincomment" class="form-control" placeholder="Add Notes">
                        <div class="input-group-append">
                            <button class="btn btn-success waves-effect waves-light" id="updateComplainComment"
                                type="button">Update Note</button>
                        </div>
                    </div>
                    <br>
                    <table id="ComplainCommentTable" data-id="{{ $complain->id }}" style="width: 100% !important;"
                        class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Created At</th>
                                <th>Notes</th>
                                <th>User</th>
                            </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>


                </div>
            </div>
        </div>

        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <strong>Old Complain</strong>
                </div>
                <div class="card-body">
                    <table id="oldComplainTable" style="width: 100% !important;" data-id="{{ $complain->id }}"
                        class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Invoice ID</th>
                                <th>Name</th>
                                <th>Products</th>
                                <th>Total</th>
                                <th>Courier</th>
                                <th>Order Date</th>
                                <th>Status</th>
                                <th style="width: 133px;">Notes</th>
                                <th style="width: 133px;">User</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse ($orderalls as $orderall)
                                <tr>
                                    <td>{{ $orderall->invoiceID }} <br> {{ $orderall->web_ID }} </td>
                                    <td>{{ $orderall->customerName }} <br>{{ $orderall->customerPhone }}
                                        <br>{{ $orderall->customerAddress }}
                                    </td>
                                    <td>
                                        @foreach ($orderall->orderproducts as $product)
                                            {{ $product->quantity . ' x ' . $product->productName }}<br>
                                        @endforeach
                                    </td>
                                    <td> {{ $orderall->subTotal }} </td>
                                    <td>
                                        @if (isset($orderall->couriers->courierName) &&
                                            isset($orderall->cities->cityName) &&
                                            isset($orderall->zones->zoneName))
                                            {{ $orderall->couriers->courierName }}<br>{{ $orderall->cities->cityName }}<br>{{ $orderall->zones->zoneName }}
                                        @elseif (isset($orderall->couriers->courierName) && isset($orderall->cities->cityName))
                                            {{ $orderall->couriers->courierName }}<br>{{ $orderall->cities->cityName }}
                                        @elseif (isset($orderall->couriers->courierName) && isset($orderall->zones->zoneName))
                                            {{ $orderall->couriers->courierName }} <br>
                                            {{ $orderall->zones->zoneName }}
                                        @elseif (isset($orderall->couriers->courierName))
                                            {{ $orderall->couriers->courierName }}
                                        @else
                                            {{ 'Not Selected' }}
                                        @endif
                                    </td>
                                    <td> {{ $orderall->orderDate }} </td>
                                    <td> <button class="btn btn-info btn-sm">{{ $orderall->status }}</button> </td>
                                    <td>{{ $orderall->comments->comment }}</td>
                                    <td>{{ $orderall->admins->name }}</td>
                                </tr>
                            @empty

                            @endforelse
                        </tbody>
                    </table>


                </div>
            </div>

        </div>
    </div>

</section>
