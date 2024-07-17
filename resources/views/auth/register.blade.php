@extends('webview.master')

@section('maincontent')
@section('title')
    {{ env('APP_NAME') }}-Register
@endsection

<div class="body-content">
    <div class="container">
        <div class="sign-in-page m-b-10">
            <div class="row">
                <!-- create a new account -->
                <div class="col-md-3 col-sm-2 create-new-account">

                </div>
                <!-- Sign-in -->
                <div class="card col-md-6 col-sm-8 sign-in mb-4 mt-4">
                    <h4 class="checkout-subtitle m-0 pb-2 pt-4 text-center"> <b>Create a new account</b> </h4>
                    <form class="register-form outer-top-xs" method="POST" action="{{ url('register') }}" role="form">
                        @csrf
                        <div class="form-group">
                            <label class="info-title" for="exampleInputEmail1">Name <span>*</span></label>
                            <input type="text" name="name" class="form-control unicase-form-control text-input"
                                required>
                        </div>
                        <div class="form-group">
                            <label class="info-title" for="exampleInputEmail2">Email <span>*</span></label>
                            <input type="email" name="email" class="form-control unicase-form-control text-input"
                                required>
                        </div>
                        <div class="form-group">
                            <label class="info-title" for="exampleInputEmail2">Phone <span>*</span></label>
                            <input type="text" name="phone" class="form-control unicase-form-control text-input"
                                required>
                        </div>
                        <div class="form-group">
                            <label class="info-title" for="exampleInputEmail1">Password <span>*</span></label>
                            <input type="password" name="password" class="form-control unicase-form-control text-input"
                                id="password" required>
                        </div>
                        <div class="form-group mb-4">
                            <label class="info-title" for="exampleInputEmail1">Confirm Password <span>*</span></label>
                            <input type="password" onkeyup="checkpass()" id="confirm_password"
                                class="form-control unicase-form-control text-input m-0" required>
                            <small id="confirm_passwordtextmatch" style="color: deepskyblue;display:none">Password
                                Matched</small>
                            <small id="confirm_passwordtext" style="color: red;display:none">Password Not
                                Matched</small>
                        </div>
                        <button type="submit" id="submit-button" style="background:#e62e04;border:1px #e62e04;color: white;width:100%"
                            class="btn-block btn-upper btn btn-dark checkout-page-button">Sign
                            Up</button>
                    </form>
                    <h4 class="text-center" style="margin-top: 20px;margin-bottom:20px;">
                        Already have an account? <a href="{{ url('login') }}" style="color:black"> <b>Login Now</b>
                        </a>
                    </h4>
                </div>
                <!-- Sign-in -->

                <!-- create a new account -->
                <div class="col-md-3 col-sm-2 create-new-account">

                </div>
                <!-- create a new account -->
            </div><!-- /.row -->
        </div><!-- /.sigin-in-->
    </div><!-- /.row -->
</div><!-- /.sigin-in-->


<script>
    function checkpass() {
        var pass = $('#password').val();
        var con_pass = $('#confirm_password').val();
        if (pass == con_pass) {
            $('#confirm_passwordtext').css('display', 'none');
            $('#confirm_passwordtextmatch').css('display', 'inline');
            $('#submit-button').prop('disabled', false);
        } else {
            $('#confirm_password').focus();
            $('#confirm_passwordtext').css('display', 'inline');
            $('#confirm_passwordtextmatch').css('display', 'none');
            $('#submit-button').prop('disabled', true);
        }
    }

    function checkunick() {
        var username = $('#username').val();
        $.ajax({
            type: "GET",
            url: "{{ url('check/username') }}/" + username,

            success: function(data) {

                if (data == 'taken') {
                    $('#username').focus();
                    $('#submit-button').prop('disabled', true);
                    $('#avaliableusername').css('display', 'none');
                    $('#unavaliableusername').css('display', 'inline');
                } else {
                    $('#avaliableusername').css('display', 'inline');
                    $('#unavaliableusername').css('display', 'none');
                    $('#submit-button').prop('disabled', false);
                }
            }
        });
    }
</script>
@endsection
