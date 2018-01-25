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
error_reporting(E_ALL); 
ini_set('display_errors', 1);
		
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
	
	if(isset($_POST['addpst']))
	{
		$itemName = $_POST['itemName'];
		$abrev = $_POST['abrev'];
		$unitPrice = $_POST['unitPrice'];
		$description = $_POST['description'];
		$productCode = $_POST['productCode'];
		$createdBy = $username;
		$itemCompanyCode = $_POST['itemCompanyCode'];
		
		include ("../db.php");
		
		$sql = $db->query("INSERT INTO items1 (
			itemName, abrev, unitPrice, 
			description, productCode, createdBy, 
			itemCompanyCode, createdDate, updatedBy) 
		VALUES (
			'$itemName', '$abrev', '$unitPrice',
			'$description', '$productCode', '$createdBy',
			 '$itemCompanyCode', now(), '$createdBy')")or die (mysqli_error());
		$sql9 = $db->query("SELECT * FROM items1 ORDER BY itemId DESC limit 1");
			while($row = mysqli_fetch_array($sql9)){
				$Imagename = $row['itemId'];
			
		$sqlPrev = $db->query("INSERT INTO theask(companyId, unitPrice, priceType, itemCode) 
			VALUES ('$itemCompanyCode', '$unitPrice', 'prev', '$Imagename')");
		$sqlCurrent = $db->query("INSERT INTO theask(companyId, unitPrice, priceType, itemCode) 
			VALUES ('$itemCompanyCode', '$unitPrice', 'current', '$Imagename')");

		if ($_FILES['fileField']['tmp_name'] != "") {																	 										 
			$newname = ''.$Imagename.'.jpg';
			move_uploaded_file( $_FILES['fileField']['tmp_name'], "../products/$newname");
		}
		header("location: items.php");
		}
	}
	elseif(isset($_POST['editpst']))
	{
		$postId = $_POST['postId'];
		$postTitle = $_POST['postTitle'];
		$productCode = $_POST['productCode'];
		$quantity = $_POST['quantity'];
		$price = $_POST['price'];
		$priceStatus = $_POST['priceStatus'];
		$postDesc = $_POST['postDesc'];
		$postedBy = $username; //$_POST['postedBy'];
		$postDeadline = $_POST['postDeadline'];
		$productLocation = $_POST['productLocation'];
		
		include ("../db.php");
		$sql = $db->query("UPDATE posts SET postTitle='$postTitle',productCode='$productCode',quantity='$quantity',price='$price',priceStatus='$priceStatus',postDesc='$postDesc',postedBy='$postedBy',postDeadline='$postDeadline',productLocation='$productLocation' WHERE postId = '$postId'")or die (mysqli_error());
		
		header("location: items.php");
	}		
	
?>
<?php 
	$sqlseller1 = $db->query("SELECT * FROM company1 WHERE cumpanyUserCode = '$thisid'");
	$countComanies1 = mysqli_num_rows($sqlseller1);
	if($countComanies1>0)
		{
			while($row = mysqli_fetch_array($sqlseller1)) 
				{
					$companyid = $row['companyId'];
					$companyName = $row['companyName'];
				}
		}
	?>
<div id="page_content">
        <div id="page_content_inner">
			<h4 class="heading_b uk-margin-bottom">
			<a href="purchase.php"><i class="uk-icon-angle-double-left"></i> Back</a>&nbsp;&nbsp;&nbsp;
			PURCHAS SHARES</h4>
			<div class="uk-grid uk-grid-medium" data-uk-grid-margin="">
                <div class="uk-width-xLarge-10-10 uk-width-large-10-10 uk-row-first">
                    <div class="md-card">
                        <div class="md-card-toolbar">
                            <br/>
							<div class="uk-grid uk-grid-width-large-1-2 uk-grid-width-xlarge-1-4" data-uk-grid-margin="">
								<div class="uk-row-first">
									<label class="uk-form-label" for="kUI_masked_phone">PURC ORD</label>
									<input id="purchaseOrder"  type="text" class="uk-form-width-medium k-textbox" data-role="maskedtextbox" autocomplete="off">
								</div>
								<div>
									<label class="uk-form-label" for="kUI_masked_credit_card">DELIV NOT</label>
									<input id="deliverlyNote" type="text" class="uk-form-width-medium k-textbox" data-role="maskedtextbox" autocomplete="off">
								</div>
								<div>
									<label class="uk-form-label" for="kUI_masked_ssn">DOC REF NO.</label>
									<input id="docRefNumber" type="text" class="uk-form-width-medium k-textbox" data-role="maskedtextbox" autocomplete="off">
								</div>
								<div>
									<label class="uk-form-label" for="kUI_masked_postcode">PROVIDER NAME</label>
									<input id="customerName" type="text" class="uk-form-width-medium k-textbox" data-role="maskedtextbox" autocomplete="off">
								</div>
							</div>
							<br/>
                        </div>
                        <div class="md-card-content">
							    <br>
							    <br>
							<div class="uk-grid uk-grid-width-large-1-2 uk-grid-width-xlarge-1-5" data-uk-grid-margin="">
								<div class="uk-row-first">
									<label class="uk-form-label" for="kUI_masked_phone">Product:</label>
									<select id="itemCode" >
										<option></option>
										
										<?php 
											include ("../db.php");
											
											$sql1 = $db->query("SELECT * FROM `items1` WHERE itemCompanyCode='$companyid'");
											while($row = mysqli_fetch_array($sql1))
												{
													$n++;
													echo'<option value="'.$row['itemId'].'">'.$row['itemName'].'</option> ';
												}
										?>
									</select>
									
								</div>

								<div>
									<label class="uk-form-label" for="kUI_masked_credit_card">Quantity(Shares):</label>
									<input id="qty"  onkeyup="purchaseTotal()" type="text" class="uk-form-width-medium k-textbox" data-role="maskedtextbox" autocomplete="off">
									
								</div>
								<div>
									<label class="uk-form-label" for="kUI_masked_ssn">Unit Price:</label>
									<input id="unityPrice" onkeyup="purchaseTotal()" type="text" class="uk-form-width-medium k-textbox" data-role="maskedtextbox" autocomplete="off">
									
								</div>
								<div id="purchaseTotalPrice" >
									<label class="uk-form-label" for="kUI_masked_postcode">Total Price:</label>
									<input disabled>
								</div>
								<div>
									<button class="md-btn" onclick="insertItem()">Add</button>
								</div>
							</div>
							<hr>
								<br>
									<div id="listTable"></div>
								<br>
							<hr>
							Comment:<textarea id="operationNotes">N/A</textarea> <div class="form-group">
						<label for="attachedFile" class="control-label">Attache optional file:</label> 
						<input class="form-control" type="file"></div></br>
						</br></br>
						<a class="md-btn" href="purchase.php">Done</a>
						</div>
                    </div>
                </div>
			</div>				 
        </div>
    </div>
<script src="assets/js/pages/ecommerce_product_edit.min.js"></script>
<script>

<!--5 Load product to Edit-->
function getItemsDet()
{
	var itemIdtoGet = $("#itemCode").val();	
	$.ajax({
			type : "GET",
			url : "userscript.php",
			dataType : "html",
			cache : "false",
			data : {
				
				itemIdtoGet : itemIdtoGet,
			},
			success : function(html, textStatus){
				$("#qtydiv").html(html);
			},
			error : function(xht, textStatus, errorThrown){
				alert("Error : " + errorThrown);
			}
	});
}


</script>   