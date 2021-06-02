<?php 

include 'db2.php';

@$id = $_POST['compid'];

$query=mysqli_query($con,"SELECT * FROM complaint_db WHERE complaint_id='$id'");
$result= array();

while ($rowData= $query->fetch_assoc()) {
	$result[]= $rowData;
}

echo json_encode($result);

?>