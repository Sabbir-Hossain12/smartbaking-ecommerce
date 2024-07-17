@extends('backend.master')

@section('maincontent')
    @section('title')
        {{ env('APP_NAME') }}-Edit Role
    @endsection
<div class="container-fluid pt-4 px-4">
    <form name="form" id="UpdateRole" method="POST" action="{{ route("admin.roles.update",$role->id) }}" enctype="multipart/form-data">
        @method('PUT')
        @csrf
        <div class="row">
            <div class="col-sm-12 col-xl-12">
                <div class="bg-secondary rounded h-100 p-4">
                    <h6 class="mb-4">Edit Roles</h6>
                    <div class="row">
                        <div class="col-9">
                            <div class="mb-3">
                                <input type="text" class="form-control" value="{{ $role->name }}" id="roleName" name="roleName">
                            </div>
                        </div>
                        <div class="col-3">
                            <button type="submit" class="btn btn-primary">Update Role</button>
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
                        <input class="form-check-input m-0" type="checkbox" id="checkAllPermission" {{ App\Models\User::roleHasPermissions($role, $allpermissions) ?'checked' : '' }}>
                        <div class="w-100 ms-3">
                            <div class="d-flex w-100 align-items-center justify-content-between">
                                <span style="color: white;font-weight:bold"  id="checkAllPermission">Check All</span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        @php $i=1; @endphp
                        @forelse ($permission_groups as $permission_group)

                            @php
                                $permissions =App\Models\Admin::getPermissionsByGroupName($permission_group->name);
                                $j =1;
                            @endphp
                            <div class="col-3 mb-4">
                                <div class="d-flex align-items-center border-bottom py-2" style="text-transform: capitalize;">
                                    <input class="form-check-input m-0" type="checkbox" id="{{ $i }}Management" value="{{ $permission_group->name }}" onclick="chekPermissionsByGroup('role-{{ $i }}-management-checkbox',this)" {{ App\Models\User::roleHasPermissions($role, $permissions) ?'checked' : '' }}>
                                    <div class="w-100 ms-3">
                                        <div class="d-flex w-100 align-items-center justify-content-between">
                                            <span>{{ $permission_group->name }}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-9 mb-4 role-{{ $i }}-management-checkbox">
                                @forelse ($permissions as $permission)
                                    <div class="d-flex align-items-center border-bottom py-2">
                                        <input class="form-check-input m-0" type="checkbox" onclick="checkSinglePermission('role-{{ $i }}-management-checkbox','{{ $i }}Management',{{ count($permissions) }})" name="permission[]" {{ $role->hasPermissionTo($permission->name) ?'checked' :'' }} id="permission{{ $permission->id }}" value="{{ $permission->name }}">
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
@include('backend.partials.links.rolejs')
</script>

@endsection
