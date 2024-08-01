<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;

use App\Models\City;
use App\Models\Comment;
use App\Models\Courier;
use App\Models\Customer;
use App\Models\Invoice;
use App\Models\Order;
use App\Models\Orderproduct;
use App\Models\Payment;
use App\Models\Paymentcomplete;
use App\Models\Paymenttype;
use App\Models\Product;
use App\Models\Stock;
use App\Models\Store;
use App\Models\Admin;
use App\Models\Zone;
use Carbon\Carbon;
use Illuminate\Http\Request;
use DB;
use DataTables;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Http;
use Session;

class OrderController extends Controller
{


    public function orderByproductindex()
    {
        return view('admin.content.order.productfindbyorder');
    }

    public function findByproduct(Request $request)
    {
        $admin = Admin::where('email', Auth::guard('admin')->user()->email)->first();
        $order_ids =Orderproduct::where('productName','LIKE', "%{$request->product_name}%")->select('order_id')->get();

        if($request->date){
            if($admin->hasRole('superadmin') || $admin->hasRole('admin') || $admin->hasRole('manager')){
                if(isset($request->user_id)){
                    foreach($order_ids as $order_id){
                        $orders []=  Order::with([
                            'orderproducts'=>function ($query) { $query->select('id','order_id','productName','quantity','color','size');},
                            'admins'=> function ($query) { $query->select('id','name');},
                            'couriers'=> function ($query) { $query->select('id','courierName');},
                            'products'=> function ($query) { $query->select('id','ProductName','ProductRegularPrice');},
                            'comments'=> function ($query) { $query->select('id', 'order_id', 'comment','admin_id','status','created_at')->where('status',0);},
                            'cities'=> function ($query) { $query->select('id', 'courier_id', 'cityName');},
                            'zones'=> function ($query) { $query->select('id', 'courier_id','city_id', 'zoneName');}
                        ])->where('orders.id', $order_id->order_id)
                        ->where('orders.orderDate', $request->date)
                        ->where('admin_id',$request->user_id)
                        ->where('status',$request->status)
                        ->join('customers', 'customers.order_id', '=', 'orders.id')
                        ->select('orders.*', 'customers.customerPhone', 'customers.customerName', 'customers.customerAddress')->first();
                    }
                }else{
                    foreach($order_ids as $order_id){
                     $orders []=  Order::with([
                            'orderproducts'=>function ($query) { $query->select('id','order_id','productName','quantity','color','size');},
                            'admins'=> function ($query) { $query->select('id','name');},
                            'couriers'=> function ($query) { $query->select('id','courierName');},
                            'products'=> function ($query) { $query->select('id', 'ProductName','ProductRegularPrice');},
                            'comments'=> function ($query) { $query->select('id', 'order_id', 'comment','admin_id','status','created_at')->where('status',0);},
                            'cities'=> function ($query) { $query->select('id', 'courier_id', 'cityName');},
                            'zones'=> function ($query) { $query->select('id', 'courier_id','city_id', 'zoneName');}
                        ])->where('orders.id', $order_id->order_id)
                        ->where('orders.orderDate', $request->date)
                        ->where('status',$request->status)
                        ->join('customers', 'customers.order_id', '=', 'orders.id')
                        ->select('orders.*', 'customers.customerPhone', 'customers.customerName', 'customers.customerAddress')->first();
                    }
                }
            }else{
                foreach($order_ids as $order_id){
                    $orders []=  Order::with(
                        [
                            'orderproducts'=>function ($query) { $query->select('id','order_id','productName','quantity','color','size');},
                            'admins'=> function ($query) { $query->select('id','name');},
                            'couriers'=> function ($query) { $query->select('id','courierName');},
                            'products'=> function ($query) { $query->select('id','ProductName','ProductRegularPrice');},
                            'comments'=> function ($query) { $query->select('id', 'order_id', 'comment','admin_id','status','created_at')->where('status',0);},
                            'cities'=> function ($query) { $query->select('id', 'courier_id', 'cityName');},
                            'zones'=> function ($query) { $query->select('id', 'courier_id','city_id', 'zoneName');}
                        ]
                    )
                    ->where('orders.id', $order_id->order_id)
                    ->where('orders.orderDate', $request->date)
                    ->where('status',$request->status)
                    ->where('admin_id',Auth::guard('admin')->user()->id)
                    ->join('customers', 'customers.order_id', '=', 'orders.id')
                    ->select('orders.*', 'customers.customerPhone', 'customers.customerName', 'customers.customerAddress')->first();
                }
            }
            return view('admin.content.order.productbyorder',['orders'=> $orders]);
        }else{
            if($admin->hasRole('superadmin') || $admin->hasRole('admin') || $admin->hasRole('manager')){
                if(isset($request->user_id)){
                    foreach($order_ids as $order_id){
                        $orders []=  Order::with([
                            'orderproducts'=>function ($query) { $query->select('id','order_id','productName','quantity','color','size');},
                            'admins'=> function ($query) { $query->select('id','name');},
                            'couriers'=> function ($query) { $query->select('id','courierName');},
                            'products'=> function ($query) { $query->select('id', 'ProductName','ProductRegularPrice');},
                            'comments'=> function ($query) { $query->select('id', 'order_id', 'comment','admin_id','status','created_at')->where('status',0);},
                            'cities'=> function ($query) { $query->select('id', 'courier_id', 'cityName');},
                            'zones'=> function ($query) { $query->select('id', 'courier_id','city_id', 'zoneName');}
                        ])->where('orders.id', $order_id->order_id)
                        ->where('status',$request->status)
                        ->where('admin_id',$request->user_id)
                        ->join('customers', 'customers.order_id', '=', 'orders.id')
                        ->select('orders.*', 'customers.customerPhone', 'customers.customerName', 'customers.customerAddress')->first();
                    }
                }else{
                    foreach($order_ids as $order_id){
                        $orders []=  Order::with([
                            'orderproducts'=>function ($query) { $query->select('id','order_id','productName','quantity','color','size');},
                            'admins'=> function ($query) { $query->select('id','name');},
                            'couriers'=> function ($query) { $query->select('id','courierName');},
                            'products'=> function ($query) { $query->select('id', 'ProductName','ProductRegularPrice');},
                            'comments'=> function ($query) { $query->select('id', 'order_id', 'comment','admin_id','status','created_at')->where('status',0);},
                            'cities'=> function ($query) { $query->select('id', 'courier_id', 'cityName');},
                            'zones'=> function ($query) { $query->select('id', 'courier_id','city_id', 'zoneName');}
                        ])->where('orders.id', $order_id->order_id)
                        ->where('status',$request->status)
                        ->join('customers', 'customers.order_id', '=', 'orders.id')
                        ->select('orders.*', 'customers.customerPhone', 'customers.customerName', 'customers.customerAddress')->first();
                    }
                }
            }else{
                foreach($order_ids as $order_id){
                    $orders []=  Order::with(
                        [
                            'orderproducts'=>function ($query) { $query->select('id','order_id','productName','quantity','color','size');},
                            'admins'=> function ($query) { $query->select('id','name');},
                            'couriers'=> function ($query) { $query->select('id','courierName');},
                            'products'=> function ($query) { $query->select('id', 'ProductName','ProductRegularPrice');},
                            'comments'=> function ($query) { $query->select('id', 'order_id', 'comment','admin_id','status','created_at')->where('status',0);},
                            'cities'=> function ($query) { $query->select('id', 'courier_id', 'cityName');},
                            'zones'=> function ($query) { $query->select('id', 'courier_id','city_id', 'zoneName');}
                        ]
                    )
                    ->where('orders.id', $order_id->order_id)
                    ->where('status',$request->status)
                    ->where('admin_id',Auth::guard('admin')->user()->id)
                    ->join('customers', 'customers.order_id', '=', 'orders.id')
                    ->select('orders.*', 'customers.customerPhone', 'customers.customerName', 'customers.customerAddress')->first();
                }
            }
            return view('admin.content.order.productbyorder',['orders'=> $orders]);
        }
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $admin=Admin::where('email',Auth::guard('admin')->user()->email)->first();
        $status = "";
        return view('admin.content.order.order',['admin'=>$admin,'status' => $status]);
    }

    public function complain()
    {
        $admin=Admin::where('email',Auth::guard('admin')->user()->email)->first();
        $status = "orderall";
        return view('admin.content.order.complain', ['admin'=>$admin,'status' => $status]);
    }

    public function complane(Request $request){
        $admin=Admin::where('email',Auth::guard('admin')->user()->email)->first();
        $columns = $request->input('columns');
        $status = $request->input('status');


         $orders =  Order::with(
                [
                    'orderproducts'=>function ($query) { $query->select('id','order_id','product_id','productName','quantity','color','size');},
                    'admins'=> function ($query) { $query->select('id','name');},
                    'couriers'=> function ($query) { $query->select('id','courierName');},
                    'products'=> function ($query) { $query->select('id', 'ProductName','ProductSalePrice');},
                    'comments'=> function ($query) { $query->select('id', 'order_id', 'comment','admin_id','status','created_at')->where('status',0);},
                    'cities'=> function ($query) { $query->select('id', 'courier_id', 'cityName');},
                    'zones'=> function ($query) { $query->select('id', 'courier_id','city_id', 'zoneName');}
                ]
            )->join('customers', 'customers.order_id', '=', 'orders.id')->select('orders.*', 'customers.customerPhone', 'customers.customerName', 'customers.customerAddress');






        if ($columns[1]['search']['value']) {
            $orders = $orders->Where('orders.invoiceID', 'like', "%{$columns[1]['search']['value']}%")
            ->orWhere('orders.web_ID', 'like', "%{$columns[1]['search']['value']}%");
        }
        if ($columns[2]['search']['value']) {
            $orders = $orders->Where('customers.customerPhone', 'like', "%{$columns[2]['search']['value']}%");
        }
        if ($columns[5]['search']['value']) {
            $orders = $orders->Where('orders.courier_id', '=', $columns[5]['search']['value']);
        }
        if ($columns[6]['search']['value']) {
            if ($status == 'Delivered') {
                $orders = $orders->Where('orders.deliveryDate', 'like', "%{$columns[6]['search']['value']}%");
            } elseif ($status == 'Paid' || $status == 'Return' || $status == 'Lost') {
                $orders = $orders->Where('orders.completeDate', 'like', "%{$columns[6]['search']['value']}%");
            } else {
                $orders = $orders->Where('orders.orderDate', 'like', "%{$columns[6]['search']['value']}%");
            }
        }


        if($admin->hasrole('user')){
            if ($columns[8]['search']['value']) {
                $orders = $orders->Where('orders.memo', '=', $columns[8]['search']['value']);
            }
        }else{
            if ($columns[9]['search']['value']) {
                $orders = $orders->Where('orders.admin_id', '=', $columns[9]['search']['value']);
            }
        }

        return Datatables::of($orders->orderBy('orders.id', 'DESC'))
            ->addColumn('customerInfo', function ($orders) {
                return $orders->customerName . '<br>' . $orders->customerPhone . '<br>' . $orders-> customerAddress . '<br> <span style="color:red;font-weight:bold;">' . $orders->entry_complete.'</span>';
            })
            ->addColumn('invoice', function ($orders) {
                return $orders->invoiceID . '<br>' . $orders->web_ID .'<br>' . $orders->created_at->diffForhumans();
            })
            ->editColumn('products', function ($orders) {
                $orderProducts = '';
                foreach ($orders->orderproducts as $product) {
                    if(isset($product->color) && isset($product->size)){
                        $orderProducts = $orderProducts . $product->quantity . ' x ' . $product->productName . '<br><span style="color:blue;"> Colour: '.$product->color .' , Size: '.$product->size.'</span>';
                    }elseif(isset($product->size)){
                        $orderProducts = $orderProducts . $product->quantity . ' x ' . $product->productName . '<br><span style="color:blue;"> Size: '.$product->size.'</span>';
                    }else if($product->color){
                        $orderProducts = $orderProducts . $product->quantity . ' x ' . $product->productName . '<br><span style="color:blue;"> Colour: '.$product->color.'<span>';
                    }else{
                        $orderProducts = $orderProducts . $product->quantity . ' x ' . $product->productName ;
                    }
                }
                return rtrim($orderProducts, '<br>');
            })
            ->editColumn('user', function ($orders) {
                if ($orders->admins) {
                    return $orders->admins->name;
                } else {
                    return 'user not assign';
                }
            })
            ->editColumn('courier', function ($orders) {
                if (isset($orders->couriers->courierName) && isset($orders->cities->cityName) && isset($orders->zones->zoneName)) {
                    return $orders->couriers->courierName . '<br>' . $orders->cities->cityName . '<br>' . $orders->zones->zoneName;
                } elseif (isset($orders->couriers->courierName) && isset($orders->cities->cityName)) {
                    return $orders->couriers->courierName . '<br>' . $orders->cities->cityName ;
                } elseif (isset($orders->couriers->courierName) && isset($orders->zones->zoneName)) {
                    return $orders->couriers->courierName .'<br>' . $orders->zones->zoneName;
                } elseif (isset($orders->couriers->courierName)) {
                    return $orders->couriers->courierName ;
                }   else {
                    return 'Not Selected';
                }
            })
            ->editColumn('notification', function ($orders) {
                if (isset($orders->customerNote)) return $orders->comments->comment .'<br>' .$orders->comments->created_at->diffForhumans().'<br><span style="color:red;font-weight:bold;">[ Note:'.$orders->customerNote .' ]</span>' ;
                return $orders->comments->comment .'<br>' .$orders->comments->created_at->diffForhumans();
            })
            ->addColumn('statusButton', function ($orders) {
                if (last(request()->segments()) == 'Paid') {
                    return '<span class="badge bg-soft-success text-success">Paid</span>';
                } else if (last(request()->segments()) == 'Return') {
                    return '<span class="badge bg-soft-danger text-danger">Return</span>';
                } else if (last(request()->segments()) == 'Lost') {
                    return '<span class="badge bg-soft-danger text-danger">Lost</span>';
                } else if (last(request()->segments()) == 'Pending Invoiced') {
                    return $orders->status = $this->statusList('Pending Invoiced', $orders->id);
                } else if (last(request()->segments()) == 'Checked Invoiced') {
                    return $orders->status = $this->statusList('Checked Invoiced', $orders->id);
                }else{
                    return $orders->status = $this->statusList($orders->status, $orders->id);
                }
            })

            ->addColumn('action', function ($orders) {
                return "<a href='javascript:void(0);' data-id='" . $orders->id . "' class='action-icon btn-editorder'> <i class='fas fa-1x fa-edit'></i></a> <br>
                <a href='javascript:void(0);' data-id='" . $orders->id . "' class='action-icon btn-delete'> <i class='fas fa-trash-alt'></i></a>";
            })
            ->escapeColumns([])->make();
    }

    public function userorder()
    {
        $admin=Admin::where('email',Auth::guard('admin')->user()->email)->first();
        $status = "userorderall";
        return view('admin.content.order.userorder', ['admin'=>$admin,'status' => $status]);
    }

    public function ordersByStatus ($status)
    {
        $admin=Admin::where('email',Auth::guard('admin')->user()->email)->first();
        $status = $status;
        if ($status == 'Pending Invoiced' || $status == 'Invoiced' || $status == 'Stock Out' || $status == 'Checked Invoiced') {
            return view('admin.content.order.invoiced', ['admin'=>$admin,'status' => $status]);
        }
        if ($status == 'Delivered' || $status == 'Customer Confirm' || $status == 'Customer On Hold' || $status == 'Request to Return' || $status == 'Paid' || $status == 'Return' || $status == 'Lost') {
            return view('admin.content.order.delivered',['admin'=>$admin,'status' => $status]);
        } else {
            return view('admin.content.order.order', ['admin'=>$admin,'status' => $status]);
        }
    }

    public function createorder(){
        $uniqueId = $this->uniqueID();
        $couriers = Courier::all();
        return view('admin.content.order.createorder',['couriers'=>$couriers, 'uniqueId'=> $uniqueId]);
    }

    public function storeorder(Request $request)
    {
        $order = new Order();
        $order->invoiceID = $this->uniqueID();
        $order->store_id = $request['data']['storeID'];
        $order->subTotal = $request['data']['total'];
        $order->deliveryCharge = $request['data']['deliveryCharge'];
        $order->discountCharge = $request['data']['discountCharge'];
        $order->payment_type_id = $request['data']['paymentTypeID'];
        $order->payment_id = $request['data']['paymentID'];
        $order->paymentAmount = $request['data']['paymentAmount'];
        $order->paymentAgentNumber = $request['data']['paymentAgentNumber'];
        $order->orderDate = $request['data']['orderDate'];
        $order->courier_id = $request['data']['courierID'];
        $order->city_id = $request['data']['cityID'];
        $order->zone_id = $request['data']['zoneID'];
        $products = $request['data']['products'];
        $order->admin_id = Auth::guard('admin')->user()->id;
        $result = $order->save();
        if ($result) {
            $customer = new Customer();
            $customer->order_id = $order->id;
            $customer->customerName = $request['data']['customerName'];
            $customer->customerPhone = $request['data']['customerPhone'];
            $customer->customerAddress = $request['data']['customerAddress'];
            $customer->save();
            foreach ($products as $product) {
                $orderProducts = new Orderproduct();
                $orderProducts->order_id = $order->id;
                $orderProducts->product_id = $product['productID'];
                $orderProducts->productCode = $product['productCode'];
                $orderProducts->color = $product['productColor'];
                $orderProducts->size = $product['productSize'];
                $orderProducts->productName = $product['productName'];
                $orderProducts->quantity = $product['productQuantity'];
                $orderProducts->productPrice = $product['productPrice'];
                $orderProducts->save();
            }

            $notification = new Comment();
            $notification->order_id = $order->id;
            $notification->comment = '#BG77' . $order->id . ' Order Has Been Created by ' . Auth::guard('admin')->user()->name;
            $notification->admin_id = Auth::guard('admin')->user()->id;
            $notification->save();

            if ($request['data']['paymentID'] != '' && $request['data']['paymentTypeID'] != '') {
                $paymentComplete = new Paymentcomplete();
                $paymentComplete->order_id = $order->id;
                $paymentComplete->payment_type_id = $request['data']['paymentTypeID'];
                $paymentComplete->payment_id = $request['data']['paymentID'];
                $paymentComplete->trid = $request['data']['paymentAgentNumber'];
                $paymentComplete->amount = $request['data']['paymentAmount'];
                $paymentComplete->date = date('Y-m-d');
                $paymentComplete->userID = Auth::guard('admin')->user()->id;
                $paymentComplete->save();
            }
            $response['status'] = 'success';
            $response['message'] = 'Successfully Add Order';
        } else {
            Customer::where('order_id', '=', $order->id)->delete();
            Orderproduct::where('order_id', '=', $order->id)->delete();
            Comment::where('order_id', '=', $order->id)->delete();
            Order::where('id', '=', $order->id)->delete();
            $response['status'] = 'failed';
            $response['message'] = 'Unsuccessful to Add Order';
        }
        return json_encode($response);
        die();
    }

    //user all ordeer

    public function userorderall(Request $request)
    {

        $columns = $request->input('columns');
        $status = $request->input('status');

        $orders =  Order::with(
            [
                'orderproducts'=>function ($query) { $query->select('id','order_id','productName','quantity','color','size','weight','product_id');},
                'admins'=> function ($query) { $query->select('id','name');},
                'couriers'=> function ($query) { $query->select('id','courierName');},
                'products'=> function ($query) { $query->select('id', 'productName','productPrice');},
                'comments'=> function ($query) { $query->select('id', 'order_id', 'comment','admin_id','status','created_at')->where('status',0);},
                'cities'=> function ($query) { $query->select('id', 'courier_id', 'cityName');},
                'zones'=> function ($query) { $query->select('id', 'courier_id','city_id', 'zoneName');}
            ]
        )->where('admin_id', Auth::guard('admin')->user()->id)
            ->join('customers', 'customers.order_id', '=', 'orders.id')
            ->select('orders.*', 'customers.customerPhone', 'customers.customerName', 'customers.customerAddress');






        if ($columns[1]['search']['value']) {
            $orders = $orders->Where('orders.invoiceID', 'like', "%{$columns[1]['search']['value']}%")
            ->orWhere('orders.web_ID', 'like', "%{$columns[1]['search']['value']}%");
        }
        if ($columns[2]['search']['value']) {
            $orders = $orders->Where('customers.customerPhone', 'like', "%{$columns[2]['search']['value']}%");
        }
        if ($columns[5]['search']['value']) {
            $orders = $orders->Where('orders.courier_id', '=', $columns[5]['search']['value']);
        }
        if ($columns[6]['search']['value']) {
            if ($status == 'Delivered') {
                $orders = $orders->Where('orders.deliveryDate', 'like', "%{$columns[6]['search']['value']}%");
            } elseif ($status == 'Paid' || $status == 'Return' || $status == 'Lost') {
                $orders = $orders->Where('orders.completeDate', 'like', "%{$columns[6]['search']['value']}%");
            } else {
                $orders = $orders->Where('orders.orderDate', 'like', "%{$columns[6]['search']['value']}%");
            }
        }


        if (Auth::user()->role == 0) {
            if ($columns[8]['search']['value']) {
                $orders = $orders->Where('orders.memo', '=', $columns[8]['search']['value']);
            }
        } else {
            if ($columns[8]['search']['value']) {
                $orders = $orders->Where('orders.admin_id', '=', $columns[8]['search']['value']);
            }
        }

        return Datatables::of($orders->orderBy('orders.id', 'DESC'))
        ->addColumn('customerInfo', function ($orders) {
            return $orders->customerName . '<br>' . $orders->customerPhone . '<br>' . $orders-> customerAddress . '<br>' . $orders->entry_complete ;
        })
        ->addColumn('invoice', function ($orders) {
            return $orders->invoiceID . '<br>' . $orders->web_ID .'<br>' . $orders->created_at->diffForhumans();
        })
        ->editColumn('products', function ($orders) {
            $orderProducts = '';
            foreach ($orders->orderproducts as $product) {
                if(isset($product->color) && isset($product->size) && isset($product->weight)){
                    $orderProducts = $orderProducts . $product->quantity . ' x ' . $product->productName . '<br><span style="color:blue;"> Colour: '.$product->color .' , Size: '.$product->size.' , Weight: '.$product->weight.'</span><br>';
                }elseif(isset($product->size)){
                    $orderProducts = $orderProducts . $product->quantity . ' x ' . $product->productName . '<br><span style="color:blue;"> Size: '.$product->size.'</span><br>';
                }else if($product->color){
                    $orderProducts = $orderProducts . $product->quantity . ' x ' . $product->productName . '<br><span style="color:blue;"> Colour: '.$product->color.'<span><br>';
                }
                else if ($product->weight){
                    $orderProducts = $orderProducts . $product->quantity . ' x ' . $product->productName . '<br><span style="color:blue;"> Weight: '.$product->weight.'<span><br>';
                    
                }
                
                else{
                    $orderProducts = $orderProducts . $product->quantity . ' x ' . $product->productName .'<br>';
                }
            }
            return rtrim($orderProducts, '<br>');
        })
        ->editColumn('user', function ($orders) {
            if ($orders->admins) {
                return $orders->admins->name;
            } else {
                return 'user not assign';
            }
        })
        ->editColumn('courier', function ($orders) {
            if (isset($orders->couriers->courierName)) {
                return $orders->couriers->courierName;
            } else {
                return 'Not Selected';
            }
        })
        ->editColumn('notification', function ($orders) {
            if (isset($orders->customerNote)) return $orders->comments->comment .'<br>' .$orders->comments->created_at->diffForhumans().'<br><span style="color:red;font-weight:bold;">[ Note:'.$orders->customerNote .' ]</span>' ;
            return $orders->comments->comment .'<br>' .$orders->comments->created_at->diffForhumans();
        })
        ->addColumn('statusButton', function ($orders) {
            if (last(request()->segments()) == 'Paid') {
                return '<span class="badge bg-soft-success text-success">Paid</span>';
            } else if (last(request()->segments()) == 'Return') {
                return '<span class="badge bg-soft-danger text-danger">Return</span>';
            } else if (last(request()->segments()) == 'Lost') {
                return '<span class="badge bg-soft-danger text-danger">Lost</span>';
            } else if (last(request()->segments()) == 'Pending Invoiced') {
                return $orders->status = $this->statusList('Pending Invoiced', $orders->id);
            } else {
                return $orders->status = $this->statusList($orders->status, $orders->id);
            }
        })

        ->addColumn('action', function ($orders) {
            return "<a href='javascript:void(0);' data-id='" . $orders->id . "' class='action-icon btn-editorder'> <i class='fas fa-1x fa-edit'></i></a>
                <a href='javascript:void(0);' data-id='" . $orders->id . "' class='action-icon btn-delete'> <i class='fas fa-trash-alt'></i></a>";
        })
        ->escapeColumns([])->make();
    }

    //all order

    public function orderdata(Request $request,$abc){
        $admin=Admin::where('email',Auth::guard('admin')->user()->email)->first();
        $columns = $request->input('columns');
        $status = $request->input('status');

        if($abc == 'orderall'){
            if($admin->hasrole('user')){
                $orders =  Order::with(
                    [
                        'orderproducts'=>function ($query) { $query->select('id','order_id','productName','quantity','color','size','weight','product_id');},
                        'admins'=> function ($query) { $query->select('id','name');},
                        'couriers'=> function ($query) { $query->select('id','courierName');},
                        'products'=> function ($query) { $query->select('id', 'ProductName','ProductSalePrice');},
                        'comments'=> function ($query) { $query->select('id', 'order_id', 'comment','admin_id','status','created_at')->where('status',0);},
                        'cities'=> function ($query) { $query->select('id', 'courier_id', 'cityName');},
                        'zones'=> function ($query) { $query->select('id', 'courier_id','city_id', 'zoneName');}
                    ]
                )->where('admin_id',Auth::guard('admin')->user()->id)
                    ->join('customers', 'customers.order_id', '=', 'orders.id')
                    ->select('orders.*', 'customers.customerPhone', 'customers.customerName', 'customers.customerAddress');
            }else{
                $orders =  Order::with(
                    [
                        'orderproducts'=>function ($query) { $query->select('id','order_id','productName','quantity','color','size','weight','product_id');},
                        'admins'=> function ($query) { $query->select('id','name');},
                        'couriers'=> function ($query) { $query->select('id','courierName');},
                        'products'=> function ($query) { $query->select('id', 'ProductName','ProductSalePrice');},
                        'comments'=> function ($query) { $query->select('id', 'order_id', 'comment','admin_id','status','created_at')->where('status',0);},
                        'cities'=> function ($query) { $query->select('id', 'courier_id', 'cityName');},
                        'zones'=> function ($query) { $query->select('id', 'courier_id','city_id', 'zoneName');}
                    ]
                )
                    ->join('customers', 'customers.order_id', '=', 'orders.id')
                    ->select('orders.*', 'customers.customerPhone', 'customers.customerName', 'customers.customerAddress');

            }
        }else{
            if($admin->hasrole('user')){
                $orders =  Order::with(
                    [
                        'orderproducts'=>function ($query) { $query->select('id','order_id','productName','quantity','color','size','weight','product_id');},
                        'admins'=> function ($query) { $query->select('id','name');},
                        'couriers'=> function ($query) { $query->select('id','courierName');},
                        'products'=> function ($query) { $query->select('id', 'ProductName','ProductSalePrice');},
                        'comments'=> function ($query) { $query->select('id', 'order_id', 'comment','admin_id','status','created_at')->where('status',0);},
                        'cities'=> function ($query) { $query->select('id', 'courier_id', 'cityName');},
                        'zones'=> function ($query) { $query->select('id', 'courier_id','city_id', 'zoneName');}
                    ]
                )->where('admin_id',Auth::guard('admin')->user()->id)
                    ->join('customers', 'customers.order_id', '=', 'orders.id')
                    ->select('orders.*', 'customers.customerPhone', 'customers.customerName', 'customers.customerAddress');

            }else{
                $orders =  Order::with(
                    [
                        'orderproducts'=>function ($query) { $query->select('id','order_id','productName','quantity','color','size','weight','product_id');},
                        'admins'=> function ($query) { $query->select('id','name');},
                        'couriers'=> function ($query) { $query->select('id','courierName');},
                        'products'=> function ($query) { $query->select('id', 'ProductName','ProductSalePrice');},
                        'comments'=> function ($query) { $query->select('id', 'order_id', 'comment','admin_id','status','created_at')->where('status',0);},
                        'cities'=> function ($query) { $query->select('id', 'courier_id', 'cityName');},
                        'zones'=> function ($query) { $query->select('id', 'courier_id','city_id', 'zoneName');}
                    ]
                )
                    ->join('customers', 'customers.order_id', '=', 'orders.id')
                    ->select('orders.*', 'customers.customerPhone', 'customers.customerName', 'customers.customerAddress');

            }
        }



        if ($abc == 'Pending Invoiced'  && $abc != 'Delivered' && $abc != 'Condition On Hold') {
            $orders = $orders->whereIn('orders.status', ['Completed', 'Pending Invoiced']);
        }
        if ($abc != 'orderall' && $abc != 'Pending Invoiced'  && $abc != 'Customer On Hold' && $abc != 'Delivered' && $abc != 'Condition On Hold') {
            $orders = $orders->where('orders.status', 'like', $abc);
        }

        if ($abc == 'Customer On Hold') {
            $orders = $orders->whereIn('orders.status', ['Delivered', 'Customer On Hold']);
        }
        if ($abc == 'Delivered') {
            $orders = $orders->whereIn('orders.status', ['Delivered', 'Customer Confirm', 'Customer On Hold', 'Request to Return']);
        }
        if ($abc == 'Condition On Hold' && !$abc == 'orderall') {
            $orders = $orders->whereIn('orders.status', ['Delivered', 'Customer On Hold']);
        }



        if ($columns[1]['search']['value']) {
            $orders = $orders->Where('orders.invoiceID', 'like', "%{$columns[1]['search']['value']}%")
            ->orWhere('orders.web_ID', 'like', "%{$columns[1]['search']['value']}%");
        }
        if ($columns[2]['search']['value']) {
            $orders = $orders->Where('customers.customerPhone', 'like', "%{$columns[2]['search']['value']}%");
        }
        if ($columns[5]['search']['value']) {
            $orders = $orders->Where('orders.courier_id', '=', $columns[5]['search']['value']);
        }
        if ($columns[6]['search']['value']) {
            if ($status == 'Delivered') {
                $orders = $orders->Where('orders.deliveryDate', 'like', "%{$columns[6]['search']['value']}%");
            } elseif ($status == 'Paid' || $status == 'Return' || $status == 'Lost') {
                $orders = $orders->Where('orders.completeDate', 'like', "%{$columns[6]['search']['value']}%");
            } else {
                $orders = $orders->Where('orders.orderDate', 'like', "%{$columns[6]['search']['value']}%");
            }
        }


        if($admin->hasrole('user')){
            if ($columns[8]['search']['value']) {
                $orders = $orders->Where('orders.memo', '=', $columns[8]['search']['value']);
            }
        }else{
            if ($columns[9]['search']['value']) {
                $orders = $orders->Where('orders.admin_id', '=', $columns[9]['search']['value']);
            }
        }

        return Datatables::of($orders->orderBy('orders.id', 'DESC'))
            ->addColumn('customerInfo', function ($orders) {
                return $orders->customerName . '<br>' . $orders->customerPhone . '<br>' . $orders-> customerAddress . '<br> <span style="color:red;font-weight:bold;">' . $orders->entry_complete.'</span>';
            })
            ->addColumn('invoice', function ($orders) {
                return $orders->invoiceID . '<br>' . $orders->web_ID .'<br>' . $orders->created_at->diffForhumans();
            })
            ->editColumn('products', function ($orders) {
                $orderProducts = '';
                foreach ($orders->orderproducts as $product) {
                    if(isset($product->color) && isset($product->size) && isset($product->weight)){
                        $orderProducts = $orderProducts . $product->quantity . ' x ' . $product->productName . '<br><span style="color:blue;"> Colour: '.$product->color .' , Size: '.$product->size.', Weight: '.$product->weight.'</span><br>';
                    }elseif(isset($product->size)){
                        $orderProducts = $orderProducts . $product->quantity . ' x ' . $product->productName . '<br><span style="color:blue;"> Size: '.$product->size.'</span><br>';
                    }else if($product->color){
                        $orderProducts = $orderProducts . $product->quantity . ' x ' . $product->productName . '<br><span style="color:blue;"> Colour: '.$product->color.'<span><br>';
                    }
                    else if ($product->weight){
                        $orderProducts = $orderProducts . $product->quantity . ' x ' . $product->productName . '<br><span style="color:blue;"> Weight: '.$product->weight.'</span><br>';

                    }
                    
                    
                    else{
                        $orderProducts = $orderProducts . $product->quantity . ' x ' . $product->productName.'<br>' ;
                    }
                }
                return rtrim($orderProducts, '<br>');
            })
            ->editColumn('user', function ($orders) {
                if ($orders->admins) {
                    return $orders->admins->name;
                } else {
                    return 'user not assign';
                }
            })
            ->editColumn('courier', function ($orders) {
                if (isset($orders->couriers->courierName) && isset($orders->cities->cityName) && isset($orders->zones->zoneName)) {
                    return $orders->couriers->courierName . '<br>' . $orders->cities->cityName . '<br>' . $orders->zones->zoneName;
                } elseif (isset($orders->couriers->courierName) && isset($orders->cities->cityName)) {
                    return $orders->couriers->courierName . '<br>' . $orders->cities->cityName ;
                } elseif (isset($orders->couriers->courierName) && isset($orders->zones->zoneName)) {
                    return $orders->couriers->courierName .'<br>' . $orders->zones->zoneName;
                } elseif (isset($orders->couriers->courierName)) {
                    return $orders->couriers->courierName ;
                }   else {
                    return 'Not Selected';
                }
            })
            ->editColumn('notification', function ($orders) {
                if (isset($orders->customerNote)) return $orders->comments->comment .'<br>' .$orders->comments->created_at->diffForhumans().'<br><span style="color:red;font-weight:bold;">[ Note:'.$orders->customerNote .' ]</span>' ;
                return $orders->comments->comment .'<br>' .$orders->comments->created_at->diffForhumans();
            })
            ->addColumn('statusButton', function ($orders) {
                if (last(request()->segments()) == 'Paid') {
                    return '<span class="badge bg-soft-success text-success">Paid</span>';
                } else if (last(request()->segments()) == 'Return') {
                    return '<span class="badge bg-soft-danger text-danger">Return</span>';
                } else if (last(request()->segments()) == 'Lost') {
                    return '<span class="badge bg-soft-danger text-danger">Lost</span>';
                } else if (last(request()->segments()) == 'Pending Invoiced') {
                    return $orders->status = $this->statusList('Pending Invoiced', $orders->id);
                } else if (last(request()->segments()) == 'Checked Invoiced') {
                    return $orders->status = $this->statusList('Checked Invoiced', $orders->id);
                }else{
                    return $orders->status = $this->statusList($orders->status, $orders->id);
                }
            })

            ->addColumn('action', function ($orders) {
                return "<a href='javascript:void(0);' data-id='" . $orders->id . "' class='action-icon btn-editorder'> <i class='fas fa-1x fa-edit'></i></a> <br>
                <a href='javascript:void(0);' data-id='" . $orders->id . "' class='action-icon btn-delete'> <i class='fas fa-trash-alt'></i></a>";
            })
            ->escapeColumns([])->make();
    }

    //update status
    public function updateorderstatus(Request $request)
    {
        $id = $request['id'];

        $status = $request['status'];
        $order = Order::find($id);
        $customer =Customer::where('order_id',$order->id)->first();

        if ($request['status'] == 'Completed') {
            // $sendstatus =Http::get('https://api.mobireach.com.bd/SendTextMessage?Username=danpitee&Password=Dhaka@5599&From=8801639222111&To=88'.$customer->customerPhone.'&Message=স্যার,আপনার অর্ডারটি সম্পন্ন হয়েছে |অর্ডার আইডি '.$order->invoiceID.'');

            $order->orderDate = date('Y-m-d');
        }
        if ($request['status'] == 'Delivered') {
            // $sendstatus =Http::get('https://api.mobireach.com.bd/SendTextMessage?Username=danpitee&Password=Dhaka@5599&From=8801639222111&To=88'.$customer->customerPhone.'&Message=আপনার অর্ডারটিকুরিয়ারে বুকিং হয়েছে, ২-৫ দিনের মধ্যে পণ্যটি পাবেন|');
            $order->deliveryDate = date('Y-m-d');
        }
        if ($request['status'] == 'Paid') {
            $order->completeDate = date('Y-m-d');
        }
        if ($request['status'] == 'Return') {
            $order->completeDate = date('Y-m-d');
        }

        if ($order->courier_id || $status == 'Pending Canceled' || $status == 'Canceled' || $status == 'On Hold' || $status == 'Payment Pending') {
            $order->status = $status;
            $result = $order->save();
            if ($result) {
                $response['status'] = 'success';
                $response['message'] = 'Successfully Update Status to ' . $request['status'];
            } else {
                $response['status'] = 'failed';
                $response['message'] = 'Unsuccessful to update Status ' . $request['status'];
            }
        } else {
            $response['status'] = 'failed';
            $response['message'] = 'Please Update order courier and try again !';
        }

        $comment = new Comment();
        $comment->order_id = $id;
        $comment->comment = Auth::guard('admin')->user()->name . ' Successfully Update #BG77' . $id . ' Order status to ' . $status;
        $comment->admin_id = Auth::guard('admin')->user()->id;
        $comment->status = 1;
        $comment->save();

        return json_encode($response);
    }

    public function statusList($status, $id)
    {
        $allStatus = array(
            'order' => array(
                "Processing" => array(
                    "name" => "Processing",
                    "icon" => "fe-tag",
                    "color" => "bg-primary"
                ),
                "On Hold" => array(
                    "name" => "On Hold",
                    "icon" => "far fa-stop-circle",
                    "color" => "bg-warning"
                ),
                "Payment Pending" => array(
                    "name" => "Payment Pending",
                    "icon" => "fe-tag",
                    "color" => "bg-info"
                ),
                "Pending Canceled" => array(
                    "name" => "Pending Canceled",
                    "icon" => "fe-trash-2",
                    "color" => "bg-danger"
                ),
                "Canceled" => array(
                    "name" => "Canceled",
                    "icon" => "fe-trash-2",
                    "color" => "bg-danger"
                ),
                "Completed" => array(
                    "name" => "Completed",
                    "icon" => "fe-check-circle",
                    "color" => "bg-success"
                )
            ),
            'invoice' => array(
                "Pending Invoiced" => array(
                    "name" => "Pending Invoiced",
                    "color" => "bg-primary"
                ),
                "Checked Invoiced" => array(
                    "name" => "Checked Invoiced",
                    "color" => "bg-success"
                ),
                "Invoiced" => array(
                    "name" => "Invoiced",
                    "color" => "bg-warning"
                ),
                "Stock Out" => array(
                    "name" => "Stock Out",
                    "color" => "bg-info"
                ),
                "Pending Canceled" => array(
                    "name" => "Pending Canceled",
                    "icon" => "fe-trash-2",
                    "color" => "bg-danger"
                ),
                "Canceled" => array(
                    "name" => "Canceled",
                    "color" => "bg-info"
                ),
                "Delivered" => array(
                    "name" => "Delivered",
                    "color" => "bg-info"
                )

            ),
            'delivered' => array(
                "Delivered" => array(
                    "name" => "Delivered",
                    "color" => "bg-primary"
                ),
                "Customer On Hold" => array(
                    "name" => "Customer On Hold",
                    "color" => "bg-warning"
                ),
                "Customer Confirm" => array(
                    "name" => "Customer Confirm",
                    "color" => "bg-warning"
                ),
                "Request to Return" => array(
                    "name" => "Request to Return",
                    "color" => "bg-warning"
                ),
                "Paid" => array(
                    "name" => "Paid",
                    "color" => "bg-info"
                ),
                "Return" => array(
                    "name" => "Return",
                    "color" => "bg-danger"
                ),
                "Lost" => array(
                    "name" => "Lost",
                    "color" => "bg-danger"
                )
            )
        );

        $temp = 'order';
        foreach ($allStatus as $key => $value) {
            foreach ($value as $kes => $val) {
                if ($kes == $status) {
                    $temp = $key;
                }
            }
        }
        $args = $allStatus[$temp];
        $html = '';
        foreach ($args as $value) {
            if ($args[$status]['name'] != $value['name']) {

                $html = $html . "<a class=' btn-sm dropdown-item btn-status' data-id='" . $id . "' data-status='" . $value['name'] . "' href='#'>" . $value['name'] . "</a>";
            }
        }
        $response = "<div class='btn-group dropdown'>
            <a href='javascript: void(0);' style='color:white'  class=' btn-sm table-action-btn dropdown-toggle arrow-none btn " . $args[$status]['color'] . " btn-xs' data-bs-toggle='dropdown' aria-expanded='false' >" . $args[$status]['name'] . " <i class='mdi mdi-chevron-down'></i></a>
            <div class='dropdown-menu dropdown-menu-right'>
            " . $html . "
            </div>
        </div>";

        return $response;
    }

    public function courier(Request $request)
    {
        if (isset($request['q'])) {
            $couriers = Courier::query()->where([
                ['courierName', 'like', '%' . $request['q'] . '%'],
                ['status', 'like', 'Active']
            ])->get();
        } else {
            $couriers = Courier::query()->where('status', 'like', 'Active')->get();
        }
        $courier = array();
        foreach ($couriers as $item) {
            $courier[] = array(
                "id" => $item['id'],
                "text" => $item['courierName']
            );
        }
        return json_encode($courier);
    }

    //get users
    public function users(Request $request)
    {
        if (isset($request['q'])) {
            $users = Admin::whereHas('roles', function($q) { $q->where('name', 'user'); })->where('status','Active')->query()->where([['name', 'like', '%' . $request['q'] . '%']])->get();
        } else {
            $users = Admin::whereHas('roles', function($q) { $q->where('name', 'user'); })->where('status','Active')->get();
        }
        $user = array();
        foreach ($users as $item) {
            $user[] = array(
                "id" => $item['id'],
                "text" => $item['name']
            );
        }
        return json_encode($user);
        die();
    }


    public function countorder()
    {
        $admin=Admin::where('email',Auth::guard('admin')->user()->email)->first();
        $response['allorder'] = DB::table('orders')->count();

        if($admin->hasRole('user')){
            $response['all'] = DB::table('orders')->where('admin_id', Auth::guard('admin')->user()->id)->count();
            $response['processing'] = DB::table('orders')->where('admin_id', Auth::guard('admin')->user()->id)->where('status', 'like', 'Processing')->count();
            $response['pendingPayment'] = DB::table('orders')->where('admin_id', Auth::guard('admin')->user()->id)->where('status', 'like', 'Payment Pending')->count();
            $response['onHold'] = DB::table('orders')->where('admin_id', Auth::guard('admin')->user()->id)->where('status', 'like', 'On Hold')->count();
            $response['pendingCanceled'] = DB::table('orders')->where('admin_id', Auth::guard('admin')->user()->id)->where('status', 'like', 'Pending Canceled')->count();
            $response['canceled'] = DB::table('orders')->where('admin_id', Auth::guard('admin')->user()->id)->where('status', 'like', 'Canceled')->count();
            $response['completed'] = DB::table('orders')->where('admin_id', Auth::guard('admin')->user()->id)->where('status', 'like', 'Completed')->count();
            $response['pendingInvoiced'] = DB::table('orders')->where('admin_id', Auth::guard('admin')->user()->id)->where('status', 'like', 'Completed')->orWhere('orders.status', 'like', 'Pending Invoiced')->count();
            $response['checkedInvoiced'] = DB::table('orders')->where('admin_id', Auth::guard('admin')->user()->id)->where('status', 'like', 'Checked Invoiced')->count();
            $response['invoiced'] = DB::table('orders')->where('admin_id', Auth::guard('admin')->user()->id)->where('status', 'like', 'Invoiced')->count();
            $response['stockOut'] = DB::table('orders')->where('admin_id', Auth::guard('admin')->user()->id)->where('status', 'like', 'Stock Out')->count();
            $response['delivered'] = DB::table('orders')->where('admin_id', Auth::guard('admin')->user()->id)->whereIn('orders.status', ['Delivered', 'Customer Confirm', 'Customer On Hold', 'Request to Return'])->count();
            $response['customerOnHold'] = DB::table('orders')->where('admin_id', Auth::guard('admin')->user()->id)->whereIn('orders.status', ['Delivered', 'Customer On Hold'])->count();
            $response['customerConfirm'] = DB::table('orders')->where('admin_id', Auth::guard('admin')->user()->id)->where('status', 'like', 'Customer Confirm')->count();
            $response['requestToReturn'] = DB::table('orders')->where('admin_id', Auth::guard('admin')->user()->id)->where('status', 'like', 'Request to Return')->count();
            $response['paid'] = DB::table('orders')->where('admin_id', Auth::guard('admin')->user()->id)->where('status', 'like', 'Paid')->count();
            $response['return'] = DB::table('orders')->where('admin_id', Auth::guard('admin')->user()->id)->where('status', 'like', 'Return')->count();
            $response['lost'] = DB::table('orders')->where('admin_id', Auth::guard('admin')->user()->id)->where('status', 'like', 'Lost')->count();
        }else{
            $response['all'] = DB::table('orders')->count();
            $response['processing'] = DB::table('orders')->where('status', 'like', 'Processing')->count();
            $response['pendingPayment'] = DB::table('orders')->where('status', 'like', 'Payment Pending')->count();
            $response['onHold'] = DB::table('orders')->where('status', 'like', 'On Hold')->count();
            $response['pendingCanceled'] = DB::table('orders')->where('status', 'like', 'Pending Canceled')->count();
            $response['canceled'] = DB::table('orders')->where('status', 'like', 'Canceled')->count();
            $response['completed'] = DB::table('orders')->where('status', 'like', 'Completed')->count();
            $response['pendingInvoiced'] = DB::table('orders')->where('status', 'like', 'Completed')->orWhere('orders.status', 'like', 'Pending Invoiced')->count();
            $response['checkedInvoiced'] = DB::table('orders')->where('status', 'like', 'Checked Invoiced')->count();
            $response['invoiced'] = DB::table('orders')->where('status', 'like', 'Invoiced')->count();
            $response['stockOut'] = DB::table('orders')->where('status', 'like', 'Stock Out')->count();
            $response['delivered'] = DB::table('orders')->whereIn('orders.status', ['Delivered', 'Customer Confirm', 'Customer On Hold', 'Request to Return'])->count();
            $response['customerOnHold'] = DB::table('orders')->whereIn('orders.status', ['Delivered', 'Customer On Hold'])->count();
            $response['customerConfirm'] = DB::table('orders')->where('status', 'like', 'Customer Confirm')->count();
            $response['requestToReturn'] = DB::table('orders')->where('status', 'like', 'Request to Return')->count();
            $response['paid'] = DB::table('orders')->where('status', 'like', 'Paid')->count();
            $response['return'] = DB::table('orders')->where('status', 'like', 'Return')->count();
            $response['lost'] = DB::table('orders')->where('status', 'like', 'Lost')->count();
        }
        $response['status'] = 'success';
        return json_encode($response);
    }


    public function countorderbyid($id)
    {

        if ($id == 0) {
            $response['title']='/Today';
            $response['allorder'] = DB::table('orders')->where('updated_at',  '>=', Carbon::today()->format('y-m-d'))->count();
            $response['all'] = DB::table('orders')->where('created_at',  '>=', Carbon::today()->format('y-m-d'))->count();
            $response['processing'] = DB::table('orders')->where('status', 'like', 'Processing')->where('created_at',  '>=', Carbon::today()->format('y-m-d'))->count();
            $response['pendingPayment'] = DB::table('orders')->where('status', 'like', 'Payment Pending')->where('updated_at',  '>=', Carbon::today()->format('y-m-d'))->count();
            $response['onHold'] = DB::table('orders')->where('status', 'like', 'On Hold')->where('updated_at',  '>=', Carbon::today()->format('y-m-d'))->count();
            $response['canceled'] = DB::table('orders')->where('status', 'like', 'Canceled')->where('updated_at',  '>=', Carbon::today()->format('y-m-d'))->count();
            $response['completed'] = DB::table('orders')->where('status', 'like', 'Completed')->where('updated_at',  '>=', Carbon::today()->format('y-m-d'))->count();
            $response['pendingInvoiced'] = DB::table('orders')->where('status', 'like', 'Completed')->orWhere('orders.status', 'like', 'Pending Invoiced')->where('updated_at',  '>=', Carbon::today()->format('y-m-d'))->count();
            $response['invoiced'] = DB::table('orders')->where('status', 'like', 'Invoiced')->where('updated_at',  '>=', Carbon::today()->format('y-m-d'))->count();
            $response['stockOut'] = DB::table('orders')->where('status', 'like', 'Stock Out')->where('updated_at',  '>=', Carbon::today())->count();
            $response['delivered'] = DB::table('orders')->whereIn('orders.status', ['Delivered', 'Customer Confirm', 'Customer On Hold', 'Request to Return'])->where('updated_at',  '>=', Carbon::today()->format('y-m-d'))->count();
            $response['customerOnHold'] = DB::table('orders')->whereIn('orders.status', ['Delivered', 'Customer On Hold'])->where('updated_at',  '>=', Carbon::today()->format('y-m-d'))->count();
            $response['customerConfirm'] = DB::table('orders')->where('status', 'like', 'Customer Confirm')->where('updated_at',  '>=', Carbon::today()->format('y-m-d'))->count();
            $response['requestToReturn'] = DB::table('orders')->where('status', 'like', 'Request to Return')->where('updated_at',  '>=', Carbon::today()->format('y-m-d'))->count();
            $response['paid'] = DB::table('orders')->where('status', 'like', 'Paid')->where('updated_at',  '>=', Carbon::today()->format('y-m-d'))->count();
            $response['return'] = DB::table('orders')->where('status', 'like', 'Return')->where('updated_at',  '>=', Carbon::today()->format('y-m-d'))->count();
            $response['lost'] = DB::table('orders')->where('status', 'like', 'Lost')->where('updated_at',  '>=', Carbon::today()->format('y-m-d'))->count();
            $response['status'] = 'success';
            return json_encode($response);
        } else if ($id == 1) {
            $response['title'] = '/This Month';
            $response['allorder'] = DB::table('orders')->whereYear('updated_at',  '>=', Carbon::now()->year)->whereMonth('updated_at',  '>=', Carbon::now()->month)->count();
            $response['all'] = DB::table('orders')->where('created_at','>=', Carbon::now()->month()->format('y-m-d'))->count();
            $response['processing'] = DB::table('orders')->where('status', 'like', 'Processing')->whereYear('created_at',  '>=', Carbon::now()->year)->whereMonth('created_at',  '>=', Carbon::now()->month)->count();
            $response['pendingPayment'] = DB::table('orders')->where('status', 'like', 'Payment Pending')->whereYear('created_at',  '>=', Carbon::now()->year)->whereMonth('created_at',  '>=', Carbon::now()->month)->count();
            $response['onHold'] = DB::table('orders')->where('status', 'like', 'On Hold')->whereYear('updated_at',  '>=', Carbon::now()->year)->whereMonth('updated_at',  '>=', Carbon::now()->month)->count();
            $response['canceled'] = DB::table('orders')->where('status', 'like', 'Canceled')->whereYear('updated_at',  '>=', Carbon::now()->year)->whereMonth('updated_at',  '>=', Carbon::now()->month)->count();
            $response['completed'] = DB::table('orders')->where('status', 'like', 'Completed')->whereYear('updated_at',  '>=', Carbon::now()->year)->whereMonth('updated_at',  '>=', Carbon::now()->month)->count();
            $response['pendingInvoiced'] = DB::table('orders')->where('status', 'like', 'Completed')->orWhere('orders.status', 'like', 'Pending Invoiced')->whereYear('updated_at',  '>=', Carbon::now()->year)->whereMonth('updated_at',  '>=', Carbon::now()->month)->count();
            $response['invoiced'] = DB::table('orders')->where('status', 'like', 'Invoiced')->whereYear('updated_at',  '>=', Carbon::now()->year)->whereMonth('updated_at',  '>=', Carbon::now()->month)->count();
            $response['stockOut'] = DB::table('orders')->where('status', 'like', 'Stock Out')->whereYear('updated_at',  '>=', Carbon::now()->year)->whereMonth('updated_at',  '>=', Carbon::now()->month)->count();
            $response['delivered'] = DB::table('orders')->whereIn('orders.status', ['Delivered', 'Customer Confirm', 'Customer On Hold', 'Request to Return'])->whereYear('updated_at',  '>=', Carbon::now()->year)->whereMonth('updated_at',  '>=', Carbon::now()->month)->count();
            $response['customerOnHold'] = DB::table('orders')->whereIn('orders.status', ['Delivered', 'Customer On Hold'])->whereYear('updated_at',  '>=', Carbon::now()->year)->whereMonth('updated_at',  '>=', Carbon::now()->month)->count();
            $response['customerConfirm'] = DB::table('orders')->where('status', 'like', 'Customer Confirm')->whereYear('updated_at',  '>=', Carbon::now()->year)->whereMonth('updated_at',  '>=', Carbon::now()->month)->count();
            $response['requestToReturn'] = DB::table('orders')->where('status', 'like', 'Request to Return')->whereYear('updated_at',  '>=', Carbon::now()->year)->whereMonth('updated_at',  '>=', Carbon::now()->month)->count();
            $response['paid'] = DB::table('orders')->where('status', 'like', 'Paid')->whereYear('updated_at',  '>=', Carbon::now()->year)->whereMonth('updated_at',  '>=', Carbon::now()->month)->count();
            $response['return'] = DB::table('orders')->where('status', 'like', 'Return')->whereYear('updated_at',  '>=', Carbon::now()->year)->whereMonth('updated_at',  '>=', Carbon::now()->month)->count();
            $response['lost'] = DB::table('orders')->where('status', 'like', 'Lost')->whereYear('updated_at',  '>=', Carbon::now()->year)->whereMonth('updated_at',  '>=', Carbon::now()->month)->count();
            $response['status'] = 'success';
            return json_encode($response);
        } else {
            $response['title'] = '/This Year';
            $response['allorder'] = DB::table('orders')->whereYear('updated_at',  '>=', Carbon::now()->year)->count();
            $response['all'] = DB::table('orders')->whereYear('created_at', '>=', Carbon::now()->year)->count();
            $response['processing'] = DB::table('orders')->where('status', 'like', 'Processing')->whereYear('created_at', '>=', Carbon::now()->year)->count();
            $response['pendingPayment'] = DB::table('orders')->where('status', 'like', 'Payment Pending')->whereYear('updated_at', '>=', Carbon::now()->year)->count();
            $response['onHold'] = DB::table('orders')->where('status', 'like', 'On Hold')->whereYear('updated_at', '>=', Carbon::now()->year)->count();
            $response['canceled'] = DB::table('orders')->where('status', 'like', 'Canceled')->whereYear('updated_at', '>=', Carbon::now()->year)->count();
            $response['completed'] = DB::table('orders')->where('status', 'like', 'Completed')->whereYear('updated_at', '>=', Carbon::now()->year)->count();
            $response['pendingInvoiced'] = DB::table('orders')->where('status', 'like', 'Completed')->orWhere('orders.status', 'like', 'Pending Invoiced')->whereYear('updated_at', '>=', Carbon::now()->year)->count();
            $response['invoiced'] = DB::table('orders')->where('status', 'like', 'Invoiced')->whereYear('updated_at', '>=', Carbon::now()->year)->count();
            $response['stockOut'] = DB::table('orders')->where('status', 'like', 'Stock Out')->whereYear('updated_at', '>=', Carbon::now()->year)->count();
            $response['delivered'] = DB::table('orders')->whereIn('orders.status', ['Delivered', 'Customer Confirm', 'Customer On Hold', 'Request to Return'])->whereYear('updated_at', '>=', Carbon::now()->year)->count();
            $response['customerOnHold'] = DB::table('orders')->whereIn('orders.status', ['Delivered', 'Customer On Hold'])->whereYear('updated_at', '>=', Carbon::now()->year)->count();
            $response['customerConfirm'] = DB::table('orders')->where('status', 'like', 'Customer Confirm')->whereYear('updated_at', '>=', Carbon::now()->year)->count();
            $response['requestToReturn'] = DB::table('orders')->where('status', 'like', 'Request to Return')->whereYear('updated_at', '>=', Carbon::now()->year)->count();
            $response['paid'] = DB::table('orders')->where('status', 'like', 'Paid')->whereYear('updated_at', '>=', Carbon::now()->year)->count();
            $response['return'] = DB::table('orders')->where('status', 'like', 'Return')->whereYear('updated_at', '>=', Carbon::now()->year)->count();
            $response['lost'] = DB::table('orders')->where('status', 'like', 'Lost')->whereYear('updated_at', '>=', Carbon::now()->year)->count();
            $response['status'] = 'success';
            return json_encode($response);
        }

    }

    //top sell product

    public function topsellpeoduct($id)
    {
        if($id == 0){
            $response['orders'] = DB::table('orders')->whereIn('orders.status', ['Pending Invoiced', 'Invoiced', 'Stock Out', 'Customer Confirm', 'Request to Return', 'Paid', 'Return', 'Lost', 'Completed', 'Delivered', 'Customer On Hold'])
            ->where('orders.created_at',  '>=', Carbon::today()->format('y-m-d'))
            ->join('orderproducts', 'orders.id', '=', 'orderproducts.order_id')
            ->select('orders.status', 'orders.orderDate', 'orderproducts.*', DB::raw('SUM(quantity) as total_amount'))
            ->groupBy('orderproducts.product_id')->orderBy('total_amount', 'desc')->get();
            $response['status'] = 'success';
            return json_encode($response);
        }else if($id == 1){
            $response['orders'] = DB::table('orders')->whereIn('orders.status', ['Pending Invoiced', 'Invoiced', 'Stock Out', 'Customer Confirm', 'Request to Return', 'Paid', 'Return', 'Lost', 'Completed', 'Delivered', 'Customer On Hold'])
            ->whereYear('orders.created_at',  '>=', Carbon::now()->year)->whereMonth('orders.created_at',  '>=', Carbon::now()->month)
            ->join('orderproducts', 'orders.id', '=', 'orderproducts.order_id')
            ->select('orders.status', 'orders.orderDate', 'orderproducts.*', DB::raw('SUM(quantity) as total_amount'))
            ->groupBy('orderproducts.product_id')->orderBy('total_amount', 'desc')->get();
            $response['status'] = 'success';
            return json_encode($response);
        }else{
            $response['orders'] = DB::table('orders')->whereIn('orders.status', ['Pending Invoiced', 'Invoiced', 'Stock Out', 'Customer Confirm', 'Request to Return', 'Paid', 'Return', 'Lost', 'Completed', 'Delivered', 'Customer On Hold'])
            ->whereYear('orders.created_at',  '>=', Carbon::now()->year)
            ->join('orderproducts', 'orders.id', '=', 'orderproducts.order_id')
            ->select('orders.status', 'orders.orderDate', 'orderproducts.*', DB::raw('SUM(quantity) as total_amount'))
            ->groupBy('orderproducts.product_id')->orderBy('total_amount', 'desc')->get();
            $response['status'] = 'success';
            return json_encode($response);
        }
    }

    //recent sell

    public function recentsellpeoduct($id)
    {
        if($id == 0){
            $response['title']='/Today';
            $response['orders'] = Order::with(['orderproducts' => function ($query) {
                $query->select('id', 'order_id', 'productName');
            }, 'customers' => function ($query) {
                $query->select('id','order_id', 'customerName');
            }])->whereIn('orders.status', ['Pending Invoiced', 'Invoiced', 'Stock Out', 'Customer Confirm', 'Request to Return', 'Paid', 'Return', 'Lost', 'Completed', 'Delivered', 'Customer On Hold'])
                ->where('updated_at',  '>=', Carbon::today()->format('y-m-d'))->select('id','invoiceID','subTotal','status')->get();
            $response['status'] = 'success';
            return json_encode($response);
        }else if($id == 1){
            $response['title'] = '/This Month';
            $response['orders'] = Order::with(['orderproducts' => function ($query) {
                $query->select('id', 'order_id', 'productName');
            }, 'customers' => function ($query) {
                $query->select('id', 'order_id', 'customerName');
            }])->whereIn('orders.status', ['Pending Invoiced', 'Invoiced', 'Stock Out', 'Customer Confirm', 'Request to Return', 'Paid', 'Return', 'Lost', 'Completed', 'Delivered', 'Customer On Hold'])
                ->whereYear('updated_at',  '>=', Carbon::now()->year)->whereMonth('updated_at',  '>=', Carbon::now()->month)->select('id', 'invoiceID', 'subTotal', 'status')->get();
            $response['status'] = 'success';
            return json_encode($response);
        }else{
            $response['title'] = '/This Year';
            $response['orders'] = Order::with(['orderproducts' => function ($query) {
                $query->select('id', 'order_id', 'productName');
            }, 'customers' => function ($query) {
                $query->select('id', 'order_id', 'customerName');
            }])->whereIn('orders.status', ['Pending Invoiced', 'Invoiced', 'Stock Out', 'Customer Confirm', 'Request to Return', 'Paid', 'Return', 'Lost', 'Completed', 'Delivered', 'Customer On Hold'])
                ->whereYear('updated_at',  '>=', Carbon::now()->year)->select('id', 'invoiceID', 'subTotal', 'status')->get();
            $response['status'] = 'success';
            return json_encode($response);
        }
    }



    // Get Payment Type
    public function paymenttype(Request $request)
    {
        if (isset($request['q'])) {
            $paymentTypes = Paymenttype::query()->where([
                ['paymentTypeName', 'like', '%' . $request['q'] . '%'],
                ['status', 'Active']
            ])->get();
        } else {
            $paymentTypes = PaymentType::query()->where('status', 'Active')->get();
        }
        $paymentType = array();
        foreach ($paymentTypes as $item) {
            $paymentType[] = array(
                "id" => $item['id'],
                "text" => $item['paymentTypeName']
            );
        }
        return json_encode($paymentType);
    }

    //Payment_ID
    public function payment_id(Request $request)
    {
        if (isset($request['q'])) {
            $users = Payment::query()->where('name', 'like', '%' . $request['q'] . '%')->get();
        } else {
            $users = Payment::all();
        }
        $user = array();
        foreach ($users as $item) {
            $user[] = array(
                "id" => $item['id'],
                "text" => $item['paymentNumber']
            );
        }
        return json_encode($user);
    }

    //payment number
    public function paymentnumber(Request $request)
    {
        if (isset($request['q']) && $request['paymentTypeID']) {
            $payments = Payment::query()->where([
                ['paymentNumber', 'like', '%' . $request['q'] . '%'],
                ['status', 'like', 'Active'],
                ['payment_type_id', '=', $request['paymentTypeID']]
            ])->get();
        } else {
            $payments = Payment::query()->where([
                ['status', 'like', 'Active'],
                ['payment_type_id', '=', $request['paymentTypeID']]
            ])->get();
        }
        $payment = array();
        foreach ($payments as $item) {
            $payment[] = array(
                "id" => $item['id'],
                "text" => $item['paymentNumber']
            );
        }
        return json_encode($payment);
    }




    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $orders = DB::table('orders')
        ->select('orders.*', 'customers.customerName', 'customers.customerPhone', 'customers.customerAddress', 'couriers.courierName', 'cities.cityName', 'zones.zoneName', 'admins.name',  'paymenttypes.paymentTypeName', 'payments.paymentNumber')
        ->leftJoin('customers', 'orders.id', '=', 'customers.order_id')
        ->leftJoin('couriers', 'orders.courier_id', '=', 'couriers.id')
        ->leftJoin('paymenttypes', 'orders.payment_type_id', '=', 'paymenttypes.id')
        ->leftJoin('payments', 'orders.payment_id', '=', 'payments.id')
        ->leftJoin('cities', 'orders.city_id', '=', 'cities.id')
        ->leftJoin('zones', 'orders.zone_id', '=', 'zones.id')
        ->leftJoin('admins', 'orders.admin_id', '=', 'admins.id')
        ->where('orders.id', '=', $id)->get()->first();
        $products = DB::table('orderproducts')->where('order_id', '=', $id)->get();
        $orders->products = $products;
        $orders->id = $id;
        return view('admin.content.order.edit')->with('order', $orders);
    }

    //product
    public function admproduct(Request $request)
    {
        if (isset($request['q'])) {
            $products = Product::query()->where('ProductName', 'like', '%' . $request['q'] . '%')->get();
        } else {
            $products = Product::all();
        }
        
        $product = array();
        foreach ($products as $item) {
            if (App::environment('local')) {
                $item['ProductImage'] = url($item['ProductImage']);
            } else {
                $item['ProductImage'] = url($item['ProductImage']);
            }
            
            $product[] = array(
                "id" => $item['id'],
                "text" => $item['ProductName'],
                "image" => $item['ProductImage'],
                "productCode" => $item['ProductSku'],
                "productPrice" => $item['ProductSalePrice']
            );
        }
        $data['data'] = $product;
        return json_encode($data);
        die();
    }

    //old orders
    public function previous_orders(Request $request)
    {
        $order_id = $request['id'];
        $customer = Customer::query()->where('order_id', '=', $order_id)->get()->first();

        $orders = DB::table('orders')
            ->select('orders.*', 'customers.*','admins.name')
            ->leftJoin('customers', 'orders.id', '=', 'customers.order_id')
            ->leftJoin('admins', 'orders.admin_id', '=', 'admins.id')
            ->where([
                ['customers.order_id', '!=', $order_id],
                ['customers.customerPhone', $customer->customerPhone]
            ])->get();

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

    //assign user

    public function assignuser(Request $request)
    {
        $user_id = $request['user_id'];
        $ids = $request['ids'];
        if ($ids) {
            foreach ($ids as $id) {
                $order = Order::find($id);
                $order->admin_id = $user_id;
                $order->save();
                $comment = new Comment();
                $user = Admin::find($user_id);
                $comment->order_id = $id;
                $comment->comment = Auth::guard('admin')->user()->name . ' Successfully Assign #BG77' . $id . ' Order to ' . $user->name;
                $comment->admin_id = Auth::guard('admin')->user()->id;
                $comment->save();
            }
            $response['status'] = 'success';
            $response['message'] = 'Successfully Assign User to this Order';
        } else {
            $response['status'] = 'failed';
            $response['message'] = 'Unsuccessful to Assign User to this Order';
        }
        return json_encode($response);
    }


    //change status by checkbox
    public function statusUpdateByCheckbox(Request $request)
    {

        $status = $request['status'];
        $ids = $request['orders_id'];
        if ($ids) {
            foreach ($ids as $id) {
                $order = Order::find($id);
                $order->status = $status;


                if ($status == 'Delivered') {
                    $order->deliveryDate = date('Y-m-d');
                    $orderProducts = Orderproduct::query()->where('order_id', '=', $order->id)->get();
                    foreach ($orderProducts as $orderProduct) {
                        $stock = Stock::query()->where('product_id', '=', $orderProduct->product_id)->first();
                        $stock->stock = $stock->stock - $orderProduct->quantity;
                        $stock->save();
                    }
                }
                if ($status == 'Paid') {
                    $order->completeDate = date('Y-m-d');
                }
                if ($status == 'Return') {
                    $order->completeDate = date('Y-m-d');
                    $orderProducts = Orderproduct::query()->where('order_id', '=', $order->id)->get();
                    foreach ($orderProducts as $orderProduct) {
                        $stock = Stock::query()->where('product_id', '=', $orderProduct->product_id)->first();
                        $stock->stock = $stock->stock + $orderProduct->quantity;
                        $stock->save();
                    }
                }

                $order->save();
                $comment = new Comment();
                $comment->order_id = $id;
                $comment->comment = Auth::guard('admin')->user()->name . ' Successfully Update #BG77' . $id . ' Order status to ' . $status;
                $comment->admin_id = Auth::guard('admin')->user()->id;
                $comment->status = 1;
                $comment->save();
            }
            $response['status'] = 'success';
            $response['message'] = Auth::guard('admin')->user()->name . ' Successfully Update #BG77' . $id . ' Order status to ' . $status;
        } else {
            $response['status'] = 'failed';
            $response['message'] = 'Unsuccessful to change status of this Order';
        }
        return json_encode($response);
    }
    //couriers
    public function couriers(Request $request)
    {
        if (isset($request['q'])) {
            $couriers = Courier::where([
                ['courierName', 'like', '%' . $request['q'] . '%'],
                ['status', 'like', 'Active']
            ])->get();
        } else {
            $couriers = Courier::where('status','Active')->get();
        }
        $courier = array();
        foreach ($couriers as $item) {
            $courier[] = array(
                "id" => $item['id'],
                "text" => $item['courierName']
            );
        }
        return json_encode($courier);
    }

    // Get City
    public function city(Request $request)
    {
        if (isset($request['q']) && $request['courierID']) {
            $cites = City::query()->where([
                ['cityName', 'like', '%' . $request['q'] . '%'],
                ['status', 'like', 'Active'],
                ['courier_id', '=', $request['courierID']]
            ])->get();
        } else {
            $cites = City::query()->where([
                ['status', 'Active'],
                ['courier_id', '=', $request['courierID']]
            ])->get();
        }
        $city = array();
        foreach ($cites as $item) {
            $city[] = array(
                "id" => $item['id'],
                "text" => $item['cityName']
            );
        }
        return json_encode($city);
    }

    // Get Zone
    public function zone(Request $request)
    {
        if (isset($request['q'])) {
            $zones = Zone::query()->where([
                ['zoneName', 'like', '%' . $request['q'] . '%'],
                ['courier_id', '=', $request['courierID']],
                ['status', 'Active'],
                ['city_id','like',  $request['cityID']]
            ])->get();
        } else {
            $zones = Zone::query()->where([
                ['courier_id','like',  $request['courierID']],
                ['city_id','like',  $request['cityID']],
                ['status', 'Active']
            ])->get();
        }
        $zone = array();
        foreach ($zones as $item) {
            $zone[] = array(
                "id" => $item['id'],
                "text" => $item['zoneName']
            );
        }
        return json_encode($zone);
    }



    //comments get
    public function getComments(Request $request)
    {
        $order_id = $request['id'];
        $comment = Comment::where('order_id',  $order_id)->latest()->get();

        $comment['data'] = $comment->map(function ($comment) {
            $admin = DB::table('admins')->select('admins.name')->where('id', '=', $comment->admin_id)->get()->first();
            $comment->name = $admin->name;
            $comment->date = $comment-> created_at->diffForHumans();
            return $comment;
        });
        return json_encode($comment);
    }

    public function updateComments(Request $request)
    {
        $id = $request['id'];
        $note = $request['comment'];
        $notification = new Comment();
        $notification->order_id = $id;
        $notification->comment = $note;
        $notification->admin_id = Auth::guard('admin')->user()->id;
        $request = $notification->save();

        if ($request) {
            $response['status'] = 'success';
            $response['message'] = 'Note Successfully Added To This Order';
        } else {
            $response['status'] = 'failed';
            $response['message'] = 'Unsuccessful to Update Order note';
        }
        return json_encode($response);
        die();
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $order = Order::find($id);
        $order->store_id = $request['data']['storeID'];
        $order->subTotal = $request['data']['total'];
        $oldAmount = $order->paymentAmount;
        $newAmount = $request['data']['paymentAmount'];
        $order->memo = $request['data']['memo'];
        if(isset($request['data']['customerNote'])){
            $order->customerNote = $request['data']['customerNote'];
        }
        $order->deliveryCharge = $request['data']['deliveryCharge'];
        $order->discountCharge = $request['data']['discountCharge'];
        $order->payment_type_id = $request['data']['paymentTypeID'];
        $order->payment_id = $request['data']['paymentID'];
        $order->paymentAmount = $request['data']['paymentAmount'];
        $order->paymentAgentNumber = $request['data']['paymentAgentNumber'];
        $order->orderDate = $request['data']['orderDate'];
        if (!empty($request['data']['deliveryDate'])) {
            $order->deliveryDate = $request['data']['deliveryDate'];
        }
        if (!empty($request['data']['completeDate'])) {
            $order->completeDate = $request['data']['completeDate'];
        }
        $order->courier_id = $request['data']['courierID'];
        $order->city_id = $request['data']['cityID'];
        $order->zone_id = $request['data']['zoneID'];
        $products = $request['data']['products'];



        $result = $order->update();
        if ($result) {
            $customer = Customer::where('order_id', '=', $id)->first();
            $customer->customerName = $request['data']['customerName'];
            $customer->customerPhone = $request['data']['customerPhone'];
            $customer->customerAddress = $request['data']['customerAddress'];
            $customer->update();
            Orderproduct::where('order_id', '=', $id)->delete();
            foreach ($products as $product) {
                $orderProducts = new Orderproduct();
                $orderProducts->order_id = $id;
                $orderProducts->product_id = $product['productID'];
                $orderProducts->productCode = $product['productCode'];
                $orderProducts->productName = $product['productName'];
                $orderProducts->color = $product['productColor'];
                $orderProducts->size = $product['productSize'];
                $orderProducts->weight = $product['productWeight'];
                $orderProducts->quantity = $product['productQuantity'];
                $orderProducts->productPrice = $product['productPrice'];
                $orderProducts->save();
            }
            $comment = new Comment();
            $comment->order_id = $id;
            $comment->comment = Auth::guard('admin')->user()->name . ' Successfully Update Info of #BG77' . $id;
            $comment->admin_id = Auth::guard('admin')->user()->id;
            $comment->save();

            $paymentComplete = Paymentcomplete::where('order_id', $order->id)->first();
            if ($paymentComplete) {
                $paymentComplete->payment_type_id = $request['data']['paymentTypeID'];
                $paymentComplete->payment_id = $request['data']['paymentID'];
                if ($newAmount != $oldAmount) {
                    $paymentComplete->amount = $request['data']['paymentAmount'];
                    $paymentComplete->date = date('Y-m-d');
                }
                $paymentComplete->trid = $request['data']['paymentAgentNumber'];
                $paymentComplete->userID = Auth::guard('admin')->user()->id;
                $paymentComplete->update();
            } else {
                $paymentComplete = new Paymentcomplete();
                $paymentComplete->order_id = $order->id;
                $paymentComplete->payment_type_id = $request['data']['paymentTypeID'];
                $paymentComplete->payment_id = $request['data']['paymentID'];
                $paymentComplete->amount = $request['data']['paymentAmount'];
                $paymentComplete->trid = $request['data']['paymentAgentNumber'];
                $paymentComplete->date = date('Y-m-d');
                $paymentComplete->userID = Auth::guard('admin')->user()->id;
                $paymentComplete->save();
            }
            $response['status'] = 'success';
            $response['message'] = Auth::guard('admin')->user()->name . ' Successfully Update Info of #BG77' . $id;;
        } else {
            $response['status'] = 'failed';
            $response['message'] = 'Unsuccessful to Update Order';
        }
        return json_encode($response);

    }

    // Delete All Orders
    public function delete_selected_order(Request $request)
    {
        $admin=Admin::where('email',Auth::guard('admin')->user()->email)->first();
        $ids = $request['orders_id'];
        if ($ids) {
            foreach ($ids as $id) {
                if ($admin->hasrole('superadmin')) {
                    // Order::query()->truncate();
                    // Customer::query()->truncate();
                    // Orderproduct::query()->truncate();
                    // Comment::query()->truncate();
                } else {
                    $result = Order::find($id);
                    if ($result) {
                        $result->delete();
                        Customer::query()->where('order_id', '=', $id)->delete();
                        Orderproduct::query()->where('order_id', '=', $id)->delete();
                        Comment::query()->where('order_id', '=', $id)->delete();
                    }
                }
            }
            $response['status'] = 'success';
            $response['message'] = 'Successfully Delete Order';
        } else {
            $response['status'] = 'failed';
            $response['message'] = 'Unsuccessful to Delete Order';
        }
        return json_encode($response);
    }


    //unique id
    public function uniqueID()
    {
        $lastOrder = Order::latest('id')->first();
        if ($lastOrder) {
            $orderID = $lastOrder->id + 1;
        } else {
            $orderID = 1;
        }

        return 'BG77' . $orderID;
    }


    //Invoice View
    public function storeInvoice(Request $request)
    {
        $ids = serialize($request['orders_id']);
        $invoice = new Invoice();
        $invoice->order_id = $ids;
        $result = $invoice->save();
        if ($result) {
            $response['status'] = 'success';
            $response['link'] = url('admin_order/invoice/') . '/' . $invoice->id;
        } else {
            $response['status'] = 'failed';
            $response['message'] = 'Unsuccessful to Add Order';
        }
        return json_encode($response);
        die();
    }

    public function viewInvoice($id)
    {
        $invoice = Invoice::find($id);
        return view('admin.content.order.printinvoice', ['invoice' =>$invoice]);
    }



    //send message

    public function sendmessage(Request $request)
    {

        $customerPhone = $request['customerPhone'];
        $customerName = $request['customerName'];
        $invoiceID = $request['invoiceID'];
        $paymentTypeID = $request['paymentTypeID'];
        $orderID = $request['orderID'];
        $ido = $request['storeID'];
        $store = Store::find($ido);

        $storeURL = $store->storeUrl;
        $paymentID = $request['paymentID'];

        $sendstatus =Http::get('https://api.mobireach.com.bd/SendTextMessage?Username=danpitee&Password=Dhaka@5599&From=8801639222111&To=88'.$customerPhone.'&Message=Dear,Customer Please pay your Delivery Charge via '.$paymentTypeID.' Personal, '.$paymentTypeID .': '.$paymentID.' Reference:'.$invoiceID.'.'.$storeURL.'');

        if($sendstatus){
            $comment = new Comment();
            $comment->order_id = $orderID;
            $comment->comment = Auth::guard('admin')->user()->name . ' Send Sms for ' . $paymentTypeID . ' payment on ' . $paymentID . ' For ' . $orderID . ' Order';
            $comment->admin_id = Auth::guard('admin')->user()->id;
            $comment->save();
            $response['status'] = 'success';
            $response['message'] = 'Successfully Send SMS';
        }else{
            $response['status'] = 'failed';
            $response['message'] = 'Unsuccessful to Send SMS';
        }

        return json_encode($response);
        die();
    }

     public function sendwebsite(Request $request)
    {

        $customerPhone = $request['customerPhone'];
        $websiteLink = $request['websiteLink'];
        $orderID = $request['orderID'];

        $sendstatus =Http::get('https://api.mobireach.com.bd/SendTextMessage?Username=danpitee&Password=Dhaka@5599&From=8801639222111&To=88'.$customerPhone.'&Message=Please visit this link '.$websiteLink.' to see our products');

        if($sendstatus){
            $comment = new Comment();
            $comment->order_id = $orderID;
            $comment->comment = Auth::guard('admin')->user()->name . ' Send Website link to BG77' . $orderID . ' ';
            $comment->admin_id = Auth::guard('admin')->user()->id;
            $comment->save();
            $response['status'] = 'success';
            $response['message'] = 'Website link Send Successfully';
        }else{
            $response['status'] = 'failed';
            $response['message'] = 'Unsuccessful to Send SMS';
        }

        return json_encode($response);
        die();
    }


}
