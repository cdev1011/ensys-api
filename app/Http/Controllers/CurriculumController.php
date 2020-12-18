<?php

namespace App\Http\Controllers;

use \stdClass;
use Illuminate\Support\Facades\DB;
use App\Curriculum;
use App\Levels;
use Illuminate\Http\Request;
use App\Http\Resources\Curriculum as CurriculumResource;
use App\Semesters;
use App\Courses;
use App\Majors;
use App\Prerequisites;

class CurriculumController extends Controller
{

    public function store(Request $request)
    {
        $Curriculum = new Curriculum;
        $incrementing = true;

        $Curriculum = $request->isMethod('put') ? Curriculum::findOrFail($request->curriculum_id) : new Curriculum;

        $Curriculum->course_id = $request->input('course_id');
        $Curriculum->curriculum_year = $request->input('curriculum_year');
        $Curriculum->del_flag = 0;

        $Curriculum->save();
    }

    public function index()
    {
        $Curriculum = Curriculum::where('del_flag', '0')->get();
        return CurriculumResource::collection($Curriculum);
    }

    public function curriculumsByCourse($course_id)
    {
        $Curriculum = Curriculum::where('del_flag', '0')
            ->where('course_id', $course_id)
            ->get();

        return CurriculumResource::collection($Curriculum);
    }

    public function CurriculumView($id)
    {
        $curriculum = [];
        $curriculumList = [];
        $courseInfo = [];
        $major = [];

        $CurriculumInfo = Curriculum::where('del_flag', '0')
            ->where('curriculum_id', $id)
            ->first();

        $courseInfo = Courses::where('del_flag', '0')
            ->where('course_id', $CurriculumInfo->course_id)
            ->first();

        $major = Majors::where('major_id', $courseInfo->major)
            ->first();

        if ($major == null) $major = "none";

        $levels = DB::table('curriculum_subjects')
            ->select('curr_id', 'curr_level', 'curr_subject')
            ->where('curr_id', $id)
            ->where('del_flag', 0)
            ->groupBy('curr_level')
            ->get();

        foreach ($levels as $level) {

            //Create new object
            $curriculum = new stdClass();
            $lvl = Levels::find($level->curr_level);
            $semestersArray = [];
            //get all semesters for this level
            $semesters = DB::table('curriculum_subjects')
                ->select('curr_semester')
                ->where('curr_id', $id)
                ->where('curr_level', $level->curr_level)
                ->where('del_flag', 0)
                ->groupBy('curr_semester')
                ->get();

            //foreach semester in this level
            foreach ($semesters as $semester) {
                $sem = Semesters::find($semester->curr_semester);

                $semster_subjects = DB::table('curriculum_subjects')
                    ->select('subjects.subject_course_no', 'pSubject.subject_course_no as prereq_course_no', 'pSubject.descriptive_title as prereq_title', 'subjects.descriptive_title', 'curriculum_subjects.curr_subject_units','curriculum_subjects.curr_lec_units','curriculum_subjects.curr_lab_units', 'curriculum_subjects.curr_sub_id')
                    ->join('subjects', 'subjects.subject_id', '=', 'curriculum_subjects.curr_subject')
                    ->leftjoin(DB::raw('subjects AS pSubject'), DB::raw('pSubject.subject_id'), '=', 'curriculum_subjects.curr_subject_prereq')
                    ->where('curr_level', $level->curr_level) // group by level
                    ->where('curr_semester', $semester->curr_semester) //group by semester
                    ->where('curr_id', $id)
                    ->where('curriculum_subjects.del_flag', 0)
                    ->get();

                $subDetailsArray = [];

                //Loop through semester subjects
                foreach ($semster_subjects as $subject_info) {
                    //create new array with additional field added which is the prerequiste

                    $prereqString = DB::table('curriculum_prereq')
                        ->select(DB::raw("group_concat(subjects.subject_course_no SEPARATOR ',') as subjects"))
                        ->join('subjects', 'subjects.subject_id', '=', 'curriculum_prereq.subject_id')
                        ->where('curr_sub_id', $subject_info->curr_sub_id)
                        ->where('curriculum_prereq.del_flag',0)
                        ->first();

                    $tempArray = [
                        'subject_course_no' => $subject_info->subject_course_no,
                        'prereq_course_no' => $subject_info->prereq_course_no,
                        'prereq_title' => $subject_info->prereq_title,
                        'descriptive_title' => $subject_info->descriptive_title,
                        'curr_subject_units' => $subject_info->curr_subject_units,
                        'curr_lec_units' => $subject_info->curr_lec_units,
                        'curr_lab_units' => $subject_info->curr_lab_units,
                        'curr_sub_id' => $subject_info->curr_sub_id,
                        'prerequisites' => $prereqString->subjects
                    ];

                    array_push($subDetailsArray, $tempArray);
                }

                $totalUnits = DB::table('curriculum_subjects')
                    ->selectRaw('sum(curriculum_subjects.curr_lec_units) + sum(curriculum_subjects.curr_lab_units) as totalUnits')
                    ->where('curr_level', $level->curr_level) // group by level
                    ->where('curr_semester', $semester->curr_semester) //group by semester
                    ->where('curr_id', $id)
                    ->where('curriculum_subjects.del_flag', 0)
                    ->get();

                //create an object that has semester and its subjects
                $subjects = [
                    'semester_name' => $sem->semester_desc,
                    'semester_subjects' =>  $subDetailsArray, //semester info
                    'total_units' => $totalUnits[0]->totalUnits
                ];

                array_push($semestersArray, $subjects);
            }

            //Preaparing the detailed view 
            $detailedView = [
                "level" => $lvl->level_desc, //what level this is??????
                "semester" => $semestersArray  //the semesters they have 
            ];

            array_push($curriculumList, $detailedView);
        }

        $finalView = [
            "curriculum_info" => $CurriculumInfo,
            "course_info" => $courseInfo,
            "major" => $major,
            "list" => $curriculumList,
        ];


        return $finalView;
    }

    public function delete($id)
    {
        Curriculum::where(['curriculum_id' => $id])->update(['del_flag' => 1]);
        return response()->json(['success'], 200);
    }
}
