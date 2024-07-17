<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;

use App\Models\Attribute;
use Illuminate\Http\Request;
use DataTables;

class AttributeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('backend.content.attribute.index');
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $attribute= new Attribute();
        $attribute->attribute_name =$request->attribute_name;
        $attribute->save();
        return response()->json($attribute, 200);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Attribute  $attribute
     * @return \Illuminate\Http\Response
     */
    public function attributedata()
    {
        $attribute = Attribute::all();
        return Datatables::of($attribute)
            ->addColumn('action', function ($attribute) {
                return '<a href="#" type="button" id="editAttributeBtn" data-id="' . $attribute->id . '"   class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#editmainAttribute" ><i class="bi bi-pencil-square"></i></a>
                <a href="#" type="button" id="deleteAttributeBtn" data-id="' . $attribute->id . '" class="btn btn-danger btn-sm" ><i class="bi bi-archive" ></i></a>';
            })

            ->make(true);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Attribute  $attribute
     * @return \Illuminate\Http\Response
     */
    public function edit( $id)
    {
        $attribute =Attribute::findOrfail($id);
        return response()->json($attribute, 200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Attribute  $attribute
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $attribute =Attribute::findOrfail($id);
        $attribute->attribute_name =$request->attribute_name;
        $attribute->update();
        return response()->json($attribute, 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Attribute  $attribute
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $attribute =Attribute::where('id',$id)->first();
        $attribute->delete();
        return response()->json('success', 200);
    }

    public function statusupdate(Request $request)
    {
        $attribute =Attribute::where('id',$request->attribute_id)->first();
        $attribute->status=$request->status;
        $attribute->update();
        return response()->json($attribute, 200);
    }
}