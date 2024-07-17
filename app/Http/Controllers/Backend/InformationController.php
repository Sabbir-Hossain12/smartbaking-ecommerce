<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Information;
use Illuminate\Http\Request;
use App\Models\Menu;

class InformationController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($slug)
    {
        if($slug=='about_us'){
            $title='About US';
        }else if($slug=='contact_us'){
            $title='Contact Us';
        }else if($slug=='shipping_guide'){
            $title='Shipping Guard';
        }else if($slug=='investor_relation'){
            $title='Investor Relation';
        }else if($slug=='company'){
            $title='Company';
        }else if($slug=='customer_service'){
            $title='Customer Service';
        }else if($slug=='help_center'){
            $title='Help Center';
        }else if($slug=='faq'){
            $title='FAQ';
        }else if($slug=='terms_codition'){
            $title='Terms & Conditions';
        }else{

        }

        $value=Information::where('key',$slug)->first();
        return view('backend.content.information.info',['title'=>$title,'slug'=>$slug,'value'=>$value]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function create($slug)
    {
        $menus =Menu::where('slug',$slug)->first();
        $value=Information::where('key',$slug)->first();
        return view('backend.content.information.menu',['menus'=>$menus,'slug'=>$slug,'value'=>$value]);
    }


    public function createpage(Request $request, $slug)
    {
        $value=Information::where('key',$slug)->first();
        if(isset($value)){
            $value->value=$request->value;
            $value->update();
            return redirect()->back()->with('message','Info Update Successfully.');
        }else{
            $valuenew=new Information();
            $valuenew->key=$request->key;
            $valuenew->value=$request->value;
            $valuenew->save();
            return redirect()->back()->with('message','Info created Successfully.');
        }

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */


    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Information  $information
     * @return \Illuminate\Http\Response
     */
    public function show(Information $information)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Information  $information
     * @return \Illuminate\Http\Response
     */
    public function edit(Information $information)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Information  $information
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $slug)
    {
        $value=Information::where('key',$slug)->first();
        $value->value=$request->value;
        $value->update();
        return redirect()->back()->with('message','Info Update Successfully.');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Information  $information
     * @return \Illuminate\Http\Response
     */
    public function destroy(Information $information)
    {
        //
    }
}
