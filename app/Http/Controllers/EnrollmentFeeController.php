<?php

namespace App\Http\Controllers;

use App\EnrollmentFee;
use App\Http\Resources\EnrollmentFee as EnrollmentFeeResource;
use Illuminate\Http\Request;

class EnrollmentFeeController extends Controller
{
    public function index()
    {
        $enrollmentFee = EnrollmentFee::where('del_flag','0')->get();
        return EnrollmentFeeResource::collection($enrollmentFee);
    }

    public function store(Request $request)
    {
        $enrollmentFee = new EnrollmentFee;
        $incrementing = true;
        
        $enrollmentFee = $request->isMethod('put') ? EnrollmentFee::findOrFail
        ($request->enrollment_fee_id ) : new EnrollmentFee;

        $enrollmentFee->enrollment_id = $request->input('enrollment_id');
        $enrollmentFee->course_fee_id = $request->input('course_fee_id');
        //$enrollmentFee->course_department = $request->input('course_department');
        $enrollmentFee->del_flag = 0;

        $enrollmentFee->save();
    }

  
    public function delete($id)
    {
        EnrollmentFee::where(['enrollment_fee_id'=>$id])->update(['del_flag'=>'1']);
        return response()->json(['success'],200);
    }
}
