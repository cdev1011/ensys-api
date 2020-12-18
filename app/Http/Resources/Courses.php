<?php

namespace App\Http\Resources;

use App\Majors;
use App\Departments;
use Illuminate\Http\Resources\Json\JsonResource;

class Courses extends JsonResource
{
    public function toArray($request)
    {
        $major = Majors::find($this->major);
        $department = Departments::find($this->course_department);
        $fullMajorDesc = null;

        if($major == null){
            $major = null;
            $fullMajorDesc = $this->course_code;
        }
        else{
            $major = $major->major_desc;
            $fullMajorDesc = $this->course_code." Major in ".$major;
        }

        return [ 
            'course_id' => $this->course_id,
            'course_code' => $this->course_code,
            'course_title' => $this->course_title,
            'course_department' => $department->department_desc,
            'department_id' => $department->department_id,
            'major_id' => $this->major,
            'major_desc' => $major,
            'full_course_desc' => $fullMajorDesc,
            'del_flag' => $this->del_flag
        ];
        // return parent::toArray($request);
    }
}
