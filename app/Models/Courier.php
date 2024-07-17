<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Courier extends Model
{
    use HasFactory;

    protected $fillable = [
        'courierName',
        'hasCity',
        'hasZone',
        'courierCharge',
        'status',
    ];

    public function cities()
    {
        return $this->hasMany(City::class, 'courier_id');
    }

    public function zones()
    {
        return $this->hasMany(Zone::class, 'courier_id');
    }

    public function orders()
    {
        return $this->hasMany(Order::class, 'courier_id');
    }
}