<?php 

include 'db2.php';
@$roleId = $_POST['roleid'];
$query=mysqli_query($con,"SELECT * FROM complaint_db where user_id='$roleId'");
$result= array();

while ($rowData= $query->fetch_assoc()) {
	$result[]= $rowData;
}

echo json_encode($result);

?>