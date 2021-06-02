<?php 

include 'db2.php';

@$id = $_POST['workid'];

$query=mysqli_query($con,"SELECT * FROM work_db join worker_registration_db on work_db.worker_id=worker_registration_db.worker_id WHERE work_db.work_id ='$id'");
$result= array();

while ($rowData= $query->fetch_assoc()) {
	$result[]= $rowData;
}

echo json_encode($result);

?>