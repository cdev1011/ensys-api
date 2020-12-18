<?php
namespace App\Http\Resources;

use App\SignatoryTypes;
use Illuminate\Http\Resources\Json\JsonResource;

class Signatories extends JsonResource
{
    public function toArray($request)
    {
        $SignatoryTypes = SignatoryTypes::find($this->sig_pos_id); //find uac_type_id

        return [ 
            'signatory_id' => $this->signatory_id,
            'signatory_person' => $this->signatory_person,
            'sig_pos_id' => $this->sig_pos_id,
            'sig_pos_desc' => $SignatoryTypes->sig_pos_desc,
            'del_flag' => $this->del_flag
        ];
    }
}
