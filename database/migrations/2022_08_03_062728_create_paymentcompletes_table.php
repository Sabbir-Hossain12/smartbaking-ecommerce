<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePaymentcompletesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('paymentcompletes', function (Blueprint $table) {
            $table->id();
            $table->integer('order_id');
            $table->integer('payment_type_id')->nullable();
            $table->integer('payment_id')->nullable();
            $table->integer('amount')->default(0);
            $table->string('trid')->nullable();
            $table->date('date');
            $table->integer('userID');
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
        Schema::dropIfExists('paymentcompletes');
    }
}