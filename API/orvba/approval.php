<?php
include 'db2.php';
$su_id=$_GET['s_id'];
$lu_id=$_GET['l_id'];

$result=mysqli_query($con,"UPDATE `work_db` SET `status`='$lu_id' where work_id='$su_id'");
header('location: workers_req.php');
?>
