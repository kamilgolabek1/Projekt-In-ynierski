<?php
require_once('confi.php');
if (isset($_POST['pointId']) && isset($_POST['picId']))
	{

		$pointid = $_POST['pointId'];
		$picid = $_POST['picId'];
		if ($picid == 0) {
			$picid = 1000000;
		}

		$sql = "SELECT photo.id, filename, user.username
						FROM photo INNER JOIN user on photo.userID=user.id 
						WHERE locationId = '".$pointid."' AND photo.id < '".$picid."'
						ORDER BY photo.id DESC
						LIMIT 10";
						
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