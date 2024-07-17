<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;

use App\Models\Attrvalue;
use App\Models\Attribute;
use Illuminate\Http\Request;
use DataTables;

class AttrvalueController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $attributes =Attribute::where('status','Active')->get();
        return view('backend.content.attribute.value',['attributes'=>$attributes]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $attr =Attribute::where('id',$request->attribute_id)->first();
        $attrvalue=new Attrvalue();
        $attrvalue-> value=$request-> value;
        $attrvalue-> attribute_id=$request-> attribute_id;
        $attrvalue->attribute_name =$attr->attribute_name;
        $attrvalue->save();
        return response()->json($attrvalue, 200);
    }

     public function attrvaluedata()
    {
        $attrvalue = Attrvalue::all();
        return Datatables::of($attrvalue)
            ->addColumn('action', function ($attrvalue) {
                return '<a href="#" type="button" id="editAttrvalueBtn" data-id="' . $attrvalue->id . '"   class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#editmainAttrvalue" ><i class="bi bi-pencil-square"></i></a>
                <a href="#" type="button" id="deleteAttrvalueBtn" data-id="' . $attrvalue->id . '" class="btn btn-danger btn-sm" ><i class="bi bi-archive" ></i></a>';
            })

            ->make(true);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Attrvalue  $attrvalue
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $attrvalue =Attrvalue::findOrfail($id);
        return response()->json($attrvalue, 200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Attrvalue  $attrvalue
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $attrvalue =Attrvalue::findOrfail($id);
        $attr =Attribute::where('id',$request->attribute_id)->first();
        $attrvalue-> value=$request-> value;
        $attrvalue-> attribute_id=$request-> attribute_id;
        $attrvalue->attribute_name =$attr->attribute_name;
        $attrvalue->update();
        return response()->json($attrvalue, 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Attrvalue  $attrvalue
     * @return \Illuminate\Http\Response
     */
     public function destroy($id)
    {
        $attrvalue =Attrvalue::where('id',$id)->first();
        $attrvalue->delete();
        return response()->json('success', 200);
    }

    public function statusupdate(Request $request)
    {
        $attrvalue =Attrvalue::where('id',$request->attrvalue_id)->first();
        $attrvalue->status=$request->status;
        $attrvalue->update();
        return response()->json($attrvalue, 200);
    }
}