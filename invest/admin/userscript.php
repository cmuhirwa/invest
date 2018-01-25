<?php // Destry session if it hasn't been used for 15 minute.
session_start();
	$inactive = 900;
    if(isset($_SESSION['timeout']) ) 
	{
		$session_life = time() - $_SESSION['timeout'];
		if($session_life > $inactive)
		{
		header("Location: ../logout.php"); 
		}
    }
    $_SESSION['timeout'] = time();
	if (!isset($_SESSION["username"])) 
	{
		header("location: ../login.php"); 
		exit();
	}
include "../db.php"; 
	
?>
<?php 
$session_id = preg_replace('#[^0-9]#i', '', $_SESSION["id"]); // filter everything but numbers and letters
$username = preg_replace('#[^A-Za-z0-9]#i', '', $_SESSION["username"]); // filter everything but numbers and letters
$password = preg_replace('#[^A-Za-z0-9]#i', '', $_SESSION["password"]); // filter everything but numbers and letters
include "../db.php"; 
$sql = $db->query("SELECT * FROM users WHERE loginId='$username' AND pwd='$password' LIMIT 1"); // query the person
// ------- MAKE SURE PERSON EXISTS IN DATABASE ---------
$existCount = mysqli_num_rows($sql); // count the row nums
if ($existCount > 0) { 
	while($row = mysqli_fetch_array($sql)){ 
			 $thisid = $row["id"];
			 $names = $row["names"];
			}
		} 
		else{
		echo "
		
		<br/><br/><br/><h3>Your account has been temporally deactivated</h3>
		<p>Please contact: <br/><em>(+25) 078 484-8236</em><br/><b>muhirwaclement@gmail.com</b></p>		
		Or<p><a href='../logout.php'>Click Here to login again</a></p>
		
		";
	    exit();
	}
	
	?>
<?php
// get the subcategory list
if(isset($_GET['catId']))
{
	$catId = $_GET['catId'];
	$catoption="";
	$sql = $db->query("SELECT * FROM `productsubcategory` WHERE CatCode = '$catId' ");
	while($row = mysqli_fetch_array($sql))
	{
		$catoption.='<option value="'.$row['subCatId'].'">'.$row['subCatName'].'</option>
		';
	}echo'<select onchange="get_prod()" id="subCatId">
	<option></option>
	'.$catoption.'
	</select>
	';
}
// get the product list
if(isset($_GET['subCatId']))
{
	$subCatId = $_GET['subCatId'];
	include ("../db.php");
	$catoption="";
	$sql = $db->query("SELECT * FROM `products` WHERE subCatCode = '$subCatId' ");
	while($row = mysqli_fetch_array($sql))
	{
		$catoption.='<option value="'.$row['productId'].'">'.$row['productName'].'</option>
		';
	}echo'<select onchange="new_post()" id="productId">
	<option></option>
	'.$catoption.'
	</select>
	';
}
// get the form to post a new post
if(isset($_GET['productId']))
{
	$productId = $_GET['productId'];
	include ("../db.php");
	$sql = $db->query("SELECT * FROM `products` WHERE productId = '$productId'");
	while($row = mysqli_fetch_array($sql))
	{
		$productName = $row['productName'];
		$productId = $row['productId'];
	$sqlseller = $db->query("SELECT * FROM company1 WHERE cumpanyUserCode = '$thisid'");
		while($row = mysqli_fetch_array($sqlseller)) 
			{
				$comanyId = $row['companyId'];
			
				echo'
				<form method="post" action="addItem.php" enctype="multipart/form-data">
					<div class="uk-grid uk-grid-divider uk-grid-medium" data-uk-grid-margin="">
                        <div class="uk-width-large-1-2 uk-row-first">
                            <div class="uk-form-row">
                                <div class="md-input-wrapper md-input-filled">
                                	<label for="itemName">Product Name</label>
                                	<input type="text" class="md-input" name="itemName">
                                	<span class="md-input-bar"></span>
                                </div>
                            </div>
                            <div class="uk-form-row">
                                <div class="md-input-wrapper md-input-filled">
                                	<label for="itemName">Abreviation</label>
                                	<input type="text" class="md-input" name="abrev">
                                	<span class="md-input-bar"></span>
                                </div>
                            </div>
                            <div class="uk-form-row">
                                <div class="md-input-wrapper md-input-filled">
                                	<label for="unityPrice">Price / Share</label>
                                	<input type="number" class="md-input" name="unitPrice">
                                	<span class="md-input-bar"></span>
                                </div>
                            </div>
						</div>
                        <div class="uk-width-large-1-2">
                            <div class="uk-form-row">
                                <label class="uk-form-label" for="fileField-selectized">Image</label>
                                	<div class="uk-form-file md-btn md-btn-primary" data-uk-tooltip="">
			                            Import image
			                            <input type="file" name="fileField" id="fileField"/> 
                                	</div>
                            </div>
                            <div class="uk-form-row">
                                <div class="md-input-wrapper md-input-filled">
                                	<label for="description">Description</label>
                                	<textarea name="description" class="md-input" cols="30" rows="4"></textarea>
                           		 </div>
                            </div>
                        </div>
                    </div>
						<input  type="text" name="productCode" value="'.$productId.'" hidden/>				
						<input  type="text" name="itemCompanyCode" value="'.$comanyId.'" hidden/><br/>			
						<input  type="text" name="username" value="'.$username.'" hidden/><br/>	
				<div class="md-fab-wrapper">
        <input type="submit" class="md-fab md-fab-primary" id="product_edit_submit" value="add" name="addpst"/>
				<i class="material-icons"></i>
        
    </div></form>';
			}
	}
}
// get the post title
if(isset($_GET['posttilte']))
{
	$productId = $_GET['posttilte'];
	include ("../db.php");
	$sql = $db->query("SELECT * FROM `products` WHERE productId = '$productId'");
	while($row = mysqli_fetch_array($sql))
	{
		echo 'POST IN ('.$row['productName'].')';
	
	}
}
// delete post
if(isset($_GET['removepostid'])){
	$removepostid = $_GET['removepostid'];
	include '../db.php';
	$sqlremove = $db->query("DELETE FROM `items1` WHERE `itemId` = '$removepostid'");
}
?>
        
<?php
// MODIFY ITEM
/*if(isset($_GET['modifyPostTitle']))
{
	$PostTitle = $_GET['modifyPostTitle'];
	$Price = $_GET['modifyPrice'];
	$Quantity = $_GET['modifyQuantity'];
	$ProductLocation = $_GET['modifyProductLocation'];
	$PostDesc = $_GET['modifyPostDesc'];
	$PriceStatus = $_GET['modifyPriceStatus'];
	$PostId = $_GET['modifyPostId'];
	
	$sql = $db->query("UPDATE `posts` SET postTitle='$PostTitle',
	quantity='$Quantity',price='$Price',priceStatus='$PriceStatus',
	postDesc='$PostDesc',productLocation='$ProductLocation' WHERE postId = '$PostId'")
	or die(mysqli_error());
	$sql2 = $db->query("SELECT * FROM posts WHERE postId = '$PostId'");
	while($row = mysqli_fetch_array($sql2))
	{
		$postTitle = $row['postTitle'];
		$quantity = $row['quantity'];
		$price = $row['price'];
		$priceStatus = $row['priceStatus'];
		$postDesc = $row['postDesc'];
		$postedDate = $row['postedDate'];
		$postedBy = $row['postedBy'];
		$productLocation = $row['productLocation'];
	}
	echo'<style> .notif{font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	color: #fe2c2c;}></style><div class="notif">Post modifiyed succesfully <a href="userPost.php?postId='.$PostId.'">Close</a></div><table>
			<tr>
				<td>Name: </td>
				<td><input id="postTitle" value="'.$postTitle.'">
				<input id="postId" value="'.$PostId.'" hidden></td>
			</tr>
			<tr>
				<td>Abreviation: </td>
				<td><input id="abrev" value="'.$postTitle.'"></td>
			</tr>
			<tr>
				<td>Price: </td>
				<td><input id="price" value="'.$price.'"> Rwf, 
				<select id="priceStatus">
					<option value="'.$priceStatus.'">'.$priceStatus.'</option>
					<option value="Negociable">Negociable</option>
					<option value="Fixed">Fixed</option>
				</select>
				</td>
			</tr>
			<tr>
				<td>Quantity: </td>
				<td><input id="quantity" value="'.$quantity.'"></td>
			</tr>
			<tr>
				<td>Owner: </td>
				<td><input id="postedBy" value="'.$postedBy.'" disabled></td>
			</tr>
			<tr>
				<td>Located: </td>
				<td><input id="productLocation" value="'.$productLocation.'"></td>
			</tr>
			<tr>
				<td>More Info: </td>
				<td><textarea id="postDesc">'.$postDesc.'</textarea></td>
			</tr>
			<tr>
				<td>Was here since: </td>
				<td><input id="postedDate" value="'.$postedDate.'" disabled></td>
			</tr>
		</table>
		';
	}

*/?>

<?php
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
}else{
	echo'please first <a href="login.php">sign</a> in or <a href="../register.php">register</a> to submit a comment.';
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
	echo'your reply has been successfully submited! <a href="userPost.php?postId='.$postCode.'">Click Here</a>
	<br/>
	<br/>
	';
}
?>


<?PHP // INJECTION OPERATIONS
// BRING INPUTS ON THE INJECT FORM
if(isset($_GET['itemIdtoGet']))
{
	$itemId = $_GET['itemIdtoGet'];
	$sql = $db->query("SELECT * FROM items WHERE itemId ='	$itemId'");
	$countout = mysqli_num_rows($sql);
	if($countout>0)
	{
	WHILE($row= mysqli_fetch_array($sql))
	{
		$unit = $row['unit'];
		$unityPrice = $row['unityPrice'];
	}
	echo'
<div class="col-sm-3">
	<div class="form-group"> 
		<label for="itemCode" class="control-label">Quantity:</label>
		<div class="input-group">
			<input required name="qty" id="qty" onkeyup="purchaseTotal()" class="form-control"/>
			<span class="input-group-addon">'.$unit.'</span>
		</div>
	</div>
</div>

<div class="col-sm-2">
	<div class="form-group"> 
		<label for="itemCode" class="control-label">Unit Price:</label>
		<input required name="unityPrice" id="unityPrice" onkeyup="purchaseTotal()" placeholder=" < '.$unityPrice.'" class="form-control"/>
	</div>
</div>

<div class="col-sm-2">
	<div class="form-group"> 
		<label for="itemCode" class="control-label">Total Price:</label>
		<div class="input-group" id="purchaseTotalPrice" >
			<input class="form-control"  disabled/>
			<span class="input-group-addon">RWF</span>
		</div>
	</div>
</div>

<div class="col-sm-2">
<br/>
	<div class="">
		<button class="btn btn-primary waves-effect waves-light" onclick="insertItem()">Add <i class="fa fa-plus"></i></button>
	</div>
	</div>';}else{}	
}
// REVERT A TRANSACTION ON THE INJECT
if(isset($_GET['removeTransaction']))
{
	$transactionID = $_GET['removeTransaction'];
	$sql = $db->query("DELETE FROM `transactions` WHERE transactionID='$transactionID'")or die(mysqli_error());
}
// INSERT AN ITEM
if(isset($_GET['operationNotes']))
{
	$purchaseOrder = $_GET['purchaseOrder'];
	$deliverlyNote = $_GET['deliverlyNote'];
	$docRefNumber = $_GET['docRefNumber'];
	$customerName = $_GET['customerName'];
	$customerRef = $_GET['customerRef'];
	$itemCode = $_GET['itemCode'];
	$qty = $_GET['qty'];
	$unityPrice = $_GET['unityPrice'];
	$operationNotes = $_GET['operationNotes'];
	$operation = 'In';
	$operationStatus = 1;
	
	$sql = $db->query("INSERT INTO `transactions`
	(`trUnityPrice`, `qty`, 
	`itemCode`, `operation`, `purchaseOrder`,
	`deliverlyNote`, `docRefNumber`, `customerName`, 
	`customerRef`, `operationNotes`, `operationStatus`, `doneOn`, doneBy) 
	VALUES 
	('$unityPrice','$qty',
	'$itemCode','$operation','$purchaseOrder',
	'$deliverlyNote','$docRefNumber','$customerName',
	'$customerRef','$operationNotes','$operationStatus', now(), '$username')
	")or die(mysqli_error());
	$sql2 = $db->query("SELECT `itemName` FROM `items1` WHERE `itemId` = '$itemCode' ");
	WHILE($row = mysqli_fetch_array($sql2))
	{
		echo'<div class="alert alert-success alert-dismissable">
                                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                            <a href="#" class="alert-link">'.$row['itemName'].'</a> was Succesfuly added on the list.
                                        </div>';
	}

}
// CHECK IF PURCHASE ORDER EXISTS
if(isset($_GET['purchaseOrder']))
{
	$purchaseOrder = $_GET['purchaseOrder'];
	$deliverlyNote = $_GET['deliverlyNote'];
	$sql = $db->query("
	SELECT 
	T.`transactionID`, T.`itemCode`,I.`itemName`,
	T.`qty`,I.`unit`,  T.`trUnityPrice`, 
	T.`qty` * T.`trUnityPrice` AS Total,`operation`
	FROM `transactions` T INNER JOIN `items1` I 
	ON T.`itemCode` = I.`itemId`

WHERE `purchaseOrder`='$purchaseOrder' AND `deliverlyNote` = '$deliverlyNote' AND `operation` = 'in'")or die(mysqli_error());
	$countout = mysqli_num_rows($sql);
	if($countout > 0)
	{
		$n=0;
		echo'<table class="table table-hover ">
			<thead>
				<tr>
					<th>#</th>
					<th>Item Name</th>
					<th>Quantity</th>
					<th>Unity Price</th>
					<th>Total Price</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>';
	WHILE($row= mysqli_fetch_array($sql))
		{
			$n++;
			
					$qty1 = number_format($row['qty']);
					$up1 = $row['trUnityPrice'];
					$totalprice = number_format($qty1 * $up1);
					echo'<tr>
							<td>'.$n.'</td>
							<td>'.$row['itemName'].'</td>
							<td>'.number_format($row['qty']).'</td>
							<td>'.number_format($row['trUnityPrice']).' Rwf</td>
							<td>'.number_format($row['Total']).' Rwf</td>
							<td class="actions">
							&nbsp;&nbsp;&nbsp;
							<a href="javascript:void()" onclick="removeOnPo(removeTransaction='.$row['transactionID'].')" class="danger"><i class="fa fa-trash-o text-danger"></i></a>
							</td>
						</tr>';						
		}
	}
}
?>

<?PHP // GENERAL REPORTS (DONE)
// ITEM REPORT
if(isset($_GET['itemInfoId']))
{
	$itemCode= $_GET['itemInfoId'];
	$sqliteminfo = $db->query("SELECT 
	T.`transactionID`,doneOn,`operation`, T.`itemCode`,I.`itemName`,T.purchaseOrder,
	ROUND(T.`qty`, 2) AS Quantity,I.`unit`,  ROUND(T.`trUnityPrice`) U_Price, 
	ROUND(T.`qty` * T.`trUnityPrice` , 2) AS T_Values,IFNULL(doneBy, 'Not Specified') as Done_by
	FROM `transactions` T INNER JOIN `items1` I 
	ON T.`itemCode` = I.`itemId`

	WHERE I.`itemId` = '$itemCode'

	ORDER BY T.`transactionID` ASC");
	$giveMeName = $db->query("SELECT * FROM `items1` WHERE `itemId` = '$itemCode'");
	while($row = mysqli_fetch_array($giveMeName))
	{
		echo'
		<h4 class="heading_c uk-margin-bottom">'.$row['itemName'].'</h4>
                    <div id="chartist_line_area" class="chartist"></div>
                    <div class="md-card">

                        <div class="md-card-content" >
                            
		';
	}
	$counthisto = mysqli_num_rows($sqliteminfo);
	if($counthisto > 0)
	{
		$n=0;
		echo'
			<table id="datatable-buttons"  class="table table-striped table-bordered">
				<thead>
					<tr>
						<th>#</th>
						<th>Done On</th>
						<th>Op</th>
						<th>Qty</th>
						<th>U Price</th>
						<th>Total Price</th>
						<th>By</th>
						<th>Ref</th>
					</tr>
				</thead>
				<tbody>
		';
		$operation="";
		WHILE($row= mysqli_fetch_array($sqliteminfo))
		{
			$n++;
			$convOperation = $row['operation'];
			if($convOperation == 'In')
			{
				$operation ='Purc';
			}
			elseif($convOperation == 'Out')
			{
				$operation ='Sale';
			}
			echo'
				<tr>
					<td>'.$n.'</td>
					<td>'.strftime("%d %b, %Y", strtotime($row['doneOn'])).'</td>
					<td>'.$operation.'</td>
					<td>'.number_format($row['Quantity']).'</td>
					<td>'.number_format($row['U_Price']).'</td>
					<td>'.number_format($row['T_Values']).'</td>
					<td>'.$row['Done_by'].'</td>
					<td>'.$row['purchaseOrder'].'</td>
				</tr>
			';													
		}
		echo'
					</tbody>
				</table>
    
                        </div>
                    </div>
						
			';
	}
	else
	{
		echo'
			no transaction on this item yet!	
								
			';
	}	
}

?>

