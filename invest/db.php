<?php  

$db = new mysqli("localhost", "clement", "clement123" , "commerce_db");
	
	if($db->connect_errno){
		die('Sorry we have some problem with the Database!');
	}             
?>