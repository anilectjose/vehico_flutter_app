<?php

include "db2.php";

@$name=$_POST['names'];
@$subj=$_POST['subject'];
@$compl = $_POST['complaint'];
@$RoleiD = $_POST['roleid'];


$result = mysqli_query($con,"INSERT INTO complaint_db (name,subject,complaint,user_id) values ('$name','$subj','$compl','$RoleiD')");

if($result){
	echo "done";
}
else{
	echo "error";
}

?>	