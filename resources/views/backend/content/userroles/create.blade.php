@extends('backend.master')

@section('maincontent')

    @section('title')
        {{ env('APP_NAME') }}-Create New User Role
    @endsection

<div class="container-fluid pt-4 px-4">
    <form name="form" id="CreateRole" method="POST" action="{{ route("admin.userroles.store") }}" enctype="multipart/form-data">
        @csrf
        <div class="row">
            <div class="col-sm-12 col-xl-12">
                <div class="bg-secondary rounded h-100 p-4">
                    <h6 class="mb-4">Create New User Roles</h6>
                    <div class="row">
                        <div class="col-9">
                            <div class="mb-3">
                                <input type="text" class="form-control" id="roleName" name="roleName">
                            </div>
                        </div>
                        <div class="col-3">
                            <button type="submit" class="btn btn-primary">Create User Role</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-12 col-md-12 col-xl-12">
                <div class="h-100 bg-secondary rounded p-4 pt-0">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <h6 class="mb-0">Permission List</h6>
                        <a href="">Show All</a>
                    </div>
                    <div class="d-flex align-items-center border-bottom py-2" style="border: 1px solid black;border-left: 0;">
                        <input class="form-check-input m-0" type="checkbox" id="checkAllPermission">
                        <div class="w-100 ms-3">
                            <div class="d-flex w-100 align-items-center justify-content-between">
                                <span style="color: white;font-weight:bold"  id="checkAllPermission">Check All</span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        @php $i=1; @endphp
                        @forelse ($permission_groups as $permission_group)
                            <div class="col-3 mb-4">
                                <div class="d-flex align-items-center border-bottom py-2" style="text-transform: capitalize;">
                                    <input class="form-check-input m-0" type="checkbox" id="{{ $i }}Management" value="{{ $permission_group->name }}" onclick="chekPermissionsByGroup('role-{{ $i }}-management-checkbox',this)">
                                    <div class="w-100 ms-3">
                                        <div class="d-flex w-100 align-items-center justify-content-between">
                                            <span>{{ $permission_group->name }}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-9 mb-4 role-{{ $i }}-management-checkbox">
                                @php
                                    $permissions =App\Models\User::getPermissionsByGroupName($permission_group->name);
                                    $j =1;
                                @endphp
                                @forelse ($permissions as $permission)
                                    <div class="d-flex align-items-center border-bottom py-2">
                                        <input class="form-check-input m-0" type="checkbox" name="permission[]" id="permission{{ $permission->id }}" value="{{ $permission->name }}">
                                        <div class="w-100 ms-3">
                                            <div class="d-flex w-100 align-items-center justify-content-between">
                                                <span>{{ $permission->name }}</span>
                                            </div>
                                        </div>
                                    </div>
                                    @php $j++; @endphp
                                @empty

                                @endforelse
                            </div>
                            @php $i++; @endphp
                        @empty

                        @endforelse
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>

<script>

$('#checkAllPermission').click(function(){
    if($(this).is(':checked')){
        // checked all the checkbox
        $('input[type=checkbox]').prop('checked',true);
    }else{
        // unchecked all the checkbox
        $('input[type=checkbox]').prop('checked',false);
    }
});

function chekPermissionsByGroup(className , checkthis){
    const groupIdName =$('#'+checkthis.id);
    const classCheckBox = $('.'+className+' input');
    if(groupIdName.is(':checked')){
        // checked all the checkbox
        classCheckBox.prop('checked',true);
    }else{
        // unchecked all the checkbox
        classCheckBox.prop('checked',false);
    }
}

</script>

@endsection
