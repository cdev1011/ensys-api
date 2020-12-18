<?php

namespace App\Http\Controllers;

use App\SchoolYear;
use Illuminate\Http\Request;
use App\Http\Resources\SchoolYear as SchoolYearResource;

class SchoolYearController extends Controller
{
    public function index()
    {
        $SchoolYear = SchoolYear::where('del_flag',0)->get();
        return SchoolYearResource::collection($SchoolYear);
    }

    public function store(Request $request)
    {
        $SchoolYear = new SchoolYear;
        $incrementing = true;
        
        $SchoolYear = $request->isMethod('put') ? SchoolYear::findOrFail
        ($request->sy_id) : new SchoolYear;

        $SchoolYear->sy_start = $request->input('sy_start');
        $SchoolYear->sy_end = $request->input('sy_end');
        $SchoolYear->del_flag = 0;

        $SchoolYear->save();
    }

    public function show($id)
    {
        //
    }

    public function delete($id)
    {
        SchoolYear::where(['sy_id'=>$id])->update(['del_flag'=>1]);
        return response()->json(['success'],200);
    }
}
