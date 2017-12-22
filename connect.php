<?php  
	$server="localhost";
	$username="root";
	$password="";
	$dbname="smartsoft";

	$conn=mysqli_connect($server, $username, $password, $dbname);
	echo("Conected");
?>