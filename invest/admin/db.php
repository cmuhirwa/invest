<?php  

$db = new mysqli("localhost", "root", "" , "commerce_db");
	
	if($db->connect_errno){
		die('Sorry we have some problem with the Database!');
	} 
$uplusdb = new mysqli("localhost", "root", "" , "uplus");
	
	if($uplusdb->connect_errno){
		die('Sorry we have some problem with the central Database!');
	}             
?>

