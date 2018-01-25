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
 <div id="page_content">
        <div id="page_content_inner">
			<h3 class="heading_b uk-margin-bottom">NEW POST</h3>
			<div class="uk-grid uk-grid-medium" data-uk-grid-margin="">
                <div class="uk-width-xLarge-2-10 uk-width-large-3-10 uk-row-first">
                    <div class="md-card">
                        <div class="md-card-toolbar">
                            <h3 class="md-card-toolbar-heading-text" >
                                CATEGORY
                            </h3>
                        </div>
                        <div class="md-card-content">
							<form method="post" action="admin.php">
								<div id="cat">Category<br/>
									<select onchange="get_sub()" id="catId">
										<option></option>
										<?php 
											include ("../db.php");
											$n=0;
											$sql1 = $db->query("SELECT * FROM `productcategory`");
											$count = mysqli_num_rows($sql1);
											if($count > 0)
											{
												while($row = mysqli_fetch_array($sql1))
												{
													$n++;
													echo'<option value="'.$row['catId'].'">'.$row['catNane'].'</option> ';
												}
																					
												}else{
													echo'No category yet Please contact the administrator';
												}
										?>
									</select>
									<br/>
									<br/>
									Subcategory:<br/>
									<div id="suboption">
										<select>
											<option>No category selected</option>
										</select>
									</div>
									<br/>
									Product Type:<br/>
									<div id="prodoption">
									<select>
										<option>No subcategory selected</option>
									</select>
									</div>
								</div>
							</form>
		
						</div>
                    </div>
                </div>
				<div class="uk-width-xLarge-8-10  uk-width-large-7-10">
                    <div class="md-card">
                        <div class="md-card-toolbar">
                            <h3 class="md-card-toolbar-heading-text" id="new_post_title">
                                POST
                            </h3>
                        </div>
                        <div class="md-card-content large-padding" id="new_post_show">
                        <h3>Select a category</h3>	
                                
                            </div>

                    </div>
                </div>
			</div>				 
        </div>
    </div>
 <script src="assets/js/pages/ecommerce_product_edit.min.js"></script>
    


