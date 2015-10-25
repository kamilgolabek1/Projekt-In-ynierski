<?php
require_once('confi.php');
if (isset($_POST['pointId']) && isset($_POST['commId']))
	{

		$pointid = $_POST['pointId'];
		$commid = $_POST['commId'];
		if ($commid == 0) {
			$commid = 1000000;
		}

		$sql = "SELECT comment.id, comment.comment, comment.date, user.username
						FROM comment INNER JOIN user on comment.userID=user.id 
						WHERE locationId = '".$pointid."' AND comment.id < '".$commid."'
						ORDER BY date DESC
						LIMIT 5";
						
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