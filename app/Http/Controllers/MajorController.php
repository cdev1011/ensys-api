<?php

namespace App\Http\Controllers;


use App\Majors;
use Illuminate\Http\Request;
use App\Http\Resources\Major as MajorResource;

class MajorController extends Controller
{
    public function index()
    {
        $majors = Majors::where('status','Active')->get();
        return MajorResource::collection($majors);
    }

    public function store(Request $request)
    {
        $majors = new Majors;
        $incrementing = true;
        
        $majors = $request->isMethod('put') ? Majors::findOrFail
        ($request->major_id) : new Majors;

        $majors->major_desc = $request->input('major_desc');
        $majors->status = "Active";

        $majors->save();
    }

    public function delete($id)
    {
        Majors::where(['major_id'=>$id])->update(['status'=>'Inactive']);
        return response()->json(['success'],200);
    }
}
