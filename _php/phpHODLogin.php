<?php
//f($_SERVER["REQUEST_METHOD"]=="POST"){

		require('phpDBConnect.php');
			$response = array();
			$userid=$_GET['userid'];
			$password=$_GET['password'];

			
			$query1="SELECT * FROM staff where staff.StaffID ='$userid' and staff.Password ='$password' and HOD= 1";
			$result=$conn->query($query1);

			$num_result = $result->num_rows;
				

			if ($num_result>0) {

				while( $row = $result->fetch_assoc())
				{
					extract($row);
					array_push($response,array("status" => "successful", "userid"=>"{$StaffID}","password"=>"{$Password}"));
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
