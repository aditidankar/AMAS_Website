<?php

  require('phpDBConnect.php');

  $staff_id = mysqli_real_escape_string($conn, $_REQUEST['staffID']);
  $staff_dept_id = mysqli_real_escape_string($conn, $_REQUEST['staffDeptID']);
  $staff_desig = mysqli_real_escape_string($conn, $_REQUEST['staffDesignation']);
  $staff_HOD_check = mysqli_real_escape_string($conn, $_REQUEST['staffHODcheck']);
  $staff_f_name = mysqli_real_escape_string($conn, $_REQUEST['staffFName']);
  $staff_m_name = mysqli_real_escape_string($conn, $_REQUEST['staffMName']);
  $staff_l_name = mysqli_real_escape_string($conn, $_REQUEST['staffLName']);
  $staff_email_id = mysqli_real_escape_string($conn, $_REQUEST['staffEmailID']);
  $staff_phone_no = mysqli_real_escape_string($conn, $_REQUEST['staffPhoneNumber']);
  $staff_country = mysqli_real_escape_string($conn, $_REQUEST['staffCountry']);
  $staff_state = mysqli_real_escape_string($conn, $_REQUEST['staffState']);
  $staff_city = mysqli_real_escape_string($conn, $_REQUEST['staffCity']);
  $staff_address = mysqli_real_escape_string($conn, $_REQUEST['staffAddress']);
  $staff_pincode = mysqli_real_escape_string($conn, $_REQUEST['staffPincode']);

  $sql = "INSERT INTO staff (StaffID, DeptID, Designation, HOD, StaffFname, StaffMname, StaffLname, StaffEmailID, StaffPhoneNumber, Country, State, City, AddressHome, Pincode)
  VALUES ('$staff_id', '$staff_dept_id', '$staff_desig', '$staff_HOD_check', '$staff_f_name', '$staff_m_name', '$staff_l_name', '$staff_email_id', '$staff_phone_no', '$staff_country', '$staff_state', '$staff_city', '$staff_address', '$staff_pincode')";

  if ($conn->query($sql) === TRUE) {
    echo "New record created successfully";
  } else {
    echo "Error: " . $sql . "<br>" . $conn->error;
  }

  $conn->close();
?>