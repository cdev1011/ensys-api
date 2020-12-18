<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Faculty extends Model
{
    protected $table = 'faculty_profile';
    protected $primaryKey = 'faculty_id';
    public $timestamps = false;
}
