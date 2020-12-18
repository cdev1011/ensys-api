<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Students extends Model
{
    protected $table = 'student_info';
    protected $primaryKey = 'student_id';
    public $timestamps = false;
}
