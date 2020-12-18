<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Colleges extends Model
{
    protected $table = 'colleges';
    protected $primaryKey = 'college_id';
    public $timestamps = false;
}
