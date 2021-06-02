<?php

include "db2.php";

@$name=$_POST['names'];
@$pass=$_POST['password'];
 @$email = $_POST['mailid'];
 @$mobile = $_POST['phonen'];
 @$roleId = $_POST['RoleID'];
 @$Address = $_POST['address'];
 @$Role = $_POST['role'];

if ($Role=='worker') {
	$result1 =mysqli_query($con, "UPDATE `worker_registration_db` SET `worker_name`='$name',`w_mobile`='$mobile', WHERE `role_id`='$roleId'");
    $result2 =mysqli_query($con, "UPDATE `role_db` SET `mail`='$email',`password`='$pass' WHERE `role_id`='$roleId'");
}else{
	$result1 =mysqli_query($con, "UPDATE `customer_registration_db` SET `customer_name`='$name',`mobile`='$mobile', `address`='$Address' WHERE `role_id`='$roleId'");
    $result2 =mysqli_query($con, "UPDATE `role_db` SET `mail`='$email',`password`='$pass' WHERE `role_id`='$roleId'");
}



if($result2){
	echo "done";
}
else{
	echo "error";
}

?>	