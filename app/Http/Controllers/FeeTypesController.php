<?php

namespace App\Http\Controllers;

use App\FeeTypes;
use Illuminate\Http\Request;
use App\Http\Resources\FeeTypes as FeeTypesResource;

class FeeTypesController extends Controller
{
    public function index()
    {
        $FeeTypes = FeeTypes::where('status',0)->get();
        return FeeTypesResource::collection($FeeTypes);
    }

    public function store(Request $request)
    {
        $FeeTypes = new FeeTypes;
        $incrementing = true;
        
        $FeeTypes = $request->isMethod('put') ? FeeTypes::findOrFail
        ($request->fee_type_id) : new FeeTypes;

        $FeeTypes->fee_type_desc = $request->input('fee_type_desc');
        $FeeTypes->fee_category_id = $request->input('fee_category_id');
        $FeeTypes->status = 0;

        $FeeTypes->save();
    }

    public function show($id)
    {
        //
    }

    public function delete($id)
    {
        FeeTypes::where(['fee_type_id'=>$id])->update(['status'=>1]);
        return response()->json(['success'],200);
    }
}
