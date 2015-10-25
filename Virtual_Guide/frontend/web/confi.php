<?php
$con = mysqli_connect('127.0.0.1', 'root', 'pass') or die('Could not connect the database : Username or password incorrect');
$sel = mysqli_select_db($con, 'virtualguide') or die ('No database found');
?>