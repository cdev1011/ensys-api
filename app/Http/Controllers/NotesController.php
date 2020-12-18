<?php

namespace App\Http\Controllers;


use App\Notes;
use Illuminate\Http\Request;
use App\Http\Resources\Notes as NotesRecource;

class NotesController extends Controller
{
    public function index()
    {
        $Notes = Notes::where('del_flag',0)->get();
        return NotesRecource::collection($Notes);
    }

    public function store(Request $request)
    {
        $Notes = new Notes;
        $incrementing = true;
        
        $Notes = $request->isMethod('put') ? Notes::findOrFail
        ($request->note_id) : new Notes;

        $Notes->note_title = $request->input('note_title');
        $Notes->note_message = $request->input('note_message');
        $Notes->del_flag = 0;

        $Notes->save();
    }

    public function delete($id)
    {
        Notes::where(['note_id'=>$id])->update(['del_flag'=>1]);
        return response()->json(['success'],200);
    }
}
