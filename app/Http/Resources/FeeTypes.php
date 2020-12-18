<?php

namespace App\Http\Resources;

use App\FeeCategory;
use Illuminate\Http\Resources\Json\JsonResource;

class FeeTypes extends JsonResource
{
    public function toArray($request)
    {
        $category = FeeCategory::find($this->fee_category_id);
        return [ 
            'fee_type_id' => $this->fee_type_id,
            'fee_type_desc' => $this->fee_type_desc,
            'fee_category_id' => $this->fee_category_id,
            'fee_category_desc' => $category->fee_category_desc,
            'status' => $this->status
        ];
    }
}
