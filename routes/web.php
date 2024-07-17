<?php

use App\Models\Product;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\WebviewController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\OrderController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('webview.content.maincontent');
});
// web view

Route::get('venture/{slug}', [WebviewController::class, 'index']);
Route::get('menu/{slug}', [WebviewController::class, 'menuindex']);
Route::get('product/{slug}', [WebviewController::class, 'productdetails']);
Route::get('products/category/{slug}', [WebviewController::class, 'categoryproduct']);
Route::get('products/brand/{slug}', [WebviewController::class, 'brandproduct']);
Route::get('get/products/by-category', [WebviewController::class, 'getcategoryproduct']);
Route::get('get/products/by-subcategory', [WebviewController::class, 'getsubcategoryproduct']);
Route::get('products/sub/category/{slug}', [WebviewController::class, 'subcategoryproduct']); 
Route::get('/search', [WebviewController::class, 'search'])->name('search');
Route::get('/combo-offer', [WebviewController::class, 'combo'])->name('combo');

Route::get('get/slug/products', [WebviewController::class, 'getslugproduct']);
Route::get('view/categories', [WebviewController::class, 'allcategories']);
// cart
Route::post('add-to-cart', [CartController::class, 'addtocart']);
Route::post('order-to-cart', [CartController::class, 'ordertocart']);
Route::get('get-cart-content', [CartController::class, 'getcartcontent']);
Route::post('remove-cart', [CartController::class, 'destroy']);
Route::get('update-cart', [CartController::class, 'cartcontent']);
Route::get('get-checkcart-content', [CartController::class, 'getcheckcartcontent']);
Route::get('cart', [CartController::class, 'cart']);
Route::get('checkout', [CartController::class, 'checkout']);
Route::get('order-received', [CartController::class, 'payment'])->name('payment.methood');
Route::get('order/complete', [CartController::class, 'complete']);
Route::post('/update-cart', [CartController::class, 'updatecart']);
Route::get('load-cart', [CartController::class, 'loadcart']);
Route::post('press/order', [OrderController::class, 'pressorder']);
Route::post('update/paymentmethood', [OrderController::class, 'updatepaymentmethood']);
Route::get('get-search-content', [WebviewController::class, 'searchcontent']);
Route::get('track-order', [WebviewController::class, 'orderTraking']);
Route::post('track-now', [WebviewController::class, 'orderTrakingNow']);

Route::group(['middleware' => ['auth:web']], function () {
    Route::get('user/profile', [WebviewController::class, 'profile']);
    Route::post('update/profile', [WebviewController::class, 'updateprofile']);
    Route::get('user/purchase_history', [WebviewController::class, 'orderhistory']);

});

//weightbyproduct

Route::get('get/price-by-weight', [WebviewController::class, 'getWeightPriceByProduct']);


Route::get('user/dashboard', function () {
    return view('dashboard');
})->middleware(['auth:web'])->name('dashboard');
require __DIR__.'/auth.php';
require __DIR__.'/admin.php';
Route::get('{slug}/products', [WebviewController::class, 'slugProduct']);

Route::get('/dummyPr',function ()
{
  return  Product::where('status','Active')->where('frature','0')->select('id','ProductName','ViewProductImage','ProductSlug','ProductSku','ProductRegularPrice','ProductSalePrice','Discount','ProductImage')->with('weights')->get()->reverse();
}
);