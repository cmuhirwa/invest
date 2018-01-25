<?PHP require('db.php');?>
<?php 
session_start(); 
$session_id = preg_replace('#[^0-9]#i', '', $_SESSION["id"]); // filter everything but numbers and letters
$username = preg_replace('#[^A-Za-z0-9]#i', '', $_SESSION["username"]); // filter everything but numbers and letters
$password = preg_replace('#[^A-Za-z0-9]#i', '', $_SESSION["password"]); // filter everything but numbers and letters
$sql = $db->query("SELECT * FROM users WHERE loginId='$username' AND pwd='$password' LIMIT 1"); // query the person
// ------- MAKE SURE PERSON EXISTS IN DATABASE ---------
$existCount = mysqli_num_rows($sql); // count the row nums
if ($existCount > 0) { 
	while($row = mysqli_fetch_array($sql)){ 
			 $thisid = $row["id"];
			 $names = $row["names"];
			 
	if(isset($_GET['next'])){
			if($_GET['next'] == 2){
foreach ($_SESSION["cart_array"] as $each_item) 
	{ 
		$item_id = $each_item['item_id'];
		$qtty = $each_item['quantity'];
		$sql = $db->query("INSERT INTO orders(itemCode, quantity, customerCode) 
		VALUES ('$item_id', '$qtty', '$session_id')");
		header('location: payment.php');
	}
	}
	}
			}
		} 
		else{
		echo "
		
		<br/><br/><br/><h3>Your account has been temporally deactivated</h3>
		<p>Please contact: <br/><em>(+25) 078 484-8236</em><br/><b>muhirwaclement@gmail.com</b></p>		
		Or<p><a href='../pages/logout.php'>Click Here to login again</a></p>
		
		";
	    exit();
	}
?>