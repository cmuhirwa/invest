<?php 
session_start();
if (isset($_SESSION["username"])) {
    header("location: admin/user.php"); 
    exit();
}
//error_reporting(0);
?>
<?php
if (isset($_GET['page']))
{
	$page = $_GET['page'];
}else{
	$page = 'admin/user.php';
}
if (isset($_POST['Signup']))
{
	$page = $_POST['page'];
	$loginId = $_POST['loginId'];
	$pwd = $_POST['pwd'];
	$names = $_POST['names'];
	$phone = $_POST['phone'];
	$email = $_POST['email'];
	require 'db.php';
	$sql = $db->query("INSERT INTO users (`loginId`, `pwd`, `names`, `phone`, `email`) 
	VALUES ('$loginId', '$pwd', '$names', '$phone', '$email')")or mysqli_error();
	$pid = mysqli_insert_id();
	$_SESSION["id"] = $pid ;
	$_SESSION["username"] = $loginId;
	$_SESSION["password"] = $pwd;
	header("location: ".$page."");
	exit();	
}
?>

<!DOCTYPE html>
<html class="no-js css-menubar" lang="en">
<head>
 
</head>
<body >
<form method="post" action="register.php" class="form-group">
				FullName:<br/>
				<input type="text" name="names" /><br/>
				<input type="text" name="page" value="<?php echo $page;?>" hidden/>
				Username:<br/>
				<input type="text" name="loginId" /><br/>
				Password:<br/>
				<input type="text" name="pwd" /><br/>
				Phone:<br/>
				<input type="text" name="phone" /><br/>
				Email:<br/>
				<input type="text" name="email" /><br/>
				<input type="submit" value="Signup" name="Signup"/>
				Or <a href="login.php">Login</a>
			</form>
</body>
</html>