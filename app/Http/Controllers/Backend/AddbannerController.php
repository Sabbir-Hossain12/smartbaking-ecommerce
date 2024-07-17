<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;

use App\Models\Addbanner;
use Illuminate\Http\Request;

class AddbannerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $addbanners =Addbanner::all();
        return view('backend.content.addbanner.index',['addbanners'=>$addbanners]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function statusupdate(Request $request,$id)
    {
        $addbanner =Addbanner::findOrfail($id);
        $addbanner->status=$request->status;
        $addbanner->update();
        return redirect()->back()->with('message','Add banner status updated');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Addbanner  $addbanner
     * @return \Illuminate\Http\Response
     */
    public function show(Addbanner $addbanner)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Addbanner  $addbanner
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $addbanner =Addbanner::findOrfail($id);
        return view('backend.content.addbanner.edit',['addbanner'=>$addbanner]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Addbanner  $addbanner
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $addbanner =Addbanner::findOrfail($id);
        $addbanner->add_link=$request->add_link;
        if($request->add_image){
            if($addbanner->add_image=='public/webview/assets/images/banners/home-banner1.jpg'){

            }else{
                unlink($addbanner->add_image);
            }
            $add_image = $request->file('add_image');
            $name = time() . "_" . $add_image->getClientOriginalName();
            $uploadPath = ('public/images/addbanner/');
            $add_image->move($uploadPath, $name);
            $add_imageImgUrl = $uploadPath . $name;
            $addbanner->add_image = $add_imageImgUrl;
        }
        $addbanner->update();
        return redirect()->route('admin.addbanners.index')->with('message','Add Banner Updated');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Addbanner  $addbanner
     * @return \Illuminate\Http\Response
     */
    public function destroy(Addbanner $addbanner)
    {
        //
    }
}