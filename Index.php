<?php
	require 'CsvToArray.php';
	$data = csv_to_array('file.csv',true,',');
	echo '<pre>';
	print_r($data);
	echo '</pre>';
?>