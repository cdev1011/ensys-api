<?php

namespace App\Http\Controllers;


use App\Students;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;
use App\Http\Resources\Students as StudentsResource;

class StudentsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $Students = Students::where('del_flag',0)->get();
        return StudentsResource::collection($Students);
    }

    public function specificList($flag)
    {
        $Students = Students::where('del_flag',0)
        ->where('tranfer_flag',$flag)
        ->get();

        return StudentsResource::collection($Students);
    }

    public function store(Request $request)
    {
        $student = new Students;
        $incrementing = true;

        $cover = $request->file('student_photo');
        $extension = $cover->getClientOriginalExtension();
        $img_path =   $cover->getFilename().'.'.$extension;
        Storage::disk('public')->put($cover->getFilename().'.'.$extension,  File::get($cover));
    
        $student->student_fname = $request->student_fname;
        $student->student_mname = $request->student_mname;
        $student->student_lname = $request->student_lname;
        $student->student_photo =  $img_path;
        $student->date_of_birth = $request->date_of_birth;
        $student->age = $request->age;
        $student->gender = $request->gender;
        $student->birthplace = $request->birthplace;
        $student->course_id = $request->course_id;
        $student->mobile_number = $request->mobile_number;
        $student->home_address = $request->home_address;
        $student->fathers_name = $request->fathers_name;
        $student->fathers_occup = $request->fathers_occup;
        $student->mothers_name = $request->mothers_name;
        $student->mother_occup = $request->mother_occup;
        $student->parent_tel = $request->parent_tel;
        $student->guardian_name = $request->guardian_name;
        $student->guardian_rel = $request->guardian_rel;
        $student->guradian_Addr = $request->guradian_Addr;
        $student->guardian_occup = $request->guardian_occup;
        $student->guardian_tel = $request->guardian_tel;
        $student->elem_attended = $request->elem_attended;
        $student->elem_yrs_attd = $request->elem_yrs_attd;
        $student->hs_attended = $request->hs_attended;
        $student->hs_yrs_attd = $request->hs_yrs_attd;
        $student->lst_cllg_attd = $request->lst_cllg_attd;
        $student->attd_cllg_lvl = $request->attd_cllg_lvl;
        $student->attd_cllg_sy = $request->attd_cllg_sy;
        $student->creds_presented = $request->creds_presented;
        $student->tranfer_flag = $request->transferee_flag;
        $student->current_year = $request->current_year;
        $student->enrollment_status = "Regular";
        $student->save();

        return response()->json($student->student_id); 
    }

    public function updateStudent(Request $request){
        $student = new Students;
        
        $student = $request->isMethod('put') ? Students::findOrFail
        ($request->student_id) : new Students;
  
        $student->student_fname = $request->student_fname;
        $student->student_mname = $request->student_mname;
        $student->student_lname = $request->student_lname;;
        $student->date_of_birth = $request->date_of_birth;
        $student->age = $request->age;
        $student->gender = $request->gender;
        $student->birthplace = $request->birthplace;
        $student->course_id = $request->course_id;
        $student->mobile_number = $request->mobile_number;
        $student->home_address = $request->home_address;
        $student->fathers_name = $request->fathers_name;
        $student->fathers_occup = $request->fathers_occup;
        $student->mothers_name = $request->mothers_name;
        $student->mother_occup = $request->mother_occup;
        $student->parent_tel = $request->parent_tel;
        $student->guardian_name = $request->guardian_name;
        $student->guardian_rel = $request->guardian_rel;
        $student->guradian_Addr = $request->guradian_Addr;
        $student->guardian_occup = $request->guardian_occup;
        $student->guardian_tel = $request->guardian_tel;
        $student->elem_attended = $request->elem_attended;
        $student->elem_yrs_attd = $request->elem_yrs_attd;
        $student->hs_attended = $request->hs_attended;
        $student->hs_yrs_attd = $request->hs_yrs_attd;
        $student->lst_cllg_attd = $request->lst_cllg_attd;
        $student->attd_cllg_lvl = $request->attd_cllg_lvl;
        $student->attd_cllg_sy = $request->attd_cllg_sy;
        $student->creds_presented = $request->creds_presented;
        $student->tranfer_flag = $request->transferee_flag;
        $student->current_year = $request->current_year;
        $student->enrollment_status = $request->enrollment_status;

        $student->save();

        return response()->json("Updated");
    }

    public function updateProfilePic(Request $request){

        $cover = $request->file('profile');
        $extension = $cover->getClientOriginalExtension();
        Storage::disk('public')->put($cover->getFilename().'.'.$extension,  File::get($cover));
        
        $img_path =   $cover->getFilename().'.'.$extension;
        
        Students::where(['student_id'=>$request->student_id])->update(['student_photo'=>$img_path]);
        return response()->json(['success'],200);

    }

    public function show($id)
    {
        $student = Students::findOrFail($id);
        return new StudentsResource($student);
    }

    public function edit($id)
    {
        //
    }

    public function destroy($id)
    {
        //
    }
}
