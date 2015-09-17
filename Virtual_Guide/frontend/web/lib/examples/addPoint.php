<?php
require_once('confi.php');
// if data are received via POST, with index of 'test'
if (isset($_POST['title']) && isset($_POST['street']) && isset($_POST['city']) && isset($_POST['lon']) && isset($_POST['lat'])) {
    $title = $_POST['title'];
    $street = $_POST['street'];
    $city = $_POST['city'];
    $lon = $_POST['lon'];
    $lat = $_POST['lat'];
	// get data
	$sql = "INSERT INTO stations (lon, lat, title, street, city) VALUES ( '".$lon."', '".$lat."', '".$title."', '".$street."', '".$city."' )";
	$result = mysqli_query($con, $sql);
	if ($result) {
		$id = mysqli_insert_id($con);
		$result2 = mysqli_query($con, "SELECT * FROM stations WHERE id='".$id."'");
		$jsonData = mysqli_fetch_assoc($result2);
		echo json_encode($jsonData);
	} else {
		echo $sql;
	}
	
}
	
mysqli_close($con);
?>