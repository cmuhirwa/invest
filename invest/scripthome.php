<?PHP require('db.php');?>
<?php // Destry session if it hasn't been used for 15 minute.
session_start();
?>
<?php
// get the subcategory list
if(isset($_GET['subshowid']))
{
	$subshowid = $_GET['subshowid'];
	include ("db.php");
	$catoption="";
	$sql = $db->query("SELECT * FROM `posts` WHERE `productCode` is not null and `productCode` in
(select productId from products where subCatCode = '$subshowid')");
	$count = mysqli_num_rows($sql);
	$sql2 = $db->query("SELECT * FROM `productsubcategory` WHERE `subCatId` = '$subshowid'");
	while($row = mysqli_fetch_array($sql2)) 
	{
		$subCatName = $row['subCatName'];
		echo '<h3>we have '.$count.' '.$subCatName.'</h3>
		<table width="100%" cellpadding="5">';
	}
	if($count > 0)
	{
		while($row = mysqli_fetch_array($sql))
		{
			echo '<tr>
			<td width="30%">
				<a href="post.php?postId='.$row['postId'].'"><img src="products/'.$row['postId'].'.jpg" width="125"/></a>
			</td>
			<td>
				<a href="post.php?postId='.$row['postId'].'"><b>'.$row['postTitle'].'</b><br/>
				'.$row['price'].' Rwf</a><br/>'.$row['priceStatus'].'
			</td></tr>';
		}
	}
	else{
		echo '<tr>
			<td >
			 nothing to displey here!
			</td>
			</tr>
			';
	}
}
if(isset($_GET['comment']))
{
	$postCode = $_GET['postCode'];
	
if (isset($_SESSION["username"])) {
$username = preg_replace('#[^A-Za-z0-9]#i', '', $_SESSION["username"]);
	echo'<textarea id="commentNote" placeholder="your comment Plz!"></textarea>
	<input id="commentBy" value="'.$username.'" hidden/>
	<input id="postCode" value="'.$postCode.'" hidden/><br/>
	<select id="visibilityStatus">
		<option value=""></option>
		<option value="Private">Private</option>
		<option value="Public">Public</option>
		</select>
	<button onclick="saveComment()">Comment</button>'; 
}else{
	echo'please first <a href="admin/login.php?page=../post.php?postId='.$postCode.'">sign</a> in or <a href="admin/login.php?page=../post.php?postId='.$postCode.'">register</a> to submit a comment.';
}
	
}
if(isset($_GET['commentNote']))
{
	$commentNote = $_GET['commentNote'];
	$commentBy = $_GET['commentBy'];
	$postCode = $_GET['postCode'];
	$visibilityStatus = $_GET['visibilityStatus'];
	
	
	$sql = $db->query("INSERT INTO postscomments(commentNote, commentBy, visibilityStatus, postCode) 
	VALUES ('$commentNote', '$commentBy', '$visibilityStatus', '$postCode')
	")or (mysqli_error());
	echo'your comment has been successfully submited! <a href="post.php?postId='.$postCode.'">Click Here</a>
	<br/>
	<br/>
	';
}
// reply box
if(isset($_GET['commentId']))
{
	$commentId = $_GET['commentId'];
	$postCode = $_GET['postCode'];
	if (isset($_SESSION["username"])) {
$username = preg_replace('#[^A-Za-z0-9]#i', '', $_SESSION["username"]);
	echo'<br/><textarea id="replyNote" placeholder="your comment Plz!"></textarea>
	<input id="replyBy" value="'.$username.'" hidden/>
	<input id="postCode" value="'.$postCode.'" hidden/>
	<input id="commentCode" value="'.$commentId.'" hidden/><br/>
	<select id="visibilityStatus">
		<option value=""></option>
		<option value="Private">Private</option>
		<option value="Public">Public</option>
		</select>
	<button onclick="replyComment()">Comment</button>
	';
}
else{
	echo'please first <a href="login.php">sign</a> in or <a href="register.php">register</a> to submit a comment.';
}
}
if(isset($_GET['replyNotes']))
{
	$replyNotes = $_GET['replyNotes'];
	$replyBy = $_GET['replyBy'];
	$postCode = $_GET['postCode'];
	$commentCode = $_GET['commentCode'];
	$visibilityStatus = $_GET['visibilityStatus'];
	
	
	$sql = $db->query("INSERT INTO `commentreplies`(replyNotes, replyBy, visibilityStatus, commentCode) 
	VALUES ('$replyNotes', '$replyBy', '$visibilityStatus', '$commentCode')")or (mysqli_error());
	echo'your reply has been successfully submited! <a href="post.php?postId='.$postCode.'">Click Here</a>
	<br/>
	<br/>
	';
}
?>
