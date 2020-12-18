<?php

namespace App\Http\Controllers;


use App\Levels;
use Illuminate\Http\Request;
use App\Http\Resources\Faculty as LevelsResource;

class LevelsController extends Controller
{
    public function index()
    {
        $levels = Levels::where('del_flag',0)->get();
        return LevelsResource::collection($levels);
    }

    public function store(Request $request)
    {
        $level = new Levels;
        $incrementing = true;
        
        $level = $request->isMethod('put') ? Levels::findOrFail
        ($request->level_id) : new Levels;

        $level->level_desc = $request->input('level_desc');
        $level->del_flag = 0;

        $level->save();
    }

    public function show($id)
    {
        //
    }

    public function delete($id)
    {
        Levels::where(['level_id'=>$id])->update(['del_flag'=>1]);
        return response()->json(['success'],200);
    }
}
