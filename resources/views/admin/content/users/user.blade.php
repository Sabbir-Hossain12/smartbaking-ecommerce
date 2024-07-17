@extends('admin.master')

@section('maincontent')
    <main id="main" class="main">

        <div class="pagetitle row">
            <div class="col-6">
                <h1><a href="{{url('/admindashboard')}}">Dashboard</a></h1>
                <nav>
                    <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{url('/admindashboard')}}">Home</a></li>
                    <li class="breadcrumb-item active">Users</li>
                    </ol>
                </nav>
            </div>
            <div class="col-6" style="text-align: right">
                @if (Auth::user()->role == 1)

                @else
                    <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#mainUser"><span style="font-weight: bold;">+</span>  Add New User</button>
                @endif
            </div>
        </div><!-- End Page Title -->

        {{-- //popup modal for create user --}}
        <div class="modal fade" id="mainUser" tabindex="-1" data-bs-backdrop="false">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Add New User</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <form name="form" id="AddUser" enctype="multipart/form-data">
                            @csrf
                            <div class="successSMS"></div>

                            <div class="form-group pb-3">
                                <label for="websiteTitle" class="control-label">Name</label>
                                <div class="webtitle">
                                    <input type="text" class="form-control" name="name" id="name" required>
                                    <span class="text-danger">{{ $errors->has('name')? $errors->first('name'):'' }}</span>
                                </div>
                            </div>

                            <div class="form-group pb-3">
                                <label for="websiteTitle" class="control-label">Phone</label>
                                <div class="webtitle">
                                    <input type="text" class="form-control" name="phone" id="phone" required>
                                    <span class="text-danger">{{ $errors->has('phone')? $errors->first('phone'):'' }}</span>
                                </div>
                            </div>

                            <div class="form-group pb-3">
                                <label for="websiteTitle" class="control-label">Email</label>
                                <div class="webtitle">
                                    <input type="email" class="form-control" name="email" id="email" required>
                                    <span class="text-danger">{{ $errors->has('email')? $errors->first('email'):'' }}</span>
                                </div>
                            </div>

                            <div class="form-group pb-3">
                                <label for="websiteTitle" class="control-label">Password</label>
                                <div class="webtitle">
                                    <input type="password" class="form-control" name="password" id="password" required>
                                    <span class="text-danger">{{ $errors->has('password')? $errors->first('password'):'' }}</span>
                                </div>
                            </div>

                            <div class="form-group mb-4">
                                <label for="menuName" class="control-label mt-2">Role</label>
                                <div class="">
                                    <select class="form-control" name="role" id="role" required >
                                        <option value="">Select Role</option>
                                        <option value="0">User</option>
                                        <option value="1">Manager</option>
                                        <option value="2">Admin</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group" style="text-align: right">
                                <div class="submitBtnSCourse">
                                    <button type="submit" name="btn" class="btn btn-primary AddUserBtn btn-block">Save</button>
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
                        <table class="table table-centered table-borderless table-hover mb-0" id="userinfo" width="100%">
                            <thead class="thead-light">
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Phone</th>
                                <th>Email</th>
                                <th>Type</th>
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
        <div class="modal fade" id="editmainUser" tabindex="-1" data-bs-backdrop="false">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Edit User</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <form name="form" id="EditUser" enctype="multipart/form-data">
                            @csrf
                            <div class="successSMS"></div>

                            <div class="form-group pb-3">
                                <label for="websiteTitle" class="control-label">Name</label>
                                <div class="webtitle">
                                    <input type="text" class="form-control" name="name" id="editname" required>
                                    <span class="text-danger">{{ $errors->has('name')? $errors->first('name'):'' }}</span>
                                </div>
                            </div>

                            <div class="form-group pb-3">
                                <label for="websiteTitle" class="control-label">Phone</label>
                                <div class="webtitle">
                                    <input type="text" class="form-control" name="phone" id="editphone" required>
                                    <span class="text-danger">{{ $errors->has('phone')? $errors->first('phone'):'' }}</span>
                                </div>
                            </div>

                            <div class="form-group pb-3">
                                <label for="websiteTitle" class="control-label">Email</label>
                                <div class="webtitle">
                                    <input type="email" class="form-control" name="email" id="editemail" required>
                                    <span class="text-danger">{{ $errors->has('email')? $errors->first('email'):'' }}</span>
                                </div>
                            </div>

                            <div class="form-group pb-3">
                                <label for="websiteTitle" class="control-label">Password</label>
                                <div class="webtitle">
                                    <input type="password" class="form-control" name="password" id="password" required>
                                    <span class="text-danger">{{ $errors->has('password')? $errors->first('password'):'' }}</span>
                                </div>
                            </div>

                            <div class="form-group mb-4">
                                <label for="menuName" class="control-label mt-2">Role</label>
                                <div class="">
                                    <select class="form-control" name="role" id="editrole" required >
                                        <option value="">Select Role</option>
                                        <option value="0">User</option>
                                        <option value="1">Manager</option>
                                        <option value="2">Admin</option>
                                    </select>
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
        $(document).ready(function() {

           var userinfotbl = $('#userinfo').DataTable({
                order: [ [0, 'desc'] ],
                processing: true,
                serverSide: true,
                ajax: '{!! route('user.info') !!}',
                columns: [
                    { data: 'id' },
                    { data: 'name' },
                    { data: 'phone' },
                    { data: 'email' },
                    { data: 'role_name' },
                    {
                        "data": null,
                        render: function (data) {

                            if (data.status === 'Active') {
                                return '<button type="button" class="btn btn-success btn-sm btn-status" data-status="Inactive" id="statusBtn" data-id="'+data.id+'">Active</button>';
                            } else {
                                return '<button type="button" class="btn btn-warning btn-sm btn-status" data-status="Active" id="statusBtn" data-id="'+data.id+'" >Inactive</button>';
                            }


                        }
                    },
                    { data: 'action', name: 'action', orderable: false, searchable: false},

                ]
            });


            //add user

            $('#AddUser').submit(function(e){
                e.preventDefault();

                $.ajax({
                    type:'POST',
                    uploadUrl:'{{route("users.store")}}',
                    processData: false,
                    contentType: false,
                    data:new FormData(this),

                    success: function (data) {
                        $('#name').val('');
                        $('#email').val('');
                        $('#phone').val('');
                        $('#role').val('');
                        $('#password').val('');

                        swal({
                            title: "Success!",
                            icon: "success",
                            showCancelButton: true,
                            focusConfirm: false,
                            confirmButtonColor: "#DD6B55",
                            confirmButtonText: "Yes",
                            cancelButtonText: "No",
                        });
                        userinfotbl.ajax.reload();
                    },
                    error: function(error){
                        console.log('error');
                    }
                });
            });

            //edit user

            $(document).on('click', '#editUserBtn', function(){
                let userId = $(this).data('id');

                $.ajax({
                    type:'GET',
                    url:'users/'+userId+'/edit',

                    success: function (data) {
                        $('#EditUser').find('#editname').val(data.name);
                        $('#EditUser').find('#editemail').val(data.email);
                        $('#EditUser').find('#editphone').val(data.phone);
                        $('#EditUser').find('#editrole').val(data.role);
                        $('#EditUser').find('#idhidden').val(data.id);
                        $('#EditUser').attr('data-id', data.id);
                    },
                    error: function(error){
                        console.log('error');
                    }

                });
            });

            //update
            $('#EditUser').submit(function(e){
                e.preventDefault();
                let userId = $('#idhidden').val();

                $.ajax({
                    type:'POST',
                    url:'user/'+userId,
                    processData: false,
                    contentType: false,
                    data:new FormData(this),

                    success: function (data) {
                        $('#editname').val('');
                        $('#editemail').val('');
                        $('#editphone').val('');
                        $('#editrole').val('');

                        swal({
                            title: "User update successfully !",
                            icon: "success",
                            showCancelButton: true,
                            focusConfirm: false,
                            confirmButtonColor: "#DD6B55",
                            confirmButtonText: "Yes",
                            cancelButtonText: "No",
                        });
                        userinfotbl.ajax.reload();
                    },
                    error: function(error){
                        console.log('error');
                    }
                });
            });

            //deleteuser

            $(document).on('click', '#deleteUserBtn', function(){
                let userId = $(this).data('id');
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
                            url:'users/'+userId,

                            success: function (data) {
                                swal("Poof! Your user has been deleted!", {
                                    icon: "success",
                                });
                                userinfotbl.ajax.reload();
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

             $(document).on('click', '#statusBtn', function(){
                let userId = $(this).data('id');
                let userStatus = $(this).data('status');

                $.ajax({
                    type:'PUT',
                    url:'user/status',
                    data:{
                        user_id:userId,
                        status:userStatus,
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
                        userinfotbl.ajax.reload();
                    },
                    error: function(error){
                        console.log('error');
                    }

                });
            });











        });



    </script>


@endsection
