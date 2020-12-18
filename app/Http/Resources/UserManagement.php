<?php

namespace App\Http\Resources;

use App\UserTypes;
use Illuminate\Http\Resources\Json\JsonResource;

class UserManagement extends JsonResource
{
    public function toArray($request)
    {
        $user_type = UserTypes::find($this->uac_type); //find uac_type_id

        return [ 
            'uac_id' => $this->uac_id,
            'uac_type_id' => $user_type->uac_type_id,
            'uac_fullname' => $this->uac_fullname,
            'uac_type_desc' => $user_type->uac_type_desc,
            'uac_name' => $this->uac_name,
            'uac_pword' => $this->uac_pword,
            'del_flag' => $this->del_flag,
        ];
    }
}
