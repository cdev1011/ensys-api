<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Majors extends Model
{
    protected $table = 'majors';
    protected $primaryKey = 'major_id';
    public $timestamps = false;
}
