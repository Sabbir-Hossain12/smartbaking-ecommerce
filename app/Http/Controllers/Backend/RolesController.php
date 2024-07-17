<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\Models\Admin;
use DataTables;

class RolesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $roles =Role::where('guard_name','admin')->get();
        return view('backend.content.roles.index',['roles'=>$roles]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $exist =Role::where('name',$request->roleName)->where('guard_name','admin')->first();
        if($exist){
            return redirect()->back()->with('error','Role already exist');
        }else{
            $role = Role::create(['name' => $request->roleName,'guard_name' => 'admin']);
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
        $allpermissions =Permission::where('guard_name','admin')->get();
        $permission_groups =Admin::getPermissionGroups();
        return view('backend.content.roles.create',['allpermissions'=>$allpermissions,'permission_groups'=>$permission_groups]);
    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $role =Role::findById($id,'admin');
        $allpermissions =Permission::where('guard_name','admin')->get();
        $permission_groups =Admin::getPermissionGroups();
        return view('backend.content.roles.edit',['role'=>$role,'allpermissions'=>$allpermissions,'permission_groups'=>$permission_groups]);
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

        $role =Role::findById($id,'admin');
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
        $role =Role::findById($id,'admin');
        if(is_null($role)){
            return redirect()->back()->with('error','Something went wrong');
        }else{
            $role->delete();
            return redirect()->back()->with('message','Role Deleted Successfully');
        }
    }

}
