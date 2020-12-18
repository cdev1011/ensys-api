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
-- Database: `enrollment_system`
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
(1, 'Kalinga State University', '0');

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
(1, 1, 1, 2, '1100.00', 0),
(2, 1, 1, 1, '2000.00', 1),
(3, 1, 2, 2, '500.00', 0),
(4, 1, 19, 2, '1100.00', 0),
(5, 1, 20, 2, '1100.00', 0),
(6, 1, 21, 2, '1500.00', 0),
(7, 1, 14, 2, '300.00', 0),
(8, 1, 22, 2, '440.00', 0),
(9, 1, 22, 2, '440.00', 1),
(10, 1, 3, 2, '500.00', 0),
(11, 1, 4, 2, '150.00', 0),
(12, 1, 5, 2, '115.00', 0),
(13, 1, 7, 2, '400.00', 0),
(14, 1, 8, 2, '300.00', 0),
(15, 1, 9, 2, '350.00', 0),
(16, 1, 10, 2, '200.00', 0),
(17, 1, 11, 2, '200.00', 0),
(18, 1, 12, 2, '300.00', 0),
(19, 1, 13, 2, '175.00', 0),
(20, 1, 15, 2, '75.00', 0),
(21, 1, 16, 2, '200.00', 0),
(22, 1, 17, 2, '300.00', 0),
(23, 2, 22, 2, '250.00', 0),
(24, 2, 3, 2, '500.00', 0),
(25, 2, 4, 2, '150.00', 0),
(26, 2, 5, 2, '115.00', 0),
(27, 2, 7, 2, '400.00', 0),
(28, 2, 8, 2, '300.00', 0),
(29, 2, 9, 2, '350.00', 0),
(30, 2, 10, 2, '200.00', 0),
(31, 2, 11, 2, '200.00', 0),
(32, 2, 12, 2, '300.00', 0),
(33, 2, 13, 2, '175.00', 0),
(34, 2, 14, 2, '300.00', 0),
(35, 2, 15, 2, '75.00', 0),
(36, 2, 16, 2, '200.00', 0),
(37, 2, 14, 2, '300.00', 0),
(38, 2, 15, 2, '75.00', 0),
(39, 2, 16, 2, '200.00', 0),
(40, 2, 17, 2, '300.00', 0),
(41, 2, 2, 2, '500.00', 0),
(42, 2, 23, 2, '500.00', 0),
(43, 2, 19, 2, '1100.00', 0),
(44, 2, 20, 2, '1100.00', 0);

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
(13, 1, 2019, 0),
(14, 6, 2018, 0),
(15, 3, 2018, 0),
(16, 4, 2018, 0),
(17, 5, 2018, 0),
(18, 2, 2018, 0),
(19, 7, 2018, 0),
(20, 8, 2018, 0),
(21, 9, 2018, 0);

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
  `curr_subject_units` int(11) NOT NULL,
  `del_flag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `curriculum_subjects`
--

INSERT INTO `curriculum_subjects` (`curr_sub_id`, `curr_id`, `curr_subject`, `curr_subject_prereq`, `curr_level`, `curr_semester`, `curr_subject_units`, `del_flag`) VALUES
(191, 13, 1, NULL, 1, 1, 3, 0),
(192, 13, 2, NULL, 1, 1, 2, 1),
(193, 13, 4, NULL, 1, 1, 2, 1),
(194, 13, 2, NULL, 1, 1, 3, 0),
(195, 13, 3, NULL, 1, 1, 3, 0),
(196, 13, 4, NULL, 1, 1, 5, 0),
(197, 13, 5, NULL, 1, 1, 5, 0),
(198, 13, 146, NULL, 1, 1, 3, 0),
(199, 13, 10, NULL, 1, 1, 2, 0),
(200, 13, 11, NULL, 1, 1, 3, 0),
(201, 13, 6, NULL, 1, 1, 3, 0),
(202, 13, 148, NULL, 1, 2, 3, 0),
(203, 13, 149, NULL, 1, 2, 5, 0),
(204, 13, 150, NULL, 2, 2, 3, 1),
(205, 13, 150, NULL, 1, 2, 3, 0),
(206, 13, 151, NULL, 1, 2, 5, 0),
(207, 13, 152, NULL, 1, 2, 4, 0),
(208, 13, 21, NULL, 1, 2, 2, 1),
(209, 13, 22, 11, 1, 2, 3, 0),
(210, 13, 21, NULL, 1, 2, 2, 1),
(211, 13, 21, 32, 1, 2, 2, 0),
(212, 13, 23, NULL, 1, 2, 3, 0),
(213, 13, 153, NULL, 2, 1, 4, 0),
(214, 13, 154, NULL, 2, 1, 3, 0),
(215, 13, 155, NULL, 2, 1, 3, 0),
(216, 13, 156, NULL, 2, 1, 9, 0),
(217, 13, 157, NULL, 2, 1, 3, 0),
(218, 13, 95, NULL, 2, 1, 2, 0),
(219, 13, 158, NULL, 2, 1, 3, 0),
(220, 13, 159, NULL, 2, 2, 12, 0),
(221, 13, 160, NULL, 2, 2, 3, 0),
(222, 13, 161, NULL, 2, 2, 3, 0),
(223, 13, 162, NULL, 2, 2, 3, 0),
(224, 13, 61, NULL, 2, 2, 2, 0),
(225, 13, 163, NULL, 2, 2, 3, 0),
(226, 13, 164, NULL, 3, 1, 3, 0),
(227, 13, 165, NULL, 3, 1, 14, 0),
(228, 13, 166, NULL, 2, 1, 3, 1),
(229, 13, 167, NULL, 3, 1, 3, 0),
(230, 13, 166, NULL, 3, 1, 3, 0),
(231, 13, 168, NULL, 3, 1, 3, 0),
(232, 13, 169, NULL, 3, 2, 2, 0),
(233, 13, 170, NULL, 3, 2, 9, 0),
(234, 13, 171, NULL, 3, 1, 8, 1),
(235, 13, 171, NULL, 3, 2, 8, 0),
(236, 13, 172, NULL, 3, 2, 3, 0),
(237, 13, 173, NULL, 4, 1, 9, 0),
(238, 13, 174, 170, 4, 1, 7, 0),
(239, 13, 175, NULL, 4, 1, 3, 0),
(240, 13, 76, NULL, 4, 1, 3, 0),
(241, 13, 177, NULL, 4, 2, 3, 0),
(242, 13, 178, NULL, 4, 2, 8, 0),
(243, 13, 179, NULL, 4, 2, 3, 0),
(244, 13, 180, NULL, 4, 2, 3, 0),
(245, 18, 1, NULL, 1, 1, 3, 0),
(246, 18, 6, NULL, 1, 1, 3, 0),
(247, 18, 7, NULL, 1, 1, 3, 0),
(248, 18, 8, NULL, 1, 1, 3, 0),
(249, 18, 9, NULL, 1, 1, 3, 0),
(250, 18, 32, NULL, 1, 1, 3, 1),
(251, 18, 11, NULL, 1, 1, 3, 0),
(252, 18, 12, NULL, 1, 1, 3, 0),
(253, 18, 13, NULL, 1, 1, 3, 0),
(254, 18, 14, NULL, 1, 1, 3, 0),
(255, 18, 32, NULL, 1, 1, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `department_id` int(11) NOT NULL,
  `department_desc` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `enrolled_subjects`
--

CREATE TABLE `enrolled_subjects` (
  `enrolled_sub_id` int(11) NOT NULL,
  `enrollment_id` int(11) NOT NULL,
  `sched_sub_id` int(11) NOT NULL,
  `del_flag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enrolled_subjects`
--

INSERT INTO `enrolled_subjects` (`enrolled_sub_id`, `enrollment_id`, `sched_sub_id`, `del_flag`) VALUES
(1, 1, 1, 0),
(2, 2, 1, 0),
(3, 3, 2, 0),
(4, 3, 2, 0),
(5, 4, 2, 0),
(6, 4, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `faculty_profile`
--

CREATE TABLE `faculty_profile` (
  `faculty_id` int(11) NOT NULL,
  `faculty_fname` varchar(200) NOT NULL,
  `faculty_mname` varchar(200) DEFAULT NULL,
  `faculty_lname` varchar(200) NOT NULL,
  `faculty_PIC` text NOT NULL,
  `age` int(11) NOT NULL,
  `civil_status` varchar(20) NOT NULL,
  `designation` varchar(200) DEFAULT NULL,
  `years_in_service` int(11) NOT NULL,
  `profesional_organization` varchar(200) DEFAULT NULL,
  `specialization` varchar(200) NOT NULL,
  `highest_educ_qualification` varchar(200) DEFAULT NULL,
  `employment_status` varchar(200) NOT NULL,
  `del_flag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faculty_profile`
--

INSERT INTO `faculty_profile` (`faculty_id`, `faculty_fname`, `faculty_mname`, `faculty_lname`, `faculty_PIC`, `age`, `civil_status`, `designation`, `years_in_service`, `profesional_organization`, `specialization`, `highest_educ_qualification`, `employment_status`, `del_flag`) VALUES
(1, 'Sample', 'Sample', 'Sample', 'phpE910.tmp.jpg', 33, 'Male', 'Instructor', 21, 'Sample', 'Sample', 'Sample', 'Sample', 1),
(2, 'Nova Divine', 'Molina', 'De La Pena', 'php2433.tmp.jpg', 26, 'Single', 'College Instructor', 5, 'AREI-CAR, NOPTI', 'Computing', 'Master in Information Technology (IP)', 'Regular', 0),
(3, 'Rogelio Jr.', 'Ag-a', 'Doctor', 'phpEDBD.tmp.jpg', 30, 'Male', 'ICT- I.T. Instructor', 6, NULL, 'Hardware & Software Application', 'MA (IP)', 'Regular', 0),
(4, 'Mayeth', 'Taloza', 'Valdez', 'phpC80.tmp.png', 32, 'Male', 'CTE Coordinator', 5, 'NOPTI', 'English', 'MST-English', 'Regular', 0),
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
  `final` decimal(2,1) DEFAULT NULL,
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
  `created_at` date DEFAULT NULL,
  `del_flag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notes`
--

INSERT INTO `notes` (`note_id`, `note_title`, `note_message`, `created_at`, `del_flag`) VALUES
(1, 'Reminders!!!', 'Sample note for users..', NULL, 1);

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
(2, 13, 2, 0);

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
(2, 2, 191, 3, 2, '02:23:00', '01:00:00', 'M,T,W', 0),
(3, 2, 193, 2, 1, '12:59:00', '12:59:00', 'M,T', 0);

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
(2, 2019, 2020, 0);

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
  `del_flag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_enrollments`
--

INSERT INTO `student_enrollments` (`enrollment_id`, `student_id`, `course_id`, `sy_id`, `semester_id`, `del_flag`) VALUES
(1, 1, 1, 1, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `student_info`
--

CREATE TABLE `student_info` (
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `student_photo` text DEFAULT NULL,
  `student_fname` varchar(100) NOT NULL,
  `student_mname` varchar(100) NOT NULL,
  `student_lname` varchar(100) NOT NULL,
  `date_of_birth` date NOT NULL,
  `age` int(11) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `birthplace` varchar(200) NOT NULL,
  `home_address` varchar(200) NOT NULL,
  `mobile_number` varchar(200) DEFAULT NULL,
  `fathers_name` varchar(250) NOT NULL,
  `fathers_occup` varchar(200) NOT NULL,
  `mothers_name` varchar(250) NOT NULL,
  `mother_occup` varchar(200) NOT NULL,
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
  `del_flag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_info`
--

INSERT INTO `student_info` (`student_id`, `course_id`, `student_photo`, `student_fname`, `student_mname`, `student_lname`, `date_of_birth`, `age`, `gender`, `birthplace`, `home_address`, `mobile_number`, `fathers_name`, `fathers_occup`, `mothers_name`, `mother_occup`, `parent_tel`, `guardian_name`, `guardian_rel`, `guradian_Addr`, `guardian_occup`, `guardian_tel`, `elem_attended`, `elem_yrs_attd`, `hs_attended`, `hs_yrs_attd`, `lst_cllg_attd`, `attd_cllg_lvl`, `attd_cllg_sy`, `creds_presented`, `tranfer_flag`, `del_flag`) VALUES
(1, 2, 'php14C9.tmp.png', 'Sample', 'Sample', 'Sample', '2020-01-15', 22, 'Male', 'Sample', 'Sample', '96562', 'Sample', 'Sample', 'Sample', 'Sample', '23123', NULL, NULL, NULL, NULL, NULL, 'Sample', 21, 'Sample', NULL, 'Sample', 0, '21', NULL, 0, 0),
(2, 2, 'php10D9.tmp.png', 'Blue', 'Blue', 'Blue', '2020-01-17', 21, 'Male', 'Blue', 'Blue', '9565223213', 'Blue', 'Blue', 'Blue', 'Blue', '432424242434', 'Blue', 'Blue', 'Blue', 'Blue', '3424434', 'Blue', 2, 'Blue', 3, 'Blue', 0, '3', NULL, 0, 0);

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
  `uac_pword` varchar(50) NOT NULL,
  `del_flag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_accounts`
--

INSERT INTO `user_accounts` (`uac_id`, `uac_type`, `uac_name`, `uac_pword`, `del_flag`) VALUES
(1, 1, 'admin', 'P@ssword', 0),
(2, 2, 'christiandale', 'P@ssword1', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `colleges`
--
ALTER TABLE `colleges`
  ADD PRIMARY KEY (`college_id`);

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
  ADD KEY `semester_id` (`semester_id`);

--
-- Indexes for table `student_info`
--
ALTER TABLE `student_info`
  ADD PRIMARY KEY (`student_id`);

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
-- AUTO_INCREMENT for table `course_fees`
--
ALTER TABLE `course_fees`
  MODIFY `course_fee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `course_taken`
--
ALTER TABLE `course_taken`
  MODIFY `course_taken_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `curriculum`
--
ALTER TABLE `curriculum`
  MODIFY `curriculum_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `curriculum_subjects`
--
ALTER TABLE `curriculum_subjects`
  MODIFY `curr_sub_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=256;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `enrolled_subjects`
--
ALTER TABLE `enrolled_subjects`
  MODIFY `enrolled_sub_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  MODIFY `note_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `schedule_subjects`
--
ALTER TABLE `schedule_subjects`
  MODIFY `sched_sub_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `school_year`
--
ALTER TABLE `school_year`
  MODIFY `sy_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_enrollments`
--
ALTER TABLE `student_enrollments`
  MODIFY `enrollment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `student_info`
--
ALTER TABLE `student_info`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `uac_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `student_enrollments`
--
ALTER TABLE `student_enrollments`
  ADD CONSTRAINT `student_enrollments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student_info` (`student_id`),
  ADD CONSTRAINT `student_enrollments_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`),
  ADD CONSTRAINT `student_enrollments_ibfk_3` FOREIGN KEY (`sy_id`) REFERENCES `school_year` (`sy_id`),
  ADD CONSTRAINT `student_enrollments_ibfk_4` FOREIGN KEY (`semester_id`) REFERENCES `semesters` (`semester_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
