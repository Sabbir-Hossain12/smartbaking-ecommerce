@extends('admin.master')

@section('maincontent')
    <main id="main" class="main">

        <div class="pagetitle row">
            <div class="col-6">
                <h1><a href="{{url('/admindashboard')}}">Dashboard</a></h1>
                <nav>
                    <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{url('/admindashboard')}}">Home</a></li>
                    <li class="breadcrumb-item active">Cities</li>
                    </ol>
                </nav>
            </div>
            <div class="col-6" style="text-align: right">
                <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#mainCity"><span style="font-weight: bold;">+</span>  Add New City</button>
            </div>
        </div><!-- End Page Title -->

        {{-- //popup modal for create user --}}
        <div class="modal fade" id="mainCity" tabindex="-1" data-bs-backdrop="false">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Add New City</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <form name="form" id="AddCity" enctype="multipart/form-data">
                            @csrf
                            <div class="successSMS"></div>
                            <div class="form-group mb-3">
                                <label for="menuName" class="control-label mt-2">Courier Name</label>
                                <div class="">
                                    <select class="form-control" name="courier_id" id="courier_id" required >
                                        <option value="">Select Courier</option>
                                        @forelse ($couriers as $courier)
                                            <option value="{{$courier->id}}">{{$courier->courierName}}</option>
                                        @empty

                                        @endforelse
                                    </select>
                                </div>
                            </div>

                            <div class="form-group pb-3">
                                <label for="websiteTitle" class="control-label">City name</label>
                                <div class="webtitle">
                                    <input type="text" class="form-control" name="cityName" id="cityName" required>
                                    <span class="text-danger">{{ $errors->has('cityName')? $errors->first('cityName'):'' }}</span>
                                </div>
                            </div>

                            <div class="form-group pb-3">
                                <label for="websiteTitle" class="control-label">Division</label>
                                <div class="webtitle">
                                    <select class="form-control" name="division" id="division" >
                                        <option value="">Select Division</option>
                                        <option value="Dhaka">Dhaka</option>
                                        <option value="Barishal">Barishal</option>
                                        <option value="Chattogram">Chattogram</option>
                                        <option value="Khulna">Khulna</option>
                                        <option value="Mymenshing">Mymenshing</option>
                                        <option value="Rajshahi">Rajshahi</option>
                                        <option value="Rangpur">Rangpur</option>
                                        <option value="Sylhet">Sylhet</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group" style="text-align: right">
                                <div class="submitBtnSCourse">
                                    <button type="submit" name="btn" class="btn btn-primary AddCityBtn btn-block">Save</button>
                                </div>
                            </div>
                        </form>

                    </div>

                </div>
            </div>
        </div><!-- End popup Modal-->

        {{-- //table section for category --}}

        <section class="section">
            <div class="row">
                <div class="col-lg-12">

                <div class="card">
                    <div class="card-body pt-4">
                    @if(\Session::has('success'))
                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                            <i class="bi bi-check-circle me-1"></i>
                            {{ \Session::get('success') }}
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    @endif
                    <!-- Table with stripped rows -->
                    <div class="table-responsive">
                        <table class="table table-centered table-borderless table-hover mb-0" id="cityinfo" width="100%">
                            <thead class="thead-light">
                            <tr>
                                <th>ID</th>
                                <th>Courier Name</th>
                                <th>City Name</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody></tbody>
                        </table>
                    </div>
                    <!-- End Table with stripped rows -->

                    </div>
                </div>

                </div>
            </div>
        </section>

          {{-- //popup modal for edit user --}}
        <div class="modal fade" id="editmainCity" tabindex="-1" data-bs-backdrop="false">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Edit City</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <form name="form" id="EditCity" enctype="multipart/form-data">
                            @csrf
                            <div class="successSMS"></div>

                            <div class="form-group mb-3">
                                <label for="menuName" class="control-label mt-2">Courier Name</label>
                                <div class="">
                                    <select class="form-control" name="courier_id" id="editcourier_id" required >
                                        <option value="">Select Courier</option>
                                        @forelse ($couriers as $courier)
                                            <option value="{{$courier->id}}">{{$courier->courierName}}</option>
                                        @empty

                                        @endforelse
                                    </select>
                                </div>
                            </div>
                            <input type="text" name="id" id="idhidden" hidden>
                            <div class="form-group pb-3">
                                <label for="websiteTitle" class="control-label">City name</label>
                                <div class="webtitle">
                                    <input type="text" class="form-control" name="cityName" id="editcityName" required>
                                    <span class="text-danger">{{ $errors->has('cityName')? $errors->first('cityName'):'' }}</span>
                                </div>
                            </div>

                            <div class="form-group pb-3">
                                <label for="websiteTitle" class="control-label">Division</label>
                                <div class="webtitle">
                                    <select class="form-control" name="division" id="division" >
                                        <option value="">Select Division</option>
                                        <option value="Dhaka">Dhaka</option>
                                        <option value="Barishal">Barishal</option>
                                        <option value="Chattogram">Chattogram</option>
                                        <option value="Khulna">Khulna</option>
                                        <option value="Mymenshing">Mymenshing</option>
                                        <option value="Rajshahi">Rajshahi</option>
                                        <option value="Rangpur">Rangpur</option>
                                        <option value="Sylhet">Sylhet</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group" style="text-align: right">
                                <div class="submitBtnSCourse">
                                    <button type="submit" name="btn" class="btn btn-primary btn-block">Save</button>
                                </div>
                            </div>
                        </form>

                    </div>

                </div>
            </div>
        </div><!-- End popup Modal-->

    </main>



    <script>
        $(document).ready(function() {

           var cityinfotbl = $('#cityinfo').DataTable({
                order: [ [0, 'desc'] ],
                processing: true,
                serverSide: true,
                ajax: '{!! route('city.info') !!}',
                columns: [
                    { data: 'id' },
                    { data: 'couriers.courierName' },
                    { data: 'cityName' },
                    {
                        "data": null,
                        render: function (data) {

                            if (data.status === 'Active') {
                                return '<button type="button" class="btn btn-success btn-sm btn-status" data-status="Inactive" id="citystatusBtn" data-id="'+data.id+'">Active</button>';
                            } else {
                                return '<button type="button" class="btn btn-warning btn-sm btn-status" data-status="Active" id="citystatusBtn" data-id="'+data.id+'" >Inactive</button>';
                            }


                        }
                    },
                    { data: 'action', name: 'action', orderable: false, searchable: false},

                ]
            });


            //add user

            $('#AddCity').submit(function(e){
                e.preventDefault();

                $.ajax({
                    type:'POST',
                    uploadUrl:'{{route("cities.store")}}',
                    processData: false,
                    contentType: false,
                    data:new FormData(this),

                    success: function (data) {
                        $('#cityName').val('');
                        $('#courier_id').val('');

                        swal({
                            title: "Success!",
                            icon: "success",
                            showCancelButton: true,
                            focusConfirm: false,
                            confirmButtonColor: "#DD6B55",
                            confirmButtonText: "Yes",
                            cancelButtonText: "No",
                        });
                        cityinfotbl.ajax.reload();
                    },
                    error: function(error){
                        console.log('error');
                    }
                });
            });

            //edit city

            $(document).on('click', '#editCityBtn', function(){
                let cityId = $(this).data('id');
                        $('#editcourier_id').val('');
                        $('#editcityName').val('');
                        $('#EditCity').attr('data-id', '');
                $.ajax({
                    type:'GET',
                    url:'cities/'+cityId+'/edit',

                    success: function (data) {
                        $('#EditCity').find('#division').val(data.division);
                        $('#EditCity').find('#editcourier_id').val(data.courier_id);
                        $('#EditCity').find('#editcityName').val(data.cityName);
                        $('#EditCity').find('#idhidden').val(data.id);
                        $('#EditCity').attr('data-id', data.id);
                    },
                    error: function(error){
                        console.log('error');
                    }

                });
            });

            //update city
            $('#EditCity').submit(function(e){
                e.preventDefault();
                let cityId = $('#idhidden').val();

                $.ajax({
                    type:'POST',
                    url:'city/'+cityId,
                    processData: false,
                    contentType: false,
                    data:new FormData(this),

                    success: function (data) {
                        $('#editcourier_id').val('');
                        $('#editcityName').val('');

                        $("#EditCity").trigger("reset");

                        swal({
                            title: "City update successfully !",
                            icon: "success",
                            showCancelButton: true,
                            focusConfirm: false,
                            confirmButtonColor: "#DD6B55",
                            confirmButtonText: "Yes",
                            cancelButtonText: "No",
                        });
                        cityinfotbl.ajax.reload();
                    },
                    error: function(error){
                        console.log('error');
                    }
                });
            });

            //deleteuser

            $(document).on('click', '#deleteCityBtn', function(){
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
                            type:'DELETE',
                            url:'cities/'+cityId,

                            success: function (data) {
                                swal("Poof! Your city has been deleted!", {
                                    icon: "success",
                                });
                                cityinfotbl.ajax.reload();
                            },
                            error: function(error){
                                console.log('error');
                            }

                        });


                    } else {
                        swal("Your data is safe!");
                    }
                });

            });

            //status update

             $(document).on('click', '#citystatusBtn', function(){
                let cityId = $(this).data('id');
                let cityStatus = $(this).data('status');

                $.ajax({
                    type:'PUT',
                    url:'city/status',
                    data:{
                        city_id:cityId,
                        status:cityStatus,
                    },

                    success: function (data) {
                        swal({
                            title: "Status updated !",
                            icon: "success",
                            showCancelButton: true,
                            focusConfirm: false,
                            confirmButtonColor: "#DD6B55",
                            confirmButtonText: "Yes",
                            cancelButtonText: "No",
                        });
                        cityinfotbl.ajax.reload();
                    },
                    error: function(error){
                        console.log('error');
                    }

                });
            });











        });



    </script>


@endsection
