<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\Models\Admin;
use DataTables;
use Illuminate\Support\Facades\Hash;

class AdminController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $admins =Admin::all();
        return view('backend.content.admins.index',['admins'=>$admins]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $admin=new Admin();
        $admin->name=$request->name;
        $admin->email=$request->email;
        $admin->password=Hash::make($request->password);
        $admin->phone=$request->phone;
        $admin->save();
        if($request->roles){
            $admin->assignRole($request->roles);
        }
        return redirect()->back()->with('message','Admin created successfully');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $roles =Role::where('guard_name','admin')->get();
        return view('backend.content.admins.create',['roles'=>$roles]);
    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $roles =Role::where('guard_name','admin')->get();
        $admin =Admin::where('id',$id)->first();
        return view('backend.content.admins.edit',['roles'=>$roles,'admin'=>$admin]);
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

        $admin=Admin::findOrfail($id);
        $admin->name=$request->name;
        $admin->email=$request->email;
        if($request->password){
            $admin->password=Hash::make($request->password);
        }
        $admin->phone=$request->phone;
        $admin->save();
        $admin->roles()->detach();
        if($request->roles){
            $admin->assignRole($request->roles);
        }

        return redirect()->back()->with('message','Admin updated successfully');

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $admin = Admin::where('id',$id)->first();
        if(is_null($admin)){
            return redirect()->back()->with('error','Something went wrong');
        }else{
            $admin->delete();
            return redirect()->back()->with('message','ADmin Deleted Successfully');
        }
    }

}
