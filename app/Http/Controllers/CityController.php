<?php

namespace App\Http\Controllers;

use App\Models\City;
use App\Models\Courier;
use Illuminate\Http\Request;
use DataTables;


class CityController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $couriers =Courier::where('status', 'Active')->where('hasCity','on')->get();
        return view('admin.content.city.city',['couriers'=> $couriers]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function citydata()
    {
        $cities = City::with('couriers')->get();
        return Datatables::of($cities)
            ->addColumn('action', function ($cities) {
                return '<a href="#" type="button" id="editCityBtn" data-id="' . $cities->id . '"   class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#editmainCity" ><i class="bi bi-pencil-square"></i></a>
                <a href="#" type="button" id="deleteCityBtn" data-id="' . $cities->id . '" class="btn btn-danger btn-sm" ><i class="bi bi-archive" ></i></a>';
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
        $city =City::create($request->all());
        return response()->json($city, 200);
    }



    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\City  $city
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $city = City::findOrfail($id);
        return response()->json($city, 200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\City  $city
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $city = City::findOrfail($id)->update($request->all());
        return response()->json($city, 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\City  $city
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $city = City::findOrfail($id);
        $city->delete();
        return response()->json('delete success', 200);
    }

    public function updatestatus(Request $request)
    {

        $city = City::Where('id', $request->city_id)->first();
        $city->status = $request->status;
        $city->save();

        return response()->json($city, 200);
    }











}