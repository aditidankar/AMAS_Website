<?php

  require('phpDBConnect.php');

  $dept_id = mysqli_real_escape_string($conn, $_REQUEST['deptID']);
  $dept_name = mysqli_real_escape_string($conn, $_REQUEST['deptName']);

  $sql = "INSERT INTO department (DeptID, DeptName)
  VALUES ('$dept_id', '$dept_name')";

  if ($conn->query($sql) === TRUE) {
    echo "New record created successfully";
  } else {
    echo "Error: " . $sql . "<br>" . $conn->error;
  }

  $conn->close();
?>
