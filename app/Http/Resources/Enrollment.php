<?php

namespace App\Http\Resources;

use App\Courses;
use App\Levels;
use App\SchoolYear;
use App\Semesters;
use App\Students;
use App\UserAccounts;
use App\UserManagement;
use Illuminate\Http\Resources\Json\JsonResource;

class Enrollment extends JsonResource
{
    public function toArray($request)
    {

        $Courses = Courses::find($this->course_id);
        $SchoolYear = SchoolYear::find($this->sy_id);
        $Semesters = Semesters::find($this->semester_id);
        $Levels = Levels::find($this->level_id);
        $Students = Students::find($this->student_id);
        $enrolled_by = UserManagement::find($this->processed_by);
        return [ 
            'enrollment_id' => $this->enrollment_id,
            'student_id' => $this->student_id,
            'course_id' => $this->course_id,
            'sy_id' => $this->sy_id,
            'semester_id' => $this->semester_id,
            'processed_by' => $enrolled_by->uac_fullname,

            //Other objects
            'school_year' => $SchoolYear,
            'course' => $Courses,
            'semester' => $Semesters,
            'student' => $Students,
            'level' => $Levels,
            'enrollment_date' => $this->enrollment_date,
            'full_enrollment_desc' => $Levels->level_desc.' '.$Semesters->semester_desc.' '.$SchoolYear->sy_start.' - '.$SchoolYear->sy_end
         ];

    }
}
