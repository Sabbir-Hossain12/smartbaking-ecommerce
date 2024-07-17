<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;

use App\Models\Slider;
use Illuminate\Http\Request;
use DataTables;

class SliderController extends Controller
{
     /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('backend.content.slider.index');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        if(empty($request->slider_title)){
            return response()->json('error', 200);
        }
        $slider =new Slider();
        $slider->slider_small_title =$request->slider_small_title;
        $slider->slider_title =$request->slider_title;
        $slider->slider_text =$request->slider_text;
        $slider->slider_btn_name =$request->slider_btn_name;
        $slider->slider_btn_link =$request->slider_btn_link;
        $sliderimage = $request->file('slider_image');
        $name = time() . "_" . $sliderimage->getClientOriginalName();
        $uploadPath = ('public/images/slider/');
        $sliderimage->move($uploadPath, $name);
        $sliderimageImgUrl = $uploadPath . $name;
        $slider->slider_image = $sliderimageImgUrl;
        $slider->save();
        return response()->json($slider, 200);
    }

    public function sliderdata()
    {
        $sliders = Slider::all();
        return Datatables::of($sliders)
            ->addColumn('action', function ($sliders) {
                return '<a href="#" type="button" id="editSliderBtn" data-id="' . $sliders->id . '"   class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#editmainSlider" ><i class="bi bi-pencil-square"></i></a>
                <a href="#" type="button" id="deleteSliderBtn" data-id="' . $sliders->id . '" class="btn btn-danger btn-sm" ><i class="bi bi-archive" ></i></a>';
            })

            ->make(true);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Slider  $slider
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $slider = Slider::findOrfail($id);
        return response()->json($slider, 200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Slider  $slider
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $slider = Slider::findOrfail($id);
        if(empty($request->slider_title)){
            return response()->json('error', 200);
        }
        $slider->slider_small_title =$request->slider_small_title;
        $slider->slider_title =$request->slider_title;
        $slider->slider_text =$request->slider_text;
        $slider->slider_btn_name =$request->slider_btn_name;
        $slider->slider_btn_link =$request->slider_btn_link;
        if($request->slider_image){
            unlink($slider->slider_image);
            $slider_image = $request->file('slider_image');
            $name = time() . "_" . $slider_image->getClientOriginalName();
            $uploadPath = ('public/images/slider/');
            $slider_image->move($uploadPath, $name);
            $slider_imageImgUrl = $uploadPath . $name;
            $slider->slider_image = $slider_imageImgUrl;
        }
        $slider->update();
        return response()->json($slider, 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Slider  $slider
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $slider = Slider::findOrfail($id);
        $slider->delete();
        return response()->json('success', 200);
    }

    public function statusupdate(Request $request)
    {
        $slider = Slider::where('id',$request->slider_id)->first();
        $slider->status=$request->status;
        $slider->update();
        return response()->json($slider, 200);
    }
}
