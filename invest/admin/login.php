<?php 
session_start();
if (isset($_SESSION["username"])) {
    header("location: user.php"); 
    exit();
}
error_reporting(0);
?>
<?php
if(isset($_GET['page']))
{
	$page= $_GET['page'];
}
elseif(!isset($_GET['page']))
{
	$page= 'user.php';
}

?>
<?php
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
	VALUES ('$loginId', '$pwd', '$names', '$phone', '$email')");
	$pid = mysqli_insert_id();
	$_SESSION["id"] = $pid ;
	$_SESSION["username"] = $loginId;
	$_SESSION["password"] = $pwd;
	header("location: ".$page."");
	exit();	
}
if (isset($_POST['login'])){
	
	$username = $_POST['username'];
	$password = $_POST['password'];
	$page = $_POST['page'];
	require 'db.php';
	$help ="";
	$sql_check_user = $db->query("SELECT * FROM users WHERE loginId = '$username' AND pwd = '$password' limit 1")or die ($db->error);
	$existCount= mysqli_num_rows($sql_check_user);
	if ($existCount == 1) { // evaluate the count
	     while($row = mysqli_fetch_array($sql_check_user)){ 
             $id = $row["id"];
             $account_type = $row["account_type"];
		 }
		
		 $_SESSION["id"] = $id;
		// echo $phone;
		$_SESSION["username"] = $username;
		$_SESSION["password"] = $password;
		if($account_type =='admin')
		{
			header("location: admin.php");
			exit();
		}
			elseif ($account_type =='user')
		{
			header("location: ".$page."");
		exit();
		}
    }else {$help.="try!";}
}
else{
	 $help="";
}

?>

<!doctype html>
<!--[if lte IE 9]> <html class="lte-ie9" lang="en"> <![endif]-->
<!--[if gt IE 9]><!--> <html lang="en"> <!--<![endif]-->
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Remove Tap Highlight on Windows Phone IE -->
    <meta name="msapplication-tap-highlight" content="no"/>

    <link rel="icon" type="image/png" href="assets/img/favicon-16x16.png" sizes="16x16">
    <link rel="icon" type="image/png" href="assets/img/favicon-32x32.png" sizes="32x32">

    <title>Admin</title>

    <link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500' rel='stylesheet' type='text/css'>

    <!-- uikit -->
    <link rel="stylesheet" href="bower_components/uikit/css/uikit.almost-flat.min.css"/>

    <!-- altair admin login page -->
    <link rel="stylesheet" href="assets/css/login_page.min.css" />

</head>
<body class="login_page">

    <div class="login_page_wrapper">
        <div class="md-card" id="login_card">
            <div class="md-card-content large-padding" id="login_form">
                <div class="login_heading">
                    <div class="user_avatar"></div>
                </div>
                <form method="post" action="login.php" class="form-group">
					<div class="uk-form-row">
                        <label for="username">Username</label>
                        <input class="md-input" type="text" id="username" name="username" />
                    </div>
                    <div class="uk-form-row">
                        <label for="password">Password</label>
						<input class="md-input" type="password" id="password" name="password" />
                    </div>
					<input type="text" name="page" value="<?php echo$page;?>" hidden class="form-control"/>
						
                    <div class="uk-margin-medium-top">
                        <input type="submit" class="md-btn md-btn-primary md-btn-block md-btn-large" name="login" value="SIGNIN"/>
                    </div><div class="uk-margin-top">
                        <a href="#" id="login_help_show" class="uk-float-right">Need help?</a>
                        <span class="icheck-inline">
                            <input type="checkbox" name="login_page_stay_signed" id="login_page_stay_signed" data-md-icheck />
                            <label for="login_page_stay_signed" class="inline-label">Stay signed in</label>
                        </span>
                    </div>
                </form>
            </div>
            <div class="md-card-content large-padding uk-position-relative" id="login_help" style="display: none">
                <button type="button" class="uk-position-top-right uk-close uk-margin-right uk-margin-top back_to_login"></button>
                <h2 class="heading_b uk-text-success">Can't log in?</h2>
                <p>Here’s the info to get you back in to your account as quickly as possible.</p>
                <p>First, try the easiest thing: if you remember your password but it isn’t working, make sure that Caps Lock is turned off, and that your username is spelled correctly, and then try again.</p>
                <p>If your password still isn’t working, it’s time to <a href="#" id="password_reset_show">reset your password</a>.</p>
            </div>
            <div class="md-card-content large-padding" id="login_password_reset" style="display: none">
                <button type="button" class="uk-position-top-right uk-close uk-margin-right uk-margin-top back_to_login"></button>
                <h2 class="heading_a uk-margin-large-bottom">Reset password</h2>
                <form>
                    <div class="uk-form-row">
                        <label for="login_email_reset">Your email address</label>
                        <input class="md-input" type="text" id="login_email_reset" name="login_email_reset" />
                    </div>
                    <div class="uk-margin-medium-top">
                        <a href="index.html" class="md-btn md-btn-primary md-btn-block">Reset password</a>
                    </div>
                </form>
            </div>
            <div class="md-card-content large-padding" id="register_form" style="display: none">
                <button type="button" class="uk-position-top-right uk-close uk-margin-right uk-margin-top back_to_login"></button>
                <h2 class="heading_a uk-margin-medium-bottom">Create an account</h2>
                <form method="post" action="login.php">
					<div class="uk-form-row">
                        <label for="loginId">FullName</label>
                        <input class="md-input" type="text" id="names" name="names" />
                    </div>
					<div class="uk-form-row">
                        <label for="loginId">Username</label>
                        <input class="md-input" type="text" id="loginId" name="loginId" />
                    </div>
                    <div class="uk-form-row">
                        <label for="register_password">Password</label>
                        <input class="md-input" type="password" id="pwd" name="pwd" />
                    </div>
                    <div class="uk-form-row">
                        <label for="email">E-mail</label>
                        <input class="md-input" type="text" id="email" name="email" />
                    </div>
					<div class="uk-form-row">
                        <label for="loginId">Phone</label>
                        <input class="md-input" type="text" id="phone" name="phone" />
                    </div>

                    <input type="hidden" name="page" value="<?php echo $page;?>"/>
                    <div class="uk-margin-medium-top">
                        <input type="submit" value="Signup" name="Signup" class="md-btn md-btn-success md-btn-block md-btn-large" />
                    </div>
                </form>
            </div>
        </div>
        <div class="uk-margin-top uk-text-center">
            <a href="#" id="signup_form_show">Create an account</a>
        </div>
    </div>

    <!-- common functions -->
    <script src="assets/js/common.min.js"></script>
    <!-- uikit functions -->
    <script src="assets/js/uikit_custom.min.js"></script>
    <!-- altair core functions -->
    <script src="assets/js/altair_admin_common.min.js"></script>

    <!-- altair login page functions -->
    <script src="assets/js/pages/login.min.js"></script>

    <script>
        // check for theme
        if (typeof(Storage) !== "undefined") {
            var root = document.getElementsByTagName( 'html' )[0],
                theme = localStorage.getItem("altair_theme");
            if(theme == 'app_theme_dark' || root.classList.contains('app_theme_dark')) {
                root.className += ' app_theme_dark';
            }
        }
    </script>

</body>
</html>


