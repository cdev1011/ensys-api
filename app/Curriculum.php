<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Curriculum extends Model
{
    protected $table = 'curriculum';
    protected $primaryKey = 'curriculum_id';
    public $timestamps = false;
}
