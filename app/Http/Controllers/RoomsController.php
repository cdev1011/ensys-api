<?php

namespace App\Http\Controllers;

use App\Rooms;
use Illuminate\Http\Request;
use App\Http\Resources\Rooms as RoomsResource;

class RoomsController extends Controller
{
    public function index()
    {
        $Rooms = Rooms::where('del_flag',0)->get();
        return RoomsResource::collection($Rooms);
    }

    public function store(Request $request)
    {
        $Rooms = new Rooms;
        $incrementing = true;
        
        $Rooms = $request->isMethod('put') ? Rooms::findOrFail
        ($request->room_id) : new Rooms;

        $Rooms->room_desc = $request->input('room_desc');
        $Rooms->del_flag = 0;

        $Rooms->save();
    }

    public function show($id)
    {
    
    }

    public function delete($id)
    {
        Rooms::where(['room_id'=>$id])->update(['del_flag'=>1]);
        return response()->json(['success'],200);
    }
}
