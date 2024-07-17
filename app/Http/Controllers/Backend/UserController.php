<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\Models\User;
use DataTables;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $users =User::all();
        return view('backend.content.users.index',['users'=>$users]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $user=new User();
        $user->name=$request->name;
        $user->email=$request->email;
        $user->password=Hash::make($request->password);
        $user->phone=$request->phone;
        $user->save();
        if($request->roles){
            $user->assignRole($request->roles);
        }

        return redirect()->back()->with('message','User created successfully');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $roles =Role::where('guard_name','web')->get();
        return view('backend.content.users.create',['roles'=>$roles]);
    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $roles =Role::where('guard_name','web')->get();
        $user =User::where('id',$id)->first();
        return view('backend.content.users.edit',['roles'=>$roles,'user'=>$user]);
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

        $user=User::findOrfail($id);
        $user->name=$request->name;
        $user->email=$request->email;
        if($request->password){
            $user->password=Hash::make($request->password);
        }
        $user->phone=$request->phone;
        $user->save();
        $user->roles()->detach();
        if($request->roles){
            $user->assignRole($request->roles);
        }

        return redirect()->back()->with('message','User updated successfully');

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $user = User::where('id',$id)->first();
        if(is_null($user)){
            return redirect()->back()->with('error','Something went wrong');
        }else{
            $user->delete();
            return redirect()->back()->with('message','User Deleted Successfully');
        }
    }

}
