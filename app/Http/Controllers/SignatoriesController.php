<?php

namespace App\Http\Controllers;

use App\Signatories;
use Illuminate\Http\Request;
use App\Http\Resources\Signatories as SignatoriesResource;

class SignatoriesController extends Controller
{
    public function index()
    {
        $Signatories = Signatories::where('del_flag',0)->get();
        return SignatoriesResource::collection($Signatories);
    }

    public function store(Request $request)
    {
        $Signatories = new Signatories;
        $incrementing = true;
        
        $Signatories = $request->isMethod('put') ? Signatories::findOrFail
        ($request->signatory_id) : new Signatories;

        $Signatories->signatory_person = $request->input('signatory_person');
        $Signatories->sig_pos_id = $request->input('sig_pos_id');
        $Signatories->del_flag = 0;

        $Signatories->save();
    }

    public function delete($id)
    {
        Signatories::where(['signatory_id'=>$id])->update(['del_flag'=>1]);
        return response()->json(['success'],200);
    }
}
