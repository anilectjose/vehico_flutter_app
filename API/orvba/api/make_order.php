<?php 

include 'db2.php';

@$Wid = $_POST['workid'];
@$Roleid = $_POST['roleid'];

$query=mysqli_query($con,"INSERT INTO `order_db`(`customer_id`, `work_id`) VALUES ('$Roleid','$Wid')");
$result= array();

while ($rowData= $query->fetch_assoc()) {
	$result[]= $rowData;
}

echo json_encode($result);

?>