<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class UserTypes extends Model
{
    protected $table = 'uac_types';
    protected $primaryKey = 'uac_type_id';
    public $timestamps = false;
}
