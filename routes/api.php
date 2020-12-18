<?php

use Illuminate\Http\Request;


Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});


//subjects
Route::get('subjects','SubjectsController@index');
Route::post('subjects/new','SubjectsController@store');
Route::put('subjects/update','SubjectsController@store');
Route::get('subjects/{id}','SubjectsController@show');
Route::delete('subjects/delete/{id}','SubjectsController@delete');

//departments
Route::get('departments','DepartmentsController@index');
Route::post('departments/new','DepartmentsController@store');
Route::put('departments/update','DepartmentsController@store');
Route::delete('departments/delete/{id}','DepartmentsController@delete');

//Courses
Route::get('courses','CoursesController@index');
Route::post('courses/new','CoursesController@store');
Route::put('courses/update','CoursesController@store');
Route::get('courses/{id}','CoursesController@show');
Route::delete('courses/delete/{id}','CoursesController@delete');

//semesters
Route::get('semesters','semestersController@index');
Route::post('semesters/new','semestersController@store');
Route::put('semesters/update',  'semestersController@store');
Route::delete('semesters/delete/{id}','semestersController@delete');

//rooms
Route::get('rooms','roomsController@index');
Route::post('rooms/new','roomsController@store');
Route::put('rooms/update',  'roomsController@store');
Route::delete('rooms/delete/{id}','roomsController@delete');

//faculty
Route::get('faculty','facultyController@index');
Route::post('faculty/new','facultyController@store');
Route::put('faculty/update','facultyController@updateFaculty');
Route::post('faculty/update_profile_img','facultyController@updateProfilePic');
Route::delete('faculty/delete/{id}','facultyController@delete');

//levels
Route::get('levels','levelsController@index');
Route::post('levels/new','levelsController@store');
Route::put('levels/update','levelsController@store');
Route::delete('levels/delete/{id}','levelsController@delete');

//students
Route::get('students','studentsController@index');//getNonRegular
Route::get('students/list/{id}','studentsController@specificList');
Route::get('students/{id}','studentsController@show');
Route::post('students/new','studentsController@store');
Route::put('students/update','studentsController@updateStudent');
Route::post('students/update_profile_img','studentsController@updateProfilePic');

//enrollment
Route::get('enrollments','enrollmentController@index');
Route::post('enrollment/new','enrollmentController@store');
Route::get('enrollment/assesment/{id}','enrollmentController@GenerateAssesment');
Route::get('enrollments/student/{id}','enrollmentController@GetStudentEnrollments');

//grades
Route::post('grades/new','gradesController@updateGrade');
Route::put('grades/update','gradesController@updateGrade');

//fee Category
Route::get('fee-category','FeeCategoryController@index');
Route::post('fee-category/new','FeeCategoryController@store');
Route::put('fee-category/update','FeeCategoryController@store');
Route::delete('fee-category/delete/{id}','FeeCategoryController@delete');

//fee Types
Route::get('fee-types','FeeTypesController@index');
Route::post('fee-types/new','FeeTypesController@store');
Route::put('fee-types/update','FeeTypesController@store');
Route::delete('fee-types/delete/{id}','FeeTypesController@delete');

//course Fees
Route::get('course-fees','CourseFeesController@index');
Route::post('course-fees/new','CourseFeesController@store');
Route::put('course-fees/update','CourseFeesController@store');
Route::delete('course-fees/delete/{id}','CourseFeesController@delete');
Route::get('course-fees/course/{id}','CourseFeesController@CourseFees');

//Majors
Route::get('majors','MajorController@index');
Route::post('majors/new','MajorController@store');
Route::put('majors/update','MajorController@store');
Route::delete('majors/delete/{id}','MajorController@delete');

//Colleges
Route::get('colleges','CollegeController@index');
Route::post('colleges/new','CollegeController@store');
Route::put('colleges/update','CollegeController@store');
Route::delete('colleges/delete/{id}','CollegeController@delete');

//Sections
Route::get('sections','SectionController@index');
Route::post('sections/new','SectionController@store');
Route::put('sections/update','SectionController@store');
Route::delete('sections/delete/{id}','SectionController@delete');

//school year
Route::get('school-year','SchoolYearController@index');
Route::post('school-year/new','SchoolYearController@store');
Route::put('school-year/update','SchoolYearController@store');
Route::delete('school-year/delete/{id}','SchoolYearController@delete');

//Curriculum
Route::get('curriculum','CurriculumController@index');
Route::get('curriculum/{id}','CurriculumController@curriculumsByCourse');
Route::post('curriculum/new','CurriculumController@store');
Route::put('curriculum/update','CurriculumController@store');
Route::delete('curriculum/delete/{id}','CurriculumController@delete');
Route::get('curriculum/report/{id}','CurriculumController@CurriculumView');

//UserTypes
Route::get('user-types','UserTypesController@index');
Route::post('user-types/new','UserTypesController@store');
Route::put('user-types/update','UserTypesController@store');
Route::delete('user-types/delete/{id}','UserTypesController@delete');
Route::get('user-types/{id}','UserTypesController@show');

//UserTypes
Route::get('user-management','UserManagementController@index');
Route::post('user-management/new','UserManagementController@store');
Route::put('user-management/update','UserManagementController@store');
Route::delete('user-management/delete/{id}','UserManagementController@delete');
Route::get('user-managements/{id}','UserManagementController@show');
Route::post('verify','UserManagementController@Authenticate');

//Curriculum subjects
Route::get('curriculum-subjects/{id}','CurriculumSubjectsController@curriculumsByCourse');
Route::post('curriculum-subjects/new','CurriculumSubjectsController@store');
Route::put('curriculum-subjects/update','CurriculumSubjectsController@store');
Route::delete('curriculum-subjects/delete/{id}','CurriculumSubjectsController@delete');
Route::get('curriculum-subjects/{id}','CurriculumSubjectsController@getCurriculumSubject');

//schedules
Route::get('schedules','SchedulesController@index');
Route::get('schedules/{id}','SchedulesController@show');
Route::post('schedules/new','SchedulesController@store');
Route::put('schedules/update','SchedulesController@store');
Route::delete('schedules/delete/{id}','SchedulesController@delete');
Route::post('schedules/subjects','SchedulesController@schedulesSubjectsList');
Route::get('schedules/semesters/{id}','SchedulesController@scheduleSemesters');

//Schedule Subjects
Route::post('schedules-subjects/new','ScheduleSubjectsController@store');
Route::put('schedules-subjects/update','ScheduleSubjectsController@store');
Route::delete('schedules-subjects/delete/{id}','ScheduleSubjectsController@delete');

//Enrolled Subjects
Route::post('enrolled-subjects/new','EnrolledSubjectsController@store');
Route::put('enrolled-subjects/update','EnrolledSubjectsController@store');
Route::get('enrolled-subjects/{id}','EnrolledSubjectsController@GetEnrollmentSubjects');
Route::get('enrolled-subject/{id}','EnrolledSubjectsController@GetEnrollmentSubject');
Route::delete('enrolled-subjects/delete/{id}','EnrolledSubjectsController@delete');

//notes
Route::get('notes','NotesController@index');
Route::post('notes/new','NotesController@store');
Route::put('notes/update','NotesController@store');
Route::delete('notes/delete/{id}','NotesController@delete');

//prerquisites
Route::post('prerequisites/new','PrerequisitesController@store');
Route::delete('prerequisites/delete/{id}','PrerequisitesController@delete');


//Charts
Route::get('enrollments/reports/chart_one/{sy}','enrollmentController@SemReportsSyBased'); // Total enrollments per sem based on school year
Route::get('enrollments/reports/chart_two/{course_id}','enrollmentController@CourseEnrollmentsByGender');
Route::get('enrollments/reports/chart_three/{year}','enrollmentController@TotalEnrollmentsByYear'); 
Route::get('enrollments/reports/chart_four/{course_id}','enrollmentController@EnrolleesPerSemYearly'); 
Route::get('enrollments/reports/chart_five/{course_id}','enrollmentController@EnrolleesByGenderYearly'); //chat_five

//signatories
Route::get('signatory-type','SignatoryTypesController@index');
Route::post('signatory-type/new','SignatoryTypesController@store');
Route::put('signatory-type/update','SignatoryTypesController@store');
Route::delete('signatory-type/delete/{id}','SignatoryTypesController@delete');

//signatories
Route::get('signatories','SignatoriesController@index');
Route::post('signatories/new','SignatoriesController@store');
Route::put('signatories/update','SignatoriesController@store');
Route::delete('signatories/delete/{id}','SignatoriesController@delete');

//Enrollment Fees
Route::get('enrollment/fees/','EnrollmentFeeController@index');
Route::post('enrollment/fees/new','EnrollmentFeeController@store');
Route::put('enrollment/fees/update','EnrollmentFeeController@store');
Route::delete('enrollment/fees/delete/{id}','EnrollmentFeeController@delete');

//Reports
Route::get('reports/grade-sheet/{sched_sub_id}','ReportsController@CreateGradeSheet');
Route::get('reports/certificate-of-enrollment/{student_id}','ReportsController@CreateCertificateOfEnrollment');
Route::post('reports/list-of-grades/','ReportsController@CreateListOfGrades');