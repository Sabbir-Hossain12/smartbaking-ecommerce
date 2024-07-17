<?php

namespace App\Http\Controllers;

use App\Models\Payment;
use App\Models\Paymenttype;
use Illuminate\Http\Request;
use DataTables;

class PaymentController extends Controller
{
    public function index()
    {
        $paymenttypes = Paymenttype::where('status', 'Active')->get();
        return view('admin.content.payment.payment', ['paymenttypes' => $paymenttypes]);
    }

    public function paymentdata()
    {
        $payments = Payment::with('paymenttypes')->get();
        return Datatables::of($payments)
            ->addColumn('action', function ($payments) {
                return '<a href="#" type="button" id="editPaymentBtn" data-id="' . $payments->id . '"   class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#editmainPayments" ><i class="bi bi-pencil-square"></i></a>
                <a href="#" type="button" id="deletePaymentBtn" data-id="' . $payments->id . '" class="btn btn-danger btn-sm" ><i class="bi bi-archive" ></i></a>';
            })

            ->make(true);
    }

    public function store(Request $request)
    {
        $payment = Payment::create($request->all());
        return response()->json($payment, 200);
    }


    public function edit($id)
    {
        $payment = Payment::findOrfail($id);
        return response()->json($payment, 200);
    }

    public function update(Request $request, $id)
    {
        $payment = Payment::findOrfail($id);
        $payment->payment_type_id = $request->payment_type_id;
        $payment->paymentNumber = $request->paymentNumber;
        $payment->save();
        return response()->json($payment, 200);
    }


    public function destroy($id)
    {
        $payment = Payment::findOrfail($id);
        $payment->delete();
        return response()->json('delete success', 200);
    }

    public function updatestatus(Request $request)
    {

        $payment = Payment::Where('id', $request->payment_id)->first();
        $payment->status = $request->status;
        $payment->save();

        return response()->json($payment, 200);
    }


}