<?php

namespace App\Http\Resources;

use App\Levels;
use App\SchoolYear;
use App\Subjects;
use App\Faculty;
use App\Courses;
use App\Curriculum;
use Illuminate\Http\Resources\Json\JsonResource;

class Schedules extends JsonResource
{
    public function toArray($request)
    {
        $schoolYear = SchoolYear::find($this->sy_id);
        $curriculum = Curriculum::find($this->curriculum_id); //What curriculum is this absed on
        $course = Courses::find($curriculum->course_id); // For what Course is this Curriculum based on
        return [ 
            'schedule_id' => $this->schedule_id,
            'sy_id' => $this->sy_id,
            'curriculumn_id' => $this->curriculum_id,
            'sy_desc' => $schoolYear->sy_start.'-'.$schoolYear->sy_end,
            'based_on_curriculum' => $course->course_title. ' '.$curriculum->curriculum_year,
            'curriculum_course' => $course->course_code,
            'del_flag' => $this->del_flag
        ];
    }
}
