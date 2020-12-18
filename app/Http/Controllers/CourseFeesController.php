<?php

namespace App\Http\Controllers;


use App\CourseFees;
use Illuminate\Http\Request;
use App\Http\Resources\CourseFees as CourseFeesResource;

class CourseFeesController extends Controller
{
    public function index()
    {
        $CourseFees = CourseFees::where('del_flag',0)->get();
        return CourseFeesResource::collection($CourseFees);
    }

    public function store(Request $request)
    {
        $CourseFees = new CourseFees;
        $incrementing = true;
        
        $CourseFees = $request->isMethod('put') ? CourseFees::findOrFail
        ($request->course_fee_id) : new CourseFees;

        $CourseFees->fee_type_id = $request->input('fee_type_id');
        $CourseFees->course_id = $request->input('course_id');
        $CourseFees->sy_id = $request->input('sy_id');
        $CourseFees->price = $request->input('price');
        $CourseFees->del_flag = 0;

        $CourseFees->save();
    }

    public function CourseFees($course_id)
    {
        $CourseFees = CourseFees::where('del_flag',0)
        ->where('course_id',$course_id)
        ->get();
        return CourseFeesResource::collection($CourseFees);
    }

    public function show($id)
    {
        //
    }

    public function delete($id)
    {
        CourseFees::where(['course_fee_id'=>$id])->update(['del_flag'=>1]);
        return response()->json(['success'],200);
    }
}
