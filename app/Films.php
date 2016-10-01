<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Laraveldaily\Quickadmin\Observers\UserActionsObserver;


use Illuminate\Database\Eloquent\SoftDeletes;

class Films extends Model {

    use SoftDeletes;

    /**
    * The attributes that should be mutated to dates.
    *   
    * @var array
    */
    protected $dates = ['deleted_at'];

    protected $table    = 'films';
    
    protected $fillable = [
          'movie_name',
          'imdb_rating'
    ];
    
    public $relation_ids = [];

    public function users()
    {
        return $this->belongsToMany('User');
    }

    public static function boot()
    {
        parent::boot();

        Films::observe(new UserActionsObserver);
    }
    
    
    
    
}