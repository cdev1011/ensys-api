<?php

namespace App\Http\Controllers;

use App\Prerequisites;
use Illuminate\Http\Request;
use App\Http\Resources\Prerequisites as PrerequisitesResource;

class PrerequisitesController extends Controller
{

    public function store(Request $request)
    {
        $Prerequisites = new Prerequisites;
        $incrementing = true;

        //Looop and store...
        foreach($request->input('prereq_array') as $subject){
        
        $Prerequisites = $request->isMethod('put') ? Prerequisites::findOrFail
        ($request->curr_prereq_id) : new Prerequisites;

        $Prerequisites->curr_sub_id = $request->input('curr_sub_id');
        $Prerequisites->subject_id = $subject;
        $Prerequisites->del_flag = 0;

        $Prerequisites->save();
        }
    }

    public function delete($id)
    {
        Prerequisites::where(['curr_prereq_id' => $id])->update(['del_flag' => 1]);
        return response()->json(['success'], 200);
    }
}
