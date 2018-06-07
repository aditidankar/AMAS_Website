<?php

  require('phpDBConnect.php');

  $sub_id = mysqli_real_escape_string($conn, $_REQUEST['subID']);
  $sub_name = mysqli_real_escape_string($conn, $_REQUEST['subName']);
  $sub_dept_id = mysqli_real_escape_string($conn, $_REQUEST['subDeptID']);
  $sub_credits = mysqli_real_escape_string($conn, $_REQUEST['subCredits']);
  $sub_type = mysqli_real_escape_string($conn, $_REQUEST['subType']);

  $sql = "INSERT INTO subject (SubjectID, SubjectName, DeptID, Credits, Type)
  VALUES ('$sub_id', '$sub_name', '$sub_dept_id', '$sub_credits', '$sub_type')";

  if ($conn->query($sql) === TRUE) {
    echo "New record created successfully";
  } else {
    echo "Error: " . $sql . "<br>" . $conn->error;
  }
  $conn->close();
?>
