<?php

namespace App\Http\Resources;

use App\Majors;
use App\Levels;
use App\Courses;
use Illuminate\Http\Resources\Json\JsonResource;

class Students extends JsonResource
{
    public function toArray($request)
    {
        $course = Courses::find($this->course_id); // For what Course is this Curriculum based on
        $major = Majors::find($course->major);

        $currentYear = null;
        $CurrentLevelId = null;

        if($this->current_year != null ){
            $Levels = Levels::find($this->current_year);
            $currentYear =  $Levels->level_desc;
            $CurrentLevelId = $Levels->level_id;
        }

        $course_full_title = null;
        
        
        if($major != null){
            $course_full_title = $course->course_code.' '.$course->course_title.' Major in '.$major->major_desc;
        }else{
            $course_full_title = $course->course_code.' '.$course->course_title;
        }

        return [ 
            'student_id' => $this->student_id,
            'student_photo' => $this->student_photo,
            'student_fullname' => $this->student_fname." ".$this->student_mname." ".$this->student_lname,
            'student_fname' => $this->student_fname,
            'student_mname' => $this->student_mname,
            'student_lname' => $this->student_lname,
            'date_of_birth' => $this->date_of_birth,
            'mobile_number' => $this->mobile_number,
            'age' => $this->age,
            'gender' => $this->gender ,
            'birthplace' => $this->birthplace,
            'home_address' => $this->home_address ,
            'fathers_name' => $this->fathers_name ,
            'fathers_occup' => $this->fathers_occup ,
            'mothers_name' => $this->mothers_name,
            'mother_occup' => $this->mother_occup,
            'parent_tel' => $this->parent_tel,
            'guardian_name' => $this->guardian_name,
            'guardian_rel' => $this->guardian_rel,
            'guradian_Addr' => $this->guradian_Addr,
            'guardian_occup' => $this->guardian_occup,
            'guardian_tel' => $this->guardian_tel,
            'elem_attended' => $this->elem_attended,
            'elem_yrs_attd' => $this->elem_yrs_attd,
            'hs_attended' => $this->hs_attended,
            'hs_yrs_attd' => $this->hs_yrs_attd,
            'lst_cllg_attd' => $this->lst_cllg_attd,
            'attd_cllg_lvl' => $this->attd_cllg_lvl,
            'attd_cllg_sy' => $this->attd_cllg_sy,
            'creds_presented' => $this->creds_presented,
            'tranfer_flag' => $this->tranfer_flag,
            'course_id' =>  $this->course_id,
            'course_code' => $course->course_code,
            'current_year' => $currentYear,
            'level_id' => $CurrentLevelId,
            'course_full_desc' =>  $course_full_title ,
            'enrollment_status' =>  $this->enrollment_status,
        ];
    }
}
