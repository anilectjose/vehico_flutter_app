<?php 

include 'db2.php';

  @$role = $_POST['workid'];
  @$roleee = $_POST['rolE'];

 if ($roleee=='customer') {
 	$query=mysqli_query($con,"SELECT * FROM `worker_registration_db` inner join role_db ON role_db.role_id=worker_registration_db.role_id WHERE role_db.role_id='$role'");
  $result= array();
 }else{
  $query=mysqli_query($con,"SELECT * FROM `customer_registration_db` inner join role_db ON role_db.role_id=customer_registration_db.role_id WHERE role_db.role_id='$role'");
  $result= array();
}
  while ($rowData= $query->fetch_assoc()) {
	$result[]= $rowData;
  }

  echo json_encode($result);


?>