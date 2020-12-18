<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Curriculum;
use App\Semesters;
use App\Levels;
use App\Subjects;
use App\Courses;
use App\Prerequisites;
use App\Http\Resources\Prerequisites as PrerequisitesResource;

class CurriculumSubjects extends JsonResource
{
    public function toArray($request)
    {        
        $subject = Subjects::find($this->curr_subject);
        $subject_preq = Subjects::find($this->curr_subject_prereq);
        $Levels = Levels::find($this->curr_level);
        $Semesters = Semesters::find($this->curr_semester);
        $Curriculum = Curriculum::find($this->curr_id);
        $Courses = Courses::find($Curriculum->course_id);
        $Prerequisites = PrerequisitesResource::collection(Prerequisites::where('curr_sub_id',$this->curr_sub_id)
        ->where('del_flag',0)
        ->get());
        
         return [ 
            'curr_sub_id'=> $this->curr_sub_id,
            'curr_id'=> $this->curr_id,
            'curr_subject'=> $this->curr_subject,
            'curr_subject_desc'=> $subject->descriptive_title,
            'curr_level'=> $this->curr_level,
            'curr_semester'=> $this->curr_semester,
            'curr_lec_units'=> $this->curr_lec_units,
            'curr_lab_units'=> $this->curr_lab_units,

            'curriculum_year' => $Curriculum->curriculum_year,
            'course' => $Courses->course_code,
            'subject' => $subject->subject_course_no,
            'level' => $Levels->level_desc,
            'semester' => $Semesters->semester_desc,
            'units' => $this->curr_subject_units,
            'prerequisites' => $Prerequisites
         ];
    }
}
