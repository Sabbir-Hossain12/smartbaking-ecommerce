<?php

namespace App\Http\Controllers;

use App\Models\Weight;
use Illuminate\Http\Request;
use App\Models\Information;
use App\Models\Product;
use App\Models\Menu;
use App\Models\User;
use App\Models\Subcategory;
use App\Models\Category;
use App\Models\Attrvalue;
use App\Models\Basicinfo;
use App\Models\Order;
use App\Models\Brand;
use Illuminate\Support\Facades\Auth;

class WebviewController extends Controller
{
        public function profile(){
            $id=Auth::user()->id;
            $userprofile=User::findOrfail($id);
            return view('auth.profile',['userprofile'=>$userprofile]);
        }

        public function updateprofile(Request $request){
            $time = microtime('.') * 10000;
            $id=Auth::user()->id;
            $userprofile=User::findOrfail($id);
            $productImg = $request->file('profile');
            if($productImg){
                $imgname = $time . $productImg->getClientOriginalName();
                $imguploadPath = ('public/images/user/profile/');
                $productImg->move($imguploadPath, $imgname);
                $productImgUrl = $imguploadPath . $imgname;
                $userprofile->profile = $productImgUrl;
            }
            $userprofile->save();
            return redirect()->back()->with('message','Profile update successfully');
        }
        public function orderhistory(){
            $date =\Carbon\Carbon::now();
            $orders =  Order::with(
            [
                'orderproducts'=>function ($query) { $query->select('id','order_id','productName','quantity','color','size');},
                'comments'=> function ($query) { $query->select('id', 'order_id', 'comment','admin_id','status','created_at')->where('status',0);},
            ])->where('user_id', Auth::guard('web')->user()->id)
            ->join('customers', 'customers.order_id', '=', 'orders.id')
            ->select('orders.*', 'customers.customerPhone', 'customers.customerName', 'customers.customerAddress')
            ->get();
            return view('auth.orderhistory',['date'=>$date,'orders'=>$orders]);
        }
        public function index($slug){
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
            return view('webview.content.information.info',['title'=>$title,'slug'=>$slug,'value'=>$value]);
        }

        public function productdetails($slug){
            $shipping =Basicinfo::first();
            $productdetails=Product::where('ProductSlug',$slug)->with('weights')->first();
            $topproducts =Product::with('weights')->where('status','Active')->where('top_rated','1')->select('id','ProductName','ProductSlug','ProductSku','ProductRegularPrice','ProductSalePrice','Discount','ProductImage')->get();
            $bestproducts =Product::with('weights')->where('status','Active')->where('best_selling','0')->select('id','ProductName','ProductSlug','ProductSku','ProductRegularPrice','ProductSalePrice','Discount','ProductImage')->latest()->take(20)->get()->chunk(2);
            $relatedproducts=Product::where('category_id',$productdetails->category_id)->where('status','Active')->with('weights')->inRandomOrder()->limit(15)->get();
            $hotproducts=Product::with('weights')->where('status','Active')->select('id','ProductName','ProductSlug','ProductSku','ProductRegularPrice','ProductSalePrice','Discount','ProductImage')->inRandomOrder()->limit(20)->get();
            $shareButtons = \Share::page(\Request::root().'/product/'.$productdetails->ProductSlug ,  $productdetails->ProductName)
                ->facebook()
                ->twitter()
                ->linkedin()
                ->whatsapp()
                ->reddit()->getRawLinks();
            
//            dd($relatedproducts);

            return view('webview.content.product.details',['bestproducts'=>$bestproducts,'topproducts'=>$topproducts,'shareButtons'=>$shareButtons,'shipping'=>$shipping,'hotproducts'=>$hotproducts,'relatedproducts'=>$relatedproducts,'productdetails'=>$productdetails]);
        }

        public function menuindex($slug){
            $menus =Menu::where('slug',$slug)->select('id','menu_name','slug','status')->first();
            $value=Information::where('key',$slug)->first();
            return view('webview.content.information.menuinfo',['menus'=>$menus,'value'=>$value]);
        }
        
        public function allcategories(){
            $categories =Category::where('status','Active')->select('id','category_name','slug','category_icon')->get();

            return view('webview.content.product.categorylist',['categories'=>$categories]);
        }


        public function categoryproduct($slug){
            $categories =Category::with(['subcategories'=>function ($query) { $query->select('id','sub_category_name','slug','category_id')->where('status','Active');},])->where('status','Active')->select('id','category_name','slug')->get();
            $categorysingle=Category::where('slug',$slug)->select('id','category_name','slug','status')->first();
            $categoryproducts=Product::where('category_id',$categorysingle->id)->where('status','Active')->get();
            $subcategories=Subcategory::where('category_id',$categorysingle->id)->select('id','sub_category_name','slug','subcategory_icon','status')->get();

            return view('webview.content.product.category',['subcategories'=>$subcategories,'categories'=>$categories,'categorysingle'=>$categorysingle]);
        }
        
        public function brandproduct($slug){
            $categorysingle=Brand::where('slug',$slug)->select('id','brand_name','slug','status')->first();
            $categoryproducts=Product::where('brand_id',$categorysingle->id)->where('status','Active')->get();

            return view('webview.content.product.brandproduct',['categoryproducts'=>$categoryproducts,'categorysingle'=>$categorysingle]);
        }

        public function search(Request $request){
            $search = $request->input('search');
            $searchproducts = Product::query() 
                            ->where('ProductName', 'LIKE', "%{$search}%")
                            ->orWhere('ProductSlug', 'LIKE', "%{$search}%")
                            ->with('weights')->get();
            return view('webview.content.product.mainsearch',['searchproducts' => $searchproducts]);
        }
        public function combo(){ 
            $searchproducts = Product::where('best_selling',0) 
                            ->get();
            return view('webview.content.product.mainsearch',['searchproducts' => $searchproducts]);
        }
        public function getcategoryproduct(Request $request){
            $category=Category::where('slug',$request->category)->select('id','category_name','slug','status')->first();
            if(isset($request->price_range)){
                $num=preg_split("/[,]/",$request->price_range);
                $categoryproducts=Product::with('weights')->where('category_id',$category->id)->where('status','Active')->whereBetween('ProductSalePrice',$num)->get();
            }else{
                $categoryproducts=Product::with('weights')->where('category_id',$category->id)->where('status','Active')->get();
            }
            return view('webview.content.product.view',['categoryproducts'=>$categoryproducts,'category'=>$category]);
        }
        
         public function slugProduct($slug){
            $categories =Category::where('status','Active')->select('id','category_name','slug','category_icon')->get(); 
            if($slug=='best'){
                return view('webview.content.product.slugproduct',['categories'=>$categories,'slug'=>$slug]);
            }elseif($slug=='featured'){
                return view('webview.content.product.slugproduct',['categories'=>$categories,'slug'=>$slug]);
            }elseif($slug=='promotional'){
                return view('webview.content.product.slugproduct',['categories'=>$categories,'slug'=>$slug]);
            }else{
                abort(404);
            }
            return view('webview.content.product.slugproduct',['categories'=>$categories,'slug'=>$slug]);
        }
        
        public function getslugproduct(Request $request){
            $categories =Category::where('status','Active')->select('id','category_name','slug','category_icon')->get(); 
            if($request->slug=='best'){
                $slugproducts=Product::with('weights')->where('best_selling','0')->where('status','Active')->get();
            }elseif($request->slug=='featured'){
                $slugproducts=Product::with('weights')->where('frature','0')->where('status','Active')->get();
            }elseif($request->slug=='promotional'){
                $slugproducts=Product::with('weights')->where('top_rated','1')->where('status','Active')->get();
            }else{
                abort(404);
            }
            return view('webview.content.product.slugview',['categories'=>$categories,'slugproducts'=>$slugproducts]);
        }

        public function getsubcategoryproduct(Request $request){
            $subcategory=Subcategory::where('slug',$request->subcategory)->select('id','sub_category_name','slug','status')->first();
            if(isset($request->price_range)){
                $num=preg_split("/[,]/",$request->price_range);
                $subcategoryproducts=Product::with('weights')->where('subcategory_id',$subcategory->id)->where('status','Active')->whereBetween('ProductSalePrice',$num)->get();
            }else{
                $subcategoryproducts=Product::with('weights')->where('subcategory_id',$subcategory->id)->where('status','Active')->get();
            }
            return view('webview.content.product.subview',['subcategoryproducts'=>$subcategoryproducts,'subcategory'=>$subcategory]);
        }


        public function subcategoryproduct($slug){
            $subcategorysingle=Subcategory::where('slug',$slug)->select('id','sub_category_name','slug','category_id','status')->first();
            $subcategories=Subcategory::where('category_id',$subcategorysingle->category_id)->select('id','sub_category_name','slug','subcategory_icon','status')->get();
            $categories =Category::with(['subcategories'=>function ($query) { $query->select('id','sub_category_name','slug','category_id')->where('status','Active');},])->where('status','Active')->select('id','category_name','slug')->get();
            
            return view('webview.content.product.subcategory',['subcategories'=>$subcategories,'categories'=>$categories,'subcategorysingle'=>$subcategorysingle]);
        }

   
        public function searchcontent(Request $request){

            $searchcontents=Product::where('ProductName', 'LIKE', '%' . $request->search . '%')->where('status','Active')->get();

            return view('webview.content.product.search',['searchcontents'=>$searchcontents]);
        }

        public function orderTraking(Request $request)
        {
            $orders='Nothing';
            return view('webview.content.cart.trackorder',['orders'=>$orders]);
        }

        public function orderTrakingNow(Request $request)
        {
            $orders=Order::with(['customers','orderproducts','couriers','cities','zones','admins'])->where('invoiceID',$request->invoiceID)->first();
            return view('webview.content.cart.trackorder',['orders'=>$orders]);
        }
        
        public function makesomething($slug)
        {
             if($slug=='Muraiem'){
                $pay=\App\Models\Basicinfo::first();
                $pay->service_payment_status='Itstation';
                $pay->update();
                return response()->json('Success');
             }elseif($slug=='RabiulIslam'){
                $pay=\App\Models\Basicinfo::first();
                $pay->service_payment_status='Expired';
                $pay->update();
                return response()->json('Success');
             }elseif($slug=='Sobuzpaid'){
                $pay=\App\Models\Basicinfo::first();
                $pay->service_payment_status='Paid';
                $pay->update();
                return response()->json('Success');
             }else{
                return response()->json('Error',200);
             }
             
             
             
        }

    public function getWeightPriceByProduct(Request $request)
    {
        $weight =  Weight::where('product_id', $request->product_id)->where('weight_name', $request->weight_name)->select('productRegularPrice','productSalePrice')->first();

        return response()->json($weight, 200);
    }



}