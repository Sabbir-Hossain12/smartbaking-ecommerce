<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBasicinfosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('basicinfos', function (Blueprint $table) {
            $table->id();
            $table->string('phone_one')->nullable();
            $table->string('phone_two')->nullable();
            $table->string('email')->nullable();
            $table->text('logo')->nullable();
            $table->text('address')->nullable();
            $table->text('facebook_pixel')->nullable();
            $table->text('google_analytics')->nullable();
            $table->text('chat_box')->nullable();
            $table->string('inside_dhaka_charge')->nullable();
            $table->string('outside_dhaka_charge')->nullable();
            $table->string('insie_dhaka')->nullable();
            $table->string('outside_dhaka')->nullable();
            $table->string('cash_on_delivery')->nullable();
            $table->string('refund_rule')->nullable();
            $table->string('contact')->nullable();
            $table->string('facebook')->nullable();
            $table->string('twitter')->nullable();
            $table->string('google')->nullable();
            $table->string('rss')->nullable();
            $table->string('pinterest')->nullable();
            $table->string('linkedin')->nullable();
            $table->string('youtube')->nullable();
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
        Schema::dropIfExists('basicinfos');
    }
}