-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 16, 2020 at 04:29 PM
-- Server version: 10.3.15-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ensys_api`
--

-- --------------------------------------------------------

--
-- Table structure for table `colleges`
--

CREATE TABLE `colleges` (
  `college_id` int(11) NOT NULL,
  `college_desc` varchar(250) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `colleges`
--

INSERT INTO `colleges` (`college_id`, `college_desc`, `status`) VALUES
(1, 'Some College', '0');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL,
  `course_code` varchar(50) DEFAULT NULL,
  `course_title` varchar(50) DEFAULT NULL,
  `course_department` int(11) DEFAULT NULL,
  `major` int(11) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `course_code`, `course_title`, `course_department`, `major`, `del_flag`) VALUES
(1, 'GE121', 'General Economics', 2, 4, 0),
(2, 'BSIT', 'Bachelor in Science and Technology', 1, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `course_fees`
--

CREATE TABLE `course_fees` (
  `course_fee_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `fee_type_id` int(11) NOT NULL,
  `sy_id` int(11) NOT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `del_flag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course_fees`
--

INSERT INTO `course_fees` (`course_fee_id`, `course_id`, `fee_type_id`, `sy_id`, `price`, `del_flag`) VALUES
(1, 1, 1, 1, '200.00', 0),
(2, 1, 1, 1, '200.00', 1),
(3, 2, 14, 1, '2000.00', 0),
(4, 1, 2, 1, '500.00', 0),
(5, 1, 3, 1, '200.00', 0),
(6, 1, 5, 1, '100.00', 0),
(7, 1, 6, 1, '20.00', 1),
(8, 1, 6, 3, '50.90', 0),
(9, 2, 6, 1, '200.00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `course_taken`
--

CREATE TABLE `course_taken` (
  `course_taken_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `curriculum`
--

CREATE TABLE `curriculum` (
  `curriculum_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `curriculum_year` year(4) NOT NULL,
  `del_flag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `curriculum`
--

INSERT INTO `curriculum` (`curriculum_id`, `course_id`, `curriculum_year`, `del_flag`) VALUES
(1, 1, 2020, 0);

-- --------------------------------------------------------

--
-- Table structure for table `curriculum_prereq`
--

CREATE TABLE `curriculum_prereq` (
  `curr_prereq_id` int(11) NOT NULL,
  `curr_sub_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `del_flag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `curriculum_prereq`
--

INSERT INTO `curriculum_prereq` (`curr_prereq_id`, `curr_sub_id`, `subject_id`, `del_flag`) VALUES
(1, 1, 4, 0),
(2, 2, 4, 0),
(3, 2, 5, 0),
(4, 3, 3, 0),
(5, 4, 6, 0);

-- --------------------------------------------------------

--
-- Table structure for table `curriculum_subjects`
--

CREATE TABLE `curriculum_subjects` (
  `curr_sub_id` int(11) NOT NULL,
  `curr_id` int(11) NOT NULL,
  `curr_subject` int(11) NOT NULL,
  `curr_subject_prereq` int(11) DEFAULT NULL,
  `curr_level` int(11) NOT NULL,
  `curr_semester` int(11) NOT NULL,
  `curr_subject_units` int(11) DEFAULT NULL,
  `curr_lec_units` int(11) DEFAULT NULL,
  `curr_lab_units` int(11) DEFAULT NULL,
  `del_flag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `curriculum_subjects`
--

INSERT INTO `curriculum_subjects` (`curr_sub_id`, `curr_id`, `curr_subject`, `curr_subject_prereq`, `curr_level`, `curr_semester`, `curr_subject_units`, `curr_lec_units`, `curr_lab_units`, `del_flag`) VALUES
(1, 1, 1, NULL, 1, 1, 6, 3, 4, 0),
(2, 1, 3, NULL, 1, 1, 5, 5, 19, 0),
(3, 1, 5, NULL, 1, 1, 3, 4, 5, 0),
(4, 1, 6, NULL, 2, 1, NULL, 3, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `department_id` int(11) NOT NULL,
  `department_desc` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`department_id`, `department_desc`, `status`) VALUES
(1, 'Sample Department', 'Active'),
(2, 'Another Sample', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `enrolled_subjects`
--

CREATE TABLE `enrolled_subjects` (
  `enrolled_sub_id` int(11) NOT NULL,
  `enrollment_id` int(11) NOT NULL,
  `sched_sub_id` int(11) NOT NULL,
  `prelim_grade` int(11) DEFAULT NULL,
  `mideterm_grade` int(11) DEFAULT NULL,
  `final_grade` varchar(50) DEFAULT NULL,
  `tmg` int(11) DEFAULT NULL,
  `tfg` int(11) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `del_flag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enrolled_subjects`
--

INSERT INTO `enrolled_subjects` (`enrolled_sub_id`, `enrollment_id`, `sched_sub_id`, `prelim_grade`, `mideterm_grade`, `final_grade`, `tmg`, `tfg`, `remarks`, `del_flag`) VALUES
(1, 1, 1, NULL, NULL, '0', NULL, NULL, NULL, 0),
(2, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(3, 4, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(4, 5, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(5, 6, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(6, 7, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(7, 8, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(8, 9, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(9, 10, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(10, 11, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(11, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(12, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(13, 14, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(14, 15, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(15, 15, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(16, 16, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(17, 16, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(18, 17, 1, NULL, NULL, 'INC', NULL, NULL, NULL, 0),
(19, 17, 2, NULL, NULL, 'UD', NULL, NULL, 'Please check', 0),
(20, 17, 3, NULL, NULL, '80', NULL, NULL, NULL, 0),
(21, 18, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(22, 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(23, 20, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(24, 20, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(25, 21, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(26, 22, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(27, 23, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(28, 23, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(29, 24, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(30, 25, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(31, 26, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(32, 26, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `enrollment_fees`
--

CREATE TABLE `enrollment_fees` (
  `enrollment_fee_id` int(11) NOT NULL,
  `enrollment_id` int(11) NOT NULL,
  `course_fee_id` int(11) NOT NULL,
  `del_flag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enrollment_fees`
--

INSERT INTO `enrollment_fees` (`enrollment_fee_id`, `enrollment_id`, `course_fee_id`, `del_flag`) VALUES
(1, 15, 4, 0),
(2, 15, 5, 0),
(3, 16, 1, 0),
(4, 16, 7, 0),
(5, 16, 6, 0),
(6, 16, 5, 0),
(7, 16, 4, 0),
(8, 17, 1, 0),
(9, 17, 4, 0),
(10, 17, 8, 0),
(11, 17, 5, 0),
(12, 17, 6, 0),
(13, 18, 8, 0),
(14, 18, 6, 0),
(15, 18, 4, 0),
(16, 18, 5, 0),
(17, 18, 1, 0),
(18, 19, 3, 0),
(19, 20, 9, 0),
(20, 20, 3, 0),
(21, 21, 8, 0),
(22, 21, 6, 0),
(23, 21, 5, 0),
(24, 22, 9, 0),
(25, 22, 3, 0),
(26, 23, 4, 0),
(27, 23, 1, 0),
(28, 23, 5, 0),
(29, 23, 6, 0),
(30, 23, 8, 0),
(31, 24, 3, 0),
(32, 24, 9, 0),
(33, 25, 3, 0),
(34, 25, 9, 0),
(35, 26, 3, 0),
(36, 26, 9, 0);

-- --------------------------------------------------------

--
-- Table structure for table `faculty_profile`
--

CREATE TABLE `faculty_profile` (
  `faculty_id` int(11) NOT NULL,
  `faculty_fname` varchar(200) DEFAULT NULL,
  `faculty_mname` varchar(200) DEFAULT NULL,
  `faculty_lname` varchar(200) DEFAULT NULL,
  `faculty_PIC` text DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `civil_status` varchar(20) DEFAULT NULL,
  `designation` varchar(200) DEFAULT NULL,
  `years_in_service` int(11) DEFAULT NULL,
  `profesional_organization` varchar(200) DEFAULT NULL,
  `specialization` varchar(200) DEFAULT NULL,
  `highest_educ_qualification` varchar(200) DEFAULT NULL,
  `employment_status` varchar(200) DEFAULT NULL,
  `del_flag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faculty_profile`
--

INSERT INTO `faculty_profile` (`faculty_id`, `faculty_fname`, `faculty_mname`, `faculty_lname`, `faculty_PIC`, `age`, `civil_status`, `designation`, `years_in_service`, `profesional_organization`, `specialization`, `highest_educ_qualification`, `employment_status`, `del_flag`) VALUES
(1, 'Sample', 'Sample', 'Sample', 'phpE910.tmp.jpg', 33, 'Male', 'Instructor', 21, 'Sample', 'Sample', 'Sample', 'Sample', 1),
(2, 'Nova Divine', 'Molina', 'De La Pena', 'php2433.tmp.jpg', 26, 'Single', 'College Instructor', 5, 'AREI-CAR, NOPTI', 'Computing', 'Master in Information Technology (IP)', 'Regular', 0),
(3, 'Rogelio Jr.', 'Ag-a', 'Doctor', 'phpEDBD.tmp.jpg', 30, 'Male', 'ICT- I.T. Instructor', 6, NULL, 'Hardware & Software Application', 'MA (IP)', 'Regular', 0),
(4, 'Mayeth', NULL, 'Valdez', 'phpC80.tmp.png', 32, 'Male', 'CTE Coordinator', 5, 'NOPTI', 'English', 'MST-English', 'Regular', 0),
(5, 'TBA', 'TBA', 'TBA', 'phpCCC0.tmp.png', 29, 'Male', 'TBA', 4, 'TBA', 'TBA', 'TBA', 'TBA', 0);

-- --------------------------------------------------------

--
-- Table structure for table `fee_category`
--

CREATE TABLE `fee_category` (
  `fee_category_id` int(11) NOT NULL,
  `fee_category_desc` varchar(250) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fee_category`
--

INSERT INTO `fee_category` (`fee_category_id`, `fee_category_desc`, `status`) VALUES
(1, 'Laboratory Fee', 0),
(2, 'Other Fees', 0),
(3, 'Tuition fee per unit', 0),
(4, 'Miscellaneous Fee', 0),
(5, 'RLE/SL Per hour', 0);

-- --------------------------------------------------------

--
-- Table structure for table `fee_types`
--

CREATE TABLE `fee_types` (
  `fee_type_id` int(11) NOT NULL,
  `fee_type_desc` varchar(250) NOT NULL,
  `fee_category_id` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fee_types`
--

INSERT INTO `fee_types` (`fee_type_id`, `fee_type_desc`, `fee_category_id`, `status`) VALUES
(1, 'Anatomy', 1, 0),
(2, 'Microbiology', 1, 0),
(3, 'Registration Fee', 4, 0),
(4, 'ID', 4, 0),
(5, 'Medical/Dental', 4, 0),
(6, 'Unit Fee', 3, 0),
(7, 'Library Fee', 4, 0),
(8, 'Student Activities', 4, 0),
(9, 'Guidance Testing/s', 4, 0),
(10, 'Athletic', 4, 0),
(11, 'Development Fund', 4, 0),
(12, 'Test Materials', 4, 0),
(13, 'School Organ', 4, 0),
(14, 'Internet Fee', 2, 0),
(15, 'Insurance/Red Cross', 2, 0),
(16, 'Audio Visual Fee/Conference Room', 2, 0),
(17, 'Energy Fee', 2, 0),
(18, 'Anatomy', 1, 1),
(19, 'Chemistry', 1, 0),
(20, 'Computer Laboratory', 1, 0),
(21, 'Skills Lab', 1, 0),
(22, 'Tuition Fee', 3, 0),
(23, 'Physics', 1, 0),
(24, 'Zoology', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `grade_id` int(11) NOT NULL,
  `schedule_id` int(11) NOT NULL,
  `prelim` decimal(15,2) DEFAULT NULL,
  `tmg` decimal(15,2) DEFAULT NULL,
  `midterm` decimal(15,2) DEFAULT NULL,
  `tfg` decimal(15,2) DEFAULT NULL,
  `final` varchar(25) DEFAULT NULL,
  `remarks` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `levels`
--

CREATE TABLE `levels` (
  `level_id` int(11) NOT NULL,
  `level_desc` varchar(255) NOT NULL,
  `del_flag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `levels`
--

INSERT INTO `levels` (`level_id`, `level_desc`, `del_flag`) VALUES
(1, 'First Year', 0),
(2, 'Second Year', 0),
(3, 'Third Year', 0),
(4, 'Fourth Year', 0);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `Login_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `usertype_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `majors`
--

CREATE TABLE `majors` (
  `major_id` int(11) NOT NULL,
  `major_desc` varchar(250) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `majors`
--

INSERT INTO `majors` (`major_id`, `major_desc`, `status`) VALUES
(1, 'English', 'Active'),
(2, 'Mathematics', 'Active'),
(3, 'Science', 'Active'),
(4, 'General Education', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `note_id` int(11) NOT NULL,
  `note_title` text NOT NULL,
  `note_message` text DEFAULT NULL,
  `created_at` date NOT NULL,
  `del_flag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notes`
--

INSERT INTO `notes` (`note_id`, `note_title`, `note_message`, `created_at`, `del_flag`) VALUES
(1, '', NULL, '0000-00-00', 1),
(2, '', 'test', '0000-00-00', 1),
(3, 'Note to new enrollments', 'Please use the recommended sections to post data', '0000-00-00', 0),
(4, 'Hello World', 'Test message', '0000-00-00', 0),
(5, 'Hello', 'Hi there', '0000-00-00', 0),
(6, 'Hello World', 'This is a test message', '0000-00-00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `room_id` int(11) NOT NULL,
  `room_desc` varchar(255) NOT NULL,
  `del_flag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`room_id`, `room_desc`, `del_flag`) VALUES
(1, 'Com Lab', 0),
(2, 'Com Lab 2', 0),
(3, 'SB 201', 0),
(4, 'SB 301', 0),
(5, 'SB 302', 0),
(6, 'SB 303', 0),
(7, 'HE/Hotel', 0),
(8, 'TBA', 0),
(9, 'Kiddie Room', 0),
(10, 'LB 101', 0);

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `schedule_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `faculty_id` int(11) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `days` varchar(20) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `del_flag` int(11) NOT NULL,
  `sy_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `schedule_list`
--

CREATE TABLE `schedule_list` (
  `schedule_id` int(11) NOT NULL,
  `curriculum_id` int(11) NOT NULL,
  `sy_id` int(11) NOT NULL,
  `del_flag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schedule_list`
--

INSERT INTO `schedule_list` (`schedule_id`, `curriculum_id`, `sy_id`, `del_flag`) VALUES
(1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `schedule_subjects`
--

CREATE TABLE `schedule_subjects` (
  `sched_sub_id` int(11) NOT NULL,
  `schedule_id` int(11) NOT NULL,
  `curr_sub_id` int(11) NOT NULL,
  `faculty_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `days` varchar(20) DEFAULT NULL,
  `del_flag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schedule_subjects`
--

INSERT INTO `schedule_subjects` (`sched_sub_id`, `schedule_id`, `curr_sub_id`, `faculty_id`, `room_id`, `start_time`, `end_time`, `days`, `del_flag`) VALUES
(1, 1, 1, 5, 1, '13:59:00', '00:59:00', 'M,T', 0),
(2, 1, 3, 3, 2, '12:31:00', '13:12:00', 'M,T,W', 0),
(3, 1, 2, 5, 5, '12:59:00', '01:00:00', 'M,TH', 0),
(4, 1, 4, 5, 5, '02:13:00', '03:21:00', 'M,T', 0),
(5, 1, 1, 2, 5, '20:04:00', '20:07:00', 'M,T,W', 0),
(6, 1, 3, 4, 4, '14:39:00', '19:38:00', 'T', 0);

-- --------------------------------------------------------

--
-- Table structure for table `school_year`
--

CREATE TABLE `school_year` (
  `sy_id` int(11) NOT NULL,
  `sy_start` year(4) NOT NULL,
  `sy_end` year(4) NOT NULL,
  `del_flag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `school_year`
--

INSERT INTO `school_year` (`sy_id`, `sy_start`, `sy_end`, `del_flag`) VALUES
(1, 2018, 2019, 0),
(2, 2019, 2020, 0),
(3, 2020, 2021, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `section_id` int(11) NOT NULL,
  `section_desc` varchar(250) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `semesters`
--

CREATE TABLE `semesters` (
  `semester_id` int(11) NOT NULL,
  `semester_desc` varchar(200) NOT NULL,
  `del_flag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `semesters`
--

INSERT INTO `semesters` (`semester_id`, `semester_desc`, `del_flag`) VALUES
(1, 'First Semester', 0),
(2, 'Second Semester', 0),
(3, 'Third Semester', 1),
(4, 'Fourth Semester', 1),
(5, 'Summer', 0);

-- --------------------------------------------------------

--
-- Table structure for table `signatories`
--

CREATE TABLE `signatories` (
  `signatory_id` int(11) NOT NULL,
  `signatory_person` text DEFAULT NULL,
  `sig_pos_id` int(11) NOT NULL,
  `del_flag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `signatories`
--

INSERT INTO `signatories` (`signatory_id`, `signatory_person`, `sig_pos_id`, `del_flag`) VALUES
(1, 'Christian Dale Gonzales', 1, 0),
(2, 'Test person', 2, 1),
(3, 'Tester', 2, 1),
(4, 'Nobody Here', 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `signatory_position`
--

CREATE TABLE `signatory_position` (
  `sig_pos_id` int(11) NOT NULL,
  `sig_pos_desc` text NOT NULL,
  `del_flag` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `signatory_position`
--

INSERT INTO `signatory_position` (`sig_pos_id`, `sig_pos_desc`, `del_flag`) VALUES
(1, 'Assistant Registrar', 0),
(2, 'President', 0),
(3, 'Working', 0),
(4, 'What', 0);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL,
  `first_name` varchar(250) NOT NULL,
  `middle_name` varchar(250) DEFAULT NULL,
  `last_name` varchar(250) NOT NULL,
  `date_of_admission` date NOT NULL,
  `entrance_data` text DEFAULT NULL,
  `address` text DEFAULT NULL,
  `place_of_birth` text DEFAULT NULL,
  `course` int(11) NOT NULL,
  `del_flag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student_enrollments`
--

CREATE TABLE `student_enrollments` (
  `enrollment_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `sy_id` int(11) NOT NULL,
  `semester_id` int(11) NOT NULL,
  `level_id` int(11) NOT NULL,
  `enrollment_date` date NOT NULL,
  `del_flag` int(11) NOT NULL,
  `processed_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_enrollments`
--

INSERT INTO `student_enrollments` (`enrollment_id`, `student_id`, `course_id`, `sy_id`, `semester_id`, `level_id`, `enrollment_date`, `del_flag`, `processed_by`) VALUES
(1, 1, 1, 1, 1, 1, '2020-02-26', 0, 1),
(2, 1, 1, 2, 1, 1, '2020-03-01', 0, 1),
(3, 1, 1, 1, 1, 1, '2020-03-01', 0, 1),
(4, 2, 1, 2, 1, 1, '2020-03-01', 0, 1),
(5, 2, 1, 2, 2, 1, '2020-03-01', 0, 1),
(6, 1, 1, 1, 2, 1, '2020-03-01', 0, 1),
(7, 2, 1, 1, 5, 1, '2020-03-01', 0, 1),
(8, 1, 1, 3, 1, 1, '2020-03-01', 0, 1),
(9, 2, 1, 1, 5, 1, '2020-03-01', 0, 1),
(10, 2, 1, 2, 5, 1, '2020-03-01', 0, 1),
(11, 2, 1, 1, 1, 1, '2020-03-01', 0, 1),
(12, 1, 1, 1, 1, 2, '2020-03-04', 0, 1),
(13, 1, 1, 1, 1, 1, '2020-03-04', 0, 1),
(14, 2, 1, 1, 1, 1, '2020-03-04', 0, 1),
(15, 1, 1, 1, 1, 1, '2020-03-04', 0, 1),
(16, 1, 1, 1, 1, 1, '2020-03-04', 0, 1),
(17, 1, 1, 1, 1, 1, '2020-03-05', 0, 1),
(18, 2, 1, 3, 5, 4, '2020-03-05', 0, 1),
(19, 3, 2, 1, 1, 1, '2020-03-12', 0, 1),
(20, 3, 2, 1, 1, 1, '2020-03-12', 0, 1),
(21, 5, 1, 1, 1, 1, '2020-03-13', 0, 1),
(22, 6, 2, 1, 1, 1, '2020-03-13', 0, 1),
(23, 7, 1, 2, 1, 1, '2020-06-18', 0, 1),
(24, 7, 2, 1, 1, 1, '2020-06-18', 0, 2),
(25, 7, 2, 2, 2, 2, '2020-06-18', 0, 3),
(26, 7, 2, 3, 1, 1, '2020-06-18', 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `student_info`
--

CREATE TABLE `student_info` (
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `student_photo` text DEFAULT NULL,
  `student_fname` varchar(100) DEFAULT NULL,
  `student_mname` varchar(100) DEFAULT NULL,
  `student_lname` varchar(100) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `birthplace` varchar(200) DEFAULT NULL,
  `home_address` varchar(200) DEFAULT NULL,
  `mobile_number` varchar(200) DEFAULT NULL,
  `fathers_name` varchar(250) DEFAULT NULL,
  `fathers_occup` varchar(200) DEFAULT NULL,
  `mothers_name` varchar(250) DEFAULT NULL,
  `mother_occup` varchar(200) DEFAULT NULL,
  `parent_tel` varchar(200) DEFAULT NULL,
  `guardian_name` varchar(200) DEFAULT NULL,
  `guardian_rel` varchar(50) DEFAULT NULL,
  `guradian_Addr` varchar(150) DEFAULT NULL,
  `guardian_occup` varchar(150) DEFAULT NULL,
  `guardian_tel` varchar(50) DEFAULT NULL,
  `elem_attended` varchar(200) DEFAULT NULL,
  `elem_yrs_attd` int(11) DEFAULT NULL,
  `hs_attended` varchar(200) DEFAULT NULL,
  `hs_yrs_attd` int(11) DEFAULT NULL,
  `lst_cllg_attd` varchar(200) DEFAULT NULL,
  `attd_cllg_lvl` int(11) DEFAULT NULL,
  `attd_cllg_sy` varchar(50) DEFAULT NULL,
  `creds_presented` varchar(50) DEFAULT NULL,
  `tranfer_flag` int(11) NOT NULL,
  `current_year` int(11) DEFAULT NULL,
  `enrollment_status` varchar(200) DEFAULT NULL,
  `del_flag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_info`
--

INSERT INTO `student_info` (`student_id`, `course_id`, `student_photo`, `student_fname`, `student_mname`, `student_lname`, `date_of_birth`, `age`, `gender`, `birthplace`, `home_address`, `mobile_number`, `fathers_name`, `fathers_occup`, `mothers_name`, `mother_occup`, `parent_tel`, `guardian_name`, `guardian_rel`, `guradian_Addr`, `guardian_occup`, `guardian_tel`, `elem_attended`, `elem_yrs_attd`, `hs_attended`, `hs_yrs_attd`, `lst_cllg_attd`, `attd_cllg_lvl`, `attd_cllg_sy`, `creds_presented`, `tranfer_flag`, `current_year`, `enrollment_status`, `del_flag`) VALUES
(1, 1, 'phpA72C.tmp.jpg', 'Christian Dale', 'O.', 'Gonzales', '2020-01-18', 11, 'Male', 'Test', 'Test', '1221211', 'TestTestTestTest', 'TestTest', 'TestTest', 'TestTestTest', '09167716182', 'TestTestTestTest', 'Test', 'Test', 'Test', 'Test', 'Test', 123, 'Test', 12312, 'Test', 0, '3213', NULL, 0, 1, 'Graduate', 0),
(2, 2, 'php4321.tmp.jpg', 'Blueberry', 'Blueberry', 'Blueberry', '2020-01-09', 223, 'Female', 'Blueberry', 'Blueberry', '9167716182', 'BlueberryBlueberry', 'Blueberry', 'BlueberryBlueberry', 'Blueberry', '2313213123', NULL, NULL, NULL, NULL, NULL, 'Blueberry', 23, 'Blueberry', 3, 'BlueberryBlueberryBlueberryBlueberry', 0, '2', NULL, 0, 2, 'Graduate', 0),
(3, 2, 'phpC4A9.tmp.jpg', 'Chandler', 'Mike', 'Bing', '2020-12-31', 21, 'Male', 'Kawit', 'Central Park', '9123121231', 'Christian Dale', 'Sample', 'Lola Samoni', NULL, '0962662262626', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3, 'Regular', 0),
(5, 1, 'php7697.tmp.jpg', 'zenwire', 'zenwire', 'zenwire', '2020-01-01', 23, 'Male', 'zenwire', 'zenwire', '91212', 'zenwire', 'zenwire', 'zenwire', 'zenwire', '09131223123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 4, 'Regular', 0),
(6, 2, 'php4D85.tmp.jpg', 'Tooohoo', 'Tooohoo', 'Tooohoo', '2020-01-01', 22, 'Female', 'Tooohoo', 'Tooohoo', '231233', 'Tooohoo', 'Tooohoo', 'Tooohoo', 'Tooohoo', '091312313', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 'Regular', 0),
(7, 2, 'php15BD.tmp.jpg', 'Elon', 'Something', 'Musk', '2020-06-12', 35, 'Male', 'Cali', 'California', '91565665245', 'Sample Data', 'Jr', 'waddawdawdadwdwd', 'Rogers', '0953211616', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 'Regular', 0);

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `subject_id` int(11) NOT NULL,
  `subject_course_no` varchar(100) NOT NULL,
  `descriptive_title` text NOT NULL,
  `del_flag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`subject_id`, `subject_course_no`, `descriptive_title`, `del_flag`) VALUES
(1, 'GEC 1', 'Understanding the Self', 0),
(2, 'GEC 2', 'Readings in Philippine History', 0),
(3, 'NCM 100', 'Theoretical Foundations of Nursing', 0),
(4, 'MC 1', 'Anatomy and Physiology', 0),
(5, 'MC 2', 'Biochemistry', 0),
(6, 'Religion 1', 'Religious Education 1', 0),
(7, 'History 1', 'Readings in Philippine History', 0),
(8, 'Math A', 'Mathematics in Modern World', 0),
(9, 'Arts 1', 'Arts Appreciation', 0),
(10, 'PE 1', 'Physical Fitness Incl Self-Testing Act', 1),
(11, 'NSTP 1', 'LTS/CWTS 1', 0),
(12, 'Educ 103', 'Technology for Teaching & Learning', 0),
(13, 'FIlipino 1', 'Masining na Pagpapahayag', 0),
(14, 'Educ 101a', 'The Child & Adolescent Learners & Learning Principles', 0),
(15, 'English 3', 'Purposive Communication', 0),
(16, 'VED 111', 'Good Manners & Right Conduct (Edukasyon sa Pagpapakatao)', 0),
(17, 'Socio 1', 'General Sociology with Emphasis on the Filipino Family & Current Issues', 0),
(18, 'Filipino 2', 'Pagbasa at Pagsulat Tungo sa Pananaliksik', 0),
(19, 'Ethics 1', 'Ethics', 0),
(20, 'Music 106', 'Teaching Music in the Elementary Grades', 0),
(21, 'PE 2', 'Rhythmic Act Including Folk Dances', 0),
(22, 'NSTP 2', 'LTS/CWTS 2', 0),
(23, 'Religion 2', 'Religious Education 2', 0),
(24, 'Educ 116', 'Building & Enhancing New Literacy Across the Curriculum', 0),
(25, 'English +', 'Basic English', 0),
(26, 'English 1', 'Study and Thinking Skills', 0),
(27, 'Filipino 1', 'Komunikasyon sa Akademikong Filipino', 0),
(28, 'Computer 1', 'Computer Fundamentals w/ ISA', 0),
(29, 'Soc Or', 'Social Orientation', 0),
(30, 'HT 1', 'Principles of Tourism', 0),
(31, 'HM 111', 'Introduction to HRM', 0),
(32, 'PE 1', 'Physical Fitness Incl Self-Testing Activities', 0),
(33, 'Religion 1(Old Cur)', 'The Old Testament', 0),
(34, 'NSTP 11', 'LTS/CWTS', 1),
(35, 'English 2', 'Writing in the Discipline', 0),
(36, 'Filipino 2', 'Pagbasa at Pagsulat Tungo sa Pananaliksik', 0),
(37, 'PE 12', 'Rhythmic Activities and Folk Dancing', 1),
(38, 'Religion 2 (Old Cur)', 'The New Testament Message', 0),
(39, 'Religion 2', 'The New Testament Message', 1),
(40, 'NSTP 12', 'LTS/CWTS 2', 1),
(41, 'HM 121', 'Housekeeping Management', 0),
(42, 'HM 122', 'Intro to Hotel Operations', 0),
(43, 'GENSS', 'Principle of Safety Sanitation & Hygiene', 0),
(44, 'Math 0', 'Business Math', 0),
(45, 'English 3', 'Speech and Oral Communication', 0),
(46, 'HM 211', 'Culinary Arts & Sciences', 0),
(47, 'HM 212', 'Food & Beverage Service Management', 0),
(48, 'HM 213', 'Nutrition', 0),
(49, 'HM 214', 'Baking & Pastry Arts', 0),
(50, 'Psycho 1', 'General Psychology w/ DEP', 0),
(51, 'Chem 1', 'General Chemistry', 0),
(52, 'PE 3', 'Fund of Individual & Dual Sports', 0),
(53, 'Hm 221', 'Commercial Cooking', 0),
(54, 'HM 222', 'Bartending', 0),
(55, 'Acctg 1', 'Accounting Principles 1', 0),
(56, 'BPE', 'Business Planning & Entrepreneurship', 0),
(57, 'FL 1', 'Foreign Language 1', 0),
(58, 'FCM', 'Food Chemistry & Microbiology', 0),
(59, 'English 4', 'Technical Writing', 0),
(60, 'Mngt 1', 'Principles of Management', 0),
(61, 'PE 4', 'Team Sports', 0),
(62, 'HM 311', 'Hospitality Operational Management', 0),
(63, 'HM 312', 'Asian Cuisine', 0),
(64, 'HM 313', 'Food & Beverage Cost Control', 0),
(65, 'GESCA', 'Cultural Anthropology w/ IP', 0),
(66, 'BCMIS', 'Management Information System', 0),
(67, 'Fin 1', 'Basic Finance', 0),
(68, 'FL 2', 'Foreign Language 2', 0),
(69, 'HUm 2', 'Arts & Music Appreciation', 0),
(70, 'HM 321', 'Convention Management', 0),
(71, 'Hm 322', 'Western Cuisine', 0),
(72, 'HM 323', 'HRM Research & Methods Techniques', 0),
(73, 'HRM 324', 'Banquets Functions & Catering Service Procedures', 0),
(74, 'ANA', 'Accounting for Non-Accountants', 0),
(75, 'TCTQM', 'Total Quality Management', 0),
(76, 'Rizal', 'Rizal: His Life & Works', 0),
(77, 'FL 3', 'Foreign Language 3', 0),
(78, 'STAT', 'Statistics and Probabilities', 0),
(79, 'HM 411', 'Sales & Promotion in Hospitality Industry', 0),
(80, 'HM 412', 'Feasibility Studies', 0),
(81, 'HM 413', 'Computer Applications for HRM', 0),
(82, 'HM 414', 'Events Management', 0),
(83, 'HM 415', 'Tourism Planning & Development', 0),
(84, 'FL 4', 'Foreign Language 4', 0),
(85, 'Econ 1', 'Economics w/ LRT', 0),
(86, 'Phil. Hist', 'Philippine History and Government Constitution', 0),
(87, 'HM 421', 'Industry Immersion - Hotel', 0),
(88, 'HM 421a', 'Industry Immersion - Restaurant', 0),
(89, 'Educ 117', 'The Teacher & the Community, School Culture & Organizational Leadership', 0),
(90, 'Sci 101a', 'Teaching Science in the Elementary Grades (Biology & Chemistry)', 0),
(91, 'SSC 102a', 'Teaching Social Studies in the Elementary Grades (Philippine History & Government)', 0),
(92, 'Fil 103a', 'Pagtuturo ng Filipino sa Elementarya 1 - Estraktura at Gamit ng Wikang Filipino', 0),
(93, 'Math 104a', 'Teaching Math in the Primary Grades', 0),
(94, 'TLE 105a', 'Edukasyong Pantahanan at Pangkabuhayan', 0),
(95, 'PE 3', 'Fundamental of Individual and Dual Sports', 0),
(96, 'Panitikan', 'Panitikan ng Pilipinas', 0),
(97, 'Educ 106a', 'Facilitating Learner - Centered Teaching', 0),
(98, 'Sci Tech 1', 'Science, Technology & Society', 0),
(99, 'Educ 118', 'Foundation of Special & Inclusive Education', 0),
(100, 'Sci 101b', 'Teaching Science in the Elementary Grades (Physics, Earth & Space Science)', 0),
(101, 'SSC 102b', 'Teaching Social Studies in the Elementary Grades (Culture & Geography)', 0),
(102, 'Fil 103b', 'Pagtuturo nf Filipino sa Elementarya 2 - Panitikan ng Pilipinas', 0),
(103, 'Eng 107', 'Creative Writing', 0),
(104, 'TLE 105b', 'Edukasyong Pantahanan at Pangkabuhayan w/ Entrepreneurship', 0),
(105, 'PE 4', 'Recreational Activities', 0),
(106, 'Arts 107', 'Teaching English in the Elementary Grades', 0),
(107, 'Eng 109a', 'Teaching English in the Elementary (Language Arts)', 0),
(108, 'Educ 108a', 'Assessment in Learning 1', 0),
(109, 'Hist 12', 'Rizal: His Life , Works & Writing', 1),
(110, 'MTB-MLE 110', 'Content & Pedagogy for the Mother Tongue', 0),
(111, 'Math 104b', 'Teaching Math in the Intermediate Grades', 0),
(112, 'Filipino 3', 'Istruktura ng Wikang Filipino', 0),
(113, 'TTL 113', 'Technology for Teaching in Elementary Grades', 0),
(114, 'Educ 108b', 'Assessment in Learning 2', 0),
(115, 'Eng 109b', 'Teaching English in the Elementary Grades through Literature', 0),
(116, 'Educ 115', 'The Teacher & the School Curriculum', 0),
(117, 'Educ 111', 'The Teaching Profession', 0),
(118, 'GEC 2', 'Contemporary World', 0),
(119, 'RES 112a', 'Research in Education 1', 0),
(120, 'PEH 108', 'Teaching PE and Health in the Elementary Grades', 0),
(121, 'Field Study 1', 'Observation of Teaching-Learning in Actual School Environment', 0),
(122, 'Field Study 2', 'Participation and Teaching Assistantship', 0),
(123, 'RES 112b', 'Research in Education 2', 0),
(124, 'Educ 114', 'Teaching Internship', 0),
(125, 'ECE 101', 'Child Development', 0),
(126, 'ECE 102', 'Health, Nutrition and Safety', 0),
(127, 'ECE 103', 'Foundations of Early Childhood Education', 0),
(128, 'ECE 104', 'Play and Developmentally Appropriate Practices in Early Childhood Education', 0),
(129, 'ECE 105', 'Creative Arts, Music, and Movement in Early Childhood Education', 0),
(130, 'ECE 106', 'Numeracy Development', 0),
(131, 'EEd 1', 'Environment Education', 0),
(132, 'ECE 109', 'Children\'s Literature', 0),
(133, 'ECE 108', 'Literacy Development', 0),
(134, 'ECE 110', 'Social Studies in Early Childhood Education', 0),
(135, 'ECE 111', 'Science in Early Childhood Education', 0),
(136, 'ECE 112', 'Early Learning Environment', 0),
(137, 'ECE 201', 'Technology for Teaching & Learning 2 - Utilization of Instructional Technology in Early Childhood Education', 0),
(138, 'ECE 203', 'Guiding Children\'s Behavior and Moral Development', 0),
(139, 'ECE 204', 'Inclusive Education in Early Childhood Settings', 0),
(140, 'ECE 205', 'Infant and Toddler Programs', 0),
(141, 'ECE 206', 'Management of Early Childhood Education Programs', 0),
(142, 'ECE 207', 'Family, School and Community Partnership', 0),
(143, 'ECE 107', 'Assessment of Children\'s Development and Learning', 0),
(144, 'ECE 202', 'Early Childhood Education Curriculum Models', 0),
(145, 'Res 112b', 'Research in Early Childhood Education 2', 0),
(146, 'GEC 3', 'Mathematics in the Modern World', 0),
(147, 'NSTP 1', 'NSTP 1', 1),
(148, 'GEC 4', 'Purposive Communication', 0),
(149, 'NCM 101', 'Health Assessment', 0),
(150, 'NCM 102', 'Health Education', 0),
(151, 'NCM 103', 'Fundamentals of Nursing Practice', 0),
(152, 'MC 3', 'Microbiology and Parasitology', 0),
(153, 'NCM 104', 'Community Health Nursing (Individual and Family As Client)', 0),
(154, 'NCM 105', 'Nutrition and Diet Theraphy', 0),
(155, 'NCM 106', 'Pharmacology', 0),
(156, 'NCM 107', 'Care of Mother, Child, Adolescent (Well Clients)', 0),
(157, 'NCM 108', 'Health Care Ethics (Bioethics)', 0),
(158, 'MC 4', 'Logic & Critical Thinking', 0),
(159, 'NCM 109', 'Care of Mother, Child at Risk or With Problems (Acute and Chronic)', 0),
(160, 'NCM 110', 'Nursing Informatics', 0),
(161, 'GEC 5', 'Ethics', 0),
(162, 'GEC 6', 'Science, Technology and Society', 0),
(163, 'GEC E1', 'People and the Earth Ecosystems', 0),
(164, 'NCM 111', 'Nursing Research 1', 0),
(165, 'NCM 112', 'Care of Clients with Problems in Oxygenation, Fluid and Acute and Chronic Electrolytes, Infectious, Inflammatory and Immunologic Responses, Cellulars Aberrations', 0),
(166, 'NCM 113', 'Community Health Nursing 2 (Population Groups and Community as Clients)', 0),
(167, 'NCM 114', 'Care of the Older Person', 0),
(168, 'GEC 7', 'Art Appreciation', 0),
(169, 'NCM 115', 'Nursing Research 2', 0),
(170, 'NCM 116', 'Care of Clients with Problems in Nutrition and Gastro-Intestinal Metabolism and Endocrine, Perception and Coordination (Acute and Chronic)', 0),
(171, 'NCM 117', 'Care of Clients with Maladaptive Patterns of Behavior, Acute and Chronic', 0),
(172, 'GEC E2', 'Living in an IT Era', 0),
(173, 'NCM 118', 'Nursing Care of Clients with Threatening Conditions, Acutely III, Multi-Organ Problems, High Acuity and Emergency Situations (Acute and Chronic)', 0),
(174, 'NCM 119', 'Nursing Leadership and Management', 0),
(175, 'NCM 120', 'Decent Work Employment and Transcultural Nursing', 0),
(176, 'Rizal 1', 'Life , Works and Writing of Rizal', 1),
(177, 'NCM 121', 'Disaster Nursing', 0),
(178, 'NCM 122', 'Intensive Nursing Practicum (Hospital and Community Settings)', 0),
(179, 'GEC 8', 'The Contemporary World', 0),
(180, 'GEC 3', 'The Entrepreneural Mind', 0),
(181, 'GEC 4', 'Art Appreciation', 0),
(182, 'THC 1', 'Macro Perspective of Tourism and Hospitality', 0),
(183, 'GE 5', 'Purposive Communication', 0),
(184, 'GE 6', 'The Contemporary World', 0),
(185, 'THC 2', 'Risk Management as Applied to Safety, Security and Sanitation', 0),
(186, 'GE Elect 1', 'Reading Visual Arts', 0),
(187, 'HPC 1', 'Kitchen Essentials and Basic Food Preparation', 0),
(188, 'HPC 2', 'Fundamentals in Lodging Operations', 0),
(189, 'IT 100', 'Introduction to Computing', 0),
(190, 'IT 100', 'Introduction to Computing', 0),
(191, 'IT 101', 'Computer Programming 1', 0),
(192, 'GE 1', 'Mathematics in the Modern World', 0),
(193, 'GE 2', 'Understanding the Self', 0),
(194, 'GE 3', 'Readings in Philippine History', 0),
(195, 'GE 4', 'Art Appreciation', 0),
(196, 'IT 102', 'Human Computer Interaction', 0),
(197, 'IT 103', 'Discrete Mathematics', 0),
(198, 'IT 104', 'Computer Programming 2', 0),
(199, 'GE 5', 'Purposive Communication', 0);

-- --------------------------------------------------------

--
-- Table structure for table `uac_types`
--

CREATE TABLE `uac_types` (
  `uac_type_id` int(11) NOT NULL,
  `uac_type_desc` varchar(100) NOT NULL,
  `del_flag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `uac_types`
--

INSERT INTO `uac_types` (`uac_type_id`, `uac_type_desc`, `del_flag`) VALUES
(1, 'Admin', 0),
(2, 'Super-Admin', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_accounts`
--

CREATE TABLE `user_accounts` (
  `uac_id` int(11) NOT NULL,
  `uac_type` int(11) NOT NULL,
  `uac_name` varchar(50) NOT NULL,
  `uac_fullname` varchar(250) NOT NULL,
  `uac_pword` varchar(50) NOT NULL,
  `del_flag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_accounts`
--

INSERT INTO `user_accounts` (`uac_id`, `uac_type`, `uac_name`, `uac_fullname`, `uac_pword`, `del_flag`) VALUES
(1, 1, 'admin', 'Tony Stark', 'P@ssword', 0),
(2, 2, 'christiandale', 'Christian Dale Gonzales', 'P@ssword1', 0),
(3, 1, 'sample', 'Sample Person', 'P@ssword1', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `colleges`
--
ALTER TABLE `colleges`
  ADD PRIMARY KEY (`college_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `course_department` (`course_department`),
  ADD KEY `major` (`major`);

--
-- Indexes for table `course_fees`
--
ALTER TABLE `course_fees`
  ADD PRIMARY KEY (`course_fee_id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `fee_type_id` (`fee_type_id`),
  ADD KEY `sy_id` (`sy_id`);

--
-- Indexes for table `course_taken`
--
ALTER TABLE `course_taken`
  ADD PRIMARY KEY (`course_taken_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `curriculum`
--
ALTER TABLE `curriculum`
  ADD PRIMARY KEY (`curriculum_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `curriculum_prereq`
--
ALTER TABLE `curriculum_prereq`
  ADD PRIMARY KEY (`curr_prereq_id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `curr_sub_id` (`curr_sub_id`);

--
-- Indexes for table `curriculum_subjects`
--
ALTER TABLE `curriculum_subjects`
  ADD PRIMARY KEY (`curr_sub_id`),
  ADD KEY `curr_id` (`curr_id`),
  ADD KEY `curr_subject` (`curr_subject`),
  ADD KEY `curr_subject_prereq` (`curr_subject_prereq`),
  ADD KEY `curr_level` (`curr_level`),
  ADD KEY `curr_semester` (`curr_semester`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `enrolled_subjects`
--
ALTER TABLE `enrolled_subjects`
  ADD PRIMARY KEY (`enrolled_sub_id`),
  ADD KEY `enrollment_id` (`enrollment_id`),
  ADD KEY `sched_sub_id` (`sched_sub_id`);

--
-- Indexes for table `enrollment_fees`
--
ALTER TABLE `enrollment_fees`
  ADD PRIMARY KEY (`enrollment_fee_id`),
  ADD KEY `enrollment_id` (`enrollment_id`),
  ADD KEY `course_fee_id` (`course_fee_id`);

--
-- Indexes for table `faculty_profile`
--
ALTER TABLE `faculty_profile`
  ADD PRIMARY KEY (`faculty_id`);

--
-- Indexes for table `fee_category`
--
ALTER TABLE `fee_category`
  ADD PRIMARY KEY (`fee_category_id`);

--
-- Indexes for table `fee_types`
--
ALTER TABLE `fee_types`
  ADD PRIMARY KEY (`fee_type_id`),
  ADD KEY `fee_category_id` (`fee_category_id`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`grade_id`),
  ADD KEY `schedule_id` (`schedule_id`);

--
-- Indexes for table `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`level_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`Login_id`),
  ADD KEY `usertype_id` (`usertype_id`);

--
-- Indexes for table `majors`
--
ALTER TABLE `majors`
  ADD PRIMARY KEY (`major_id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`note_id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`room_id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`schedule_id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `faculty_id` (`faculty_id`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `fk_name` (`sy_id`);

--
-- Indexes for table `schedule_list`
--
ALTER TABLE `schedule_list`
  ADD PRIMARY KEY (`schedule_id`),
  ADD KEY `curriculum_id` (`curriculum_id`),
  ADD KEY `sy` (`sy_id`);

--
-- Indexes for table `schedule_subjects`
--
ALTER TABLE `schedule_subjects`
  ADD PRIMARY KEY (`sched_sub_id`),
  ADD KEY `schedule_id` (`schedule_id`),
  ADD KEY `faculty_id` (`faculty_id`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `subject_id` (`curr_sub_id`);

--
-- Indexes for table `school_year`
--
ALTER TABLE `school_year`
  ADD PRIMARY KEY (`sy_id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`section_id`);

--
-- Indexes for table `semesters`
--
ALTER TABLE `semesters`
  ADD PRIMARY KEY (`semester_id`);

--
-- Indexes for table `signatories`
--
ALTER TABLE `signatories`
  ADD PRIMARY KEY (`signatory_id`),
  ADD KEY `sig_pos_id` (`sig_pos_id`);

--
-- Indexes for table `signatory_position`
--
ALTER TABLE `signatory_position`
  ADD PRIMARY KEY (`sig_pos_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`),
  ADD KEY `course` (`course`);

--
-- Indexes for table `student_enrollments`
--
ALTER TABLE `student_enrollments`
  ADD PRIMARY KEY (`enrollment_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `sy_id` (`sy_id`),
  ADD KEY `semester_id` (`semester_id`),
  ADD KEY `level_id` (`level_id`),
  ADD KEY `fk_uac` (`processed_by`);

--
-- Indexes for table `student_info`
--
ALTER TABLE `student_info`
  ADD PRIMARY KEY (`student_id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `current_year` (`current_year`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`subject_id`);

--
-- Indexes for table `uac_types`
--
ALTER TABLE `uac_types`
  ADD PRIMARY KEY (`uac_type_id`);

--
-- Indexes for table `user_accounts`
--
ALTER TABLE `user_accounts`
  ADD PRIMARY KEY (`uac_id`),
  ADD KEY `uac_type` (`uac_type`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `colleges`
--
ALTER TABLE `colleges`
  MODIFY `college_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `course_fees`
--
ALTER TABLE `course_fees`
  MODIFY `course_fee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `course_taken`
--
ALTER TABLE `course_taken`
  MODIFY `course_taken_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `curriculum`
--
ALTER TABLE `curriculum`
  MODIFY `curriculum_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `curriculum_prereq`
--
ALTER TABLE `curriculum_prereq`
  MODIFY `curr_prereq_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `curriculum_subjects`
--
ALTER TABLE `curriculum_subjects`
  MODIFY `curr_sub_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `enrolled_subjects`
--
ALTER TABLE `enrolled_subjects`
  MODIFY `enrolled_sub_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `enrollment_fees`
--
ALTER TABLE `enrollment_fees`
  MODIFY `enrollment_fee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `faculty_profile`
--
ALTER TABLE `faculty_profile`
  MODIFY `faculty_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `fee_category`
--
ALTER TABLE `fee_category`
  MODIFY `fee_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `fee_types`
--
ALTER TABLE `fee_types`
  MODIFY `fee_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `grade_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `levels`
--
ALTER TABLE `levels`
  MODIFY `level_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `Login_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `majors`
--
ALTER TABLE `majors`
  MODIFY `major_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `note_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schedule_list`
--
ALTER TABLE `schedule_list`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `schedule_subjects`
--
ALTER TABLE `schedule_subjects`
  MODIFY `sched_sub_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `school_year`
--
ALTER TABLE `school_year`
  MODIFY `sy_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `section_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `semesters`
--
ALTER TABLE `semesters`
  MODIFY `semester_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `signatories`
--
ALTER TABLE `signatories`
  MODIFY `signatory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `signatory_position`
--
ALTER TABLE `signatory_position`
  MODIFY `sig_pos_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_enrollments`
--
ALTER TABLE `student_enrollments`
  MODIFY `enrollment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `student_info`
--
ALTER TABLE `student_info`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=200;

--
-- AUTO_INCREMENT for table `uac_types`
--
ALTER TABLE `uac_types`
  MODIFY `uac_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_accounts`
--
ALTER TABLE `user_accounts`
  MODIFY `uac_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`course_department`) REFERENCES `department` (`department_id`),
  ADD CONSTRAINT `courses_ibfk_2` FOREIGN KEY (`major`) REFERENCES `majors` (`major_id`);

--
-- Constraints for table `course_fees`
--
ALTER TABLE `course_fees`
  ADD CONSTRAINT `course_fees_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`),
  ADD CONSTRAINT `course_fees_ibfk_2` FOREIGN KEY (`fee_type_id`) REFERENCES `fee_types` (`fee_type_id`),
  ADD CONSTRAINT `course_fees_ibfk_3` FOREIGN KEY (`sy_id`) REFERENCES `school_year` (`sy_id`);

--
-- Constraints for table `course_taken`
--
ALTER TABLE `course_taken`
  ADD CONSTRAINT `course_taken_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  ADD CONSTRAINT `course_taken_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`);

--
-- Constraints for table `curriculum`
--
ALTER TABLE `curriculum`
  ADD CONSTRAINT `curriculum_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`);

--
-- Constraints for table `curriculum_prereq`
--
ALTER TABLE `curriculum_prereq`
  ADD CONSTRAINT `curriculum_prereq_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`),
  ADD CONSTRAINT `curriculum_prereq_ibfk_2` FOREIGN KEY (`curr_sub_id`) REFERENCES `curriculum_subjects` (`curr_sub_id`);

--
-- Constraints for table `curriculum_subjects`
--
ALTER TABLE `curriculum_subjects`
  ADD CONSTRAINT `curriculum_subjects_ibfk_1` FOREIGN KEY (`curr_id`) REFERENCES `curriculum` (`curriculum_id`),
  ADD CONSTRAINT `curriculum_subjects_ibfk_2` FOREIGN KEY (`curr_subject`) REFERENCES `subjects` (`subject_id`),
  ADD CONSTRAINT `curriculum_subjects_ibfk_3` FOREIGN KEY (`curr_subject_prereq`) REFERENCES `subjects` (`subject_id`),
  ADD CONSTRAINT `curriculum_subjects_ibfk_4` FOREIGN KEY (`curr_level`) REFERENCES `levels` (`level_id`),
  ADD CONSTRAINT `curriculum_subjects_ibfk_5` FOREIGN KEY (`curr_semester`) REFERENCES `semesters` (`semester_id`);

--
-- Constraints for table `enrolled_subjects`
--
ALTER TABLE `enrolled_subjects`
  ADD CONSTRAINT `enrolled_subjects_ibfk_1` FOREIGN KEY (`enrollment_id`) REFERENCES `student_enrollments` (`enrollment_id`),
  ADD CONSTRAINT `enrolled_subjects_ibfk_2` FOREIGN KEY (`sched_sub_id`) REFERENCES `schedule_subjects` (`sched_sub_id`);

--
-- Constraints for table `enrollment_fees`
--
ALTER TABLE `enrollment_fees`
  ADD CONSTRAINT `enrollment_fees_ibfk_1` FOREIGN KEY (`enrollment_id`) REFERENCES `student_enrollments` (`enrollment_id`),
  ADD CONSTRAINT `enrollment_fees_ibfk_2` FOREIGN KEY (`course_fee_id`) REFERENCES `course_fees` (`course_fee_id`);

--
-- Constraints for table `fee_types`
--
ALTER TABLE `fee_types`
  ADD CONSTRAINT `fee_types_ibfk_1` FOREIGN KEY (`fee_category_id`) REFERENCES `fee_category` (`fee_category_id`);

--
-- Constraints for table `grades`
--
ALTER TABLE `grades`
  ADD CONSTRAINT `grades_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`schedule_id`);

--
-- Constraints for table `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `login_ibfk_1` FOREIGN KEY (`usertype_id`) REFERENCES `usertype` (`usertype_id`);

--
-- Constraints for table `schedules`
--
ALTER TABLE `schedules`
  ADD CONSTRAINT `fk_name` FOREIGN KEY (`sy_id`) REFERENCES `school_year` (`sy_id`),
  ADD CONSTRAINT `schedules_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `curriculum_subjects` (`curr_sub_id`),
  ADD CONSTRAINT `schedules_ibfk_2` FOREIGN KEY (`faculty_id`) REFERENCES `faculty_profile` (`faculty_id`),
  ADD CONSTRAINT `schedules_ibfk_3` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`);

--
-- Constraints for table `schedule_list`
--
ALTER TABLE `schedule_list`
  ADD CONSTRAINT `schedule_list_ibfk_1` FOREIGN KEY (`curriculum_id`) REFERENCES `curriculum` (`curriculum_id`),
  ADD CONSTRAINT `schedule_list_ibfk_2` FOREIGN KEY (`sy_id`) REFERENCES `school_year` (`sy_id`);

--
-- Constraints for table `schedule_subjects`
--
ALTER TABLE `schedule_subjects`
  ADD CONSTRAINT `schedule_subjects_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedule_list` (`schedule_id`),
  ADD CONSTRAINT `schedule_subjects_ibfk_2` FOREIGN KEY (`faculty_id`) REFERENCES `faculty_profile` (`faculty_id`),
  ADD CONSTRAINT `schedule_subjects_ibfk_3` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`),
  ADD CONSTRAINT `schedule_subjects_ibfk_4` FOREIGN KEY (`curr_sub_id`) REFERENCES `curriculum_subjects` (`curr_sub_id`);

--
-- Constraints for table `signatories`
--
ALTER TABLE `signatories`
  ADD CONSTRAINT `signatories_ibfk_1` FOREIGN KEY (`sig_pos_id`) REFERENCES `signatory_position` (`sig_pos_id`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`course`) REFERENCES `courses` (`course_id`);

--
-- Constraints for table `student_enrollments`
--
ALTER TABLE `student_enrollments`
  ADD CONSTRAINT `fk_uac` FOREIGN KEY (`processed_by`) REFERENCES `user_accounts` (`uac_id`),
  ADD CONSTRAINT `student_enrollments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student_info` (`student_id`),
  ADD CONSTRAINT `student_enrollments_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`),
  ADD CONSTRAINT `student_enrollments_ibfk_3` FOREIGN KEY (`sy_id`) REFERENCES `school_year` (`sy_id`),
  ADD CONSTRAINT `student_enrollments_ibfk_4` FOREIGN KEY (`semester_id`) REFERENCES `semesters` (`semester_id`),
  ADD CONSTRAINT `student_enrollments_ibfk_5` FOREIGN KEY (`level_id`) REFERENCES `levels` (`level_id`);

--
-- Constraints for table `student_info`
--
ALTER TABLE `student_info`
  ADD CONSTRAINT `student_info_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`),
  ADD CONSTRAINT `student_info_ibfk_2` FOREIGN KEY (`current_year`) REFERENCES `levels` (`level_id`);

--
-- Constraints for table `user_accounts`
--
ALTER TABLE `user_accounts`
  ADD CONSTRAINT `user_accounts_ibfk_1` FOREIGN KEY (`uac_type`) REFERENCES `uac_types` (`uac_type_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
