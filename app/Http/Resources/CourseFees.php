<?php

namespace App\Http\Resources;

use App\Majors;
use App\Courses;
use App\FeeCategory;
use App\SchoolYear;
use App\FeeTypes;
use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\Courses as CoursesResource;

class CourseFees extends JsonResource
{
    public function toArray($request)
    {
        $FeeTypes = FeeTypes::find($this->fee_type_id);
        $Courses = Courses::find($this->course_id);
        $SchoolYear = SchoolYear::find($this->sy_id);
        $Category = FeeCategory::find($FeeTypes->fee_category_id);

        $major = Majors::find($Courses->major);
        $fullMajorDesc = null;

        if($major == null){
            $major = null;
            $fullMajorDesc = $Courses->course_code;
        }
        else{
            $major = $major->major_desc;
            $fullMajorDesc = $Courses->course_code." Major in ".$major;
        }

        return [ 
            'course_fee_id' => $this->course_fee_id,
            'fee_type_id' => $this->fee_type_id,
            'course_id' => $this->course_id,
            'sy_id' => $this->sy_id,
            'start' => $SchoolYear->sy_start,
            'end' => $SchoolYear->sy_end,
            'price' => $this->price,
            'fee_type_desc' => $FeeTypes->fee_type_desc,
            'course_desc' => $Courses->course_desc,
            'course_full_info' => $fullMajorDesc,
            'fee_category_desc' => $Category->fee_category_desc,
            'fee_category_id' => $Category->fee_category_id,
            'status' => $this->del_flag
        ];
    }
}
