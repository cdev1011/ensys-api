<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class ReportsController extends Controller
{

    public function CreateGradeSheet($sched_sub_id){

        $Students = DB::table('enrolled_subjects')
        ->selectRaw('student_info.student_fname,subjects.subject_course_no,subjects.descriptive_title,school_year.sy_start,school_year.sy_end,semesters.semester_desc,levels.level_desc')
        ->join('student_enrollments', 'student_enrollments.enrollment_id', '=', 'enrolled_subjects.enrollment_id')
        ->join('student_info', 'student_info.student_id', '=', 'student_enrollments.student_id')
        ->join('schedule_subjects', 'schedule_subjects.sched_sub_id', '=', 'enrolled_subjects.sched_sub_id')
        ->join('curriculum_subjects', 'curriculum_subjects.curr_sub_id', '=', 'schedule_subjects.curr_sub_id')
        ->join('subjects', 'subjects.subject_id', '=', 'curriculum_subjects.curr_subject')
        ->join('schedule_list', 'schedule_list.schedule_id', '=', 'schedule_subjects.schedule_id')
        ->join('school_year', 'school_year.sy_id', '=', 'schedule_list.sy_id')
        ->join('semesters', 'semesters.semester_id', '=', 'curriculum_subjects..curr_semester')
        ->join('levels', 'levels.level_id', '=', 'curriculum_subjects.curr_level')
        ->where('schedule_subjects.sched_sub_id', $sched_sub_id)
        ->get();

        return $Students;
    }

    public function CreateCertificateOfEnrollment($studentId){

        $certificate = DB::table('student_enrollments')
        ->selectRaw('school_year.sy_start,school_year.sy_end,semesters.semester_desc')
        ->join('student_info', 'student_info.student_id', '=', 'student_enrollments.student_id')
        ->join('courses', 'courses.course_id', '=', 'student_info.course_id')
        ->join('semesters', 'semesters.semester_id', '=', 'student_enrollments.semester_id')
        ->join('school_year', 'school_year.sy_id', '=', 'student_enrollments.sy_id')
        ->where('student_enrollments.student_id', $studentId)
        ->groupBy('student_enrollments.sy_id')
        ->groupBy('student_enrollments.semester_id')
        ->get();

        return $certificate;
    }

    public function CreateListOfGrades(Request $request){

        $course_id = $request->input('course_id');
        $sy_id = $request->input('sy_id');
        $semester_id = $request->input('semester_id');
        $GradesData = [];
        $EnrollmentByLevel = [];

        $level = DB::table('student_enrollments')
        ->selectRaw('levels.level_id')
        ->join('student_info', 'student_info.student_id', '=', 'student_enrollments.student_id')
        ->join('enrolled_subjects', 'student_enrollments.enrollment_id', '=', 'enrolled_subjects.enrollment_id')
        ->join('schedule_subjects', 'schedule_subjects.sched_sub_id', '=', 'enrolled_subjects.sched_sub_id')
        ->join('curriculum_subjects', 'curriculum_subjects.curr_sub_id', '=', 'schedule_subjects.curr_sub_id')
        ->join('subjects', 'subjects.subject_id', '=', 'curriculum_subjects.curr_subject')
        ->join('levels', 'levels.level_id', '=', 'student_enrollments.level_id')
        ->where('student_enrollments.course_id', $course_id)
        ->where('student_enrollments.sy_id', $sy_id)
        ->where('student_enrollments.semester_id', $semester_id)
        ->groupBy('level_id')
        ->get();
        
        foreach($level as $lvl){

            $report = DB::table('student_enrollments')
            ->selectRaw('student_enrollments.student_id,levels.level_desc,levels.level_id,student_info.student_fname,student_info.student_mname,student_info.student_lname,subjects.descriptive_title,subjects.subject_course_no,enrolled_subjects.final_grade')
            ->join('student_info', 'student_info.student_id', '=', 'student_enrollments.student_id')
            ->join('enrolled_subjects', 'student_enrollments.enrollment_id', '=', 'enrolled_subjects.enrollment_id')
            ->join('schedule_subjects', 'schedule_subjects.sched_sub_id', '=', 'enrolled_subjects.sched_sub_id')
            ->join('curriculum_subjects', 'curriculum_subjects.curr_sub_id', '=', 'schedule_subjects.curr_sub_id')
            ->join('subjects', 'subjects.subject_id', '=', 'curriculum_subjects.curr_subject')
            ->join('levels', 'levels.level_id', '=', 'student_enrollments.level_id')
            ->where('student_enrollments.course_id', $course_id)
            ->where('student_enrollments.sy_id', $sy_id)
            ->where('student_enrollments.semester_id', $semester_id)
            ->where('student_enrollments.level_id', $lvl->level_id)
            ->get();

            $list = [
                'level' => $lvl->level_id,
                'student_grades' => $report->groupBy('student_id')
            ];

            array_push($GradesData, $list);
        }

        return $GradesData;
    }

    public function index()
    {
    }

    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        //
    }

    public function show($id)
    {
        //
    }

    public function edit($id)
    {
        //
    }

    public function update(Request $request, $id)
    {
        //
    }

    public function destroy($id)
    {
        //
    }
}
