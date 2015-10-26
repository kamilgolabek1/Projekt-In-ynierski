<?php
require_once('confi.php');
// if data are received via POST, with index of 'test'
if (isset($_POST['id'])) {
    $id = $_POST['id'];             // get data
	
	$result = mysqli_query($con, "DELETE FROM stations WHERE id =".$id);
    echo $id;
} else {
	echo '0';
}
mysqli_close($con);
?> 
