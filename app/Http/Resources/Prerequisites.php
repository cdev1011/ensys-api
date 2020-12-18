<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Subjects;

class Prerequisites extends JsonResource
{
    public function toArray($request)
    {
        $subject = Subjects::find($this->subject_id);

        return [
            "curr_prereq_id" => $this->curr_prereq_id,
            "subject_id" => $this->subject_id,
            "curr_sub_id" => $this->curr_sub_id,
            "subject_course_no" => $subject->subject_course_no,
            "subject_desc" => $subject->descriptive_title,
            "del_flag" => $this->del_flag,
         ];
    }
}
