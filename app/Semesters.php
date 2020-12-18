<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Semesters extends Model
{
    protected $table = 'semesters';
    protected $primaryKey = 'semester_id';
    public $timestamps = false;
}
