<?php  
	require 'connect.php';
	require 'CsvToArray.php';

	$data = csv_to_array('file.csv',true,',');
	$length=sizeof($data);
	echo $length;
	$sql_query="SELECT `attributes in csv`, `attributes in table`, `tablename` FROM `main table`";
	$run=mysqli_query($conn,$sql_query);
	$array=mysqli_fetch_assoc($run);
	echo '<pre>';
	print_r($array);
	echo '</pre>';
	$tableNames=explode(',',$array['tablename']);
	print_r($tableNames);
	foreach ($tableNames as $tname) {
		$checkArray=array();
		for ($i=0; $i <$length ; $i++) {
			$subarray=$data[$i];
			echo '<pre>';
			print_r($subarray);
			echo '</pre>';
			$attribute_csv=$array['attributes in csv'];
			echo($attribute_csv);
			$attribute_table=$array['attributes in table'];
			echo($attribute_table);
			$value=$subarray[$attribute_csv];
			echo($value);
			$query="SELECT `$attribute_table` FROM `$tname`";
			$run=mysqli_query($conn,$query);
			$counter=0;
			while($row=mysqli_fetch_array($run,MYSQLI_NUM)){
				print_r($row);
				$present=insertIntoArray($checkArray,$row[0]);
				if($present==false){
					$checkArray[$counter]=$row[0];
					$counter=$counter+1;
				}
			}
			echo "<pre>";
			print_r($checkArray);
			echo "</pre>";
			$present=checkArray($checkArray,$value);
			if($present==true){
				echo "<br>" ." we nedd to update";
			}
			else {
				echo "<br>" ." we nedd to insert";
			}
		}

	}
	//function to insert value in the check array
	function insertIntoArray ($checkArray,$value){
		$present=false;
		foreach ($checkArray as $key) {
			if($key==$value){
				$present=true;
			}
		}
		return $present;
	}

	//function to check whether the value is present in checkarray
	function checkArray($checkArray,$value){
		$present=false;
		foreach ($checkArray as $key) {
			if($key==$value){
				$present=true;
				break;
			}
		}
		return $present;
	}
?>