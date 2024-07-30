<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use App\Models\Basicinfo;
use App\Models\Category;
use App\Models\Menu;
use App\Models\Policymenu;
use App\Models\Brand;
use App\Models\Slider;
use App\Models\Product;
use App\Models\Addbanner;
use App\Models\Servicepackage;
use App\Models\Comment;
use App\Models\Order;
use Stevebauman\Location\Facades\Location;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Rakibhstu\Banglanumber\NumberToBangla;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {

        view()->composer('*', function($view)
        {
            $numto = new NumberToBangla();

            $view->with('numto', $numto);
        });

        View()->composer('admin.content.adminmaincontent', function ($view) {

            $comments = Comment::join('admins', 'admins.id', '=', 'comments.admin_id')->select('comments.*','admins.name')->get()->reverse();
            $orders = DB::table('orders')->whereIn('orders.status', ['Pending Invoiced', 'Invoiced', 'Stock Out', 'Customer Confirm', 'Request to Return', 'Paid', 'Return','Lost', 'Completed','Delivered', 'Customer On Hold'])
                    ->join('orderproducts', 'orders.id', '=', 'orderproducts.order_id')
                    ->select('orders.status', 'orders.orderDate', 'orderproducts.*', DB::raw('SUM(quantity) as total_amount'))
                    ->groupBy('orderproducts.product_id')->orderBy('total_amount','desc')->get();
            $latestorders = DB::table('orders')->whereIn('orders.status', ['Completed','Pending Invoiced', 'Invoiced', 'Stock Out', 'Customer Confirm', 'Request to Return', 'Paid', 'Return', 'Lost', 'Completed', 'Delivered', 'Customer On Hold'])
                ->join('orderproducts', 'orders.id', '=', 'orderproducts.order_id')
                ->select('orders.status', 'orders.orderDate', 'orderproducts.*', DB::raw('SUM(quantity) as total_amount'))
                ->groupBy('orderproducts.product_id')->orderBy('total_amount', 'desc')->get();

            $view->with([
                'comments' => $comments,
                'orders' =>$orders,
                'latestorders' => $latestorders
            ]);
        });

        View()->composer('webview.partials.header', function ($view) {
            $basicinfo =Basicinfo::select('id','logo','marquee_text','phone_one')->first();
            $categories =Category::with(['subcategories'=>function ($query) { $query->select('id','sub_category_name','slug','category_id')->where('status','Active');},])->where('status','Active')->select('id','category_name','slug')->get();

            $view->with([
                'basicinfo' => $basicinfo,
                'categories'=>$categories,
            ]);
        });

        View()->composer('backend.partials.sidebar', function ($view) {
            $menus =Menu::select('id','menu_name','slug')->get();

            $view->with([
                'menus'=>$menus,
            ]);
        });

        View()->composer('webview.content.maincontent', function ($view) {
            $menus = Menu::where('status','Active')->select('id','menu_name','slug')->get();
            $categories = Category::with(['subcategories'=>function ($query) { $query->select('id','sub_category_name','slug','category_id')->where('status','Active');},])->where('status','Active')->select('id','category_name','slug','category_icon')->latest()->take(15)->get()->reverse();
            $categorylist = Category::where('status','Active')->select('id','category_name','slug','category_icon')->get()->chunk(2);
            $navCategories = Category::where('status','Active')->select('id','category_name','slug','category_icon')->limit(5)->get();
            $sliders = Slider::where('status','Active')->select('id','slider_small_title','slider_title','slider_text','slider_btn_name','slider_btn_link','slug','slider_image')->get();
            $topproducts = Product::where('status','Active')->where('top_rated','1')->select('id','ProductName','ViewProductImage','ProductSlug','ProductSku','ProductRegularPrice','ProductSalePrice','Discount','ProductImage')->with('weights')->get();
            $adds = Addbanner::where('status','Active')->select('id','add_link','add_image','status')->get()->take(2);
            $addbottoms = Addbanner::where('status','Active')->select('id','add_link','add_image','status')->get()->reverse()->take(2);
            
            $featuredproducts = Product::with('weights')->where('status','Active')->where('frature','0')->select('id','ProductName','ViewProductImage','ProductSlug','ProductSku','ProductRegularPrice','ProductSalePrice','Discount','ProductImage')->get()->reverse();
            $bestproducts = Product::where('status','Active')->where('best_selling','0')->select('id','ProductName','ViewProductImage','ProductSlug','ProductSku','ProductRegularPrice','ProductSalePrice','Discount','ProductImage')->latest()->take(20)->get()->chunk(2);
            $categoryproducts = Category::with(['products'=>function ($query) { $query->select('id','category_id','ViewProductImage','ProductName','ProductSlug','ProductSku','ProductRegularPrice','ProductSalePrice','Discount','ProductImage')->where('status','Active');},'products.weights'])->where('front_status',0)->select('id','category_name','slug')->get();

          


            $policymenus =Policymenu::where('status','Active')->select('id','policy_menu_name','policy_text')->get();
            $bottombanners =Brand::where('status','Active')->select('id','brand_name','brand_icon')->get();
            $servicepackages =Servicepackage::where('status','Active')->select('id','servicepackage_name','package_text','roles')->get();
            $newproducts =Product::where('status','Active')->select('id','ProductName','ProductSlug','ProductSku','ViewProductImage','ProductRegularPrice','ProductSalePrice','Discount','ProductImage')->latest()->take(20)->get();
            $countproduct=Product::where('status','Active')->select('id','status','ProductName')->get()->count();
            $number=$countproduct/2;
            $bestone=Product::where('status','Active')->select('id','ProductName','ProductSlug','ProductSku','ViewProductImage','ProductRegularPrice','ProductSalePrice','Discount','ProductImage')->get()->chunk(2);
            $specialdeals=Product::where('status','Active')->select('id','ProductName','ProductSlug','ProductSku','ViewProductImage','ProductRegularPrice','ProductSalePrice','Discount','ProductImage')->inRandomOrder()->limit(15)->get()->chunk(3);
            $specialoffers=Product::where('status','Active')->where('Discount','>=','10')->select('id','ProductName','ViewProductImage','ProductSlug','ProductSku','ProductRegularPrice','ProductSalePrice','Discount','ProductImage')->inRandomOrder()->limit(15)->get()->chunk(3);
            $hotoffers=Product::where('status','Active')->where('Discount','>=','20')->select('id','ProductName','ProductSlug','ViewProductImage','ProductSku','ProductRegularPrice','ProductSalePrice','Discount','ProductImage')->inRandomOrder()->limit(4)->get();

            $view->with([
                'addbottoms'=>$addbottoms,
                'bestproducts'=>$bestproducts,
                'categorylist'=>$categorylist,
                'menus'=>$menus,
                'categories'=>$categories,
                'policymenus'=>$policymenus,
                'bottombanners'=>$bottombanners,
                'sliders'=>$sliders,
                'servicepackages'=>$servicepackages,
                'newproducts'=>$newproducts,
                'adds'=>$adds,
                'featuredproducts'=>$featuredproducts,
                'topproducts'=>$topproducts,
                'categoryproducts'=>$categoryproducts,
                'bestone'=>$bestone,
                'specialdeals'=>$specialdeals,
                'specialoffers'=>$specialoffers,
                'hotoffers'=>$hotoffers,
                'navCategories'=>$navCategories
            ]);

        });

        View()->composer('webview.partials.footer', function ($view) {
            $basicinfo =Basicinfo::first();
            $view->with([
                'basicinfo' => $basicinfo,
            ]);
        });



    }
}