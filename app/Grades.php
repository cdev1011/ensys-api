<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Grades extends Model
{
    protected $table = 'grades';
    protected $primaryKey = 'grade_id';
    public $timestamps = false;
}
