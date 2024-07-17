@extends('webview.master')

@section('maincontent')
@section('title')
    {{ env('APP_NAME') }}-Forget Password
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
                    <br><br>
                    <div class="mb-4 text-sm text-gray-600">
                        {{ __('Forgot your password? No problem. Just let us know your email address and we will email you a password reset link that will allow you to choose a new one.') }}
                    </div>

                    <!-- Session Status -->
                    <x-auth-session-status class="mb-4" :status="session('status')" />

                    <!-- Validation Errors -->
                    <x-auth-validation-errors class="mb-4" :errors="$errors" />

                    <form method="POST" action="{{ route('password.email') }}">
                        @csrf

                        <!-- Email Address -->
                        <div>
                            <x-label for="email" :value="__('Email')" />

                            <x-input id="email" class="block mt-1 w-full" type="email" name="email" :value="old('email')" required autofocus />
                        </div>

                        <div class="flex items-center justify-end mt-4">
                            <x-button>
                                {{ __('Email Password Reset Link') }}
                            </x-button>
                        </div>
                    </form>
                    <h4 class="text-center" style="margin-top: 20px;margin-bottom:20px;">
                        Need an account? <a href="{{ url('register') }}" style="color: #000">Register Now</a>
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

@endsection
