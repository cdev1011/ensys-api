<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class SchoolYear extends JsonResource
{
    public function toArray($request)
    {
        return [ 
            'sy_id' => $this->sy_id,
            'sy_start' => $this->sy_start,
            'sy_end' => $this->sy_end,
            'sy_full_desc' => $this->sy_start.'-'.$this->sy_end,
            'del_flag' => $this->del_flag
        ];
    }
}
