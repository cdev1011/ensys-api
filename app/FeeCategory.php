<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class FeeCategory extends Model
{
    protected $table = 'fee_category';
    protected $primaryKey = 'fee_category_id';
    public $timestamps = false;
}
