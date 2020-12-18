<?php

namespace App\Http\Resources;

use App\Majors;
use App\Courses;
use App\FeeCategory;
use App\SchoolYear;
use App\FeeTypes;
use App\CourseFees;
use Illuminate\Http\Resources\Json\JsonResource;

class EnrollmentFee extends JsonResource
{
    public function toArray($request)
    {
        $CourseFee = CourseFees::find($this->course_fee_id);
        $FeeTypes = FeeTypes::find($CourseFee->fee_type_id);
        $Courses = Courses::find($CourseFee->course_id);
        $SchoolYear = SchoolYear::find($CourseFee->sy_id);
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
            'fee_type_id' => $CourseFee->fee_type_id,
            'course_id' => $CourseFee->course_id,
            'sy_id' => $CourseFee->sy_id,
            'start' => $SchoolYear->sy_start,
            'end' => $SchoolYear->sy_end,
            'price' => $CourseFee->price,
            'fee_type_desc' => $FeeTypes->fee_type_desc,
            'course_desc' => $Courses->course_desc,
            'course_full_info' => $fullMajorDesc,
            'fee_category_desc' => $Category->fee_category_desc,
            'fee_category_id' => $Category->fee_category_id,
            'status' => $this->del_flag
        ];
    }
}
