<?php 	 
	require 'CsvToArray.php';
	require 'connect.php';
	$data = csv_to_array('file.csv',true,',');
	$length=sizeof($data);

	$sql = "SELECT * FROM `maintable`";
$result = mysqli_query($conn, $sql);

$row = mysqli_fetch_assoc($result);
   print_r($row);


   $attribute_in_csv=$row['Attribute in Csv'];
   $attribute=$row['Attributes'];
   $table=$row['TableInfo'];
   echo $table;
   $array=explode(",", $table);
   print_r($array);

   $len=sizeof($array);
   for($i=0;$i<$len;$i++){
   	$tableName=$array[$i];
   	$value="";
   	
   		$value=$array['$attribute_in_csv'];
   		$insert_Sql="INSERT INTO `$tableName` ('$attribute') VALUES ('$value')";
    	mysqli_query($conn,$insert_Sql);
   	

   }

?>