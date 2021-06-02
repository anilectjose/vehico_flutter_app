<?php 

include 'db2.php';

  @$mail = $_POST['mailid'];
  @$epassword = $_POST['password'];
  $sql=mysqli_query($con,"SELECT * FROM role_db WHERE mail='$mail' AND password='$epassword' AND role='customer'");

 
	
  if($sql->num_rows>0){
    		    
	while ($row = mysqli_fetch_assoc($sql)) {
		
		$json['value'] = 1;
		$json['message'] = 'User Successfully LoggedIn';
		$json['mail'] = $row['mail'];
		$json['id'] = $row['role_id'];
		$json['rol'] = $row['role'];
		$json['status'] = 'success';

	}
	
	
}else{

		$json['value'] = 0;
		$json['message'] = 'Failed to LogIn';
		$json['email'] = '';
		$json['id'] = '';
		$json['rol'] = '';
		$json['status'] = 'failure';

}
 		echo json_encode($json);
 		mysqli_close($con);



?>