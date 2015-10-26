<?php
$con = mysqli_connect('127.0.0.1', 'vguideuser', 'vguide123') or die('Could not connect the database : Username or password incorrect');
$sel = mysqli_select_db($con, 'vguidedb') or die ('No database found');
?>