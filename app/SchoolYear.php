<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SchoolYear extends Model
{
    protected $table = 'school_year';
    protected $primaryKey = 'sy_id';
    public $timestamps = false;
}
