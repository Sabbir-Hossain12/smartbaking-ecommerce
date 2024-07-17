<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateWeightsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('weights', function (Blueprint $table) {
            $table->id();
            
            $table->foreignId('attrvalue_id')->constrained();
            $table->foreignId('product_id')->constrained();
            $table->string('weight_name')->nullable();
            $table-> decimal('productRegularPrice',10,2)->nullable();
            $table-> decimal('productSalePrice',10,2)->nullable();
            $table->decimal('discount',10,2)->nullable();
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
        Schema::dropIfExists('weights');
    }
}
