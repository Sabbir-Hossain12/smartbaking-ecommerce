<?php

namespace App\Http\Controllers;

use App\Models\Courier;
use App\Models\Admin;
use Illuminate\Http\Request;
use DB;
use DataTables;

class ReportController extends Controller
{
    public function courieruserreport()
    {
        return view('admin.content.report.courieruserreport');
    }

    public function paymentreport(){
        return view('admin.content.report.paymentreport');
    }

    public function productreport()
    {
        return view('admin.content.report.productreport');
    }
    public function courierreport()
    {
        return view('admin.content.report.courierreport');
    }
    public function userreport()
    {
        return view('admin.content.report.userreport');
    }


    public function courieruserreportdata(Request $request)
    {

        $orders  = DB::table('orders')
            ->select('orders.*', 'customers.customerName', 'customers.customerPhone', 'customers.customerAddress', 'couriers.courierName', 'cities.cityName', 'zones.zoneName', 'admins.name')
            ->join('customers', 'orders.id', '=', 'customers.order_id')
            ->leftJoin('couriers', 'orders.courier_id', '=', 'couriers.id')
            ->leftJoin('cities', 'orders.city_id', '=', 'cities.id')
            ->leftJoin('zones', 'orders.zone_id', '=', 'zones.id')
            ->leftJoin('admins', 'orders.admin_id', '=', 'admins.id');

        if ($request['startDate'] != '' && $request['endDate'] != '') {
            if ($request['orderStatus'] == 'Delivered') {
                $orders = $orders->whereBetween('orders.deliveryDate', [$request['startDate'] . ' 00:00:00', $request['endDate'] . ' 23:59:59']);
            } else if ($request['orderStatus'] == 'Paid') {
                $orders = $orders->whereBetween('orders.completeDate', [$request['startDate'] . ' 00:00:00', $request['endDate'] . ' 23:59:59']);
            } else if ($request['orderStatus'] == 'Return') {
                $orders = $orders->whereBetween('orders.completeDate', [$request['startDate'] . ' 00:00:00', $request['endDate'] . ' 23:59:59']);
            } else {
                $orders = $orders->whereBetween('orders.orderDate', [$request['startDate'] . ' 00:00:00', $request['endDate'] . ' 23:59:59']);
            }
        }

        if ($request['courierID'] != '') {
            $orders = $orders->where('orders.courier_id', '=', $request['courierID']);
        }
        if ($request['orderStatus'] != 'All') {
            $orders = $orders->where('orders.status', 'like', $request['orderStatus']);
        }
        if ($request['userID'] != '') {
            $orders = $orders->where('orders.admin_id', '=', $request['userID']);
        }
        $orders = $orders->latest()->get();
        $order['data'] = $orders->map(function ($order) {
            $products = DB::table('orderproducts')->select('orderproducts.*')->where('order_id', '=', $order->id)->get();
            $orderProducts = '';
            foreach ($products as $product) {
                $orderProducts = $orderProducts . $product->quantity . ' x ' . $product->productName . '<br>';
            }
            $order->products = rtrim($orderProducts, '<br>');
            return $order;
        });
        return json_encode($order);
    }

    public function courierreportdata(Request $request)
    {
        $response = [];
        if ($request['courierID'] == '') {
            $couriers = Courier::all();
            foreach ($couriers as $courier) {
                $temp['courier'] = $courier->courierName;
                $temp['date'] = $request['startDate'] . ' to ' . $request['endDate'];
                $temp['all'] = $this->getDateCourier($request['startDate'], $request['endDate'], $courier->id, '');
                $temp['processing'] = $this->getDateCourier($request['startDate'], $request['endDate'], $courier->id, 'Processing');
                $temp['pendingPayment'] = $this->getDateCourier($request['startDate'], $request['endDate'], $courier->id, 'Payment Pending');
                $temp['onHold'] = $this->getDateCourier($request['startDate'], $request['endDate'], $courier->id, 'On Hold');
                $temp['canceled'] = $this->getDateCourier($request['startDate'], $request['endDate'], $courier->id, 'Canceled');
                $temp['invoiced'] = $this->getDateCourier($request['startDate'], $request['endDate'], $courier->id, 'Invoiced');
                $temp['stockOut'] = $this->getDateCourier($request['startDate'], $request['endDate'], $courier->id, 'Stock Out');
                $temp['delivered'] = $this->getDateCourier($request['startDate'], $request['endDate'], $courier->id, 'Delivered');
                $temp['paid'] = $this->getDateCourier($request['startDate'], $request['endDate'], $courier->id, 'Paid');
                $temp['paidAmount'] = $this->getDateCourierAmount($request['startDate'], $request['endDate'], $courier->id, 'Paid');
                $temp['return'] = $this->getDateCourier($request['startDate'], $request['endDate'], $courier->id, 'Return');
                array_push($response, $temp);
            }
        } else {
            $courier = Courier::find($request['courierID']);
            $temp['courier'] = $courier->courierName;
            $temp['date'] = $request['startDate'] . ' to ' . $request['endDate'];
            $temp['all'] = $this->getDateCourier($request['startDate'], $request['endDate'], $courier->id, '');
            $temp['processing'] = $this->getDateCourier($request['startDate'], $request['endDate'], $courier->id, 'Processing');
            $temp['pendingPayment'] = $this->getDateCourier($request['startDate'], $request['endDate'], $courier->id, 'Payment Pending');
            $temp['onHold'] = $this->getDateCourier($request['startDate'], $request['endDate'], $courier->id, 'On Hold');
            $temp['canceled'] = $this->getDateCourier($request['startDate'], $request['endDate'], $courier->id, 'Canceled');
            $temp['invoiced'] = $this->getDateCourier($request['startDate'], $request['endDate'], $courier->id, 'Invoiced');
            $temp['stockOut'] = $this->getDateCourier($request['startDate'], $request['endDate'], $courier->id, 'Stock Out');
            $temp['delivered'] = $this->getDateCourier($request['startDate'], $request['endDate'], $courier->id, 'Delivered');
            $temp['paid'] = $this->getDateCourier($request['startDate'], $request['endDate'], $courier->id, 'Paid');
            $temp['paidAmount'] = $this->getDateCourierAmount($request['startDate'], $request['endDate'], $courier->id, 'Paid');
            $temp['return'] = $this->getDateCourier($request['startDate'], $request['endDate'], $courier->id, 'Return');
            array_push($response, $temp);
        }
        $result['data'] = $response;
        return json_encode($result);
    }

    public function getDateCourier($startDate, $endDate, $courierID, $status)
    {
        $orders  = DB::table('orders')
        ->select('orders.*', 'couriers.courierName')
        ->leftJoin('couriers', 'orders.courier_id', '=', 'couriers.id');
        $orders = $orders->where('orders.courier_id', '=', $courierID);

        if ($startDate != '' && $endDate != '') {
            $orders = $orders->whereBetween('orders.orderDate', [$startDate . ' 00:00:00', $endDate . ' 23:59:59']);
        }

        if (!empty($status)) {
            if ($status == 'Completed') {
                $orders = $orders->Where('orders.status', '=', $status)->orWhere('orders.status', '=', 'Pending Invoiced');
            } else {
                $orders = $orders->Where('orders.status', '=', $status);
            }
        }
        return $orders->get()->count();
    }

    public function getDateCourierAmount($startDate, $endDate, $courierID, $status)
    {
        $orders  = DB::table('orders')
        ->select('orders.*', 'couriers.courierName')
        ->leftJoin('couriers', 'orders.courier_id', '=', 'couriers.id');
        $orders = $orders->where('orders.courier_id', '=', $courierID);

        if ($startDate != '' && $endDate != '') {
            $orders = $orders->whereBetween('orders.orderDate', [$startDate . ' 00:00:00', $endDate . ' 23:59:59']);
        }
        if (!empty($status)) {
            if ($status == 'Completed') {
                $orders = $orders->whereIn('orders.status', ['Completed', 'Pending Invoiced']);
            } else {
                $orders = $orders->Where('orders.status', '=', $status);
            }
        }
        return $orders->get()->sum('subTotal');
    }



    public function userreportdata(Request $request)
    {
        $response = [];
        if ($request['userID'] == '') {
            $users = Admin::whereHas('roles', function($q) { $q->where('name', 'user'); })->get();
            foreach ($users as $user) {
                $temp['name'] = $user->name;
                $temp['date'] = $request['startDate'] . ' to ' . $request['endDate'];
                $temp['all'] = $this->getDateUser($request['startDate'], $request['endDate'], $user->id, '');
                $temp['processing'] = $this->getDateUser($request['startDate'], $request['endDate'], $user->id, 'Processing');
                $temp['pendingPayment'] = $this->getDateUser($request['startDate'], $request['endDate'], $user->id, 'Payment Pending');
                $temp['onHold'] = $this->getDateUser($request['startDate'], $request['endDate'], $user->id, 'On Hold');
                $temp['pendingCanceled'] = $this->getDateUser($request['startDate'], $request['endDate'], $user->id, 'Pending Canceled');
                $temp['canceled'] = $this->getDateUser($request['startDate'], $request['endDate'], $user->id, 'Canceled');
                $temp['completed'] = $this->getDateUser($request['startDate'], $request['endDate'], $user->id, 'Completed');
                $temp['pendinginvoiced'] = $this->getDateUser($request['startDate'], $request['endDate'], $user->id, 'Pending Invoiced');
                $temp['checkedInvoiced'] = $this->getDateUser($request['startDate'], $request['endDate'], $user->id, 'Checked Invoiced');
                $temp['invoiced'] = $this->getDateUser($request['startDate'], $request['endDate'], $user->id, 'Invoiced');
                $temp['stockOut'] = $this->getDateUser($request['startDate'], $request['endDate'], $user->id, 'Stock Out');
                $temp['delivered'] = $this->getDateUser($request['startDate'], $request['endDate'], $user->id, 'Delivered');
                $temp['paid'] = $this->getDateUser($request['startDate'], $request['endDate'], $user->id, 'Paid');
                $temp['paidAmount'] = $this->getDateUserAmount($request['startDate'], $request['endDate'], $user->id, 'Paid');
                $temp['return'] = $this->getDateUser($request['startDate'], $request['endDate'], $user->id, 'Return');
                array_push($response, $temp);
            }
        } else {
            $user = Admin::find($request['userID']);
            $temp['name'] = $user->name;
            $temp['date'] = $request['startDate'] . ' to ' . $request['endDate'];
            $temp['all'] = $this->getDateUser($request['startDate'], $request['endDate'], $user->id, '');
            $temp['processing'] = $this->getDateUser($request['startDate'], $request['endDate'], $user->id, 'Processing');
            $temp['pendingPayment'] = $this->getDateUser($request['startDate'], $request['endDate'], $user->id, 'Payment Pending');
            $temp['onHold'] = $this->getDateUser($request['startDate'], $request['endDate'], $user->id, 'On Hold');
            $temp['pendingCanceled'] = $this->getDateUser($request['startDate'], $request['endDate'], $user->id, 'Pending Canceled');
            $temp['canceled'] = $this->getDateUser($request['startDate'], $request['endDate'], $user->id, 'Canceled');
            $temp['completed'] = $this->getDateUser($request['startDate'], $request['endDate'], $user->id, 'Completed');
            $temp['pendinginvoiced'] = $this->getDateUser($request['startDate'], $request['endDate'], $user->id, 'Pending Invoiced');
            $temp['checkedInvoiced'] = $this->getDateUser($request['startDate'], $request['endDate'], $user->id, 'Checked Invoiced');
            $temp['invoiced'] = $this->getDateUser($request['startDate'], $request['endDate'], $user->id, 'Invoiced');
            $temp['stockOut'] = $this->getDateUser($request['startDate'], $request['endDate'], $user->id, 'Stock Out');
            $temp['delivered'] = $this->getDateUser($request['startDate'], $request['endDate'], $user->id, 'Delivered');
            $temp['paid'] = $this->getDateUser($request['startDate'], $request['endDate'], $user->id, 'Paid');
            $temp['paidAmount'] = $this->getDateUserAmount($request['startDate'], $request['endDate'], $user->id, 'Paid');
            $temp['return'] = $this->getDateUser($request['startDate'], $request['endDate'], $user->id, 'Return');
            array_push($response, $temp);
        }
        $result['data'] = $response;
        return json_encode($result);
    }
    public function getDateUser($startDate, $endDate, $userID, $status)
    {
        $orders  = DB::table('orders')
        ->select('orders.*', 'couriers.courierName')
        ->leftJoin('couriers', 'orders.courier_id', 'couriers.id');
        $orders = $orders->where('orders.admin_id',  $userID);

        if ($startDate != '' && $endDate != '') {
            $orders = $orders->whereBetween('orders.orderDate', [$startDate . ' 00:00:00', $endDate . ' 23:59:59']);
        }
        if (!empty($status)) {
            if ($status == 'Completed') {
                $orders = $orders->Where('orders.status', $status);
            } else {
                $orders = $orders->Where('orders.status', $status);
            }
        }
        return $orders->get()->count();
    }

    public function getDateUserAmount($startDate, $endDate, $userID, $status)
    {
        $orders  = DB::table('orders')
        ->select('orders.*', 'couriers.courierName')
        ->leftJoin('couriers', 'orders.courier_id',  'couriers.id');
        $orders = $orders->where('orders.admin_id',  $userID);

        if ($startDate != '' && $endDate != '') {
            $orders = $orders->whereBetween('orders.orderDate', [$startDate . ' 00:00:00', $endDate . ' 23:59:59']);
        }
        if (!empty($status)) {
            if ($status == 'Completed') {
                $orders = $orders->Where('orders.status', '=', $status)->orWhere('orders.status', '=', 'Pending Invoiced');
            } else {
                $orders = $orders->Where('orders.status', '=', $status);
            }
        }
        return $ar=$orders->get()->sum('subTotal');
    }

    public function paymentreportdata(Request $request)
    {
        $orders = DB::table('paymentcompletes')
        ->join('payments', 'paymentcompletes.payment_id', '=', 'payments.id')
        ->join('admins', 'paymentcompletes.userID', '=', 'admins.id')
        ->join('paymenttypes', 'paymentcompletes.payment_type_id', '=', 'paymenttypes.id');

        if ($request['startDate'] != '' && $request['endDate'] != '') {
            $orders = $orders->whereBetween('paymentcompletes.date', [$request['startDate'] . ' 00:00:00', $request['endDate'] . ' 23:59:59']);
        }
        if ($request['userID'] != '') {
            $orders = $orders->where('paymentcompletes.userID', '=', $request['userID']);
        }
        if ($request['paymentID'] != '') {
            $orders = $orders->where('paymentcompletes.payment_id', '=', $request['paymentID']);
        }
        if ($request['paymentTypeID'] != '') {
            $orders = $orders->where('paymentcompletes.payment_type_id', '=', $request['paymentTypeID']);
        }
        $orders = $orders->where('paymentcompletes.amount', '!=', 0);
        return DataTables::of($orders)->make();
    }


    public function productreportdata(Request $request)
    {

        $status  = $request->input('orderStatus');

        $orders = DB::table('orders')
            ->join('orderproducts', 'orders.id', '=', 'orderproducts.order_id')
            ->select('orders.status', 'orders.deliveryDate', 'orders.completeDate', 'orders.orderDate', 'orderproducts.*', DB::raw('COUNT(orderproducts.order_id) as total_amount'))
            ->groupBy('orderproducts.product_id');



        if ($status != 'All' && $status != 'Pending Invoiced') {
            $orders  = $orders->where('orders.status', 'like', $status);
        }
        if ($status == 'Pending Invoiced') {
            $orders = $orders->whereIn('orders.status', ['Completed', 'Pending Invoiced']);
        }



        if ($request['startDate'] != '' && $request['endDate'] != '') {
            if ($request['orderStatus'] == 'Delivered') {
                $orders = $orders->whereBetween('orders.deliveryDate', [$request['startDate'], $request['endDate']]);
            } else if ($request['orderStatus'] == 'Paid') {
                $orders = $orders->whereBetween('orders.completeDate', [$request['startDate'], $request['endDate']]);
            } else if ($request['orderStatus'] == 'Return') {
                $orders = $orders->whereBetween('orders.completeDate', [$request['startDate'], $request['endDate']]);
            } else {

                $orders = $orders->whereBetween('orders.orderDate', [$request['startDate'], $request['endDate']]);
            }
        }



        if ($request['courierID'] != '') {
            $orders = $orders->where('orders.courier_id', '=', $request['courierID']);
        }

        return DataTables::of($orders)->make();
    }

























}
