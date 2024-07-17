<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>{{ env('APP_NAME') }} Login</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="{{ asset('public/backend/') }}/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Roboto:wght@500;700&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="{{ asset('public/backend/') }}/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="{{ asset('public/backend/') }}/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="{{ asset('public/backend/') }}/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="{{ asset('public/backend/') }}/css/style.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" ></script>
     <script>

        $(document).ready(function(){
            $("#myModal").modal('show');
        });

    </script>
    <style>
        .modal-content {
        background-image: url(../../../public/bgtech.gif);
        position: relative;
        display: flex;
        flex-direction: column;
        width: 100%;
        pointer-events: auto;
        background-color: #fff;
        background-clip: padding-box;
        border: 1px solid rgba(0,0,0,0.2);
        border-radius: 0.3rem;
        outline: 0;
        background-size: cover;
        background-repeat: no-repeat;
    }

    .bg-secondary {
        background-color: #d7dceb !important;
    }

    </style>
</head>

<body style="background-color: #fff;">
    @php
        $pay=\App\Models\Basicinfo::first();
    @endphp


        <div class="container-fluid position-relative d-flex p-0">
            <!-- Spinner Start -->
            <div id="spinner" class="show bg-dark position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
                <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                    <span class="sr-only">Loading...</span>
                </div>
            </div>
            <!-- Spinner End -->


            <!-- Sign In Start -->
            <div class="container-fluid">
                <div class="row h-100 align-items-center justify-content-center" style="min-height: 100vh;">
                    <div class="col-12 col-sm-8 col-md-6 col-lg-5 col-xl-4">
                        <div class="bg-secondary rounded p-4 p-sm-5 my-4 mx-3">
                            <div class="mb-0" style="text-align:center">

                                <a href="{{url('/')}}"> <img src="{{asset(\App\Models\Basicinfo::first()->logo)}}" alt="logo" style="width:100%"> </a>


                            </div>
                            <p style="text-align:center">Welcome to {{ env('APP_NAME') }}</p>
                            @if(\Session::has('error'))
                                <div class="alert alert-dark" style="color: red;background:black">{{ \Session::get('error') }}</div>
                            @endif
                            <form action="{{ route('admin.login') }}" method="post">
                                @csrf
                                <div class="form-floating mb-3">
                                    <input type="email" class="form-control" name="email" id="floatingInput" placeholder="name@ayebazar.com" required>
                                    <label for="floatingInput">Email address</label>
                                </div>
                                <div class="form-floating mb-4">
                                    <input type="password" class="form-control" name="password" id="floatingPassword" placeholder="Password" required>
                                    <label for="floatingPassword">Password</label>
                                </div>
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">Remember me</label>
                                    </div>
                                    <a href="">Forgot Password</a>
                                </div>
                                <button type="submit" class="btn btn-primary py-3 w-100 mb-4">Sign In</button>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Sign In End -->
        </div>




    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="{{ asset('public/backend/') }}/lib/chart/chart.min.js"></script>
    <script src="{{ asset('public/backend/') }}/lib/easing/easing.min.js"></script>
    <script src="{{ asset('public/backend/') }}/lib/waypoints/waypoints.min.js"></script>
    <script src="{{ asset('public/backend/') }}/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="{{ asset('public/backend/') }}/lib/tempusdominus/js/moment.min.js"></script>
    <script src="{{ asset('public/backend/') }}/lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="{{ asset('public/backend/') }}/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="{{ asset('public/backend/') }}/js/main.js"></script>
</body>

</html>
