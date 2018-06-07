<?php

 require('phpDBConnect.php');

  $classroom_id = mysqli_real_escape_string($conn, $_REQUEST['classroomID']);
  $class_cap = mysqli_real_escape_string($conn, $_REQUEST['classCap']);
  $class_build = mysqli_real_escape_string($conn, $_REQUEST['classBuild']);
  $class_lat = mysqli_real_escape_string($conn, $_REQUEST['classLatitude']);
  $class_long = mysqli_real_escape_string($conn, $_REQUEST['classLongitude']);
  $class_alt = mysqli_real_escape_string($conn, $_REQUEST['classAltitude']);

  $sql = "INSERT INTO classroom (ClassroomID, ClassroomCapacity, Building, Latitude, Longitude, Altitude)
  VALUES ('$classroom_id', '$class_cap', '$class_build', '$class_lat', '$class_long', '$class_alt')";

  if ($conn->query($sql) === TRUE) {
    echo "New record created successfully";
  } else {
    echo "Error: " . $sql . "<br>" . $conn->error;
  }

  $conn->close();
?>
