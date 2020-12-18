<?php

namespace App\Http\Controllers;

use App\ScheduleSubjects;
use Illuminate\Http\Request;
use App\Http\Resources\ScheduleSubjects as ScheduleSubjectsResource;


class ScheduleSubjectsController extends Controller
{

    public function store(Request $request)
    {
        $ScheduleSubjects = new ScheduleSubjects;
        $incrementing = true;

        $ScheduleSubjects = $request->isMethod('put') ? ScheduleSubjects::findOrFail($request->sched_sub_id) : new ScheduleSubjects;

        $ScheduleSubjects->schedule_id = $request->input('schedule_id');
        $ScheduleSubjects->curr_sub_id = $request->input('curr_sub_id');
        $ScheduleSubjects->faculty_id = $request->input('faculty_id');
        $ScheduleSubjects->room_id = $request->input('room_id');
        $ScheduleSubjects->start_time = $request->input('start_time');
        $ScheduleSubjects->end_time = $request->input('end_time');
        $ScheduleSubjects->days = $request->input('days');
        $ScheduleSubjects->del_flag = 0;

        $ScheduleSubjects->save();

        return $request;
    }

    
    public function delete($id)
    {
        ScheduleSubjects::where(['sched_sub_id' => $id])->update(['del_flag' => 1]);
        return response()->json(['success'], 200);
    }
    
}
