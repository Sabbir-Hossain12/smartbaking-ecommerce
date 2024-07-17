@extends('admin.master')

@section('maincontent')
    <main id="main" class="main">

        <div class="pagetitle row">
            <div class="col-6">
                <h1><a href="{{url('/drivers-info')}}">Driver Informations</a></h1>
                <nav>
                    <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{url('admin/dashboard')}}">Home</a></li>
                    <li class="breadcrumb-item active">drivers-info</li>
                    </ol>
                </nav>
            </div>
            <div class="col-6" style="text-align: right">
            </div>
        </div><!-- End Page Title -->


        {{-- //table section for category --}}

        <section class="section">
            <div class="row">
                <div class="col-lg-12">

                <div class="card">
                    <div class="card-body pt-4">

                    <!-- Table with stripped rows -->
                    <table class="table datatable">
                        <thead>
                        <tr>
                            <th scope="col"># ID:</th>
                            <th scope="col">First Name</th>
                            <th scope="col">Last Name</th>
                            <th scope="col">Status</th>
                            <th scope="col" style="text-align: center">Action</th>
                        </tr>
                        </thead>
                        <tbody>

                            @forelse ($drivers as $driver)
                                <tr  data-id="{{ $driver->id }}" id="driver{{$driver->id}}">
                                    <th scope="row">{{$driver->id}}</th>
                                    <td>{{$driver->first_name}}</td>
                                    <td>{{$driver->last_name}}</td>
                                    <td>{{$driver->active_status == 1? 'Active' : 'Inactive'}}</td>
                                    <td style="text-align: center">
                                        <a href="{{url('/driver-details/'.$driver->id)}}">
                                            <button type="button" class="btn btn-primary"><i class="bi bi-eye"></i></button>
                                        </a>
                                    </td>
                                </tr>
                            @empty

                            @endforelse

                        </tbody>
                    </table>
                    <!-- End Table with stripped rows -->

                    </div>
                </div>

                </div>
            </div>
        </section>



    </main>

@endsection
