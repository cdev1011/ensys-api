<?php

namespace App\Http\Controllers;

use App\Courses;
use Illuminate\Http\Request;
use App\Http\Resources\Courses as CoursesResource;

class CoursesController extends Controller
{
    public function index()
    {
        $Courses = Courses::where('del_flag','0')->get();
        return CoursesResource::collection($Courses);
    }

    public function store(Request $request)
    {
        $Courses = new Courses;
        $incrementing = true;
        
        $Courses = $request->isMethod('put') ? Courses::findOrFail
        ($request->course_id) : new Courses;

        $Courses->course_code = $request->input('course_code');
        $Courses->course_title = $request->input('course_title');
        $Courses->course_department = $request->input('course_department');
        $Courses->major = $request->input('major_id');
        $Courses->del_flag = 0;

        $Courses->save();
    }
    
    public function show($id)
    {
        //
    }

    public function update(Request $request, $id)
    {
        //
    }

    public function delete($id)
    {
        Courses::where(['course_id'=>$id])->update(['del_flag'=>'1']);
        return response()->json(['success'],200);
    }
}
