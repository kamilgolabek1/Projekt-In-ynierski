<?php
require_once('confi.php');
if (isset($_POST['tag']))
	{

		$tag = $_POST['tag'];

		$sql = "SELECT location.ID, location.name, location.descr, location.lon, location.lat, location.forumID, location.address, location.category, location.zoom
						FROM tag INNER JOIN location ON tag.locationID=location.ID 
						WHERE tag.name LIKE '%".$tag."%'
						GROUP BY location.ID";
		$result = mysqli_query($con, $sql);

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