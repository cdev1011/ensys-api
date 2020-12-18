<?php

namespace App\Http\Resources;

use App\Rooms;
use App\Subjects;
use App\Enrollment;
use App\ScheduleSubjects;
use App\CurriculumSubjects;
use App\Http\Resources\Enrollment as EnrollmentResource;
use App\Faculty;
use Illuminate\Http\Resources\Json\JsonResource;

class EnrolledSubjects extends JsonResource
{
    public function toArray($request)
    {
        $scheduleSubject = ScheduleSubjects::find($this->sched_sub_id);
        $faculty = Faculty::find($scheduleSubject->faculty_id);
        $room = Rooms::find($scheduleSubject->room_id);
        $currSubject = CurriculumSubjects::find($scheduleSubject->curr_sub_id);
        $subject = Subjects::find($currSubject->curr_subject);
        $Enrollment = EnrollmentResource::collection(Enrollment::where('enrollment_id',$this->enrollment_id)
        ->where('del_flag',0)->get());

 
        return [ 
            'enrolled_sub_id' => $this->enrolled_sub_id,
            'enrollment_id' => $this->enrollment_id,
            'sched_sub_id' => $this->sched_sub_id,
            'faculty' => $faculty,
            'room' => $room->room_desc,
            'enrollment_info' => $Enrollment,
            'schedule_subject' => $scheduleSubject,
            'subject_info' => $subject,

            //Grades
            'prelim_grade' => $this->prelim_grade,
            'mideterm_grade' => $this->mideterm_grade,
            'final_grade' => $this->final_grade,
            'tmg' => $this->tmg,
            'tfg' => $this->tfg,
            'remarks' => $this->remarks,
            'lab_units' => $currSubject->curr_lab_units,
            'lec_units' => $currSubject->curr_lec_units,
            'units' => $currSubject->curr_subject_units, //Based on curriculum units, not from subject table!
            'del_flag' => $this->del_flag,
        ];
    }
}
