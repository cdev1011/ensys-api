<?php

namespace App\Http\Controllers;

use App\UserManagement;
use Illuminate\Http\Request;
use App\Http\Resources\UserManagement as UserManagementResource;
use Illuminate\Support\Facades\DB;

class UserManagementController extends Controller
{
    public function index()
    {
        $UserManagement = UserManagement::where('del_flag',0)->get();
        return UserManagementResource::collection($UserManagement);
    }

    public function store(Request $request)
    {
        $UserManagement = new UserManagement;
        $incrementing = true;
        
        $UserManagement = $request->isMethod('put') ? UserManagement::findOrFail
        ($request->uac_id) : new UserManagement;

        $UserManagement->uac_name = $request->input('uac_name');
        $UserManagement->uac_fullname = $request->input('uac_fullname');
        $UserManagement->uac_pword = $request->input('uac_pword');
        $UserManagement->uac_type = $request->input('uac_type');
        $UserManagement->del_flag = 0;

        $UserManagement->save();
    }

    public function show($id)
    {
        $UserTypes = UserManagement::findOrFail($id);
        return new UserManagementResource($UserTypes);
    }

    public function delete($id)
    {
        UserManagement::where(['uac_id'=>$id])->update(['del_flag'=>1]);
        return response()->json(['success'],200);
    }

    public function Authenticate(Request $request){

        $username =  $request->input('username');
        $password = $request->input('password');

        $user = DB::table('user_accounts')
            ->select('user_accounts.*','uac_types.uac_type_desc')
            ->join('uac_types','uac_types.uac_type_id', 'user_accounts.uac_type')
            ->where('user_accounts.uac_name', '=', $username)
            ->where('user_accounts.uac_pword', '=', $password)
            ->where('user_accounts.del_flag', '=', 0)
            ->first();

        if (!is_null($user)) return  response()->json($user, 200);
        else return response()->json("Invalid", 200);
    }
}
