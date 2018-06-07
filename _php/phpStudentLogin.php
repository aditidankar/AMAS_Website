<?php
//f($_SERVER["REQUEST_METHOD"]=="POST"){

		require('phpDBConnect.php');
			$response = array();
			$userid=$_GET['userid'];
			$password=$_GET['password'];

			
			$query="SELECT * from student where student.StudentID ='$userid' and student.Password ='$password'";

			$result=$conn->query($query);

			$num_result = $result->num_rows;
				

			if ($num_result>0) {

				while( $row = $result->fetch_assoc())
				{
					extract($row);
					array_push($response,array("status" => "successful","userid"=>"{$StudentID}","password"=>"{$Password}"));
				}
			}
			else
			{
				//echo "Invalid User_id/Password";
				array_push($response,array("status" => "error", "userid"=>"Nil","password"=>"Invalid User_id/Password"));
			}
			echo json_encode($response);
			$conn->close();
//}

?>
