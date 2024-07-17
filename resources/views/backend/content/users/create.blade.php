@extends('backend.master')

@section('maincontent')

    @section('title')
        {{ env('APP_NAME') }}-Create New User
    @endsection

<div class="container-fluid pt-4 px-4">
    <form name="form" id="CreateRole" method="POST" action="{{ route("admin.users.store") }}" enctype="multipart/form-data">
        @csrf
        <div class="bg-secondary rounded h-100 p-4">
            <div class="row">
                <div class="col-sm-12 col-md-12">
                    <h6 class="mb-4">Create New User</h6>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" name="name" id="floatingInput" placeholder="Your name here" required>
                                <label for="floatingInput" style="color: red">Name</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="email" class="form-control" name="email" id="floatingInput" placeholder="name@ayebazar.com" required>
                                <label for="floatingInput" style="color: red">Email address</label>
                            </div>
                            <div class="form-floating mb-4">
                                <input type="password" class="form-control" name="password" id="floatingPassword" placeholder="Password" required>
                                <label for="floatingPassword" style="color: red">Password</label>
                            </div>
                            <div class="form-floating mb-4">
                                <input type="password" class="form-control" onchange="checkpassword()" name="confirmpassword" id="floatingConfirmPassword" placeholder="Confirm Password" required>
                                <label for="floatingPassword" style="color: red">Confirm Password</label>
                                <label for="floatingPassword" id="checkText" style="color: red;display:none">Password does not match !</label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" name="phone" id="floatingInput" placeholder="Type Phone" required>
                                <label for="floatingInput" style="color: red">Phone</label>
                            </div>
                            <select class="form-select mb-4" name="roles[]" id="role" style="font-size: 1rem;" aria-label=".form-select-lg example" multiple>
                                <option value="" style="color: red">Select Roles</option>
                                @forelse ($roles as $role)
                                    <option value="{{ $role->id }}">{{ $role->name }}</option>
                                @empty

                                @endforelse
                            </select>

                            <div class="form-floating mb-3 mt-4 pt-4">
                                <button type="submit" class="btn btn-primary w-100 mt-3">Create User</button>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </form>
</div>

<script>

    function checkpassword(){
        var pass =$('#floatingPassword').val();
        var confirmpass =$('#floatingConfirmPassword').val();
        if(pass==confirmpass){

        }else{

            $('#floatingConfirmPassword').css('border','1px solid white');
        }
    }

</script>

@endsection
