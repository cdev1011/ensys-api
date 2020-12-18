<?php

namespace App\Http\Controllers;

use App\Faculty;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;
use App\Http\Resources\Faculty as FacultyResource;

class FacultyController extends Controller
{
    public function index()
    {
        $faculty = Faculty::where('del_flag',0)->get();
        return FacultyResource::collection($faculty);
    }

    public function store(Request $request)
    {
        $faculty = new Faculty;
        $incrementing = true;

        $cover = $request->file('profile');
        $extension = $cover->getClientOriginalExtension();
        Storage::disk('public')->put($cover->getFilename().'.'.$extension,  File::get($cover));
    
        $faculty->faculty_fname = $request->faculty_fname;
        $faculty->faculty_mname = $request->faculty_mname;
        $faculty->faculty_lname = $request->faculty_lname;
        $faculty->faculty_PIC =  $cover->getFilename().'.'.$extension;
        //New rows
        $faculty->age = $request->age;
        $faculty->civil_status = $request->civil_status;
        $faculty->designation = $request->designation;
        $faculty->years_in_service = $request->years_in_service;
        $faculty->profesional_organization = $request->profesional_organization;
        $faculty->specialization = $request->specialization;
        $faculty->highest_educ_qualification = $request->highest_educ_qualification;
        $faculty->employment_status = $request->employment_status;
        $faculty->del_flag = 0;
        
        $faculty->save();

        return response()->json($request->faculty_fname); 
    }

    public function updateProfilePic(Request $request){

        $cover = $request->file('profile');
        $extension = $cover->getClientOriginalExtension();
        Storage::disk('public')->put($cover->getFilename().'.'.$extension,  File::get($cover));
        
        $img_path =   $cover->getFilename().'.'.$extension;
        
        Faculty::where(['faculty_id'=>$request->faculty_id])->update(['faculty_PIC'=>$img_path]);
        return response()->json(['success'],200);

    }

    public function updateFaculty(Request $request){
        $faculty = new Faculty;
        $incrementing = true;
        
        $faculty = $request->isMethod('put') ? Faculty::findOrFail
        ($request->faculty_id) : new Faculty;

        $faculty->faculty_fname = $request->input('faculty_fname');
        $faculty->faculty_mname = $request->input('faculty_mname');
        $faculty->faculty_lname = $request->input('faculty_lname');
        $faculty->age = $request->input('age');
        $faculty->civil_status = $request->input('civil_status');
        $faculty->designation = $request->input('designation');
        $faculty->years_in_service = $request->input('years_in_service');
        $faculty->profesional_organization = $request->input('profesional_organization');
        $faculty->specialization = $request->input('specialization');
        $faculty->highest_educ_qualification = $request->input('highest_educ_qualification');
        $faculty->employment_status = $request->input('employment_status');
        $faculty->del_flag = 0;

        $faculty->save();

        return response()->json("Updated");
    }

    public function delete($id)
    {
        Faculty::where(['faculty_id'=>$id])->update(['del_flag'=>1]);
        return response()->json(['success'],200);
    }
}
