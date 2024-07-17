<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Orderproduct extends Model
{
    use HasFactory;

    protected $fillable = [
        'order_id',
        'product_id',
        'productCode',
        'productName',
        'productPrice',
        'quantity',
    ];

    public function orders()
    {
        return $this->belongsTo(Order::class, 'order_id');
    }


}