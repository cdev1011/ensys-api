<?php

namespace App\Http\Controllers;

use App\Courses;
use App\Curriculum;
use \stdClass;
use Illuminate\Support\Facades\DB;
use App\Schedules;
use Illuminate\Http\Request;
use App\Http\Resources\Schedules as SchedulesResource;
use App\SchoolYear;
use App\Semesters;

class SchedulesController extends Controller
{
    public function index()
    {
        $Schedules = Schedules::where('del_flag', '0')->get();
        return SchedulesResource::collection($Schedules);
    }

    public function store(Request $request)
    {
        $Schedules = new Schedules;
        $incrementing = true;

        $Schedules = $request->isMethod('put') ? Schedules::findOrFail($request->schedule_id) : new Schedules;

        $Schedules->curriculum_id = $request->input('curriculum_id');
        $Schedules->sy_id = $request->input('sy_id');
        $Schedules->del_flag = 0;

        $Schedules->save();
    }


    public function delete($id)
    {
        Schedules::where(['schedule_id' => $id])->update(['del_flag' => 1]);
        return response()->json(['success'], 200);
    }
    
    public function show($id){
        $scheduleInfo = Schedules::findOrFail($id);
        return $scheduleInfo;
    }

    public function scheduleSemesters($id)
    {

        $semesterCount = DB::table('schedule_subjects')
            ->select('semesters.semester_desc as Semster', 'semesters.semester_id')
            ->join('curriculum_subjects', 'curriculum_subjects.curr_sub_id', '=', 'schedule_subjects.curr_sub_id') //Get the subject information here
            ->join('subjects', 'subjects.subject_id', '=', 'curriculum_subjects.curr_subject') //Get the actual subject name
            ->join('semesters', 'semesters.semester_id', '=', 'curriculum_subjects.curr_semester') //For what semester
            ->join('levels', 'levels.level_id', '=', 'curriculum_subjects.curr_level') //For what level
            ->where('schedule_subjects.schedule_id', $id)
            ->where('schedule_subjects.del_flag', 0)
            ->groupBy('curriculum_subjects.curr_semester') // Add this to get how many semesters the entire schedule has (Semesteral List)
            ->get();

        return $semesterCount;
    }

    public function schedulesSubjectsList(Request $request)
    {
        $schedule_id = $request->input('schedule_id');
        $semester_id = $request->input('semester_id');


        $semesterLevels = DB::table('schedule_subjects')
            ->select(
                'levels.level_desc as Level',
                'levels.level_id',
                'semesters.semester_desc as Semester',
                'school_year.sy_start as start',
                'school_year.sy_end as end',
                'courses.course_code as Course',
                'courses.course_title as college'
            )
            ->join('schedule_list', 'schedule_list.schedule_id', '=', 'schedule_subjects.schedule_id') //Get the curriculum_ID here and SY
            ->join('school_year', 'school_year.sy_id', '=', 'schedule_list.sy_id') //Get the course_id here
            ->join('curriculum', 'curriculum.curriculum_id', '=', 'schedule_list.curriculum_id') //Get the course_id here
            ->join('curriculum_subjects', 'curriculum_subjects.curr_sub_id', '=', 'schedule_subjects.curr_sub_id') //Get the subject information here
            ->join('courses', 'courses.course_id', '=', 'curriculum.course_id') //Get the course information here
            ->join('subjects', 'subjects.subject_id', '=', 'curriculum_subjects.curr_subject') //Get the actual subject name
            ->join('semesters', 'semesters.semester_id', '=', 'curriculum_subjects.curr_semester') //For what semester
            ->join('levels', 'levels.level_id', '=', 'curriculum_subjects.curr_level') //For what level
            ->where('schedule_subjects.schedule_id', $schedule_id)
            ->where('schedule_subjects.del_flag', 0)
            ->where('curriculum_subjects.curr_semester', $semester_id) //Add this to filter by semester
            ->groupBy('curriculum_subjects.curr_level') // Add this to get how many semesters the entire schedule has (Semesteral List)
            ->get();

        //Prepare creating the json Object
        $ScheduleView = [];

        $scheduleInfo = Schedules::findOrFail($schedule_id);
        $curriculum = Curriculum::findOrFail($scheduleInfo->curriculum_id);
        $schoolYear = SchoolYear::findOrFail($scheduleInfo->sy_id);
        $course = Courses::findOrFail($curriculum->course_id);
        $semester = Semesters::findOrFail($semester_id);//filter by semester

        //Schedule info
        $scheduleInfo = [
            "course" => $course->course_title,
            "school_year" => $schoolYear->sy_start.'-'.$schoolYear->sy_end,
            "semester" => $semester->semester_desc,
            "curriculum_id" => $scheduleInfo->curriculum_id
        ];
        

       // array_push($ScheduleView, $scheduleInfo);

        foreach ($semesterLevels as $levels) {

            $levelSchedule = DB::table('schedule_subjects')
                ->select(
                    'schedule_subjects.curr_sub_id',
                    'schedule_subjects.schedule_id',
                    'schedule_subjects.sched_sub_id',
                    'subjects.subject_course_no as course_no',
                    'subjects.descriptive_title as descriptive_title',
                    'schedule_subjects.start_time',
                    'schedule_subjects.end_time',
                    'schedule_subjects.days',
                    'curriculum_subjects.curr_subject_units',
                    'faculty_profile.faculty_fname',
                    'faculty_profile.faculty_mname',
                    'faculty_profile.faculty_lname',
                    'faculty_profile.faculty_id',
                    'room.room_desc',
                    'room.room_id'
                )
                ->join('schedule_list', 'schedule_list.schedule_id', '=', 'schedule_subjects.schedule_id') //Get the curriculum_ID here and SY
                ->join('school_year', 'school_year.sy_id', '=', 'schedule_list.sy_id') //Get the course_id here
                ->join('curriculum', 'curriculum.curriculum_id', '=', 'schedule_list.curriculum_id') //Get the course_id here
                ->join('courses', 'courses.course_id', '=', 'curriculum.course_id') //Get the course information here
                ->join('curriculum_subjects', 'curriculum_subjects.curr_sub_id', '=', 'schedule_subjects.curr_sub_id') //Get the subject information here
                ->join('subjects', 'subjects.subject_id', '=', 'curriculum_subjects.curr_subject') //Get the actual subject name
                ->join('semesters', 'semesters.semester_id', '=', 'curriculum_subjects.curr_semester') //For what semester
                ->join('levels', 'levels.level_id', '=', 'curriculum_subjects.curr_level') //For what level
                ->join('faculty_profile', 'faculty_profile.faculty_id', '=', 'schedule_subjects.faculty_id') //Get faculty
                ->join('room', 'room.room_id', '=', 'schedule_subjects.room_id') //Get faculty
                ->where('schedule_subjects.schedule_id', $schedule_id)
                ->where('schedule_subjects.del_flag', 0) 
                ->where('curriculum_subjects.curr_semester', $semester_id) //Add this to filter by semester
                ->where('curriculum_subjects.curr_level', $levels->level_id) //Add this to filter by semester
                ->get();

            $levelSchedules = [
                "level" => $levels->Level, //what level this is??????
                "subjects" => $levelSchedule  //the semesters they have 
            ];

            array_push($ScheduleView, $levelSchedules);
        }

        $fullView = [
            "schedule_info" => $scheduleInfo, //what level this is??????
            "schedules" => $ScheduleView  //the semesters they have 
        ];


        return $fullView;
    }
}
