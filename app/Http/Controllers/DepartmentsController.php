<?php

namespace App\Http\Controllers;


use App\Departments;
use Illuminate\Http\Request;
use App\Http\Resources\Departments as DepartmentsResource;

class DepartmentsController extends Controller
{
    public function index()
    {
        $Departments = Departments::where('status','Active')->get();
        return DepartmentsResource::collection($Departments);
    }

    public function store(Request $request)
    {
        $Departments = new Departments;
        $incrementing = true;
        
        $Departments = $request->isMethod('put') ? Departments::findOrFail
        ($request->department_id) : new Departments;

        $Departments->department_desc = $request->input('department_desc');
        $Departments->status = "Active";

        $Departments->save();
    }

    public function show($id)
    {
        //
    }

    public function delete($id)
    {
        Departments::where(['department_id'=>$id])->update(['status'=>'Inactive']);
        return response()->json(['success'],200);
    }
}
