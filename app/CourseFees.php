<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CourseFees extends Model
{
    protected $table = 'course_fees';
    protected $primaryKey = 'course_fee_id';
    public $timestamps = false;
}
