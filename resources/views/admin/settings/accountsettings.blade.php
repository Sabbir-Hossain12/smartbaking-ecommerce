@extends('admin.master')

@section('maincontent')
    <main id="main" class="main">

        <div class="pagetitle row">
            <div class="col-6">
                <h1><a href="{{url('/account/settings')}}">Account Settings</a></h1>
                <nav>
                    <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{url('admin/dashboard')}}">Home</a></li>
                    <li class="breadcrumb-item active">account / settings</li>
                    </ol>
                </nav>
            </div>
            <div class="col-6" style="text-align: right">
            </div>
        </div><!-- End Page Title -->
        @if ($message = Session::get('success'))
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <strong>{{$message}}</strong>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        @endif
         @if ($message = Session::get('error'))
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <strong>{{$message}}</strong>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        @endif
        <section class="section profile">
            <div class="row">
                <div class="col-xl-4">

                <div class="card">
                    <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">
                        @if (empty($admin->profile))
                            <img src="{{asset('public/admin/assets/img/blanck-user.jpg')}}" alt="Profile" class="rounded-circle">
                        @else
                            <img src="{{asset($admin->profile)}}" alt="Profile" class="rounded-circle">
                        @endif
                        <h2>{{$admin->name}}</h2>
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
                        <button class="nav-link" data-bs-toggle="tab" data-bs-target="#change-info">Change Profile</button>
                        </li>

                        <li class="nav-item">
                        <button class="nav-link" data-bs-toggle="tab" data-bs-target="#ride-overview">Change Info</button>
                        </li>

                    </ul>
                    <div class="tab-content pt-2">

                        <div class="tab-pane fade show active profile-overview" id="profile-overview">


                            <div class="row">
                                <div class="col-lg-3 col-md-4 label ">Full Name</div>
                                <div class="col-lg-9 col-md-8">{{$admin->name}}</div>
                            </div>

                            <div class="row">
                                <div class="col-lg-3 col-md-4 label">Email</div>
                                <div class="col-lg-9 col-md-8">{{$admin->email}}</div>
                            </div>
                        </div>

                         {{-- //additional info overview --}}
                        <div class="tab-pane fade change-info" id="change-info">

                            <div class="row">
                                <div class="col-lg-3 col-md-4 label">Profile :</div>
                                <div class="col-lg-9 col-md-8">
                                    <img src="{{asset($admin->profile)}}" alt="" style="height: 200px;width:200px">
                                    <form name="form" method="POST" action="{{url('admin/update/profile/')}}" enctype="multipart/form-data" style="display: inline;width:100%;float:left;" >
                                        @csrf
                                        <div class="form-group" style="width: 75%;float: left;">
                                            <label for="cateImg" class="control-label">Choose Image</label>
                                            <div class="categoryImg">
                                                <input type="file" name="profile" id="profile" required>
                                            </div>
                                        </div>
                                        <input type="text" name="admin_id" value="{{Auth::id()}}" hidden>
                                        <button type="submit" class="btn btn-primary" style="    margin-top: 15px;">Update</button>
                                    </form>
                                </div>

                            </div>

                        </div>

                        {{-- //ride overview --}}
                        <div class="tab-pane fade ride-overview" id="ride-overview">

                            <div class="row">
                                <div class="col-lg-3 col-md-4 label">Email :</div>
                                <div class="col-lg-9 col-md-8">
                                    <form name="form" method="POST" action="{{url('/update/admin/')}}" enctype="multipart/form-data" style="display: inline;width:100%;float:left;" >
                                        @csrf
                                        <div class="categoryImg">
                                            <div class="form-group">
                                                <label for="categoryName" class="control-label">Old Email</label>
                                                <div class="">
                                                    <input type="email" class="form-control" name="old_email" id="old_email">
                                                    <span class="text-danger">{{ $errors->has('old_email')? $errors->first('old_email'):'' }}</span>
                                                </div>
                                            </div>
                                        </div>
                                       <div class="categoryImg">
                                            <div class="form-group">
                                                <label for="categoryName" class="control-label">New Email</label>
                                                <div class="">
                                                    <input type="email" class="form-control" name="email" id="email">
                                                    <span class="text-danger">{{ $errors->has('email')? $errors->first('email'):'' }}</span>
                                                </div>
                                            </div>
                                        </div>

                                        <button type="submit" class="btn btn-primary" style=" margin-top: 15px;">Update Email</button>
                                    </form>
                                </div>

                            </div>

                            <div class="row mt-4 pt-4">
                                <div class="col-lg-3 col-md-4 label">Password :</div>
                                <div class="col-lg-9 col-md-8">
                                    <form name="form" method="POST" action="{{url('/update/admin/')}}" enctype="multipart/form-data" style="display: inline;width:100%;float:left;" >
                                        @csrf
                                        <input type="email" name="main_email" value="{{$admin->email}}" hidden>
                                       <div class="categoryImg">
                                            <div class="form-group">
                                                <label for="categoryName" class="control-label">New Password</label>
                                                <div class="">
                                                    <input type="text" class="form-control" name="password" id="password">
                                                    <span class="text-danger">{{ $errors->has('password')? $errors->first('password'):'' }}</span>
                                                </div>
                                            </div>
                                        </div>

                                        <button type="submit" class="btn btn-primary" style=" margin-top: 15px;">Update Password</button>
                                    </form>
                                </div>

                            </div>



                        </div>

                    </div><!-- End Bordered Tabs -->

                    </div>
                </div>

                </div>
            </div>
        </section>


    </main>

@endsection
