<?php

namespace App\Http\Controllers;

use App\Models\Complain;
use App\Models\Complanenote;
use App\Models\Admin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class ComplanenoteController extends Controller
{
    //complain assign user
    public function assignusertocomplain(Request $request)
    {

        $admin_id = $request['admin_id'];
        $ids = $request['ids'];
        if ($ids) {
            foreach ($ids as $id) {
                $order = Complain::find($id);
                $order->admin_id = $admin_id;
                $order->save();
                $comment = new Complanenote();
                $admin = Admin::where('id',$admin_id)->first();
                $comment->complain_id = $id;
                if ($admin->hasrole('superadmin')) {
                    $comment->comment = Auth::guard('admin')->user()->name . ' Successfully Assign #' . $id . ' Complain to Super Admin ' . $admin->name;
                } else if ($admin->hasrole('admin')) {
                    $comment->comment = Auth::guard('admin')->user()->name . ' Successfully Assign #' . $id . ' Complain to Admin ' . $admin->name;
                } else if ($admin->hasrole('manager')) {
                    $comment->comment = Auth::guard('admin')->user()->name . ' Successfully Assign #' . $id . ' Complain to Manager ' . $admin->name;
                }  else {
                    $comment->comment = Auth::guard('admin')->user()->name . ' Successfully Assign #' . $id . ' Complain to ' . $admin->name;
                }
                $comment->admin_id = $admin_id;
                $comment->save();
            }
            $response['status'] = 'success';
            $response['message'] = 'Successfully Assign User to this Complain';
        } else {
            $response['status'] = 'failed';
            $response['message'] = 'Unsuccessful to Assign User to this Complain';
        }
        return json_encode($response);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function createcomplain()
    {
        return view('admin.content.complain.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $complanenote =new Complanenote();
        $complanenote->comment = $request->comment;
        $complanenote->complain_id= $request->complain_id;
        $complanenote->admin_id= Auth::guard('admin')->user()->id;
        $request = $complanenote->save();
        if ($request) {
            $response['status'] = 'success';
            $response['message'] = 'Note Successfully add to Order';
        } else {
            $response['status'] = 'failed';
            $response['message'] = 'Unsuccessful to Update Order note';
        }
        return json_encode($response);
        die();
    }

    //comments get
    public function getComplainNote(Request $request)
    {
        $complain_id = $request['id'];
        $complanenote = Complanenote::where('complain_id',  $complain_id)->latest()->get();

        $complanenote['data'] = $complanenote->map(function ($complanenote) {
            $admin = DB::table('admins')->select('admins.name')->where('id', '=', $complanenote->admin_id)->get()->first();
            $complanenote->name = $admin->name;
            $complanenote->date = $complanenote->created_at->diffForHumans();
            return $complanenote;
        });
        return json_encode($complanenote);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Complanenote  $complanenote
     * @return \Illuminate\Http\Response
     */
    public function show(Complanenote $complanenote)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Complanenote  $complanenote
     * @return \Illuminate\Http\Response
     */
    public function edit(Complanenote $complanenote)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Complanenote  $complanenote
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Complanenote $complanenote)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Complanenote  $complanenote
     * @return \Illuminate\Http\Response
     */
    public function destroy(Complanenote $complanenote)
    {
        //
    }
}