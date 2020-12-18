<?php

namespace App\Http\Controllers;

use App\FeeCategory;
use Illuminate\Http\Request;
use App\Http\Resources\FeeCategory as FeeCategoryResource;

class FeeCategoryController extends Controller
{
    public function index()
    {
        $FeeCategory = FeeCategory::where('status',0)->get();
        return FeeCategoryResource::collection($FeeCategory);
    }

    public function store(Request $request)
    {
        $FeeCategory = new FeeCategory;
        $incrementing = true;
        
        $FeeCategory = $request->isMethod('put') ? FeeCategory::findOrFail
        ($request->fee_category_id) : new FeeCategory;

        $FeeCategory->fee_category_desc = $request->input('fee_category_desc');
        $FeeCategory->status = 0;

        $FeeCategory->save();
    }

    public function show($id)
    {
        //
    }

    public function delete($id)
    {
        FeeCategory::where(['fee_category_id'=>$id])->update(['status'=>1]);
        return response()->json(['success'],200);
    }
}
