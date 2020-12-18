<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class FeeTypes extends Model
{
    protected $table = 'fee_types';
    protected $primaryKey = 'fee_type_id';
    public $timestamps = false;
}
