<?php

namespace App\Http\Controllers;

use App\Semesters;
use Illuminate\Http\Request;
use App\Http\Resources\Semesters as SemestersResource;

class SemestersController extends Controller
{
    public function index()
    {
        $Semesters = Semesters::where('del_flag',0)->get();
        return SemestersResource::collection($Semesters);
    }

    public function store(Request $request)
    {
        $Semesters = new Semesters;
        $incrementing = true;
        
        $Semesters = $request->isMethod('put') ? Semesters::findOrFail
        ($request->semester_id) : new Semesters;

        $Semesters->semester_desc = $request->input('semester_desc');
        $Semesters->del_flag = 0;

        $Semesters->save();
    }

    public function show($id)
    {
        
    }

    public function delete($id)
    {
        Semesters::where(['semester_id'=>$id])->update(['del_flag'=>1]);
        return response()->json(['success'],200);
    }
}
