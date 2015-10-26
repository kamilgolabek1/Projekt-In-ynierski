<?php
require_once('confi.php');
#if ($sel) {
#	echo 'Database Connected successfully<br/>';
#}

$result = mysqli_query($con, "SELECT * FROM location");
$jsonData = array();
while ($array = mysqli_fetch_assoc($result)) {
    $jsonData[] = $array;
}
echo json_encode($jsonData);
mysqli_close($con);
?>