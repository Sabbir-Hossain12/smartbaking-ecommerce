<?php

namespace App\Http\Controllers;

use App\Models\Complain;
use App\Models\Complanenote;
use App\Models\Customer;
use App\Models\Order;
use App\Models\Orderproduct;
use App\Models\Admin;
use Illuminate\Http\Request;
use DataTables;
use Illuminate\Support\Facades\Auth;
use DB;

class ComplainController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {   $status ='all';
        return view('admin.content.complain.complain',['status' => $status]);
    }

    public function subindex($status)
    {
        return view('admin.content.complain.complain', ['status'=>$status]);
    }

    public function complaindata($status)
    {
        if($status ==='complainall'){
            $complains = Complain::with('admins');
        }else{
            $complains = Complain::with('admins')->where('admin_id',Auth::guard('admin')->user()->id)->where('status', '=', $status);
        }
        return Datatables::of($complains->orderBy('complains.id', 'DESC'))
            ->editColumn('user', function ($complains) {
                if ($complains->admins) {
                    return $complains->admins->name;
                } else {
                    return 'user not assign';
                }
            })
            ->addColumn('action', function ($complains) {
                return "<a href='javascript:void(0);' data-id='" . $complains->id . "' class='action-icon btn-editcomplain'> <i class='fas fa-1x fa-edit'></i></a>
                <a href='javascript:void(0);' data-id='" . $complains->id . "' id='deleteComplainBtn' class='action-icon btn-delete'> <i class='fas fa-trash-alt'></i></a>";
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

        $complainExist = Complain::query()->where([
            ['order_invoice_id', '=', $request->order_invoice_id]
        ])->get()->first();

        if(!$complainExist){
            $complain = new Complain();
            if($request->order_invoice_id){
                $complain->order_invoice_id = $request->order_invoice_id;
            }
            $complain->store_id = 1;
            $complain->site_name = env('APP_NAME');
            $complain->admin_id = Auth::guard('admin')->user()->id;
            $complain->customer_phone = $request->customer_phone;
            $complain->complain_message = $request->complain_message;
            $complain->complainDate = date('Y-m-d');
            $complain->save();
        }else{
            return back()->with('error', 'Duplicate entry');
        }

        return back()->with('message','Complain create successfully;');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Complain  $complain
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $complain = Complain::where('id', $id)->first();

        $customer = Customer::where('customerPhone', $complain->customer_phone)->latest()->take(1)->first();
        if ($customer) {
            $complainorder = Order::query()->where([
                ['id', '=', $customer->order_id],
            ])->get()->first();
        }
        $customeralls = Customer::where('customerPhone', $complain->customer_phone)->get();

        foreach($customeralls as $customerall){
            $orderalls [] =$complainorder = Order::with('orderproducts', 'admins', 'couriers', 'products', 'comments', 'cities', 'zones')
                ->join('customers', 'customers.order_id', '=', 'orders.id')
                ->select('orders.*', 'customers.customerPhone', 'customers.customerName', 'customers.customerAddress')
                ->where('orders.id',  $customerall->order_id)
                ->first();
        }


        return view('admin.content.complain.edit',['orderalls'=> $orderalls,'customer' =>$customer,'complain'=> $complain, 'complainorder'=> $complainorder]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Complain  $complain
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Complain $complain)
    {
        //
    }

    //status update


    public function updatestatus(Request $request)
    {
        $complain = Complain::Where('id', $request->complain_id)->first();
        $complain->status = $request->status;
        $complain->save();

        return response()->json($complain, 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Complain  $complain
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $complain =Complain::where('id',$id)->first();
        $complain->delete();
        return response()->json('complain delete successfully');
    }



}