<?php

  require('phpDBConnect.php');

  $stud_student_id = mysqli_real_escape_string($conn, $_REQUEST['studStudentID']);
  $stud_dept_id = mysqli_real_escape_string($conn, $_REQUEST['studDeptID']);
  $stud_sem_id = mysqli_real_escape_string($conn, $_REQUEST['studSemID']);
  $stud_sec_id = mysqli_real_escape_string($conn, $_REQUEST['studSecID']);
  $stud_f_name = mysqli_real_escape_string($conn, $_REQUEST['studFName']);
  $stud_m_name = mysqli_real_escape_string($conn, $_REQUEST['studMName']);
  $stud_l_name = mysqli_real_escape_string($conn, $_REQUEST['studLName']);
  $stud_email_id = mysqli_real_escape_string($conn, $_REQUEST['studEmailID']);
  $stud_phone_no = mysqli_real_escape_string($conn, $_REQUEST['studPhoneNumber']);
  $stud_parent_email_id = mysqli_real_escape_string($conn, $_REQUEST['studParentEmailID']);
  $stud_parent_phone_no = mysqli_real_escape_string($conn, $_REQUEST['studParentPhoneNumber']);
  $stud_country = mysqli_real_escape_string($conn, $_REQUEST['studCountry']);
  $stud_state = mysqli_real_escape_string($conn, $_REQUEST['studState']);
  $stud_city = mysqli_real_escape_string($conn, $_REQUEST['studCity']);
  $stud_address = mysqli_real_escape_string($conn, $_REQUEST['studAaddress']);
  $stud_pincode = mysqli_real_escape_string($conn, $_REQUEST['studPincode']);

  $sql = "INSERT INTO student (StudentID, DeptID, SemesterID, SectionID, StudentFname, StudentMname, StudentLname, StudentEmailID, StudentMobileNumber, ParentEmailID, ParentPhoneNumber, Country, State, City, AddressHome, Pincode)
  VALUES ('$stud_student_id', '$stud_dept_id', '$stud_sem_id', '$stud_sec_id', '$stud_f_name', '$stud_m_name', '$stud_l_name', '$stud_email_id', '$stud_phone_no', '$stud_parent_email_id', '$stud_parent_phone_no', '$stud_country', '$stud_state', '$stud_city', '$stud_address', '$stud_pincode')";

  if ($conn->query($sql) === TRUE) {
    echo "New record created successfully";
  } else {
    echo "Error: " . $sql . "<br>" . $conn->error;
  }

  $conn->close();
?>
