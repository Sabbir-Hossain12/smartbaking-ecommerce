<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Complain extends Model
{
        use HasFactory;

    protected $fillable = [
        'order_invoice_id',
        'web_ID',
        'store_id',
        'customer_phone',
        'complain_message',
        'site_name',
        'solved_by',
        'solved_date',
        'status',
        'complainDate',
        'solvedDate',
        'admin_id',
    ];

    public function admins()
    {
        return $this->belongsTo(Admin::class, 'admin_id');
    }
}
