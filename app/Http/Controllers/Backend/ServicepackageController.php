<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;

use App\Models\Servicepackage;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;
use DataTables;

class ServicepackageController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $roles =Role::where('guard_name','web')->get();
        return view('backend.content.servicepackage.index',['roles'=>$roles]);
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $exist =Servicepackage::where('roles',$request->roles)->first();
        if(isset($exist)){
            return response()->json('exist', 200);
        }else{
            $servicepackage =new Servicepackage();
            $servicepackage->roles=$request->roles;
            $servicepackage->servicepackage_name=$request->servicepackage_name;
            $servicepackage->package_text=$request->package_text;
            $servicepackage->save();
        }
        return response()->json($servicepackage, 200);

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Servicepackage  $servicepackage
     * @return \Illuminate\Http\Response
     */
    public function servicepackagedata()
    {
        $servicepackage = Servicepackage::all();
        return Datatables::of($servicepackage)
            ->addColumn('role', function ($servicepackage) {
                return Role::where('id',$servicepackage->roles)->pluck('name');
            })
            ->addColumn('action', function ($servicepackage) {
                return '<a href="#" type="button" id="editServicepackageBtn" data-id="' . $servicepackage->id . '"   class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#editmainServicepackage" ><i class="bi bi-pencil-square"></i></a>';
            })

            ->make(true);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Servicepackage  $servicepackage
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $servicepackage =Servicepackage::findOrfail($id);
        return response()->json($servicepackage, 200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Servicepackage  $servicepackage
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,  $id)
    {
        $servicepackage =Servicepackage::findOrfail($id);
        $servicepackage->servicepackage_name=$request->servicepackage_name;
        $servicepackage->package_text=$request->package_text;
        $servicepackage->update();
        return response()->json($servicepackage, 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Servicepackage  $servicepackage
     * @return \Illuminate\Http\Response
     */
    public function statusupdate(Request $request)
    {
        $servicepackage =Servicepackage::where('id',$request->servicepackage_id)->first();
        $servicepackage->status=$request->status;
        $servicepackage->update();
        return response()->json($servicepackage, 200);
    }
}