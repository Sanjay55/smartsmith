<?php
  require('ins.php');
  $table="cess class";
  $field_values=array("Cess ID","cess Percentage","Description");
  $data_values=array(3,45.00,"good");
  print_r($data_values);
  Insertdata($table,$field_values,$data_values);
  
?>