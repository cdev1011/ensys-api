<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CurriculumSubjects extends Model
{
    protected $table = 'curriculum_subjects';
    protected $primaryKey = 'curr_sub_id';
    public $timestamps = false;
}
