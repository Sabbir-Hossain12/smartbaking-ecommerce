<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\Sluggable\HasSlug;
use Spatie\Sluggable\SlugOptions;

class Product extends Model
{
    use HasSlug;
    use HasFactory;

    public function categories()
    {
        return $this->belongsTo(Category::class, 'category_id');
    }

    public function subcategories()
    {
        return $this->belongsTo(Subcategory::class, 'subcategory_id');
    }

    public function weights()
    {
        return $this->hasMany(Weight::class, 'product_id');
    }

    public function getSlugOptions() : SlugOptions
    {
        return SlugOptions::create()
            ->generateSlugsFrom('ProductName')
            ->saveSlugsTo('ProductSlug');
    }

    /**
     * Get the route key for the model.
     *
     * @return string
     */
    public function getRouteKeyNameCategory()
    {
        return 'ProductSlug';
    }


}