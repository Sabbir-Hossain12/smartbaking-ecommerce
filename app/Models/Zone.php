<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Zone extends Model
{
     use HasFactory;

    protected $fillable = [
        'courier_id',
        'city_id',
        'zoneName',
        'zoneId',
        'status',
    ];

    public function couriers()
    {
        return $this->belongsTo(Courier::class, 'courier_id');
    }

    public function cities()
    {
        return $this->belongsTo(City::class, 'city_id');
    }
    public function orders()
    {
        return $this->hasMany(Order::class, 'zone_id');
    }

}