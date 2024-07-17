<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('category_id')->unsigned();
            $table->foreign('category_id')->references('id')->on('categories')->onDelete('cascade');
            $table->bigInteger('subcategory_id')->unsigned();
            $table->foreign('subcategory_id')->references('id')->on('subcategories')->onDelete('cascade');
            $table->text('color')->nullable();
            $table->text('size')->nullable();
            $table->text('weight')->nullable();
            $table->string('ProductName');
            $table->string('ProductSlug');
            $table->longText('ProductBreaf')->nullable();
            $table->longText('ProductDetails')->nullable();
            $table->string('ProductSku');
            $table->decimal('ProductRegularPrice',10,2)->default(0);
            $table->decimal('ProductSalePrice',10,2)->default(0);
            $table->string('Discount')->default(0);
            $table->string('ProductImage')->default('public/images/product/default.jpg');
            $table->string('ViewProductImage')->default('public/images/product/default.jpg');
            $table->longText('PostImage')->nullable();
            $table->string('MetaTitle')->nullable();
            $table->string('MetaKey')->nullable();
            $table->text('MetaDescription')->nullable();
            $table->string('status')->default('Active');
            $table->tinyInteger('event')->default(1);
            $table->tinyInteger('frature')->default('0');
            $table->tinyInteger('top_rated')->default('0');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('products');
    }
}