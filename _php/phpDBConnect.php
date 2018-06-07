<?php
$servername = "localhost";
$username = "id4197718_aditidankar";
$password = "aditi";
$database = "id4197718_amas";

// Create connection
$conn = new mysqli($servername, $username, $password, $database);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

//close the connection
//mysql_close($dbhandle);
?>
