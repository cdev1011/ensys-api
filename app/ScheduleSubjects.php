<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ScheduleSubjects extends Model
{
    protected $table = 'schedule_subjects';
    protected $primaryKey = 'sched_sub_id';
    public $timestamps = false;
}
