<?php 

include 'db2.php';
@$roleId = $_POST['typeid'];
$query=mysqli_query($con,"SELECT * FROM work_db WHERE work_type_id='$roleId'");

$result= array();

while ($rowData= $query->fetch_assoc()) {
	$result[]= $rowData;
}

echo json_encode($result);

?>