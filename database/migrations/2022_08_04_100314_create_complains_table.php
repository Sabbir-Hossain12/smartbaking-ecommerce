<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateComplainsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('complains', function (Blueprint $table) {
            $table->id();
            $table->string('order_invoice_id');
            $table->string('web_ID')->nullable(); // Website ID
            $table->integer('store_id'); // Store ID
            $table->string('customer_phone');
            $table->text('complain_message');
            $table->string('site_name')->nullable();
            $table->string('solved_by')->nullable();
            $table->string('solved_date')->nullable();
            $table->string('status')->default('Pending');
            $table->date('complainDate')->nullable();
            $table->date('solvedDate')->nullable();
            $table->integer('admin_id')->nullable(); // Store ID
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
        Schema::dropIfExists('complains');
    }
}