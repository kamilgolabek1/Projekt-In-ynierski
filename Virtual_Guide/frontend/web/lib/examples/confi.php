<?php
$con = mysqli_connect('127.0.0.1', 'podglad', 'sip123') or die('Could not connect the database : Username or password incorrect');
$sel = mysqli_select_db($con, 'sipdb2') or die ('No database found');
?>