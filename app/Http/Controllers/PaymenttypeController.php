<?php

namespace App\Http\Controllers;

use App\Models\Paymenttype;
use Illuminate\Http\Request;
use DataTables;

class PaymenttypeController extends Controller
{
    public function index()
    {
        return view('admin.content.paymenttype.paymenttype');
    }


    public function paymenttypedata()
    {
        $paymenttypes = Paymenttype::all();
        return Datatables::of($paymenttypes)
            ->addColumn('action', function ($paymenttypes) {
                return '<a href="#" type="button" id="editPaymenttypeBtn" data-id="' . $paymenttypes->id . '" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#editmainPaymenttype" ><i class="bi bi-pencil-square" ></i></a>
                <a href="#" type="button" id="deletePaymenttypeBtn" data-id="' . $paymenttypes->id . '" class="btn btn-danger btn-sm"><i class="bi bi-archive"></i></a>';
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
        $paymenttype = Paymenttype::create($request->all());
        return response()->json($paymenttype, 200);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\paymenttype  $paymenttype
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $paymenttype = Paymenttype::findOrfail($id);
        return response()->json($paymenttype, 200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\paymenttype  $paymenttype
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $paymenttype = Paymenttype::where('id', $id)->first();
        $paymenttype->paymentTypeName = $request->paymentTypeName;
        $paymenttype->save();
        return response()->json($paymenttype, 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\paymenttype  $paymenttype
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $paymenttype = Paymenttype::where('id', $id)->first();
        $paymenttype->delete();
        return response()->json('delete success');
    }

    public function updatestatus(Request $request)
    {

        $paymenttype = Paymenttype::Where('id', $request->paymenttype_id)->first();
        $paymenttype->status = $request->status;
        $paymenttype->save();

        return response()->json($paymenttype, 200);
    }
}