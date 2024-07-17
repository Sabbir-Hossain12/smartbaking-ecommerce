<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;

use App\Models\Brand;
use Illuminate\Http\Request;
use DataTables;

class BrandController extends Controller
{
     /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('backend.content.brand.index');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $brand =new Brand();
        $brand->brand_name =$request->brand_name;
        $brand_icon = $request->file('brand_icon');
        $name = time() . "_" . $brand_icon->getClientOriginalName();
        $uploadPath = ('public/images/brand/');
        $brand_icon->move($uploadPath, $name);
        $brand_iconImgUrl = $uploadPath . $name;
        $brand->brand_icon = $brand_iconImgUrl;
        $brand->save();
        return response()->json($brand, 200);
    }

    public function branddata()
    {
        $brands = Brand::all();
        return Datatables::of($brands)
            ->addColumn('action', function ($brands) {
                return '<a href="#" type="button" id="editBrandBtn" data-id="' . $brands->id . '"   class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#editmainBrand" ><i class="bi bi-pencil-square"></i></a>
                <a href="#" type="button" id="deleteBrandBtn" data-id="' . $brands->id . '" class="btn btn-danger btn-sm" ><i class="bi bi-archive" ></i></a>';
            })

            ->make(true);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Brand  $brand
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $brand = Brand::findOrfail($id);
        return response()->json($brand, 200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Brand  $brand
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $brand = Brand::findOrfail($id);
        $brand->brand_name =$request->brand_name;
        if($request->brand_icon){
            unlink($brand->brand_icon);
            $brand_icon = $request->file('brand_icon');
            $name = time() . "_" . $brand_icon->getClientOriginalName();
            $uploadPath = ('public/images/brand/');
            $brand_icon->move($uploadPath, $name);
            $brand_iconImgUrl = $uploadPath . $name;
            $brand->brand_icon = $brand_iconImgUrl;
        }
        $brand->save();
        return response()->json($brand, 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Brand  $brand
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $brand = Brand::findOrfail($id);
        $brand->delete();
        return response()->json('success', 200);
    }

    public function statusupdate(Request $request)
    {
        $brand = Brand::where('id',$request->brand_id)->first();
        $brand->status=$request->status;
        $brand->update();
        return response()->json($brand, 200);
    }
}
