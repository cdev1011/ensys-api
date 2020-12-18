<?php

namespace App\Http\Controllers;

use App\SignatoryTypes;
use Illuminate\Http\Request;
use App\Http\Resources\SignatoryTypes as SignatoryTypesResource;

class SignatoryTypesController extends Controller
{
    public function index()
    {
        $SignatoryTypes = SignatoryTypes::where('del_flag',0)->get();
        return SignatoryTypesResource::collection($SignatoryTypes);
    }

    public function store(Request $request)
    {
        $SignatoryTypes = new SignatoryTypes;
        $incrementing = true;
        
        $SignatoryTypes = $request->isMethod('put') ? SignatoryTypes::findOrFail
        ($request->sig_pos_id) : new SignatoryTypes;

        $SignatoryTypes->sig_pos_desc = $request->input('sig_pos_desc');
        $SignatoryTypes->del_flag = 0;

        $SignatoryTypes->save();
    }

    public function delete($id)
    {
        SignatoryTypes::where(['sig_pos_id'=>$id])->update(['del_flag'=>1]);
        return response()->json(['success'],200);
    }
}
