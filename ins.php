<?php
  $con=mysqli_connect('localhost','root','','amazon');

  function Insertdata($table,$field,$data)
  {
global $con;
        /*$field_values= implode(",",($field));
		echo $field_values;
		$data_values= implode(" , ",($data));
		echo $data_values;*/
    //$field_values = $field ;
   //$data_values = $data;
    //$sql="INSERT into". " ".$table." ".$field_values. "VALUES(".implode(",",($data_values)).")";
    $sql = ("INSERT INTO `$table` (`".implode("` , `",($field))."`) "
				  . "VALUES ('".implode("' , '",($data))."')");
	echo "<br>".$sql;
		   
    $result=mysqli_query($con,$sql);
	if($result)
		{
    echo "inserted sucessfully!!";
  }
  else
  {
    echo "not inseterd";
  }
 }
  
?>