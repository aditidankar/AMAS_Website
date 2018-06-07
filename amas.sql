-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 07, 2018 at 06:57 PM
-- Server version: 5.7.21
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `amas`
--

-- --------------------------------------------------------

--
-- Table structure for table `classroom`
--

DROP TABLE IF EXISTS `classroom`;
CREATE TABLE IF NOT EXISTS `classroom` (
  `ClassroomID` varchar(50) NOT NULL,
  `ClassroomCapacity` tinyint(2) UNSIGNED ZEROFILL DEFAULT NULL,
  `Building` varchar(50) NOT NULL,
  `Latitude` varchar(100) NOT NULL,
  `Longitude` varchar(100) NOT NULL,
  `Altitude` varchar(100) NOT NULL,
  PRIMARY KEY (`ClassroomID`),
  UNIQUE KEY `ClassroomID_UNIQUE` (`ClassroomID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `classroom`
--

INSERT INTO `classroom` (`ClassroomID`, `ClassroomCapacity`, `Building`, `Latitude`, `Longitude`, `Altitude`) VALUES
('AB1205', 100, 'AB1', '13.551481N', '74.992419E', '0'),
('AB2102', 100, 'AB2', '13.781481N', '74.342419E', '30'),
('AB3105', 100, 'NLH', '13.535652N', '74.977856E', '40'),
('AB3203', 100, 'NLH', '13.484483N', '74.344369E', '35'),
('AB3204', 100, 'NLH', '13.351481N', '74.792419E', '60'),
('AB4304', 100, 'IC', '13.751481N', '74.592419E', '90'),
('AB4408', 100, 'IC', '13.451481N', '74.892419E', '45'),
('AB5407', 100, 'AB5', '13.651481N', '74.692419E', '75'),
('AB5507', 100, 'AB5', '13.651481N', '74.692419E', '64');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `DeptID` varchar(50) NOT NULL,
  `DeptName` varchar(100) NOT NULL,
  PRIMARY KEY (`DeptID`),
  UNIQUE KEY `departmentName_UNIQUE` (`DeptName`),
  UNIQUE KEY `departmentID_UNIQUE` (`DeptID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`DeptID`, `DeptName`) VALUES
('D07', 'Biotechnology Department'),
('D01', 'Computer Application Department'),
('D04', 'Computer Science Department'),
('D02', 'Electrical and Electronics Department'),
('D03', 'Electronics and Communication Department'),
('D05', 'Mechanical Department'),
('D06', 'Mechatronics Department');

-- --------------------------------------------------------

--
-- Table structure for table `dept_section_semester_student`
--

DROP TABLE IF EXISTS `dept_section_semester_student`;
CREATE TABLE IF NOT EXISTS `dept_section_semester_student` (
  `DeptID` varchar(50) DEFAULT NULL,
  `SectionID` varchar(10) DEFAULT NULL,
  `SemesterID` varchar(10) NOT NULL,
  `NumberOfStudents` tinyint(2) NOT NULL,
  `FirstYear` tinyint(1) NOT NULL DEFAULT '0',
  KEY `dsss_deptID_foreign_idx` (`DeptID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dept_section_semester_student`
--

INSERT INTO `dept_section_semester_student` (`DeptID`, `SectionID`, `SemesterID`, `NumberOfStudents`, `FirstYear`) VALUES
(NULL, 'A', '2', 61, 1),
(NULL, 'B', '2', 62, 1),
(NULL, 'C', '2', 63, 1),
(NULL, 'D', '2', 64, 1),
(NULL, 'E', '2', 65, 1),
('D01', NULL, '2', 66, 1),
('D01', NULL, '4', 67, 0),
('D02', 'A', '4', 68, 0),
('D02', 'B', '4', 69, 0),
('D02', 'C', '4', 70, 0),
('D02', 'A', '6', 70, 0),
('D02', 'B', '6', 69, 0),
('D02', 'C', '6', 68, 0),
('D02', 'A', '8', 72, 0),
('D02', 'B', '8', 71, 0),
('D02', 'C', '8', 72, 0),
('D03', 'A', '4', 70, 0),
('D03', 'B', '4', 71, 0),
('D03', 'A', '6', 68, 0),
('D03', 'B', '6', 69, 0),
('D03', 'A', '8', 67, 0),
('D03', 'B', '8', 68, 0),
('D04', 'A', '4', 68, 0),
('D04', 'A', '6', 69, 0),
('D04', 'A', '8', 70, 0);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
CREATE TABLE IF NOT EXISTS `staff` (
  `StaffID` varchar(50) NOT NULL,
  `Password` varchar(8) NOT NULL,
  `DeptID` varchar(50) NOT NULL,
  `Designation` varchar(100) NOT NULL,
  `HOD` tinyint(1) NOT NULL DEFAULT '0',
  `StaffFname` varchar(100) NOT NULL,
  `StaffMname` varchar(100) DEFAULT NULL,
  `StaffLname` varchar(100) DEFAULT NULL,
  `StaffEmailID` varchar(100) NOT NULL,
  `StaffPhoneNumber` bigint(10) UNSIGNED NOT NULL,
  `Country` varchar(45) NOT NULL,
  `State` varchar(45) NOT NULL,
  `City` varchar(45) NOT NULL,
  `AddressHome` varchar(200) NOT NULL,
  `Pincode` int(6) NOT NULL,
  PRIMARY KEY (`StaffID`),
  UNIQUE KEY `PhoneNumber_UNIQUE` (`StaffPhoneNumber`),
  UNIQUE KEY `StaffEmailID_UNIQUE` (`StaffEmailID`),
  UNIQUE KEY `StaffID_UNIQUE` (`StaffID`),
  KEY `staff_deptID_foreign_idx` (`DeptID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`StaffID`, `Password`, `DeptID`, `Designation`, `HOD`, `StaffFname`, `StaffMname`, `StaffLname`, `StaffEmailID`, `StaffPhoneNumber`, `Country`, `State`, `City`, `AddressHome`, `Pincode`) VALUES
('ST001', '123456', 'D01', 'Associtate Professor', 0, 'Poornima', 'P.', 'Kundapur', 'ppk@mit.com', 1234567890, 'India', 'Karnataka', 'Manipal', '221B, Manipal', 576104),
('ST002', '', 'D02', 'Assistant Professor', 0, 'Divya', NULL, 'Shetty', 'ds@mit.com', 2345678901, 'India', 'Karnataka', 'Bangalore', '221B, Bangalore', 560007),
('ST003', '123456', 'D03', 'Head of Department', 1, 'Abc', NULL, 'Def', 'ad@mit.com', 3456789012, 'India', 'Maharashtra', 'Mumbai', '234D, Mumbai', 400001),
('ST004', '', 'D01', 'Associate Professor', 0, 'Ghi', NULL, 'Jkl', 'gj@mit.com', 1234567809, 'India', 'Maharashtra', 'Pune', '567BZ, Pune', 411110),
('ST005', '', 'D03', 'Assistant Professor', 0, 'Mno', NULL, 'Pqr', 'mp@mit.com', 3456789901, 'India', 'Bihar', 'Patna', '345N, Patna', 800001),
('ST006', '', 'D02', 'Head of Department', 1, 'Savitha', 'G.', 'Kini', 'sgk@mit.com', 9876543210, 'India', 'Bihar', 'Patna', '221B, Bakerstreet', 800001),
('ST007', '', 'D05', 'Head of Department', 1, 'Stu', '', 'Vwx', 'sv@mit.com', 9876677543, 'India', 'Karnataka', 'Manipal', '221B, Bakerstreet', 576104);

-- --------------------------------------------------------

--
-- Table structure for table `staff_attendance`
--

DROP TABLE IF EXISTS `staff_attendance`;
CREATE TABLE IF NOT EXISTS `staff_attendance` (
  `StaffID` varchar(50) NOT NULL,
  `Date` date NOT NULL,
  `Time` time DEFAULT NULL,
  `Day` varchar(10) NOT NULL,
  `StaffLeave` tinyint(4) NOT NULL DEFAULT '0',
  `StaffLeaveType` varchar(50) DEFAULT NULL,
  `StaffAttendance` varchar(50) NOT NULL DEFAULT 'Present',
  KEY `staff_attendance_staffID_foreign_idx` (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `staff_attendance`
--

INSERT INTO `staff_attendance` (`StaffID`, `Date`, `Time`, `Day`, `StaffLeave`, `StaffLeaveType`, `StaffAttendance`) VALUES
('ST001', '2018-02-21', '08:00:00', 'Wednesday', 0, NULL, 'Present'),
('ST002', '2018-02-21', '08:00:00', 'Wednesday', 0, NULL, 'Present'),
('ST003', '2018-02-21', '08:00:00', 'Wednesday', 0, NULL, 'Present'),
('ST004', '2018-02-21', '08:00:00', 'Wednesday', 0, NULL, 'Present'),
('ST005', '2018-02-21', '08:00:00', 'Wednesday', 0, NULL, 'Present'),
('ST006', '2018-02-21', '08:00:00', 'Wednesday', 0, NULL, 'Present');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `StudentID` varchar(50) NOT NULL,
  `Password` varchar(8) NOT NULL,
  `DeptID` varchar(50) NOT NULL,
  `SemesterID` varchar(10) NOT NULL,
  `SectionID` varchar(10) DEFAULT NULL,
  `CR` tinyint(1) NOT NULL DEFAULT '0',
  `StudentFname` varchar(100) NOT NULL,
  `StudentMname` varchar(100) DEFAULT NULL,
  `StudentLname` varchar(100) DEFAULT NULL,
  `StudentEmailID` varchar(100) NOT NULL,
  `StudentMobileNumber` bigint(10) UNSIGNED NOT NULL,
  `ParentEmailID` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ParentPhoneNumber` bigint(10) UNSIGNED NOT NULL,
  `Country` varchar(45) NOT NULL,
  `State` varchar(45) NOT NULL,
  `City` varchar(45) NOT NULL,
  `AddressHome` varchar(200) NOT NULL,
  `Pincode` int(6) NOT NULL,
  PRIMARY KEY (`StudentID`),
  UNIQUE KEY `MobileNumber_UNIQUE` (`StudentMobileNumber`),
  UNIQUE KEY `studentID_UNIQUE` (`StudentID`),
  KEY `student_deptID_foreign_idx` (`DeptID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`StudentID`, `Password`, `DeptID`, `SemesterID`, `SectionID`, `CR`, `StudentFname`, `StudentMname`, `StudentLname`, `StudentEmailID`, `StudentMobileNumber`, `ParentEmailID`, `ParentPhoneNumber`, `Country`, `State`, `City`, `AddressHome`, `Pincode`) VALUES
('STU01', '123456', 'D02', '8', 'C', 0, 'Aditi', NULL, 'Dankar', 'student1@gmail.com', 8349589459, 'parent1@gmail.com', 9343423478, '', 'Bihar', 'Patna', 'Imlital Danapur Cant, Patna', 801503),
('STU02', '', 'D03', '8', 'B', 0, 'Vidisha', NULL, 'Prasad', 'student2@gmail.com', 9876543210, 'parent2@gmail.com', 9876543213, '', 'Karnataka', 'Bangalore', '456N, Bangalore', 560009),
('STU03', '', 'D01', '4', NULL, 0, 'Aishwarya', NULL, 'Sinha', 'student3@gmail.com', 9876543510, 'parent2@gmail.com', 9875543213, '', 'Bihar', 'Patna', '345M, Patna', 800003),
('STU04', '', 'D04', '4', 'C', 0, 'Vanya', NULL, 'Utkarsh', 'student4@gmail.com', 9876543218, 'parent4@gmail.com', 9879543213, '', 'West Bengal', 'Kolkata', '44J, Kolkata', 700034),
('STU05', '', 'D02', '2', 'B', 0, 'Aavishkar', NULL, 'Ghosh', 'student5@gmail.com', 9876543214, 'parent5@gmail.com', 9879543216, '', 'Maharashtra', 'Mumbai', '455P, Mumbai', 400009),
('STU06', '', 'D01', '2', NULL, 0, 'Kumar', NULL, 'Vishal', 'student6@gmail.com', 9876593214, 'parent6@gmail.com', 9899543216, '', 'Jharkhand', 'Ranchi', '345U, Ranchi', 830006),
('STU07', '', 'D02', '4', 'A', 0, 'Vartika', NULL, 'Vanya', 'student7@gmail.com', 9873593214, 'parent7@gmail.com', 9999543216, '', 'Karnataka', 'Bangalore', '343O, Bangalore', 560098),
('STU08', '', 'D03', '4', 'A', 0, 'Sneha', NULL, 'Singh', 'student8@gmail.com', 9873593914, 'parent8@gmail.com', 9999843216, '', 'Maharashtra', 'Pune', '23G, Pune', 410034),
('STU09', '', 'D04', '6', 'B', 0, 'Naman', NULL, 'Jain', 'student9@gmail.com', 9878593914, 'parent9@gmail.com', 9999893216, '', 'Delhi', 'New Delhi', '432F, Delhi', 110005),
('STU10', '', 'D04', '8', 'A', 0, 'Komal', NULL, 'Khetlani', 'student10@gmail.com', 9878590914, 'parent10@gmail.com', 9999899216, '', 'Tamil Nadu', 'Vellore', '345B, Vellore', 632002),
('STU11', '', 'D03', '6', 'A', 0, 'Rimjhim', NULL, 'Spandan', 'student11@gmail.com', 9878990914, 'parent11@gmail.com', 9999899816, '', 'Uttar Pradesh', 'Varanasi', '878A, Varanasi', 221002),
('STU12', '', 'D03', '8', 'B', 0, 'Shivangi', NULL, 'Misra', 'student12@gmail.com', 9878990919, 'parent12@gmail.com', 9999899819, '', 'Assam', 'Guwahati', '687R, Guwahati', 781001),
('STU13', '', 'D02', '4', 'A', 0, 'Apoorv', NULL, 'Dankar', 'student13@gmail.com', 9878998919, 'parent1@gmail.com', 9343423478, '', 'Bihar', 'Patna', 'Imlital Danapur Cant, Patna', 801503),
('STU14', '', 'D01', '4', NULL, 0, 'Akanksha', NULL, 'Shilpi', 'student14@gmail.com', 9870998919, 'parent14@gmail.com', 9343523478, '', 'Maharashtra', 'Mumbai', '455U, Mumbai', 400986),
('STU15', '', 'D01', '2', NULL, 0, 'Kavya', NULL, 'Gupta', 'student15@gmail.com', 9870998969, 'parent15@gmail.com', 9343593478, '', 'Delhi', 'Delhi', '789Y, Delhi', 110001),
('STU16', '', 'D05 ', '4', 'A', 0, 'Alok', NULL, 'Gupta', 'student16@gmail.com', 9345678901, 'parent16@gmail.com', 2345678902, 'India', 'Bihar', 'Patna', 'Mithapur', 800009);

-- --------------------------------------------------------

--
-- Table structure for table `student_attendance`
--

DROP TABLE IF EXISTS `student_attendance`;
CREATE TABLE IF NOT EXISTS `student_attendance` (
  `ClassroomID` varchar(50) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `Day` varchar(50) NOT NULL,
  `StaffID` varchar(50) NOT NULL,
  `StudentID` varchar(50) NOT NULL,
  `SubjectID` varchar(50) NOT NULL,
  `StudentAttendance` varchar(50) NOT NULL DEFAULT 'Present',
  KEY `student_attendance_classroomID_foreign_idx` (`ClassroomID`),
  KEY `student_attendance_staffID_foreign_idx` (`StaffID`),
  KEY `student_attendance_studentID_foreign_idx` (`StudentID`),
  KEY `student_attendance_subjectID_foreign_idx` (`SubjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student_attendance`
--

INSERT INTO `student_attendance` (`ClassroomID`, `Date`, `Time`, `Day`, `StaffID`, `StudentID`, `SubjectID`, `StudentAttendance`) VALUES
('AB4304', '2018-02-21', '08:00:00', 'Wednesday', 'ST002', 'STU01', 'EEE01', 'Present'),
('AB5407', '2018-02-21', '09:00:00', 'Wednesday', 'ST003', 'STU02', 'ECE01', 'Present'),
('AB5507', '2018-02-21', '09:00:00', 'Wednesday', 'ST005', 'STU11', 'ECE07', 'Present'),
('AB4408', '2018-02-22', '08:00:00', 'Thursday', 'ST001', 'STU06', 'MCA01', 'Present'),
('AB4408', '2018-02-22', '08:00:00', 'Thursday', 'ST001', 'STU15', 'MCA01', 'Present'),
('AB4408', '2018-02-22', '09:00:00', 'Thursday', 'ST004', 'STU03', 'MCA05', 'Present'),
('AB4408', '2018-02-22', '09:00:00', 'Thursday', 'ST004', 'STU14', 'MCA05', 'Present'),
('AB5407', '2018-02-23', '09:00:00', 'Friday', 'ST003', 'STU02', 'ECE01', 'Absent'),
('AB5507', '2018-02-23', '09:00:00', 'Friday', 'ST003', 'STU12', 'ECE01', 'Present');

-- --------------------------------------------------------

--
-- Table structure for table `student_subject`
--

DROP TABLE IF EXISTS `student_subject`;
CREATE TABLE IF NOT EXISTS `student_subject` (
  `StudentID` varchar(50) NOT NULL,
  `SubjectID` varchar(50) NOT NULL,
  KEY `student_subject_studentID_foreign_idx` (`StudentID`),
  KEY `student_subject_subjectID_foreign_idx` (`SubjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student_subject`
--

INSERT INTO `student_subject` (`StudentID`, `SubjectID`) VALUES
('STU06', 'MCA01'),
('STU15', 'MCA01'),
('STU03', 'MCA05'),
('STU14', 'MCA05'),
('STU05', 'EEE03'),
('STU07', 'EEE01'),
('STU07', 'EEE02'),
('STU13', 'EEE01'),
('STU13', 'EEE02'),
('STU08', 'ECE01'),
('STU11', 'ECE07'),
('STU04', 'CS08'),
('STU09', 'CS08');

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
CREATE TABLE IF NOT EXISTS `subject` (
  `SubjectID` varchar(50) NOT NULL,
  `SubjectName` varchar(100) NOT NULL,
  `DeptID` varchar(50) NOT NULL,
  `Credits` tinyint(1) UNSIGNED NOT NULL,
  `Type` varchar(50) NOT NULL DEFAULT 'Theory',
  PRIMARY KEY (`SubjectID`),
  UNIQUE KEY `SubjectID_UNIQUE` (`SubjectID`),
  UNIQUE KEY `SubjectName_UNIQUE` (`SubjectName`),
  KEY `subject_deptID_foreign_idx` (`DeptID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`SubjectID`, `SubjectName`, `DeptID`, `Credits`, `Type`) VALUES
('CS08', 'Database Management System', 'D04', 4, 'Theory'),
('ECE01', 'Analog Electronics', 'D03', 4, 'Theory'),
('ECE07', 'Digital Electronics Lab', 'D03', 1, 'Lab'),
('ECE29', 'Computer Networks', 'D03', 3, 'Theory'),
('EEE01', 'Power Electronics', 'D02', 4, 'Theory'),
('EEE02', 'Power Electronics Lab', 'D02', 1, 'Lab'),
('EEE03', 'Basic Electronics', 'D02', 4, 'Theory'),
('EEE12', 'Integrated Electronics Lab', 'D02', 1, 'Lab'),
('MCA01', 'DBMS', 'D01', 3, 'Theory'),
('MCA05', 'Android Development', 'D01', 3, 'Theory');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dept_section_semester_student`
--
ALTER TABLE `dept_section_semester_student`
  ADD CONSTRAINT `dsss_deptID_foreign` FOREIGN KEY (`DeptID`) REFERENCES `department` (`DeptID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_deptID_foreign` FOREIGN KEY (`DeptID`) REFERENCES `department` (`DeptID`);

--
-- Constraints for table `staff_attendance`
--
ALTER TABLE `staff_attendance`
  ADD CONSTRAINT `staff_attendance_staffID_foreign` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_deptID_foreign` FOREIGN KEY (`DeptID`) REFERENCES `department` (`DeptID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `student_attendance`
--
ALTER TABLE `student_attendance`
  ADD CONSTRAINT `student_attendance_classroomID_foreign` FOREIGN KEY (`ClassroomID`) REFERENCES `classroom` (`ClassroomID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `student_attendance_staffID_foreign` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `student_attendance_studentID_foreign` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `student_attendance_subjectID_foreign` FOREIGN KEY (`SubjectID`) REFERENCES `subject` (`SubjectID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `student_subject`
--
ALTER TABLE `student_subject`
  ADD CONSTRAINT `student_subject_studentID_foreign` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `student_subject_subjectID_foreign` FOREIGN KEY (`SubjectID`) REFERENCES `subject` (`SubjectID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `subject`
--
ALTER TABLE `subject`
  ADD CONSTRAINT `subject_deptID_foreign` FOREIGN KEY (`DeptID`) REFERENCES `department` (`DeptID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
