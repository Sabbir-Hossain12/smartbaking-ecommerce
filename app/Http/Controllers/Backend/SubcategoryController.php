<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;

use App\Models\Subcategory;
use App\Models\Category;
use Illuminate\Http\Request;
use DataTables;

class SubcategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $categories =Category::where('status','Active')->get();
        return view('backend.content.subcategory.index',['categories'=>$categories]);
    }



    public function store(Request $request)
    {
        $subcategory =new Subcategory();
        $subcategory->sub_category_name =$request->sub_category_name;
        $subcategory->category_id =$request->category_id;
        $subcategory_icon = $request->file('subcategory_icon');
        $name = time() . "_" . $subcategory_icon->getClientOriginalName();
        $uploadPath = ('public/images/subcategory/');
        $subcategory_icon->move($uploadPath, $name);
        $subcategory_iconImgUrl = $uploadPath . $name;
        $subcategory->subcategory_icon = $subcategory_iconImgUrl;
        $subcategory->save();
        return response()->json($subcategory, 200);
    }

    public function subcategorydata()
    {
        $subcategorys = Subcategory::with('categories')->get();
        return Datatables::of($subcategorys)
            ->addColumn('action', function ($subcategorys) {
                return '<a href="#" type="button" id="editSubcategoryBtn" data-id="' . $subcategorys->id . '"   class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#editmainSubcategory" ><i class="bi bi-pencil-square"></i></a>
                <a href="#" type="button" id="deleteSubcategoryBtn" data-id="' . $subcategorys->id . '" class="btn btn-danger btn-sm" ><i class="bi bi-archive" ></i></a>';
            })

            ->make(true);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Subcategory  $subcategory
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $subcategory = Subcategory::findOrfail($id);
        return response()->json($subcategory, 200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Subcategory  $subcategory
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $subcategory = Subcategory::findOrfail($id);
        $subcategory->sub_category_name =$request->sub_category_name;
        $subcategory->category_id =$request->category_id;

        if($request->subcategory_icon){
            if(isset($subcategory->subcategory_icon)){
                unlink($subcategory->subcategory_icon);
            }
            $subcategory_icon = $request->file('subcategory_icon');
            $name = time() . "_" . $subcategory_icon->getClientOriginalName();
            $uploadPath = ('public/images/category/');
            $subcategory_icon->move($uploadPath, $name);
            $subcategory_iconImgUrl = $uploadPath . $name;
            $subcategory->subcategory_icon = $subcategory_iconImgUrl;
        }

        $subcategory->save();
        return response()->json($subcategory, 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Subcategory  $subcategory
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $subcategory = Subcategory::findOrfail($id);
        $subcategory->delete();
        return response()->json('success', 200);
    }

    public function statusupdate(Request $request)
    {
        $subcategory = Subcategory::where('id',$request->subcategory_id)->first();
        $subcategory->status=$request->status;
        $subcategory->update();
        return response()->json($subcategory, 200);
    }
}