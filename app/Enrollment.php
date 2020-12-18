<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Enrollment extends Model
{
    protected $table = 'student_enrollments';
    protected $primaryKey = 'enrollment_id';
    public $timestamps = false;
}
