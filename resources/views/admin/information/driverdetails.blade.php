@extends('admin.master')

@section('maincontent')
    <main id="main" class="main">

        <div class="pagetitle row">
            <div class="col-6">
                <h1><a href="{{url('/drivers-info')}}">Driver Information</a></h1>
                <nav>
                    <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{url('admin/dashboard')}}">Home</a></li>
                    <li class="breadcrumb-item active">drivers-info / {{$driver->id}}</li>
                    </ol>
                </nav>
            </div>
            <div class="col-6" style="text-align: right">
            </div>
        </div><!-- End Page Title -->


        {{-- //table section for driver profile details --}}

        <section class="section profile">
            <div class="row">
                <div class="col-xl-4">

                <div class="card">
                    <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">

                    <img src="{{asset('public/admin/assets/img/blanck-user.jpg')}}" alt="Profile" class="rounded-circle">
                    <h2>{{$driver->first_name}} {{$driver->last_name}}</h2>
                    <h3>Ratings:</h3>
                    </div>
                </div>

                </div>

                <div class="col-xl-8">

                <div class="card">
                    <div class="card-body pt-3">
                    <!-- Bordered Tabs -->
                    <ul class="nav nav-tabs nav-tabs-bordered">

                        <li class="nav-item">
                        <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#profile-overview">Profile Details</button>
                        </li>

                        <li class="nav-item">
                        <button class="nav-link" data-bs-toggle="tab" data-bs-target="#additional-info">Additional Information</button>
                        </li>

                        <li class="nav-item">
                        <button class="nav-link" data-bs-toggle="tab" data-bs-target="#ride-overview">Ride Details</button>
                        </li>

                    </ul>
                    <div class="tab-content pt-2">

                        <div class="tab-pane fade show active profile-overview" id="profile-overview">


                            <div class="row">
                                <div class="col-lg-3 col-md-4 label ">First Name</div>
                                <div class="col-lg-9 col-md-8">{{$driver->first_name}}</div>
                            </div>
                            <div class="row">
                                <div class="col-lg-3 col-md-4 label ">Last Name</div>
                                <div class="col-lg-9 col-md-8">{{$driver->last_name}}</div>
                            </div>
                            <div class="row">
                                <div class="col-lg-3 col-md-4 label">Email</div>
                                <div class="col-lg-9 col-md-8">{{$driver->email}}</div>
                            </div>

                            <div class="row">
                                <div class="col-lg-3 col-md-4 label">Phone</div>
                                <div class="col-lg-9 col-md-8">{{$driver->phone}}</div>
                            </div>

                             <div class="row">
                                <div class="col-lg-3 col-md-4 label">Address</div>
                                <div class="col-lg-9 col-md-8">{{$driver->address}}</div>
                            </div>

                            <div class="row">
                                <div class="col-lg-3 col-md-4 label">Active Status</div>
                                <div class="col-lg-9 col-md-8">{{$driver->active_status == 1? 'Active' : 'Inactive'}}</div>
                            </div>

                            <div class="row">
                                <div class="col-lg-3 col-md-4 label">Created_at</div>
                                <div class="col-lg-9 col-md-8">{{$driver->created_at->format('d/m/Y')}}</div>
                            </div>

                        </div>

                         {{-- //additional info overview --}}
                        <div class="tab-pane fade additional-info" id="additional-info">

                            <div class="row">
                                <div class="col-lg-3 col-md-4 label" style="margin-top: 10%">NID :</div>
                                <div class="col-lg-9 col-md-8">
                                    <img src="{{asset($driver->nid_image)}}" alt="">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-3 col-md-4 label" style="margin-top: 10%">D-LICENCE :</div>
                                <div class="col-lg-9 col-md-8">
                                    <img src="{{asset($driver->driving_licence)}}" alt="">
                                </div>
                            </div>

                        </div>

                        {{-- //ride overview --}}
                        <div class="tab-pane fade ride-overview" id="ride-overview">

                                {{-- //trip history --}}

                        </div>

                    </div><!-- End Bordered Tabs -->

                    </div>
                </div>

                </div>
            </div>
        </section>



    </main>

@endsection
