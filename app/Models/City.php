<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class City extends Model
{
    use HasFactory;
    protected $fillable = [
        'courier_id',
        'cityName',
        'division',
        'status',
    ];

    public function couriers()
    {
        return $this->belongsTo(Courier::class, 'courier_id');
    }

    public function zones()
    {
        return $this->hasMany(Zone::class, 'city_id');
    }
    public function orders()
    {
        return $this->hasMany(Order::class, 'city_id');
    }
}