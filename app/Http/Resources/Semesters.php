<?php

namespace App\Http\Resources;

use App\SchoolYear;
use Illuminate\Http\Resources\Json\JsonResource;

class Semesters extends JsonResource
{
    public function toArray($request)
    {
        return [ 
            'semester_id' => $this->semester_id,
            'semester_desc' => $this->semester_desc,
            'del_flag' => $this->del_flag
        ];
    }
}
