<?php
//require 'connect.php';

//$m = array("Account ID"=>"1","Holder Name"=>"sanjay") ;
//$n = array("Account ID"=>"1","Holder Name"=>"amit","ID"=>"4");
//$k = "company bank accounts";
/*
@param  array $csvData Associative array of data in CSV File which is to be updated
@param  array $tableData Associative array of data in table  which is going to be updated
@param  string $tableName Name of the table in which the updation will be done 
@param  string $commonKey common field between them whose values are same 
@param  string $commonValue the equal value between them
*/
//updateRow($n,$m,$k,"Account ID",1);
function updateRow($csvData,$tableData,$tableName,$commonKey,$commonValue){


	$server="localhost";
	$username="root";
	$password="";
	$dbname="smartsoft";
    //Create connection
	$conn=mysqli_connect($server, $username, $password, $dbname);
	//Check Connection
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
    		 $sql = "UPDATE `$tableName` SET `$tableKey`= '$updatedValue' WHERE `$commonKey` = '$commonValue'";
    		 
    		 //echo "<br>" .$sql;
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