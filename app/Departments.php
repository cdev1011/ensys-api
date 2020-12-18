<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Departments extends Model
{
    protected $table = 'department';
    protected $primaryKey = 'department_id';
    public $timestamps = false;
}
