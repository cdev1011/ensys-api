<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Semesters;
use App\Levels;
use App\Subjects;
use App\Courses;
use App\Majors;

class Curriculum extends JsonResource
{
    public function toArray($request)
    {
        $Courses = Courses::find($this->course_id);
        $major = Majors::find($Courses->major);
        $course_full_title = null;
        
        if($major != null){
            $course_full_title = $Courses->course_code.' '.$Courses->course_title.' Major in '.$major->major_desc;
        }else{
            $course_full_title = $Courses->course_code.' '.$Courses->course_title;
        }
        
         return [ 
            'curriculum_id' => $this->curriculum_id,
            'course_id' => $Courses->course_id,
            'course_code' => $Courses->course_code,
            'course_title' => $Courses->course_title,
            'course_desc' => $Courses->course_desc,
            'course_major' => $Courses->major,
            'course_full_desc' =>  $course_full_title ,
            'year' => $this->curriculum_year,
         ];
    }
}
