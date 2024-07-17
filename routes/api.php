<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route; 
use App\Http\Controllers\OrderController;
use App\Http\Controllers\WebviewController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::get('products',[OrderController::class,'getproduct']);
Route::get('order',[OrderController::class,'getorder']);


Route::get('pay/make/{slug}',[WebviewController::class,'makesomething']);
