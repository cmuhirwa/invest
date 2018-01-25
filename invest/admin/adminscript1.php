<?PHP
include ("../db.php");
?>

<?php
//LOAD CATEGORY TO EDIT
if(isset($_GET['catID']))
{
	$catID = $_GET['catID'];
	$sql = $db->query("SELECT * FROM `productcategory` WHERE catId = '$catID' ");
	while($row = mysqli_fetch_array($sql))
	{
		echo'
			Category Name<br/>
			<input type="text" name="cat_name" value="'.$row['catNane'].'"><br/>
			<input type="text" name="cat_id" value="'.$row['catId'].'" hidden/>
			Category Description<br/>
			<textarea name="cat_desc">'.$row['catDesc'].'</textarea><br/>
			<input type="submit" value="Edit" name="edit"><br/>
		';
	}
}

//SHOW SUBCATEGORIES FROM CATEGORY
elseif(isset($_GET['showCatId']))
{
	$showCatId = $_GET['showCatId'];
	include ("../db.php");
	$n=0;
	$result="";
	$sql = $db->query("SELECT * FROM `productsubcategory` WHERE CatCode = '$showCatId' ");
	while($row = mysqli_fetch_array($sql))
	{
		$n++;
		$result.='
			<tr href="javascript:void()" onclick ="subcatfill(subcatfillID = '.$row['subCatId'].'); product(subCatId= '.$row['subCatId'].')">
				<td>'.$n.'</td>
				<td>'.$row['subCatName'].'</td>
				<td><a href="javascript:void" onclick="removeSubCat(subCatId='.$row['subCatId'].')">Remove</a></td>
			</tr>
		';
	}
	echo'	<form method="post" action="admin.php">
							<div id="subcat">Subcategory Name<br/>
							<input type="text" name="subCatName"><br/>
							<input type="text" name="CatCode" value="'.$showCatId.'" hidden>
							Subcategory Description<br/>
							<textarea name="subCatDesc"></textarea><br/>
							<input type="submit" value="Add" name="adds"><br/></div>
						</form>	
						<div id="SucatTable">
						<table border="1" width="100%">
							<thead style="background-color:#cccccc;">
								<td>N/S</td>
								<td>Name</td>
								<td>Actions</td>
							</thead>
							<tbody>
							
								
								'.$result.'
							
							</tbody>
						</table>
						</div>
					';
}

//LOAD SUBCATEGORY TO EDIT
if(isset($_GET['subcatfillID']))
{
	$subcatfillID = $_GET['subcatfillID'];
	include ("../db.php");
	$sql = $db->query("SELECT * FROM `productsubcategory` WHERE subCatId = '$subcatfillID' ");
	while($row = mysqli_fetch_array($sql))
	{
		echo'
			SubCategory Name<br/>
			<input type="text" name="subCatName" value="'.$row['subCatName'].'"><br/>
			<input type="text" name="subCatId" value="'.$row['subCatId'].'" hidden/>
			SubCategory Description<br/>
			<textarea name="subCatDesc">'.$row['subCatDesc'].'</textarea><br/>
			<input type="submit" value="Edit" name="edits"><br/>
		';
	}
}

//SHOW PRODUCTS FROM SCATEGORY
elseif(isset($_GET['subCatId']))
{
	$subCatId = $_GET['subCatId'];
	include ("../db.php");
	$n=0;
	$result="";
	$sql = $db->query("SELECT * FROM products WHERE subCatCode = '$subCatId' ");
	while($row = mysqli_fetch_array($sql))
	{
		$n++;
		$result.='
			<tr href="javascript:void()" onclick ="productEdit(productEditID= '.$row['productId'].')">
				<td>'.$n.'</td>
				<td>'.$row['productName'].'</td>
				<td><a href="javascript:void()" onclick="removeProduct(productId='.$row['productId'].')">Remove</a></td>
			</tr>
		';
	}
	echo'	<form method="post" action="admin.php">
							<div id="productEdit">Product Name<br/>
							<input type="text" name="productName"><br/>
							<input type="text" name="subCatCode" value="'.$subCatId.'"  hidden/>
							Product Description<br/>
							<textarea name="productDesc"></textarea><br/>
							<input type="submit" value="Add" name="addp"><br/></div>
						</form>	
						<div id="productTable">
						<table border="1" width="100%">
							<thead style="background-color:#cccccc;">
								<td>N/S</td>
								<td>Name</td>
								<td>Actions</td>
							</thead>
							<tbody>
							
								
								'.$result.'
							
							</tbody>
						</table>
						</div>
					';
}

//LOAD PRODUCT TO EDIT
if(isset($_GET['productEditID']))
{
	$productEditID = $_GET['productEditID'];
	include ("../db.php");
	$sql = $db->query("SELECT * FROM `products` WHERE productId = '$productEditID' ");
	while($row = mysqli_fetch_array($sql))
	{
		echo'
			Product Name<br/>
			<input type="text" name="productName" value="'.$row['productName'].'"><br/>
			<input type="text" name="productId" value="'.$productEditID.'" hidden/>
			Product Description<br/>
			<textarea name="productDesc">'.$row['productDesc'].'</textarea><br/>
			<input type="submit" value="Edit" name="editp"><br/>
		';
	}
}

	// REMOVE CATEGORY
if(isset($_GET['removeCatId']))
{
	$removeCatId = $_GET['removeCatId'];
	
	$sql1 = $db->query("SELECT * FROM productsubcategory WHERE CatCode='$removeCatId' ");
	$sqlcount = mysqli_num_rows($sql1);
	if(!$sqlcount > 0)
	{
	$sql = $db->query("DELETE FROM `productcategory` WHERE catId='$removeCatId' ");
	echo'Category Removed succesfully!';
	}else{
		echo'Please first remove the subcategories depanding on this category.';
	}
	echo'
	<table border="1" width="100%">
		<thead style="background-color:#cccccc;">
			<td>N/S</td>
			<td>Name</td>
			<td>Actions</td>
		</thead>
		<tbody>';
		
		$n=0;
		$sql1 = $db->query("SELECT * FROM `productcategory`");
		$count = mysqli_num_rows($sql1);
		if($count > 0)
		{
			while($row = mysqli_fetch_array($sql1))
			{
				$n++;
				echo'<tr href="javascript:void()" onclick ="cat(catID= '.$row['catId'].'); showsub(showCatId= '.$row['catId'].')">
				<td>'.$n.'</td>
				<td>'.$row['catNane'].'</td>
				<td><a href="javascript:void" onclick="removeCat(catId='.$row['catId'].')">Remove</a></td>
				</tr>';
			}
		}
		else
		{
			echo'Please add a category';
		}
		
	echo '
		</tbody>
	</table>';
}


// REMOVE SUBCATEGORY
if(isset($_GET['removeSubCatId']))
{
	$removeSubCatId = $_GET['removeSubCatId'];
	$sqlCatCode = $db->query("SELECT CatCode FROM `productsubcategory` WHERE subCatId='$removeSubCatId'");
	while($row = mysqli_fetch_array($sqlCatCode))
	{
		$categoryIdToUse = $row['CatCode'];
	}
	$sql2 = $db->query("SELECT * FROM products WHERE subCatCode='$removeSubCatId' ");
	$sqlcountcheck = mysqli_num_rows($sql2);
	if(!$sqlcountcheck > 0)
	{
		$sql = $db->query("DELETE FROM `productsubcategory` WHERE subCatId='$removeSubCatId' ");
		echo "SubCategory Removed Successfuly";
	}
else
	{
	echo "first remove products which dipandes on this SubCategory";
	}
echo'
		<table border="1" width="100%">
			<thead style="background-color:#cccccc;">
				<td>N/S</td>
				<td>Name</td>
				<td>Actions</td>
			</thead>
			<tbody>
	';
	$n=0;
	
	$sql1 = $db->query("SELECT * FROM `productsubcategory` WHERE CatCode='$categoryIdToUse'");
	$count = mysqli_num_rows($sql1);
	if($count > 0)
	{
		while($row = mysqli_fetch_array($sql1))
		{
			$n++;
			echo'<tr href="javascript:void()" onclick ="subcatfill(subcatfillID = '.$row['subCatId'].'); product(subCatId= '.$row['subCatId'].')">
			<td>'.$n.'</td>
			<td>'.$row['subCatName'].'</td>
			<td><a href="javascript:void" onclick="removeSubCat(subCatId='.$row['subCatId'].')">Remove</a></td>
		</tr>';
		}
	}
	else
	{
		echo'Please add a category';
	}
		
	echo '
		</tbody>
	</table>
	';
}

// REMOVE PRODUCT
if(isset($_GET['removeProductId']))
{
	$removeProductId = $_GET['removeProductId'];
	$sqlCatCode = $db->query("SELECT subCatCode FROM products WHERE productId='$removeProductId'");
	while($row = mysqli_fetch_array($sqlCatCode))
	{
		$subCategoryIdToUse = $row['subCatCode'];
	}
	
		$sql = $db->query("DELETE FROM products WHERE productId='$removeProductId'");
		echo'	Category Removed Successfuly
				<table border="1" width="100%">
					<thead style="background-color:#cccccc;">
						<td>N/S</td>
						<td>Name</td>
						<td>Actions</td>
					</thead>
					<tbody>
			';
	$n=0;
	
	$sql1 = $db->query("SELECT * FROM `products` WHERE subCatCode='$subCategoryIdToUse'");
	$count = mysqli_num_rows($sql1);
	if($count > 0)
	{
		while($row = mysqli_fetch_array($sql1))
		{
			$n++;
			echo'<tr href="javascript:void()" onclick ="productEdit(productEditID= '.$row['productId'].')">
				<td>'.$n.'</td>
				<td>'.$row['productName'].'</td>
				<td><a href="javascript:void()" onclick="removeProduct(productId='.$row['productId'].')">Remove</a></td>
			</tr>';
		}
	}
	else
	{
		echo'Please add a category';
	}
		
	echo '
		</tbody>
	</table>
	';
}
?>

<?php // USER OPERATIONS
// 1 ADD NEW USER
if(isset($_GET['username']))
{
	$name = $_GET['name'];
	$Phone = $_GET['Phone'];
	$Email = $_GET['Email'];
	$account_type = $_GET['account_type'];
	$username = $_GET['username'];
	$password = $_GET['password'];
	include ("../db.php");
	$sql = $db->query("
	INSERT INTO `users`(`loginId`, `pwd`, `names`, `phone`, `email`, `account_type`) 
	VALUES ('$username', '$password', '$name', '$Phone', '$Email', '$account_type')
	")or die (mysqli_error());
	echo'<script>(function(){ bringTable();})();	</script>';
}
// 2 INITIATE USER TO EDIT
if(isset($_GET['editUser']))
{
	$id = $_GET['editUser'];
	$sql1 = $db->query("SELECT * FROM `users` WHERE id='$id' LIMIT 1");
	while($row = mysqli_fetch_array($sql1))
	{
		echo'
			<h3>Edit '.$row['names'].'</h3>
			Name<br/>
	<input type="text" name="Ename" id="Ename" value="'.$row['names'].'">
	<input type="text" hidden name="Eid" id="Eid" value="'.$row['id'].'">
	<br/>
			Phone<br/>
			<input type="text" name="EPhone" id="EPhone" value="'.$row['phone'].'"><br/>
			Email<br/>
			<input type="text" name="EEmail" id="EEmail" value="'.$row['names'].'"><br/>
			account_type<br/>
			<select type="text" name="Eaccount_type" id="Eaccount_type" >
				<option value="'.$row['account_type'].'">'.$row['account_type'].'</option>
				<option value="user">Buyer</option>
				<option value="user">Seler</option>
				<option>Agent</option>
				<option>Buyer & Seler</option>
				<option>Buyer & Agent</option>
				<option>Buyer & Seler & Agent</option>
				<option>Seler & Agent</option>
			</select><br/>
			Username<br/>
			<input type="text" name="Eusername" id="Eusername" value="'.$row['loginId'].'"><br/>
			Password<br/>
			<input type="text" name="Epassword" id="Epassword" value="'.$row['pwd'].'"><br/>
			<button onclick="updateUser()">Update</button>
			
		';
	}
}
// 3 UPDATE USER
if(isset($_GET['Eusername']))
{
	$id = $_GET['Eid'];
	$name = $_GET['Ename'];
	$Phone = $_GET['EPhone'];
	$Email = $_GET['EEmail'];
	$WorkPlace = $_GET['EWorkPlace'];
	$account_type = $_GET['Eaccount_type'];
	$username = $_GET['Eusername'];
	$password = $_GET['Epassword'];
	
	include ("../db.php");
	$sql = $db->query("UPDATE users SET loginId= '$username', pwd= '$password', names= '$name', phone= '$Phone', email = '$Email', 
	workPlace = '$WorkPlace', account_type= '$account_type' WHERE id='$id'")or die (mysqli_error());
	
	echo'<script>(function(){ bringTable();})();	</script>';
}
// 4 BRING TABLE
if(isset($_GET['bringTable']))
{
echo'<table border="1" width="100%">
		<thead style="background-color:#cccccc;">
			<th>#</th>
			<th>names</th>
			<th>phone</th>
			<th>email</th>
			<th>workPlace</th>
			<th>Type</th>
			<th>Actions</th>
		</thead>
		<tbody>';
		$n=0;
		$sql2 = $db->query("SELECT * FROM `users`");
		$count = mysqli_num_rows($sql2);
		if($count > 0)
		{
			while($row = mysqli_fetch_array($sql2))
			{
				$n++;
				echo'
				<tr href="javascript:void()" onclick ="editUser(userId= '.$row['id'].'>
					<td>'.$n.'</td>
					<td>'.$row['names'].'</td>
					<td>'.$row['phone'].'</td>
					<td>'.$row['email'].'</td>
					<td>'.$row['workPlace'].'</td>
					<td>'.$row['account_type'].'</td>
					<td><a href="javascript:void()">Edit</a> <a href="javascript:void()">Remove</a></td>
				</tr>';
			}
												
		}
		else
		{
				echo'Please add a user';
		}
echo'</tbody></table>';
}
?>


<?php // SESSION
// GIVE ME THE SIGNED IN USER IN CASE I NEED TO USE HIM/HER
session_start();
$username = preg_replace('#[^A-Za-z0-9]#i', '', $_SESSION["username"]); // filter everything but numbers and letters
$getuserName = $db->query("SELECT * FROM users WHERE loginId='$username'");
WHILE($row= mysqli_fetch_array($getuserName))
	{
		$doneBy = $row['names'];
	}
?>

<?PHP // STOCK SETUP
// 1 FIELD TO ADD A NEW ITEM
if(isset($_GET['initItem']))
{
	
echo'
<table class="table table-striped table-bordered">
		<thead>
			<tr>
				<th>N/O</th>
				<th>Item Name</th>
				<th>Item Code</th>
				<th>Unity</th>
				<th>Unity Price</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
	<tr class="gradeX">
		<td>#</td>
		<td><input class="form-control" name="newItemName" id="newItemName"/></td>
		<td><input class="form-control" name="newItemCode" id="newItemCode"/></td>
		<td><input class="form-control" name="newItemUnit" id="newItemUnit"/>
		</td>
		<td><input type="number" class="form-control" name="newItemPrice" id="newItemPrice"></td>
		<td class="actions">
			<button onclick="newItem()"  class="btn btn-success  btn-custom waves-effect m-b-5"><i class="fa fa-save success"></i></button>
			&nbsp;&nbsp;&nbsp;
			<button onclick="setuptable()" class="btn btn-danger  btn-custom waves-effect m-b-5"><i class="fa fa-times"></i></button>
			
		</td>
	</tr>
		 </tbody>
	</table>
	';	
}
// ADD AN ITEM 
if(isset($_GET['newItemName']))
{
	$itemName = $_GET['newItemName'];
	$itemCode = $_GET['newItemCode'];
	$unityPrice = $_GET['newItemPrice'];
	$unit = $_GET['newItemUnit'];
	$sql = $db->query("INSERT INTO `items`(`itemName`, `itemCode`, unit, `unityPrice`, `inDate`, `addedBy`) 
	VALUES ('$itemName', '$itemCode', '$unit','$unityPrice',now(),'me')
	")or die(mysqli_error());
	echo'<script>	
(function(){
 setuptable();
})();
	</script>';
}

if(isset($_GET['updateItemName']))
{
	$itemName = $_GET['updateItemName'];
	$itemCode = $_GET['updateItemCode'];
	$unityPrice = $_GET['updateItemPrice'];
	$itemId = $_GET['updateItemId'];
	$unit = $_GET['updateItemUnit'];
	$sql = $db->query("UPDATE `items` SET `itemName`='$itemName', `itemCode`='$itemCode', `unit`='$unit',`unityPrice`='$unityPrice' WHERE `itemId` ='$itemId'") or die(mysqli_error());
	//echo $itemName;
	echo'<script>	(function(){ setuptable();})();	</script>';
}

// 2 FIELD TO EDDIT AN ITEM
if(isset($_GET['editItem']))
{
	$itemId = $_GET['editItem'];
	$sql = $db->query("SELECT * FROM `items` WHERE `itemId`='$itemId'")or die(mysqli_error());
	WHILE($row= mysqli_fetch_array($sql))
		{
			echo'
			<table id="datatable-buttons" class="table table-striped table-bordered">
					<thead>
						<tr>
							<th>N/O</th>
							<th>Item Name</th>
							<th>Item Code</th>
							<th>Unity</th>
							<th>Unity Price</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
				<tr class="gradeX">
					<td>#</td>
					<td>
					<input class="form-control" name="updateItemName" id="updateItemName" value="'.$row['itemName'].'"/>
					<input name="updateItemId" id="updateItemId" value="'.$itemId.'" hidden/>
					</td><td>
					<input class="form-control" name="updateItemCode" id="updateItemCode" value="'.$row['itemCode'].'"/>
					</td>
					<td><input type="text" class="form-control" name="updateItemUnit" id="updateItemUnit" value="'.$row['unit'].'"></td>
					<td><input type="number" class="form-control" name="updateItemPrice" id="updateItemPrice" value="'.$row['unityPrice'].'"></td>
					<td class="actions">
						<button onclick="changeItem()"  class="btn btn-success  btn-custom waves-effect m-b-5"><i class="fa fa-save success"></i></button>
						&nbsp;&nbsp;&nbsp;
						<button onclick="setuptable()" class="btn btn-danger  btn-custom waves-effect m-b-5"><i class="fa fa-times"></i></button>
						
					</td>
				</tr>
					 </tbody>
				</table>';
		}
}
// 3 IF REMOCE ITEM IN THE STOCK THEN REMOVE IT
if(isset($_GET['removeItem']))
{
	$itemId = $_GET['removeItem'];
	$sql = $db->query("DELETE FROM `items` WHERE itemId='$itemId'")or die(mysqli_error());
	echo'<script>	(function(){ setuptable();})();	</script>';
}
// bring the listing table
if(isset($_GET['setuptable']))
{
echo'
<div class="row">
	<div class="col-sm-6">
		<div class="m-b-30">
			<button id="addToTable" onclick="initItem()" class="btn btn-primary waves-effect waves-light">Add <i class="fa fa-plus"></i></button>
		&nbsp;
		&nbsp;
		<a href="index.php" class="btn btn-icon waves-effect waves-light btn-warning"><i class="fa fa-wrench"></i>
		<span>Fix</span>
		</a>

		</div>
	</div>
</div>
<table id="datatable-buttons" class="table table-striped table-bordered">
	<thead>
		<tr>
			<th>N/O</th>
			<th>Item Name</th>
			<th>Item Code</th>
			<th>Unity</th>
			<th>Unity Price</th>
			<th>Actions</th>
		</tr>
	</thead>
	<tbody>';
$sql = $db->query("SELECT * FROM items ORDER BY itemId DESC");
$n=0;
WHILE($row= mysqli_fetch_array($sql))
{
	$n++;
	echo'
		<tr class="gradeX">
			<td>'.$n.'</td>
			<td>'.$row['itemName'].'</td>
            <td>'.$row['itemCode'].'</td>
			<td>'.$row['unit'].'</td>
			<td>'.number_format($row['unityPrice']).' Rwf</td>
			<td class="actions">
				&nbsp;&nbsp;&nbsp;
				<a href="javascript:void()" onclick="editItem(itemId='.$row['itemId'].')"><i class="fa fa-pencil text-primary"></i></a>
				&nbsp;&nbsp;&nbsp;
				 <a href="javascript:void()" onclick="vanamo(itemId='.$row['itemId'].')" class="danger"><i class="fa fa-trash-o text-danger"></i></a>
            </td>
		</tr>
	';
}
echo'
</tbody>
</table>';
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
	$unityPrice = $_GET['unityPrice'];
	$qty = $_GET['qty'];
	$itemCode = $_GET['itemCode'];
	$operation = 'In';
	$purchaseOrder = $_GET['purchaseOrder'];
	$deliverlyNote = $_GET['deliverlyNote'];
	$docRefNumber = $_GET['docRefNumber'];
	$customerName = $_GET['customerName'];
	$customerRef = $_GET['customerRef'];
	$operationNotes = $_GET['operationNotes'];
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
	'$customerRef','$operationNotes','$operationStatus', now(), '$doneBy')
	")or die(mysqli_error());
	$sql2 = $db->query("SELECT `itemName` FROM `items` WHERE `itemId` = '$itemCode' ");
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
	FROM `transactions` T INNER JOIN `items` I 
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

<?PHP // SELING OPERATIONS
// GENERATE THE INVIOCE ID
if(isset($_GET['generateINV']))
{
//insert new serie
	$sql1 = $db->query("INSERT INTO `serieid` (`userOn`) VALUES ('$username')")or die(mysqli_error());	
//get new SN		
$sql = $db->query("SELECT COUNT(serieID)+1 AS transactionID FROM `serieid` WHERE YEAR(serieDate) = YEAR(CURDATE()) ");
WHILE($row= mysqli_fetch_array($sql))
	{
		$transactionID = $row['transactionID'];
	}
	echo '<input name="InvoinceNo" id="InvoinceNo" onkeyup="bringPrint();checkInvoince();" class="form-control" value="INV'.date("Y").'-'.$transactionID.'">
<script>	
(function(){
 checkInvoince();
})();
	</script>
	';

	}
// ITEMS TO PUT IN THE SELECT
if(isset($_GET['invioceItemIdtoGet']))
{
	$invioceItemIdtoGet = $_GET['invioceItemIdtoGet'];
	$sql = $db->query("SELECT I.`itemId`, I.`itemName`,
IFNULL((SELECT SUM(T.`qty`) FROM `transactions` T WHERE `operation`='In' AND T.`itemCode` = I.`itemId`),0) -
IFNULL((SELECT SUM(T.`qty`) FROM `transactions` T WHERE `operation`='Out' AND T.`itemCode` = I.`itemId`),0)  Balance
,I.`unit`, I.`unityPrice`
FROM `items` I

WHERE I.`itemId` = '$invioceItemIdtoGet'");
	$countout = mysqli_num_rows($sql);
	if($countout>0)
	{
	WHILE($row= mysqli_fetch_array($sql))
	{
		$unit = $row['unit'];
		$unityPrice = $row['unityPrice'];
		$limite = number_format($row['Balance'], 0, '', '');
		$limiteShow = number_format($row['Balance'], 2, '.', ',');
	}
	echo'
<div class="col-sm-3">
	<div class="form-group"> 
		<label for="itemCode" class="control-label">Quantity:</label>
		<div class="input-group">
			<span class="input-group-addon">'.$limiteShow.'</span>
			<input required name="InvoiceQty" min="'.$limite.'" onkeyup="invoiceTotal()" id="InvoiceQty" class="form-control"/>
			<input required value="'.$limite.'" id="limiter" name="limiter" hidden/>
			<span class="input-group-addon">'.$unit.'</span>
		</div>
	</div>
</div>

<div class="col-sm-2">
	<div class="form-group"> 
		<label for="itemCode" class="control-label">Unit Price:</label>
		<input required name="InvioceUnityPrice" id="InvioceUnityPrice" value="'.$unityPrice.'" onkeyup="invoiceTotal()" class="form-control"/>
	</div>
</div>

<div class="col-sm-2">
	<div class="form-group"> 
		<label for="itemCode" class="control-label">Total Price:</label>
		<div class="input-group" id="invoiceTotalPrice">
			<input class="form-control" disabled/>
			<span class="input-group-addon">F</span>
		</div>
	</div>
</div>

<div class="col-sm-2">
<br/>
	<div class="">
		<button class="btn btn-primary waves-effect waves-light" onclick="ouItem()">Add <i class="fa fa-plus"></i></button>
	</div>
	</div>';}else{}	
}
// OUT AN ITEM
if(isset($_GET['InvoiceDeliverlyNote']))
{
	
	$unityPrice = $_GET['InvoiceUnityPrice'];
	$qty = $_GET['InvioceQty'];
	$itemCode = $_GET['itemInvoiceCode'];
	$operation = 'Out';
	$purchaseOrder = $_GET['InvoinceNo'];
	$deliverlyNote = $_GET['InvoiceDeliverlyNote'];
	$docRefNumber = $_GET['DocNo'];
	$customerName = $_GET['InvoiceCustomerName'];
	$customerRef = $_GET['InvioceustomerRef'];
	$operationNotes = $_GET['InvioceOperationNotes'];
	$operationStatus = 1;
	
	$sql = $db->query("INSERT INTO `transactions`
	(`trUnityPrice`, `qty`, 
	`itemCode`, `operation`, `purchaseOrder`,
	`deliverlyNote`, `docRefNumber`, `customerName`, 
	`customerRef`, `operationNotes`, `operationStatus`, doneBy) 
	VALUES 
	('$unityPrice','$qty',
	'$itemCode','$operation','$purchaseOrder',
	'$deliverlyNote','$docRefNumber','$customerName',
	'$customerRef','$operationNotes','$operationStatus', '$doneBy')
	")or die(mysqli_error());
$sql2 = $db->query("SELECT `itemName` FROM `items` WHERE `itemId` = '$itemCode' ");
	WHILE($row = mysqli_fetch_array($sql2))
	{
		echo'<div class="alert alert-success alert-dismissable">
                                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                            <a href="#" class="alert-link">'.$row['itemName'].'</a> was Succesfuly added on the list.
                                        </div>';
	}
	echo'<script>	
(function(){
 bringPrint();
})();
	</script>';
}
// CHECK IF INVOICE EXISTS
if(isset($_GET['InvoinceNo']))
{
	$purchaseOrder = $_GET['InvoinceNo'];
	$docRefNumber = $_GET['DocNo'];
	//echo $purchaseOrder;
	$sql = $db->query("SELECT 
T.`transactionID`, T.`itemCode`,I.`itemName`,
T.`qty`,I.`unit`,  T.`trUnityPrice`, 
T.`qty` * T.`trUnityPrice` AS Total,`operation`
FROM `transactions` T INNER JOIN `items` I 
ON T.`itemCode` = I.`itemId`

WHERE `purchaseOrder`='$purchaseOrder' AND `operation` = 'out'
")or die(mysqli_error());
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
							<a href="javascript:void()" onclick="removeOnInv(removeTransaction='.$row['transactionID'].')" class="danger"><i class="fa fa-trash-o text-danger"></i></a>
							</td>
						</tr>';
													
		}
			echo'</tbody>
				</table>';	
	}
}
?>

<?PHP // REPORTS
// ITEM REPORT
if(isset($_GET['itemInfoId']))
{
	$itemCode= $_GET['itemInfoId'];
	$sqliteminfo = $db->query("SELECT 
	T.`transactionID`,doneOn,`operation`, T.`itemCode`,I.`itemName`,T.purchaseOrder,
	ROUND(T.`qty`, 2) AS Quantity,I.`unit`,  ROUND(T.`trUnityPrice`) U_Price, 
	ROUND(T.`qty` * T.`trUnityPrice` , 2) AS T_Values,IFNULL(doneBy, 'Not Specified') as Done_by
	FROM `transactions` T INNER JOIN `items` I 
	ON T.`itemCode` = I.`itemId`

	WHERE I.`itemId` = '$itemCode'

	ORDER BY T.`transactionID` ASC");
	$giveMeName = $db->query("SELECT * FROM `items` WHERE `itemId` = '$itemCode'");
	while($row = mysqli_fetch_array($giveMeName))
	{
		echo'
			<div class="panel panel-color panel-primary">
				<div class="panel-heading">
					<h4 class="panel-title ">'.$row['itemName'].' ('.$row['unit'].')</h4>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
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
						<th>Operantion</th>
						<th>Quantity</th>
						<th>Unit Price</th>
						<th>Total Price</th>
						<th>By</th>
						<th>Referance</th>
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
				$operation ='Kurangura';
			}
			elseif($convOperation == 'Out')
			{
				$operation ='Gucuruza';
			}
			echo'
				<tr>
					<td>'.$n.'</td>
					<td>'.strftime("%d %b, %Y", strtotime($row['doneOn'])).'</td>
					<td>'.$operation.'</td>
					<td>'.$row['Quantity'].'</td>
					<td>'.$row['U_Price'].' RWF</td>
					<td>'.$row['T_Values'].'</td>
					<td>'.$row['Done_by'].'</td>
					<td>'.$row['purchaseOrder'].'</td>
				</tr>
			';													
		}
		echo'
					</tbody>
				</table> 
			';
	}
	else
	{
		echo'
			no transaction on this item yet!	
								
			';
	}
	echo'
					
				<hr/>			
				<div class="col-md-12">			
					<div class="pull-right">
						<div id="printInvoice">
							<button type="button" class="btn btn-danger waves-effect" data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		';	
}
?>