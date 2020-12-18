<?php

namespace App\Http\Controllers;

use App\Colleges;
use Illuminate\Http\Request;
use App\Http\Resources\College as CollegesResource;

class CollegeController extends Controller
{ 
    public function index()
    {
        $college = Colleges::where('status',0)->get();
        return CollegesResource::collection($college);
    }

    public function store(Request $request)
    {
        $college = new Colleges;
        $incrementing = true;
        
        $college = $request->isMethod('put') ? Colleges::findOrFail
        ($request->college_id) : new Colleges;

        $college->college_id = $request->input('college_id');
        $college->college_desc = $request->input('college_desc');
        $college->status = 0;

        $college->save();
    }

    public function show($id)
    {
        //
    }

    public function delete($id)
    {
        colleges::where(['college_id'=>$id])->update(['status'=>1]);
        return response()->json(['success'],200);
    }
}
