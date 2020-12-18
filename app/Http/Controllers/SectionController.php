<?php

namespace App\Http\Controllers;

namespace App\Http\Controllers;


use App\Sections;
use Illuminate\Http\Request;
use App\Http\Resources\Major as SectionResource;


class SectionController extends Controller
{
    public function index()
    {
        $section = Sections::where('status','0')->get();
        return SectionResource::collection($section);
    }

    public function store(Request $request)
    {
        $section = new Sections;
        $incrementing = true;
        
        $section = $request->isMethod('put') ? Sections::findOrFail
        ($request->section_id) : new Sections;

        $section->section_desc = $request->input('section_desc');
        $section->status = "0";

        $section->save();
    }

    public function delete($id)
    {
        Sections::where(['section_id'=>$id])->update(['status'=>'1']);
        return response()->json(['success'],200);
    }
}
