<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;

use App\Models\Policymenu;
use Illuminate\Http\Request;
use DataTables;

class PolicymenuController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('backend.content.policymenu.index');
    }



    public function store(Request $request)
    {
        $policymenu =new Policymenu();
        $policymenu->policy_menu_name =$request->policy_menu_name;
        $policymenu->policy_text =$request->policy_text;
        $policymenu->save();
        return response()->json($policymenu, 200);
    }

    public function policymenudata()
    {
        $policymenus = Policymenu::all();
        return Datatables::of($policymenus)
            ->addColumn('action', function ($policymenus) {
                return '<a href="#" type="button" id="editPolicymenuBtn" data-id="' . $policymenus->id . '"   class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#editmainPolicymenu" ><i class="bi bi-pencil-square"></i></a>
                <a href="#" type="button" id="deletePolicymenuBtn" data-id="' . $policymenus->id . '" class="btn btn-danger btn-sm" ><i class="bi bi-archive" ></i></a>';
            })

            ->make(true);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Policymenu  $policymenu
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $policymenu = Policymenu::findOrfail($id);
        return response()->json($policymenu, 200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Policymenu  $policymenu
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $policymenu = Policymenu::findOrfail($id);
        $policymenu->policy_menu_name =$request->policy_menu_name;
        $policymenu->policy_text =$request->policy_text;
        $policymenu->save();
        return response()->json($policymenu, 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Policymenu  $policymenu
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $policymenu = Policymenu::findOrfail($id);
        $policymenu->delete();
        return response()->json('success', 200);
    }

    public function statusupdate(Request $request)
    {
        $policymenu = Policymenu::where('id',$request->policymenu_id)->first();
        $policymenu->status=$request->status;
        $policymenu->update();
        return response()->json($policymenu, 200);
    }
}