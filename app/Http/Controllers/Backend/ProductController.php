<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;

use App\Models\Product;
use App\Models\Category;
use App\Models\Attrvalue;
use App\Models\Attribute;
use App\Models\Subcategory;
use App\Models\Brand;
use App\Models\Stock;
use App\Models\Purchase;
use App\Models\Weight;
use Illuminate\Http\Request;
use DataTables;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $sizes=Attrvalue::where('attribute_id',2)->where('status','Active')->get();
        $colors=Attrvalue::where('attribute_id',3)->where('status','Active')->get();
        $weights=Attrvalue::where('attribute_id',1)->where('status','Active')->get();
        $categories =Category::where('status','Active')->select('id','category_name','status')->get();
        $brands =Brand::where('status','Active')->select('id','brand_name','status')->get();
        $subcategories =Subcategory::where('status','Active')->select('id','sub_category_name')->get();
        return view('backend.content.product.index',['brands'=>$brands,'weights'=>$weights,'colors'=>$colors,'sizes'=>$sizes,'categories'=>$categories,'subcategories'=>$subcategories]);
    }


    public function weightInfo()
    {
        $weights= Attrvalue::where('attribute_name','Weight')->where('status','Active')->get(['id', 'value as text']);
        
        return response()->json($weights);
    }

    public function create()
    {
        $sizes=Attrvalue::where('attribute_id',2)->where('status','Active')->get();
        $colors=Attrvalue::where('attribute_id',3)->where('status','Active')->get();
        $weights=Attrvalue::where('attribute_id',1)->where('status','Active')->get();
        $categories =Category::where('status','Active')->select('id','category_name','status')->get();
        $brands =Brand::where('status','Active')->select('id','brand_name','status')->get();
        $subcategories =Subcategory::where('status','Active')->select('id','sub_category_name')->get();
        return view('backend.content.product.create',['brands'=>$brands,'weights'=>$weights,'colors'=>$colors,'sizes'=>$sizes,'categories'=>$categories,'subcategories'=>$subcategories]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function statusupdate(Request $request)
    {
        $product=Product::where('id',$request->product_id)->first();
        $product->status=$request->status;
        $product->update();
        return response()->json($product, 200);
    }

    public function featurestatusupdate(Request $request)
    {
        $product=Product::where('id',$request->product_id)->first();
        $product->frature=$request->frature;
        $product->update();
        return response()->json($product, 200);
    }

    public function bestsellstatusupdate(Request $request)
    {
        $product=Product::where('id',$request->product_id)->first();
        $product->best_selling=$request->best;
        $product->update();
        return response()->json($product, 200);
    }

    public function ratedstatusupdate(Request $request)
    {
        $product=Product::where('id',$request->product_id)->first();
        $product->top_rated=$request->top_rated;
        $product->update();
        return response()->json($product, 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $product = new Product();
        $product->ProductName = $request->ProductName;
        $product->ProductBreaf = $request->ProductBreaf;
        $product->ProductDetails = $request->ProductDetails;
        $product->ProductSku = $this->sku();
        $product->ProductRegularPrice = $request->ProductRegularPrice;
        $product->Discount=$request->Discount;
        $product->ProductSalePrice=$request->ProductSalePrice;
        $product->category_id= $request->category_id;
        $product->youtube_embade= $request->youtube_embade;
        $product->brand_id= $request->brand_id;
        $product->subcategory_id= $request->subcategory_id;

        if ($request->color) {
            $product->color = json_encode($request->color);
        }
        if ($request->size) {
            $product->size = json_encode($request->size);
        }
        if ($request->weight) {
            $product->weight = json_encode($request->weight);
        }

        $time = microtime('.') * 10000;

        $productImg = $request->file('ProductImage');
        if($productImg){
            $imgname = $time . $productImg->getClientOriginalName();
            $imguploadPath = ('public/images/product/image/');
            $productImg->move($imguploadPath, $imgname);
            $productImgUrl = $imguploadPath . $imgname;
            $product->ProductImage = $productImgUrl;
            $webp = $productImgUrl;
            $im = imagecreatefromstring(file_get_contents($webp));
            $new_webp = preg_replace('"\.(jpg|jpeg|png|webp)$"', '.webp', $webp);
            imagewebp($im, $new_webp, 50);
            $product->ViewProductImage = $new_webp;
        }

        if ($request->hasFile('PostImage')) {
            foreach ($request->file('PostImage') as $imgfiles) {
                $name = time() . "_" . $imgfiles->getClientOriginalName();
                $imgfiles->move(public_path() . '/images/product/slider/', $name);
                $imageData[] = $name;
            }
            $product->PostImage = json_encode($imageData);
        };

        $result=$product->save();


        // Decode the JSON string
        $products = json_decode($request->product, true) ?? [];

        // Loop through each product and save to the database
        if (count($products)>0) {
            foreach ($products as $weightAtrribute) {
                $weight = new Weight();
                $weight->attrvalue_id = $weightAtrribute['attrValueId'];
                $weight->product_id = $product->id;
                $weight->weight_name = $weightAtrribute['productWeight'];
                $weight->productRegularPrice = $weightAtrribute['productRegularPrice'];
                $weight->discount = $weightAtrribute['productDiscount'];
                $weight->productSalePrice = $weightAtrribute['productRegularPrice'] - ($weightAtrribute['productRegularPrice'] * $weightAtrribute['productDiscount'] / 100);
                $weight->save();
            }
        }

        if ($result) {
            $latestStock = new Stock();
            $latestStock->product_id = $product->id;
            $latestStock->purchase = 0;
            $latestStock->stock = 100;
            $latestStock->save();
            $purchase = new Purchase();
            $purchase->date = date('Y-m-d');
            $purchase->invoiceID = date('Y-m-d');
            $purchase->product_id = $product->id;
            $purchase->supplier_id = 1;
            $purchase->quantity = 100;
            $purchase->save();
        }

        return response()->json($product, 200);
    }

    public function sku()
    {
        $lastProduct = Product::latest('id')->first();
        if ($lastProduct) {
            $ProductID = $lastProduct->id + 1;
        } else {
            $ProductID = 1;
        }

        return 'BNL000' . $ProductID;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function productdata()
    {
        $products = Product::all();
        return Datatables::of($products)
            ->addColumn('action', function ($products) {
                $editRoute=route('admin.products.edit', $products->id);
                return '<a href="'.$editRoute.'" type="button" id="editProductBtn" data-id="' . $products->id . '"   class="btn btn-primary btn-sm"  style="margin-bottom:2px;"><i class="bi bi-pencil-square"></i></a>
                <a href="#" type="button" style="margin-bottom:2px;" id="deleteProductBtn" data-id="' . $products->id . '" class="btn btn-danger btn-sm" ><i class="bi bi-archive" ></i></a>';
            })

            ->make(true);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $sizes=Attrvalue::where('attribute_id',2)->where('status','Active')->get();
        $colors=Attrvalue::where('attribute_id',3)->where('status','Active')->get();
        $weights=Attrvalue::where('attribute_id',1)->where('status','Active')->get();
        $categories =Category::where('status','Active')->select('id','category_name','status')->get();
        $brands =Brand::where('status','Active')->select('id','brand_name','status')->get();
        $product=Product::where('id',$id)->first();
        $subcategories =Subcategory::where('status','Active')->where('category_id',$product->category_id)->select('id','sub_category_name')->get();
        
//        $subCats=Subcategory::where('id',$product->subcategory_id)->where('id','!=',null)->first();
//      return response()->json($product, 200);
        
        $weightInfo=Weight::where('product_id',$id)->get();
        return view('backend.content.product.edit',compact(['product','sizes','colors','weights','categories','brands','subcategories','weightInfo']));
        
    }
    
    
    public function editProductData($id)
    {
        $product=Product::where('id',$id)->first();

        return response()->json($product, 200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $product = Product::where('id',$id)->first();
        $product->ProductName = $request->ProductName;
        $product->ProductBreaf = $request->ProductBreaf;
        $product->ProductDetails = $request->ProductDetails;
        $product->ProductRegularPrice = $request->ProductRegularPrice;
        $product->Discount=$request->Discount;
        $product->ProductSalePrice=$request->ProductSalePrice;
        $product->category_id= $request->category_id;
        $product->youtube_embade= $request->youtube_embade;
        $product->subcategory_id= $request->subcategory_id;
        $product->brand_id= $request->brand_id;

        if ($request->color) {
            $product->color = json_encode($request->color);
        }
        
        if ($request->size) {
            $product->size = json_encode($request->size);
        }
        if ($request->weight) {
            $product->weight = json_encode($request->weight);
        }

        $time = microtime('.') * 10000;

        $productImg = $request->file('ProductImage');

        if($productImg){
             unlink($product->ProductImage);
             unlink($product->ViewProductImage);
            $imgname = $time . $productImg->getClientOriginalName();
            $imguploadPath = ('public/images/product/image/');
            $productImg->move($imguploadPath, $imgname);
            $productImgUrl = $imguploadPath . $imgname;
            $product->ProductImage = $productImgUrl;
            $webp = $productImgUrl;
            $im = imagecreatefromstring(file_get_contents($webp));
            $new_webp = preg_replace('"\.(jpg|jpeg|png|webp)$"', '.webp', $webp);
            imagewebp($im, $new_webp, 50);
            $product->ViewProductImage = $new_webp;
        }

        if ($request->hasFile('PostImage')) {
            if($product->PostImage){
                foreach (json_decode($product->PostImage) as $postimg) {
                    unlink('public/images/product/slider/' . $postimg);
                }
            }
            foreach ($request->file('PostImage') as $imgfiles) {
                $name = time() . "_" . $imgfiles->getClientOriginalName();
                $imgfiles->move(public_path() . '/images/product/slider/', $name);
                $imageData[] = $name;
            }
            $product->PostImage = json_encode($imageData);
        }

        $product->save();

        // Decode the JSON string
        $products = json_decode($request->product, true) ?? [];

//         Loop through each product and save to the database
//                if (count($products)>0) {
//                foreach ($products as $weightAtrribute) {
//                $weight = new Weight();
//                $weight->attrvalue_id = $weightAtrribute['attrValueId'];
//                $weight->product_id = $product->id;
//                $weight->weight_name = $weightAtrribute['productWeight'];
//                $weight->productRegularPrice = $weightAtrribute['productRegularPrice'];
//                $weight->discount = $weightAtrribute['productDiscount'];
//                $weight->productSalePrice = $weightAtrribute['productRegularPrice'] - ($weightAtrribute['productRegularPrice'] * $weightAtrribute['productDiscount'] / 100);
//                $weight->save();
//            }
//        }

        if (count($products) > 0) {
            foreach ($products as $weightAttribute) {
                // Define the attributes to find or create the Weight record
                $attributes = [
                    'attrvalue_id' => $weightAttribute['attrValueId'],
                    'product_id' => $product->id,
                ];

                // Define the values to update or set
                $values = [
                    'weight_name' => $weightAttribute['productWeight'],
                    'productRegularPrice' => $weightAttribute['productRegularPrice'],
                    'discount' => $weightAttribute['productDiscount'],
                    'productSalePrice' => $weightAttribute['productRegularPrice'] - ($weightAttribute['productRegularPrice'] * $weightAttribute['productDiscount'] / 100),
                ];

                // Use updateOrCreate to create or update the record
                $weight =  Weight::updateOrCreate($attributes, $values);


//                 Add the weight ID to the updated list
                $updatedWeightIds[] = $weight->id;
            }

            // Delete weights that are not in the updated list
            Weight::where('product_id', $product->id)->whereNotIn('id', $updatedWeightIds)->delete();
            
            
        }

        if($product){
            return response()->json($product, 200);
        }else{
            return response()->json('error', 200);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function destroy(Product $product)
    {
        if($product->ProductImage){
            if (file_exists($product->ProductImage))
            unlink($product->ProductImage);
        }
        Weight::where('product_id', $product->id)->delete();
        $product->delete();
        return response()->json('success',200);
    }

   
}
