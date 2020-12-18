<?php

namespace App\Http\Controllers;

use App\Grades;
use Illuminate\Http\Request;
use App\Http\Resources\Grades as GradesResource;

class GradesController extends Controller
{
    public function index()
    {
        //
    }

    public function updateGrade(Request $request)
    {
        $grades = new Grades;
        $incrementing = true;
        
        $grades = $request->isMethod('put') ? Grades::findOrFail
        ($request->grade_id) : new Grades;

        $grades->enrolled_subjects_id = $request->input('enrolled_subjects_id');
        $grades->remarks = $request->input('remarks');
        $grades->status = "Active";

        $grades->save();
    }

   

    public function destroy($id)
    {
        //
    }
}
