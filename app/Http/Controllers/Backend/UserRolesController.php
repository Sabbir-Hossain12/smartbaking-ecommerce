<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\Models\User;
use DataTables;

class UserRolesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $roles =Role::where('guard_name','web')->get();
        return view('backend.content.userroles.index',['roles'=>$roles]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $exist =Role::where('name',$request->roleName)->where('guard_name','web')->first();
        if($exist){
            return redirect()->back()->with('error','Role already exist');
        }else{
            $role = Role::create(['name' => $request->roleName,'guard_name' => 'web']);
            if(empty($role)){
                return redirect()->back()->with('error','Something went wrong');
            }else{
                $permissions =$request->permission;
                if(!empty($permissions)){
                    $role->syncPermissions($permissions);
                }
                return redirect()->back()->with('message','Role created successfully');
            }
        }


    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $allpermissions =Permission::where('guard_name','web')->get();
        $permission_groups =User::getPermissionGroups();
        return view('backend.content.userroles.create',['allpermissions'=>$allpermissions,'permission_groups'=>$permission_groups]);
    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $role =Role::findById($id,'web');
        $allpermissions =Permission::where('guard_name','web')->get();
        $permission_groups =User::getPermissionGroups();
        return view('backend.content.userroles.edit',['role'=>$role,'allpermissions'=>$allpermissions,'permission_groups'=>$permission_groups]);
    }

    public function show($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {

        $role =Role::findById($id,'web');
        if(empty($role)){
            return redirect()->back()->with('error','Something went wrong');
        }else{
            $permissions =$request->permission;
            if(!empty($permissions)){
                $role->syncPermissions($permissions);
            }
            return redirect()->back()->with('message','Role Updated Successfully');
        }

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $role =Role::findById($id,'web');
        if(is_null($role)){
            return redirect()->back()->with('error','Something went wrong');
        }else{
            $role->delete();
            return redirect()->back()->with('message','Role Deleted Successfully');
        }
    }

}
