@extends('admin.master')

@section('maincontent')
    <main id="main" class="main">

        <div class="pagetitle row">
            <div class="col-6">
                <h1><a href="{{ url('/admindashboard') }}">Dashboard</a></h1>
                <nav>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ url('/admindashboard') }}">Home</a></li>
                        <li class="breadcrumb-item active">Barcode</li>
                    </ol>
                </nav>
            </div>
        </div><!-- End Page Title -->

        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6 p-4 m-2" style="background: white">
                <form id="invoiceForm">
                    <label for="invoiceID">Invoice ID</label>
                    <div class="form-group container1">
                        <div><input type="text" class="form-control mb-2" name="invoiceID" id="invoiceID"
                                onchange="increasetab(event)" placeholder="Invoice ID" style="width:90%;float:left"
                                required>
                            <a href="#" class="delete" style="width:10%;float:left"><i class="fas fa-times"
                                    style="font-size:24px;color:red;padding:7px;margin-left:20px"></i></a>
                        </div>
                    </div>
                    <br>
                    <br>
                    <button type="button" id="orderbybarcode" class="btn btn-primary">Submit</button>
                </form>
            </div>
            <div class="col-md-3"></div>
        </div>

    </main>



    <script>
        function increasetab(event) {
            var x = 1;
            var max_fields = 50;
            var wrapper = $(".container1");
            if (x < max_fields) {
                x++;
                $(wrapper).append(
                    '<div><input type="text" name="invoiceID" class="form-control mb-2" onchange="increasetab(event)" id="invoiceID" placeholder="Invoice ID" style="width:90%;float:left" required><a href="#" class="delete" style="width:10%;float:left"><i class="fas fa-times" style="font-size:24px;color:red;padding:7px;margin-left:20px"></i></a></div>'
                ); //add input box
            } else {
                alert('You Reached the limits')
            }
        };
        $(document).ready(function() {
            var wrapper = $(".container1");
            var x = 1;
            $(wrapper).on("click", ".delete", function(e) {
                e.preventDefault();
                $(this).parent('div').remove();
                x--;
            })
            $('#orderbybarcode').on('click', function(e) {
                var invoiceID = $('#invoiceForm').serializeArray();

                $.ajax({
                    type: 'GET',
                    url: 'getorder/bybarcode',
                    data: {
                        invoice_id: invoiceID,
                    },
                    success: function(data) {
                        window.location.href = "http://localhost/ayebazar/admin/getscan/order/";
                    },
                    error: function(error) {
                        console.log('error');
                    }

                });

            });

            var cityinfotbl = $('#cityinfo').DataTable({
                order: [
                    [0, 'desc']
                ],
                processing: true,
                serverSide: true,
                ajax: '{!! route('city.info') !!}',
                columns: [{
                        data: 'id'
                    },
                    {
                        data: 'couriers.courierName'
                    },
                    {
                        data: 'cityName'
                    },
                    {
                        "data": null,
                        render: function(data) {

                            if (data.status === 'Active') {
                                return '<button type="button" class="btn btn-success btn-sm btn-status" data-status="Inactive" id="citystatusBtn" data-id="' +
                                    data.id + '">Active</button>';
                            } else {
                                return '<button type="button" class="btn btn-warning btn-sm btn-status" data-status="Active" id="citystatusBtn" data-id="' +
                                    data.id + '" >Inactive</button>';
                            }


                        }
                    },
                    {
                        data: 'action',
                        name: 'action',
                        orderable: false,
                        searchable: false
                    },

                ]
            });

            //edit city

            $(document).on('click', '#editCityBtn', function() {
                let cityId = $(this).data('id');
                $('#editcourier_id').val('');
                $('#editcityName').val('');
                $('#EditCity').attr('data-id', '');
                $.ajax({
                    type: 'GET',
                    url: 'cities/' + cityId + '/edit',

                    success: function(data) {
                        $('#EditCity').find('#division').val(data.division);
                        $('#EditCity').find('#editcourier_id').val(data.courier_id);
                        $('#EditCity').find('#editcityName').val(data.cityName);
                        $('#EditCity').find('#idhidden').val(data.id);
                        $('#EditCity').attr('data-id', data.id);
                    },
                    error: function(error) {
                        console.log('error');
                    }

                });
            });

            //update city
            $('#EditCity').submit(function(e) {
                e.preventDefault();
                let cityId = $('#idhidden').val();

                $.ajax({
                    type: 'POST',
                    url: 'city/' + cityId,
                    processData: false,
                    contentType: false,
                    data: new FormData(this),

                    success: function(data) {
                        $('#editcourier_id').val('');
                        $('#editcityName').val('');

                        $("#EditCity").trigger("reset");

                        swal({
                            title: "City update successfully !",
                            icon: "success",
                            showCancelButton: true,
                            focusConfirm: false,
                            confirmButtonColor: "#DD6B55",
                            confirmButtonText: "Yes",
                            cancelButtonText: "No",
                        });
                        cityinfotbl.ajax.reload();
                    },
                    error: function(error) {
                        console.log('error');
                    }
                });
            });

            //deleteuser

            $(document).on('click', '#deleteCityBtn', function() {
                let cityId = $(this).data('id');
                swal({
                        title: "Are you sure?",
                        text: "Once deleted, you will not be able to recover this !",
                        icon: "warning",
                        buttons: true,
                        dangerMode: true,
                    })
                    .then((willDelete) => {
                        if (willDelete) {
                            $.ajax({
                                type: 'DELETE',
                                url: 'cities/' + cityId,

                                success: function(data) {
                                    swal("Poof! Your city has been deleted!", {
                                        icon: "success",
                                    });
                                    cityinfotbl.ajax.reload();
                                },
                                error: function(error) {
                                    console.log('error');
                                }

                            });


                        } else {
                            swal("Your data is safe!");
                        }
                    });

            });

            //status update

            $(document).on('click', '#citystatusBtn', function() {
                let cityId = $(this).data('id');
                let cityStatus = $(this).data('status');

                $.ajax({
                    type: 'PUT',
                    url: 'city/status',
                    data: {
                        city_id: cityId,
                        status: cityStatus,
                    },

                    success: function(data) {
                        swal({
                            title: "Status updated !",
                            icon: "success",
                            showCancelButton: true,
                            focusConfirm: false,
                            confirmButtonColor: "#DD6B55",
                            confirmButtonText: "Yes",
                            cancelButtonText: "No",
                        });
                        cityinfotbl.ajax.reload();
                    },
                    error: function(error) {
                        console.log('error');
                    }

                });
            });











        });
    </script>
@endsection
