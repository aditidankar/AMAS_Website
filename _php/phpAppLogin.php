<?php
//f($_SERVER["REQUEST_METHOD"]=="POST"){

		require('phpDBConnect.php');
			$response = array();
			$userid=$_GET['userid'];
			$password=$_GET['password'];

			$query1="SELECT * FROM staff where staff.StaffID ='$userid' and staff.Password ='$password'";
			$query2="SELECT * from student where student.StudentID ='$userid' and student.Password ='$password'";

			$result1=$conn->query($query1);
			$result2=$conn->query($query2);

				$num_results1 = $result1->num_rows;
				$num_results2 = $result2->num_rows;

			if($num_results1>0)
			{
				//echo "Login Successful";
				while( $row = $result1->fetch_assoc())
				{
					extract($row);
					array_push($response,array("status"=>"successful", "userid"=>"{$StaffID}", "password"=>"{$Password}", "fname"=>"{$StaffFname}", "lname"=>"{$StaffLname}"));
				}
				
				//array_push($response,array("code" => "successful","password"=>"$password"));
			}
			elseif ($num_results2>0) {

				while( $row = $result2->fetch_assoc())
				{
					extract($row);
					array_push($response,array("status"=>"successful", "userid"=>"{$StudentID}", "password"=>"{$Password}", "fname"=>"{$StudentFname}", "lname"=>"{$StudentLname}"));
				}
			}
			else
			{
				//echo "Invalid User_id/Password";
				array_push($response,array("status"=>"error", "userid"=>"Nil", "password"=>"Invalid User_id/Password"));
			}
			echo json_encode($response);
			$conn->close();
//}

?>
