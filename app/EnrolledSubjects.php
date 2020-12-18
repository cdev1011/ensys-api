<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class EnrolledSubjects extends Model
{
    protected $table = 'enrolled_subjects';
    protected $primaryKey = 'enrolled_sub_id';
    public $timestamps = false;
}
