@extends('admin.master')

@section('maincontent')
    <main id="main" class="main">

        <div class="pagetitle row">
            <div class="col-6">
                <h1><a href="{{url('/admindashboard')}}">Dashboard</a></h1>
                <nav>
                    <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{url('/admindashboard')}}">Home</a></li>
                    <li class="breadcrumb-item active">Zones</li>
                    </ol>
                </nav>
            </div>
            <div class="col-6" style="text-align: right">
                <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#mainZone"><span style="font-weight: bold;">+</span>  Add New Zone</button>
            </div>
        </div><!-- End Page Title -->

        {{-- //popup modal for create user --}}
        <div class="modal fade" id="mainZone" tabindex="-1" data-bs-backdrop="false">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Add New Zone</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <form name="form" id="AddZone" enctype="multipart/form-data">
                            @csrf
                            <div class="successSMS"></div>

                            <div class="form-group mb-3">
                                <label for="menuName" class="control-label mt-2">Courier Name</label>
                                <div class="">
                                    <select class="form-control" name="courier_id" id="courier_id" onchange="cityupdatenow()" required >
                                        <option value="">Select Courier</option>
                                        @forelse ($couriers as $courier)
                                            <option value="{{$courier->id}}">{{$courier->courierName}}</option>
                                        @empty

                                        @endforelse
                                    </select>
                                </div>
                            </div>

                            <div class="form-group mb-3">
                                <label for="menuName" class="control-label mt-2">City name</label>
                                <div class="">
                                    <select class="form-control" name="city_id" id="city_id" required >

                                    </select>
                                </div>
                            </div>
                            <div class="form-group pb-3">
                                <label for="websiteTitle" class="control-label">Zone name</label>
                                <div class="webtitle">
                                    <input type="text" class="form-control" name="zoneName" id="zoneName" required>
                                    <span class="text-danger">{{ $errors->has('zoneName')? $errors->first('zoneName'):'' }}</span>
                                </div>
                            </div>

                            <div class="form-group pb-3">
                                <label for="websiteTitle" class="control-label">Zone ID</label>
                                <div class="webtitle">
                                    <input type="text" class="form-control" name="zoneId" id="zoneId" >
                                    <span class="text-danger">{{ $errors->has('zoneId')? $errors->first('zoneId'):'' }}</span>
                                </div>
                            </div>

                            <div class="form-group" style="text-align: right">
                                <div class="submitBtnSCourse">
                                    <button type="submit" name="btn" class="btn btn-primary AddZoneBtn btn-block">Save</button>
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
                        <table class="table table-centered table-borderless table-hover mb-0" id="zoneinfo" width="100%">
                            <thead class="thead-light">
                            <tr>
                                <th>ID</th>
                                <th>Courier Name</th>
                                <th>City Name</th>
                                <th>Zone Name</th>
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
        <div class="modal fade" id="editmainZone" tabindex="-1" data-bs-backdrop="false">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Edit Zone</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <form name="form" id="EditZone" enctype="multipart/form-data">
                            @csrf
                            <div class="successSMS"></div>

                            <div class="form-group mb-3">
                                <label for="menuName" class="control-label mt-2">Courier Name</label>
                                <div class="">
                                    <select class="form-control" name="courier_id" id="editcourier_id" onchange="editcityupdatenow()" required >
                                        <option value="">Select Courier</option>
                                        @forelse ($couriers as $courier)
                                            <option value="{{$courier->id}}">{{$courier->courierName}}</option>
                                        @empty

                                        @endforelse
                                    </select>
                                </div>
                            </div>

                            <div class="form-group mb-3">
                                <label for="menuName" class="control-label mt-2">City name</label>
                                <div class="">
                                    <select class="form-control" name="city_id" id="editcity_id" required >
                                        <option value="">Select City</option>
                                        @forelse ($cities as $city)
                                            <option value="{{$city->id}}">{{$city->cityName}}</option>
                                        @empty

                                        @endforelse
                                    </select>
                                </div>
                            </div>
                            <div class="form-group pb-3">
                                <label for="websiteTitle" class="control-label">Zone name</label>
                                <div class="webtitle">
                                    <input type="text" class="form-control" name="zoneName" id="editzoneName" required>
                                    <span class="text-danger">{{ $errors->has('zoneName')? $errors->first('zoneName'):'' }}</span>
                                </div>
                            </div>

                            <div class="form-group pb-3">
                                <label for="websiteTitle" class="control-label">Zone ID</label>
                                <div class="webtitle">
                                    <input type="text" class="form-control" name="zoneId" id="zoneId" >
                                    <span class="text-danger">{{ $errors->has('zoneId')? $errors->first('zoneId'):'' }}</span>
                                </div>
                            </div>

                            <input type="text" name="id" id="idhidden" hidden>

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

        function cityupdatenow() {
            var select=document.getElementById('courier_id').value;
            $('#city_id').html('');

            $.ajax({
                type:'GET',
                url:'set-value/city/'+select,

                success: function (data) {

                    for (var i = 0; i < data.length; i++){
                        const option = document.createElement("option");
                        const node = document.createTextNode(data[i].cityName);
                        option.setAttribute("value", data[i].id);
                        option.appendChild(node);
                        const element = document.getElementById("city_id");
                        element.appendChild(option);
                    }


                },
                error: function(error){
                    console.log('error');
                }

            });
        };
        
        function editcityupdatenow() {
            var select=document.getElementById('editcourier_id').value;
            $('#editcity_id').html('');

            $.ajax({
                type:'GET',
                url:'set-value/city/'+select,

                success: function (data) {

                    for (var i = 0; i < data.length; i++){
                        const option = document.createElement("option");
                        const node = document.createTextNode(data[i].cityName);
                        option.setAttribute("value", data[i].id);
                        option.appendChild(node);
                        const element = document.getElementById("editcity_id");
                        element.appendChild(option);
                    }


                },
                error: function(error){
                    console.log('error');
                }

            });
        };

        $(document).ready(function() {

           var zoneinfotbl = $('#zoneinfo').DataTable({
                order: [ [0, 'desc'] ],
                processing: true,
                serverSide: true,
                ajax: '{{ route('zone.info') }}',
                columns: [
                    { data: 'id' },
                    { data: 'couriers.courierName' },
                    { data: 'cities.cityName' },
                    { data: 'zoneName' },
                    {
                        "data": null,
                        render: function (data) {

                            if (data.status === 'Active') {
                                return '<button type="button" class="btn btn-success btn-sm btn-statuszone" data-status="Inactive" id="zonestatusBtn" data-id="'+data.id+'">Active</button>';
                            } else {
                                return '<button type="button" class="btn btn-warning btn-sm btn-statuszone" data-status="Active" id="zonestatusBtn" data-id="'+data.id+'" >Inactive</button>';
                            }


                        }
                    },
                    { data: 'action', name: 'action', orderable: false, searchable: false},

                ]
            });


            //add zone

            $('#AddZone').submit(function(e){
                e.preventDefault();

                $.ajax({
                    type:'POST',
                    uploadUrl:'{{route("zones.store")}}',
                    processData: false,
                    contentType: false,
                    data:new FormData(this),

                    success: function (data) {
                        $('#zoneName').val('');
                        $('#courier_id').val('');
                        $('#city_id').val('');

                        swal({
                            title: "Success!",
                            icon: "success",
                            showCancelButton: true,
                            focusConfirm: false,
                            confirmButtonColor: "#DD6B55",
                            confirmButtonText: "Yes",
                            cancelButtonText: "No",
                        });
                        zoneinfotbl.ajax.reload();
                    },
                    error: function(error){
                        console.log('error');
                    }
                });
            });

            //edit zone

            $(document).on('click', '#editZoneBtn', function(){
                let zoneId = $(this).data('id');

                $('#editcourier_id').val('');
                $('#editcity_id').val('');
                $('#editzoneName').val('');
                $('#EditZone').attr('data-id', '');

                $.ajax({
                    type:'GET',
                    url:'zones/'+zoneId+'/edit',

                    success: function (data) {
                        $('#EditZone').find('#zoneId').val(data.zoneId);
                        $('#EditZone').find('#editcourier_id').val(data.courier_id);
                        $('#EditZone').find('#editcity_id').val(data.city_id);
                        $('#EditZone').find('#editzoneName').val(data.zoneName);

                        $('#EditZone').find('#idhidden').val(data.id);

                        $('#EditZone').attr('data-id', data.id);
                    },
                    error: function(error){
                        console.log('error');
                    }

                });
            });

            //update zone
            $('#EditZone').submit(function(e){
                e.preventDefault();
                let zoneId = $('#idhidden').val();

                $.ajax({
                    type:'POST',
                    url:'zone/'+zoneId,
                    processData: false,
                    contentType: false,
                    data:new FormData(this),

                    success: function (data) {
                        $('#editcourier_id').val('');
                        $('#editcity_id').val('');
                        $('#editzoneName').val('');

                        $("#EditZone").trigger("reset");

                        swal({
                            title: "Zone update successfully !",
                            icon: "success",
                            showCancelButton: true,
                            focusConfirm: false,
                            confirmButtonColor: "#DD6B55",
                            confirmButtonText: "Yes",
                            cancelButtonText: "No",
                        });
                        zoneinfotbl.ajax.reload();
                    },
                    error: function(error){
                        console.log('error');
                    }
                });
            });

            //delete zone

            $(document).on('click', '#deleteZoneBtn', function(){
                let zoneId = $(this).data('id');
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
                            url:'zones/'+zoneId,

                            success: function (data) {
                                swal("Poof! Your courier has been deleted!", {
                                    icon: "success",
                                });
                                zoneinfotbl.ajax.reload();
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

            //status update zone

             $(document).on('click', '#zonestatusBtn', function(){
                let zoneId = $(this).data('id');
                let zoneStatus = $(this).data('status');

                $.ajax({
                    type:'PUT',
                    url:'zone/status',
                    data:{
                        zone_id:zoneId,
                        status:zoneStatus,
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
                        zoneinfotbl.ajax.reload();
                    },
                    error: function(error){
                        console.log('error');
                    }

                });
            });











        });



    </script>


@endsection
