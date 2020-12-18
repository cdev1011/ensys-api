<?php

namespace App\Http\Controllers;


use App\EnrolledSubjects;
use Illuminate\Http\Request;
use App\Http\Resources\EnrolledSubjects as EnrolledSubjectsResource;

class EnrolledSubjectsController extends Controller
{
    public function store(Request $request)
    {
        $incrementing = true;

        $EnrolledSubjects = $request->isMethod('put') ? EnrolledSubjects::findOrFail
        ($request->enrolled_sub_id) : new EnrolledSubjects;

        $EnrolledSubjects->enrollment_id = $request->enrollment_id;
        $EnrolledSubjects->sched_sub_id = $request->sched_sub_id;

        $EnrolledSubjects->prelim_grade = $request->prelim_grade;
        $EnrolledSubjects->mideterm_grade = $request->mideterm_grade;
        $EnrolledSubjects->final_grade = $request->final_grade;
        $EnrolledSubjects->tmg = $request->tmg;
        $EnrolledSubjects->tfg = $request->tfg;
        $EnrolledSubjects->remarks = $request->remarks;

        $EnrolledSubjects->del_flag = 0 ;

        
        $EnrolledSubjects->save();

        return response()->json('success'); 
    }

    
    public function GetEnrollmentSubjects($id){

        $EnrolledSubjects = EnrolledSubjects::where('del_flag',0)
        ->where('enrollment_id',$id)
        ->get();

        return EnrolledSubjectsResource::collection($EnrolledSubjects);
    }

    public function GetEnrollmentSubject($id){

        $EnrolledSubjects = EnrolledSubjects::where('del_flag',0)
        ->where('enrolled_sub_id',$id)
        ->first();

        return $EnrolledSubjects;
    }

    public function delete($id)
    {
        EnrolledSubjects::where(['enrolled_sub_id'=>$id])->update(['del_flag'=>1]);
        return response()->json(['success'],200);
    }

}
