<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Schedules extends Model
{
    protected $table = 'schedule_list';
    protected $primaryKey = 'schedule_id';
    public $timestamps = false;
}
