<?php
//require 'connect.php';

$m = array("Cess ID"=>"3","Description"=>"product") ;
$n = array("Cess ID"=>"3","Description"=>"awesome");
$k = "cess class";
updateRow($n,$m,$k,"Cess ID",3);
function updateRow($csvData,$tableData,$tableName,$commonKey,$commonValue){


	$server="localhost";
	$username="root";
	$password="";
	$dbname="smartsoft";

	$conn=mysqli_connect($server, $username, $password, $dbname);
	if(!$conn)
     die ("Connection failed:" .mysqli_connect_error());
    else
     echo("Connected <br>");
	//echo "$tableName <br>";
    foreach($csvData as $key=>$updatedValue){
    	//echo " <br> $key $updatedValue <br>" ;
    	foreach($tableData as $tableKey=>$value){
    		//echo " <br> $tableKey $value <br>";
    		if($tableKey != $commonKey && $tableKey == $key){
    		 $sql = "UPDATE `$tableName` SET `$tableKey`= '$updatedValue' WHERE '$commonKey' = '$commonValue'";
    		 
    		 echo "<br>" .$sql;
    		 $run = mysqli_query($conn,$sql);
    	if(!$run)
    		echo "Updation Error <br>";
    	else
    		echo "Updated <br>";
    		}
    	}

    	
    	
    	   	    	
    }

}
?>