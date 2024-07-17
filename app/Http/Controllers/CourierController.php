<?php

namespace App\Http\Controllers;

use App\Models\Courier;
use Illuminate\Http\Request;
use DataTables;


class CourierController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('admin.content.courier.courier');
    }

    public function courierdata()
    {
        $courierss = Courier::all();
        return Datatables::of($courierss)
            ->addColumn('action', function ($courierss) {
                return '<a href="#" type="button" id="editCourierBtn" data-id="' . $courierss->id . '"   class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#editmainCourier" ><i class="bi bi-pencil-square"></i></a>
                <a href="#" type="button" id="deleteCourierBtn" data-id="' . $courierss->id . '" class="btn btn-danger btn-sm" ><i class="bi bi-archive" ></i></a>';
            })

            ->make(true);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $courier = Courier::create($request->all());
        return response()->json($request);
    }



    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Courier  $courier
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $courier = Courier::findOrfail($id);
        return response()->json($courier, 200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Courier  $courier
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,$id)
    {
        $courier = Courier::findOrfail($id);
        $courier->courierName = $request->courierName;

        if($request->hasZone){
            $courier->hasZone = $request->hasZone;
        }else{
            $courier->hasZone = 'off';
        }

        if ($request->hasCity) {
            $courier->hasCity = $request->hasCity;
        }else{
            $courier->hasCity = 'off';
        }

        $courier->courierCharge = $request->courierCharge;

        $courier->save();
        return response()->json($courier, 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Courier  $courier
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $courier = Courier::findOrfail($id);
        $courier->delete();
        return response()->json('delete success');
    }

    public function updatestatus(Request $request)
    {

        $courier = Courier::Where('id', $request->courier_id)->first();
        $courier->status = $request->status;
        $courier->save();

        return response()->json($courier, 200);
    }








}