<?php

namespace App\Http\Controllers;

use App\Subjects;
use Illuminate\Http\Request;
use App\Http\Resources\Subjects as SubjectsResource;

class SubjectsController extends Controller
{
    public function index()
    {
        $subjects = Subjects::where('del_flag',0)->get();
        return SubjectsResource::collection($subjects);
    }

    public function store(Request $request)
    {
        $Subjects = new Subjects;
        $incrementing = true;
        
        $Subjects = $request->isMethod('put') ? Subjects::findOrFail
        ($request->subject_id) : new Subjects;

        $Subjects->subject_course_no = $request->input('subject_course_no');
        $Subjects->descriptive_title = $request->input('descriptive_title');
        $Subjects->del_flag = 0;

        $Subjects->save();
    }

    public function show($id)
    {
        $Subjects = Subjects::findOrFail($id);
        return new SubjectsResource($Subjects);
    }

    public function delete($id)
    {
        Subjects::where(['subject_id'=>$id])->update(['del_flag'=>1]);
        return response()->json(['success'],200);
    }
}
