<?php

include "db2.php";

@$name=$_POST['names'];
@$pass=$_POST['password'];
 @$email = $_POST['mailid'];
 @$mobile = $_POST['phonen'];
 @$Role = $_POST['roleee'];
if ($Role=='true') {
	$query="INSERT INTO role_db (mail,password,role) values ('$email','$pass','worker')";
    $result = mysqli_query($con,$query);
    $roleid =mysqli_insert_id($con);
    $result2 =mysqli_query($con, "INSERT INTO `worker_registration_db`(`worker_name`, `w_mobile`,`role_id`) VALUES ('$name','$mobile','$roleid')");
}else{
    $query="INSERT INTO role_db (mail,password,role) values ('$email','$pass','customer')";
    $result = mysqli_query($con,$query);
    $roleid =mysqli_insert_id($con);
    $result2 =mysqli_query($con, "INSERT INTO `customer_registration_db`(`customer_name`, `mobile`,`role_id`) VALUES ('$name','$mobile','$roleid')");
}
if($result2){
	echo "done";
}
else{
	echo "error";
}

?>	