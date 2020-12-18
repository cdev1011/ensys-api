<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use App\CurriculumSubjects;
use App\Levels;
use Illuminate\Http\Request;
use App\Http\Resources\CurriculumSubjects as CurriculumSubjectResource;
use App\Http\Resources\SchoolYear;

class CurriculumSubjectsController extends Controller
{
    public function store(Request $request)
    {
        $curr_sub_info = new CurriculumSubjects;

        $curr_sub_info = $request->isMethod('put') ? CurriculumSubjects::findOrFail($request->curr_sub_id) : new CurriculumSubjects;

        $curr_sub_info->curr_id = $request->input('curr_id');
        $curr_sub_info->curr_subject = $request->input('curr_subject');
        $curr_sub_info->curr_subject_prereq = null;
        $curr_sub_info->curr_level = $request->input('curr_level');
        $curr_sub_info->curr_semester = $request->input('curr_semester');
        $curr_sub_info->curr_subject_units = $request->input('curr_subject_units');
        $curr_sub_info->curr_lec_units = $request->input('lec_units');
        $curr_sub_info->curr_lab_units = $request->input('lab_units');
        $curr_sub_info->del_flag = 0;

        $curr_sub_info->save();

        return $curr_sub_info->curr_sub_id;
    }

    public function curriculumsByCourse($curr_id)
    {
        $subjects = CurriculumSubjects::where('del_flag', '0')
            ->where('curr_id', $curr_id)
            ->get();

        return CurriculumSubjectResource::collection($subjects);
    }

    public function getCurriculumSubject($curr_sub_id)
    {
        $CurriculumSubjects = CurriculumSubjects::where('del_flag', '0')
            ->where('curr_sub_id', $curr_sub_id)
            ->get();
        return CurriculumSubjectResource::collection($CurriculumSubjects);
    }

    public function delete($id)
    {
        CurriculumSubjects::where(['curr_sub_id' => $id])->update(['del_flag' => 1]);
        return response()->json(['success'], 200);
    }
}
