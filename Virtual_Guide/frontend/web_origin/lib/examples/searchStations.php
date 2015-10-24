<?php
require_once('confi.php');
if (isset($_POST['company']) && isset($_POST['street']) && isset($_POST['city'])) {

	$company = $_POST['company'];
	$street = $_POST['street'];
	$city = $_POST['city'];
	/*
	if (!empty($company)) {
	$part1 = "";
	} else {
	$part1 = " AND title LIKE '%".$company."%'";
	}

	if (!empty($street)) {
	$part2 = "";
	} else {
	$part1 = " AND street LIKE '%".$street."%'";
	}

	if (!empty($city)) {
	$part3 = "";
	} else {
	$part1 = " AND city LIKE '%".$city."%'";
	}
	 */
	$sql = "SELECT * FROM stations WHERE title LIKE '%".$company."%' AND city LIKE '%".$city."%' AND street LIKE '%".$street."%'";
	$result = mysqli_query($con, $sql);
	//$result = mysqli_query($con, "SELECT * FROM stations where title = '$company' AND  city = '$city' AND street = '$street'");
	//$result = mysqli_query($con, "SELECT * FROM stations where title = '$company'");
	if ($result) {
		$jsonData = array();
		while ($array = mysqli_fetch_assoc($result)) {
			$jsonData[] = $array;
		}
		echo json_encode($jsonData);
	} else {
		echo mysqli_error($con);
		echo $sql;
	}
}
mysqli_close($con);

?>