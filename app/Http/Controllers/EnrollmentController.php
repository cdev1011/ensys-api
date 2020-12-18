<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use App\Semesters;
use App\FeeCategory;
use App\SchoolYear;
use App\Courses;
use App\CourseFees;
use App\Students;
use App\EnrollmentFee;
use Carbon\Carbon;
use App\EnrolledSubjects;
use App\Enrollment;
use Illuminate\Http\Request;
use App\Http\Resources\Enrollment as EnrollmentResource;
use App\Http\Resources\CourseFees as CourseFeesResource;
use App\Http\Resources\Courses as ResourcesCourses;
use App\Http\Resources\EnrolledSubjects as EnrolledSubjectsResouce;
use App\Http\Resources\EnrollmentFee as EnrollmentFeeResource;
use App\Http\Resources\Courses as CoursesResource;
use App\Http\Resources\UserManagement;
use App\UserManagement as AppUserManagement;

class EnrollmentController extends Controller
{
    public function index()
    {
        $Enrollment = Enrollment::where('del_flag', 0)->get();
        return EnrollmentResource::collection($Enrollment);
    }

    public function store(Request $request)
    {
        $incrementing = true;

        $Enrollment = $request->isMethod('put') ? Enrollment::findOrFail($request->enrollment_id) : new Enrollment;

        $Enrollment->student_id = $request->StudentId;
        $Enrollment->course_id = $request->EnrollmentCourse;
        $Enrollment->sy_id = $request->SchoolYear;
        $Enrollment->semester_id =  $request->EnrollmentSemester;
        $Enrollment->level_id =  $request->CurrentLevel;
        $Enrollment->processed_by =  $request->processed_by;
        $Enrollment->enrollment_date = Carbon::now()->format('y-m-d');
        $Enrollment->del_flag = 0;


        $Enrollment->save();

        return $Enrollment->enrollment_id;
    }

    public function GetStudentEnrollments($id)
    {

        $Enrollment = Enrollment::where('del_flag', 0)
            ->where('student_id', $id)
            ->get();

        return EnrollmentResource::collection($Enrollment);
    }

    public function GenerateAssesment($id)
    {

        $enrollmentInfo = [];
        //Get the enrollment
        $Enrollment = Enrollment::where('del_flag', 0)
            ->where('enrollment_id', $id)
            ->first();

        // $Enrollment = DB::table('student_enrollments')
        //     ->selectRaw('student_enrollments.*,courses.*')
        //     ->join('courses', 'courses.course_id', '=', 'student_enrollments.course_id')
        //     ->where('student_enrollments.del_flag', '=', '0')
        //     ->where('student_enrollments.enrollment_id', $id)
        //     ->first();

        //Get the course fees
        $EnrollmentFees = EnrollmentFee::where('enrollment_id', $id)
            ->get();

        $Fees = EnrollmentFeeResource::collection(EnrollmentFee::where('del_flag', 0)
            ->where('enrollment_id', $id)
            ->get());

        $TotalEnrollmentFee = DB::table('enrollment_fees')
            ->selectRaw('sum(course_fees.price) as total')
            ->join('course_fees', 'course_fees.course_fee_id', '=', 'enrollment_fees.course_fee_id')
            ->join('fee_types', 'fee_types.fee_type_id', '=', 'course_fees.fee_type_id')
            ->where('enrollment_fees.enrollment_id', $id)
            ->where('enrollment_fees.del_flag', 0)
            ->where('fee_types.fee_type_desc', '!=', 'Unit Fee')
            ->first();

        //Get Enrollment fees instead

        //get the enrolled subjects
        $EnrolledSubjects = EnrolledSubjectsResouce::collection(EnrolledSubjects::where('del_flag', 0)
            ->where('enrollment_id', $id)
            ->get());

        //get Student information
        $Students = DB::table('student_info')
            ->selectRaw('student_info.*,levels.level_desc')
            ->join('levels', 'levels.level_id', '=', 'current_year')
            ->where('student_id', $Enrollment->student_id)
            ->where('student_info.del_flag', '=', '0')
            ->first();

        $SchoolYear = SchoolYear::where('del_flag', 0)
            ->where('sy_id', $Enrollment->sy_id)
            ->first();

        //get schoolyear
        $Course = CoursesResource::collection(Courses::where('del_flag', 0)
            ->where('course_id', $Enrollment->course_id)
            ->get());

        //get semester
        $Semester = Semesters::where('del_flag', 0)
            ->where('semester_id', $Enrollment->semester_id)
            ->first();

        $ProcessedBy = AppUserManagement::where('del_flag', 0)
            ->where('uac_id', $Enrollment->processed_by)
            ->first();

        $report = [
            'enrollment_information' => $Enrollment,
            'processed_by' => $ProcessedBy->uac_fullname,
            'course_fees' => $Fees,
            'subjects_enrolled' => $EnrolledSubjects,
            'course' => $Course,
            'school_year' => $SchoolYear,
            'student' => $Students,
            'semester' => $Semester,
            'total_enrollment_fee' => $TotalEnrollmentFee
        ];

        array_push($enrollmentInfo, $report);

        return $enrollmentInfo;
    }

    public function SemReportsSyBased($SchoolYear)
    {


        $Enrollment = DB::table('student_enrollments')
            ->selectRaw('semesters.semester_desc, count(*) AS Enrollments')
            ->join('semesters', 'semesters.semester_id', '=', 'student_enrollments.semester_id')
            ->where('student_enrollments.sy_id', $SchoolYear)
            ->where('student_enrollments.del_flag', 0)
            ->groupBy('student_enrollments.semester_id')
            ->get();

        return $Enrollment;
    }

    public function CourseEnrollmentsByGender($CourseId)
    {

        $Enrollment = DB::table('student_enrollments')
            ->selectRaw('student_info.gender, count(*) AS enrollees')
            ->join('student_info', 'student_info.student_id', '=', 'student_enrollments.student_id')
            ->where('student_enrollments.course_id', $CourseId)
            ->where('student_enrollments.del_flag', 0)
            ->groupBy('student_info.gender')
            ->get();

        return $Enrollment;
    }

    public function TotalEnrollmentsByYear($year)
    {

        $Enrollment = DB::table('student_enrollments')
            ->selectRaw(DB::raw('MONTHNAME(student_enrollments.enrollment_date) as month,count(*) AS enrollees'))
            ->where(DB::raw('YEAR(student_enrollments.enrollment_date)'), $year)
            ->where('student_enrollments.del_flag', 0)
            ->groupBy(DB::raw('MONTH(student_enrollments.enrollment_date)'))
            ->get();

        return $Enrollment;
    }

    public function EnrolleesPerSemYearly($courseId)
    {

        //check if default data on first page load
        if ($courseId == 0) {
            $Enrollments = Enrollment::where('del_flag', '0')
                ->first();

            $courseId = $Enrollments->course_id;
        }

        //Get All Semesters first
        $Semesters = Semesters::where('del_flag', '0')
            ->get();

        //Get School Years
        $SchoolYear = SchoolYear::where('del_flag', '0')
            ->get();

        //Get Enrollments
        $Enrollments = Enrollment::where('del_flag', '0')
            ->get();


        $ChartData = [];
        //Lets seperate objects by semester
        foreach ($Semesters as $semester) {

            $enrollmentsByYear = [];

            //Loop through the school years
            foreach ($SchoolYear as $sy) {

                $totalEnrollments = Enrollment::where('del_flag', '0') //add the course restricton here!
                    ->where('sy_id', $sy->sy_id)
                    ->where('semester_id', $semester->semester_id)
                    ->where('course_id', '=', $courseId)
                    ->count();

                array_push($enrollmentsByYear, $totalEnrollments);
            }

            //Create new object(dataset item)
            $semesterEnrollments = [
                'label' => $semester->semester_desc,
                'data' =>  $enrollmentsByYear //Enrollments Order by Year
            ];

            array_push($ChartData, $semesterEnrollments);
        }

        $schoolYears = [];

        foreach ($SchoolYear as $sy) {
            array_push($schoolYears, 'SY ' . $sy->sy_start . '-' . $sy->sy_end);
        }

        $result = [
            "chart_labels" =>  $schoolYears,
            "chart_data" => $ChartData
        ];

        return $result;
    }

    public function EnrolleesByGenderYearly($courseId)
    {
        //First time the page loads without selection of chart course
        if ($courseId == 0) {
            $Enrollments = Enrollment::where('del_flag', '0')
                ->first();

            $courseId = $Enrollments->course_id;
        }

        //Get All Semesters first
        $Semesters = Semesters::where('del_flag', '0')
            ->get();

        //Get School Years
        $SchoolYear = SchoolYear::where('del_flag', '0')
            ->get();

        //Get Enrollments
        $Enrollments = Enrollment::where('del_flag', '0')
            ->get();


        $ChartData = [];

        //Lets seperate objects by semester
        foreach ($Semesters as $semester) {

            $enrollmentsByYearMale = [];
            $enrollmentsByYearFemale = [];

            //Loop through the school years
            foreach ($SchoolYear as $sy) {

                // $totalEnrollmentsMale = Enrollment::where('del_flag', '0')
                //     ->where('sy_id', $sy->sy_id)
                //     ->where('semester_id', $semester->semester_id)
                //     ->count();

                // $totalEnrollmentsFemale = Enrollment::where('del_flag', '0')
                //     ->where('sy_id', $sy->sy_id)
                //     ->where('semester_id', $semester->semester_id)
                //     ->count();

                $totalEnrollmentsMale = DB::table('student_enrollments')
                    ->join('student_info', 'student_info.student_id', '=', 'student_enrollments.student_id')
                    ->where('student_enrollments.sy_id', $sy->sy_id)
                    ->where('student_info.gender', "Male")
                    ->where('student_enrollments.course_id', '=', $courseId)
                    ->where('student_enrollments.semester_id', $semester->semester_id)
                    ->count();

                $totalEnrollmentsFemale = DB::table('student_enrollments')
                    ->join('student_info', 'student_info.student_id', '=', 'student_enrollments.student_id')
                    ->where('student_enrollments.sy_id', $sy->sy_id)
                    ->where('student_info.gender', "Female")
                    ->where('student_enrollments.course_id', '=', $courseId)
                    ->where('student_enrollments.semester_id', $semester->semester_id)
                    ->count();


                array_push($enrollmentsByYearMale, $totalEnrollmentsMale);
                array_push($enrollmentsByYearFemale, $totalEnrollmentsFemale);
            }

            //Male
            $semesterEnrollmentsMale = [
                'label' => $semester->semester_desc . ':Male',
                'data' =>  $enrollmentsByYearMale //Enrollments Order by Year
            ];

            //Female
            $semesterEnrollmentsFemale = [
                'label' => $semester->semester_desc . ':Female',
                'data' =>  $enrollmentsByYearFemale //Enrollments Order by Year
            ];

            array_push($ChartData, $semesterEnrollmentsMale);
            array_push($ChartData, $semesterEnrollmentsFemale);
        }

        $schoolYears = [];

        foreach ($SchoolYear as $sy) {
            array_push($schoolYears, 'SY ' . $sy->sy_start . '-' . $sy->sy_end);
        }

        $result = [
            "chart_labels" =>  $schoolYears,
            "chart_data" => $ChartData
        ];

        return $result;
    }

    public function GraduatesPerSem($courseId)
    {

        //check if default data on first page load
        if ($courseId == 0) {
            $Enrollments = Enrollment::where('del_flag', '0')
                ->first();

            $courseId = $Enrollments->course_id;
        }

        //Get All Semesters first
        $Semesters = Semesters::where('del_flag', '0')
            ->get();

        //Get School Years
        $SchoolYear = SchoolYear::where('del_flag', '0')
            ->get();

        //Get Enrollments
        $Enrollments = Enrollment::where('del_flag', '0')
            ->get();


        $ChartData = [];
        //Lets seperate objects by semester
        foreach ($Semesters as $semester) {

            $enrollmentsByYear = [];

            //Loop through the school years
            foreach ($SchoolYear as $sy) {

                $totalEnrollments = Enrollment::where('del_flag', '0') //add the course restricton here!
                    ->where('sy_id', $sy->sy_id)
                    ->where('semester_id', $semester->semester_id)
                    ->where('course_id', '=', $courseId)
                    ->count();

                array_push($enrollmentsByYear, $totalEnrollments);
            }

            //Create new object(dataset item)
            $semesterEnrollments = [
                'label' => $semester->semester_desc,
                'data' =>  $enrollmentsByYear //Enrollments Order by Year
            ];

            array_push($ChartData, $semesterEnrollments);
        }

        $schoolYears = [];

        foreach ($SchoolYear as $sy) {
            array_push($schoolYears, 'SY ' . $sy->sy_start . '-' . $sy->sy_end);
        }

        $result = [
            "chart_labels" =>  $schoolYears,
            "chart_data" => $ChartData
        ];

        return $result;
    }
}
