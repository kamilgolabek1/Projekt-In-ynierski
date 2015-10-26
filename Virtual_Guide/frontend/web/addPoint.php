<?php
require_once('confi.php');
// if data are received via POST, with index of 'test'
if (isset($_POST['name']) && isset($_POST['addr']) && isset($_POST['descr']) && isset($_POST['lon']) && isset($_POST['lat']) && isset($_POST['cat']) && isset($_POST['zoom'])) {
    $name = $_POST['name'];
    $addr = $_POST['addr'];
    $descr = $_POST['descr'];
    $lon = $_POST['lon'];
    $lat = $_POST['lat'];
    $cat = $_POST['cat'];
    $zoom = $_POST['zoom'];
	// get data
	
	$sql = "INSERT INTO location (name, descr, lon, lat, address, category, zoom) VALUES ( '".$name."', '".$descr."','".$lon."', '".$lat."', '".$addr."', '".$cat."', '".$zoom."' )";
	$result = mysqli_query($con, $sql);
	if ($result) {
		$id = mysqli_insert_id($con);
		$result2 = mysqli_query($con, "SELECT * FROM location WHERE ID='".$id."'");
		$jsonData = mysqli_fetch_assoc($result2);
		echo json_encode($jsonData);
	} else {
		echo $sql."\n";
		echo mysqli_error($con);
	}
	
}
	
mysqli_close($con);
?>