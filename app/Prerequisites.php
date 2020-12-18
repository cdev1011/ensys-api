<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Prerequisites extends Model
{
    protected $table = 'curriculum_prereq';
    protected $primaryKey = 'curr_prereq_id';
    public $timestamps = false;
}
