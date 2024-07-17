<?php

namespace App\Http\Controllers;

use App\Models\City;
use App\Models\Courier;
use App\Models\Zone;
use Illuminate\Http\Request;
use DataTables;

class ZoneController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $couriers = Courier::where('status', 'Active')->where('hasZone', 'on')->get();
        $cities = City::where('status', 'Active')->get();
        return view('admin.content.zone.zone', ['couriers' => $couriers,'cities'=>$cities]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function zonedata()
    {
        $zones = Zone::with(['couriers','cities']);
        return Datatables::of($zones)
            ->addColumn('action', function ($zones) {
                return '<a href="#" type="button" id="editZoneBtn" data-id="' . $zones->id . '"   class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#editmainZone" ><i class="bi bi-pencil-square"></i></a>
                <a href="#" type="button" id="deleteZoneBtn" data-id="' . $zones->id . '" class="btn btn-danger btn-sm" ><i class="bi bi-archive" ></i></a>';
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
        $zone = Zone::create($request->all());
        return response()->json($zone, 200);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Zone  $zone
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $zone = Zone::findOrfail($id);
        return response()->json($zone, 200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Zone  $zone
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $zone = Zone::findOrfail($id)->update($request->all());
        return response()->json($zone, 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Zone  $zone
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $zone = Zone::findOrfail($id);
        $zone->delete();
        return response()->json('delete success', 200);
    }

    public function updatestatus(Request $request)
    {

        $zone = Zone::Where('id', $request->zone_id)->first();
        $zone->status = $request->status;
        $zone->save();

        return response()->json($zone, 200);
    }


}