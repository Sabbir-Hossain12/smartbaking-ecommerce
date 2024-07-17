<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Purchase extends Model
{
    use HasFactory;

    protected $fillable = [
        'invoiceID',
        'date',
        'product_id',
        'supplier_id',
        'quantity',
        'status',
    ];


    public function products()
    {
        return $this->belongsTo(Product::class, 'product_id');
    }

    public function suppliers()
    {
        return $this->belongsTo(Supplier::class, 'supplier_id');
    }
}