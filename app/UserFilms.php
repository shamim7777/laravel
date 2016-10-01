<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Laraveldaily\Quickadmin\Models\Film;
use Laraveldaily\Quickadmin\Observers\UserActionsObserver;

class UserFilms extends Model
{


    protected $fillable = ['user_id','movie_id'];


    public function films()
    {
      return $this->belongsTo('Film','user_id');
    }

    public static function boot()
    {
        parent::boot();

        UserFilms::observe(new UserActionsObserver);
    }
    
}

