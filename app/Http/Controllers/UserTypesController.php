<?php

namespace App\Http\Controllers;

use App\UserTypes;
use Illuminate\Http\Request;
use App\Http\Resources\UserTypes as UserTypesResource;

class UserTypesController extends Controller
{
    public function index()
    {
        $UserTypes = UserTypes::where('del_flag',0)->get();
        return UserTypesResource::collection($UserTypes);
    }

    public function store(Request $request)
    {
        $UserTypes = new UserTypes;
        $incrementing = true;
        
        $UserTypes = $request->isMethod('put') ? UserTypes::findOrFail
        ($request->uac_type_id) : new UserTypes;

        $UserTypes->uac_type_desc = $request->input('uac_type_desc');
        $UserTypes->del_flag = 0;

        $UserTypes->save();
    }

    public function show($id)
    {
        $UserTypes = UserTypes::findOrFail($id);
        return new UserTypesResource($UserTypes);
    }

    public function delete($id)
    {
        UserTypes::where(['uac_type_id'=>$id])->update(['del_flag'=>1]);
        return response()->json(['success'],200);
    }
}
