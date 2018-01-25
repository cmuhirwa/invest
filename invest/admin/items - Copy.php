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
			 $account_type = $row["account_type"];
			 if($account_type =='admin')
		{
			header("location: admin.php");
			exit();
		}
			}
		} 
		else{
		echo "
		
		<br/><br/><br/><h3>Your account has been temporally deactivated</h3>
		<p>Please contact: <br/><em>(+25) 0782010262</em><br/><b>uwamclemmy@gmail.com</b></p>		
		Or<p><a href='../logout.php'>Click Here to login again</a></p>
		
		";
	    exit();
	}
?>

<?php
	if(isset($_POST['addpst']))
	{
		$itemName = $_POST['itemName'];
		$productCode = $_POST['productCode'];
		$itemCompanyCode = $_POST['itemCompanyCode'];
		$unit = $_POST['unit'];
		$unityPrice = $_POST['unityPrice'];
		$quantity = $_POST['quantity'];
		$description = $_POST['description'];
		echo $itemName;
		echo' itemName<br/>';
		echo $productCode;echo' productCode<br/>';
		echo $itemCompanyCode;echo' itemCompanyCode<br/>';
		echo $unit;echo' unit<br/>';
		echo $unityPrice;echo' unityPrice<br/>';
		echo $quantity;echo' quantity<br/>';
		echo $description ;echo' description<br/>';
		$addtheitem = $db->query("INSERT INTO `items1`(`itemName`, `productCode`, `itemCompanyCode`, `unit`, `unityPrice`, description) 
		VALUES ('$itemName','$productCode','$itemCompanyCode','$unit','$unityPrice','$description')
		")or die (mysqli_error());
		
		
		$sql2 = $db->query("SELECT * FROM items1 ORDER BY itemId DESC limit 1");
			while($row = mysqli_fetch_array($sql2)){
				$Imagename = $row['itemId'];
			}
			
		$sql5 = $db->query("INSERT INTO `bids`
		(`trUnityPrice`, `qty`, `itemCode`, `operation`,`companyId`,`operationStatus`, doneBy) 
VALUES  ('$unityPrice','$quantity','$Imagename','In','$itemCompanyCode','1','$thisid')")or die(mysqli_error());
		
		if ($_FILES['fileField']['tmp_name'] != "") {																	 										 
			$newname = ''.$Imagename.'.jpg';
			move_uploaded_file( $_FILES['fileField']['tmp_name'], "../products/$newname");
		}
		header("location: user.php");
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
		
		header("location: user.php");
	}		
	
?>

<!doctype html>
<!--[if lte IE 9]> <html class="lte-ie9" lang="en"> <![endif]-->
<!--[if gt IE 9]><!--> <html lang="en"> <!--<![endif]-->
<?php include'userheader.php' ;?>
	<!-- main sidebar -->

	
	<div id="new_prod">
<div id="page_content">
	<div id="page_content_inner">
		<h4 class="heading_b uk-margin-bottom">
            <a href="user.php"><i class="uk-icon-angle-double-left"></i> Back</a>&nbsp;&nbsp;&nbsp; MANAGE Items in <?php echo $companyName;?></h4>


	
		<div class="uk-grid uk-grid-width-medium-1-3" data-uk-grid="{gutter:24}">
                
                
				<?php 

					include ("../db.php");

					$sql2 = $db->query("SELECT * FROM `items1` WHERE postedBy = '$username' ORDER BY itemId DESC");
					$countItems = mysqli_num_rows($sql2);
					if($countItems > 0){
					while($row = mysqli_fetch_array($sql2)){
					$itemId = $row['itemId'];
					$postTitle = $row['itemName'];
					$priceStatus = $row['postDeadline'];
					$price = number_format($row['unityPrice']);
					
					$sqlprice = $db->query("SELECT * FROM bids WHERE itemCode = '$itemId' ORDER BY transactionID DESC");
					$rowprice = mysqli_fetch_array($sqlprice);
					$currentPrice = $rowprice['trUnityPrice'];

					echo '
					<div data-product-name="Vitae et.">
						<div class="md-card md-card-hover-img">
							<div class="md-card-head uk-text-center uk-position-relative">
								<div class="uk-badge uk-badge-danger uk-position-absolute uk-position-top-left uk-margin-left uk-margin-top">'.$price.' Rwf</div>
								<img class="md-card-head-img" src="../products/'.$row['itemId'].'.jpg" alt=""/>
							</div>
							<div class="md-card-toolbar">
								<div class="md-card-toolbar-actions">
									<a href="javascript:void()" onclick="removepost(postid='.$itemId.')"><i class="md-icon material-icons md-card-close"></i></a>
								</div>
								<h3 class="md-card-toolbar-heading-text">
									<a href="userPost.php?postId='.$row['itemId'].'">'.$postTitle.'</a>
								</h3>
							</div>
							<div class="md-card-content">
								<h4 class="heading_c uk-margin-bottom">
									<span class="sub-heading">Shares: '.number_format($currentPrice).' / 435798</span>
									Ending: '.$priceStatus.'
								</h4>
									<a class="md-btn md-btn-primary md-btn-mini md-btn-wave-light waves-effect waves-button waves-light" href="userPost.php?postId='.$row['itemId'].'">More</a>
							</div>
						</div>
					</div>
					
            <div class="uk-grid uk-grid-medium" data-uk-grid-margin>
                <div class="uk-width-large-4-4">
                    <div class="md-card uk-margin-medium-bottom">
                        <div class="md-card-content">
                            <table id="dt_individual_search" class="uk-table" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Date In</th>
                                        <th>Amount</th>
                                        <th>Branch</th>
                                        <th>For</th>
                                        <th>From/To</th>
                                        <th>Method</th>
                                        <th>Number</th>
                                        <th>Trabsaction ID</th>
                                    </tr>
                                </thead>

                                <tfoot>
                                    <tr>
                                        <th>#</th>
                                        <th>Date In</th>
                                        <th>Amount</th>
                                        <th>Branch</th>
                                        <th>For</th>
                                        <th>From/To</th>
                                        <th>Method</th>
                                        <th>Number</th>
                                        <th>Trabsaction ID</th>
                                    </tr>
                                </tfoot>

                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>30/03/2017</td>
                                        <td>85,000</td>
                                        <td>Gitenga</td>
                                        <td>Tithe</td>
                                        <td>Muhirwa Clement</td>
                                        <td>MTN</td>
                                        <td>0784848236</td>
                                        <td>0000010217</td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>30/03/2017</td>
                                        <td>85,000</td>
                                        <td>Gitenga</td>
                                        <td>Tithe</td>
                                        <td>Muhirwa Clement</td>
                                        <td>Cash</td>
                                        <td>0784848236</td>
                                        <td>0000010217</td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>30/03/2017</td>
                                        <td>85,000</td>
                                        <td>Gitenga</td>
                                        <td>Tithe</td>
                                        <td>Muhirwa Clement</td>
                                        <td>Visa</td>
                                        <td>0784848236</td>
                                        <td>0000010217</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

						';
					}}
					else{
						echo '<center><h4>Opps No Item Yet!!!, Please add some</h4></center>';
					}
				?>
						
		</div>
	</div>
</div>
<div class="md-fab-wrapper">
        <a class="md-fab md-fab-success" href="javascript:void(0)" onclick="additem()">
            <i class="material-icons">add</i>
        </a>
    </div>
</div>
    <!-- google web fonts -->
    <script>
        WebFontConfig = {
            google: {
                families: [
                    'Source+Code+Pro:400,700:latin',
                    'Roboto:400,300,500,700,400italic:latin'
                ]
            }
        };
        (function() {
            var wf = document.createElement('script');
            wf.src = ('https:' == document.location.protocol ? 'https' : 'http') +
            '://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js';
            wf.type = 'text/javascript';
            wf.async = 'true';
            var s = document.getElementsByTagName('script')[0];
            s.parentNode.insertBefore(wf, s);
        })();
    </script>

    <!-- common functions -->
    <script src="assets/js/common.min.js"></script>
    <!-- uikit functions -->
    <script src="assets/js/uikit_custom.min.js"></script>
    <!-- altair common functions/helpers -->
    <script src="assets/js/altair_admin_common.min.js"></script>

    <script src="assets/js/pages/ecommerce_product_edit.min.js"></script>

    <script>
        $(function() {
            if(isHighDensity()) {
                $.getScript( "bower_components/dense/src/dense.js", function() {
                    // enable hires images
                    altair_helpers.retina_images();
                });
            }
            if(Modernizr.touch) {
                // fastClick (touch devices)
                FastClick.attach(document.body);
            }
        });
        $window.load(function() {
            // ie fixes
            altair_helpers.ie_fix();
        });
    </script>
	
<script> <!--0 Add Company-->
function removepost(postid){
	var removepostid = postid;
	var r = confirm("Are you sure you want to remove this product?!");
    if (r == true) {
        $.ajax({
			type : "GET",
			url : "userscript.php",
			dataType : "html",
			cache : "false",
			data : {
				
				removepostid : removepostid,
			},
			success : function(html, textStatus){
				alert('Post Removed Thanks!');
				$("#new_post_show").html(html);
			},
			error : function(xht, textStatus, errorThrown){
				alert("Error : " + errorThrown);
			}
		});
		
    } else {
        alert('Its fine man we wont delete it.');
    }
}
function additem(){
	var itm = 'yes';
	$.ajax({
			type : "GET",
			url : "addItem.php",
			dataType : "html",
			cache : "false",
			data : {
				
				itm : itm,
			},
			success : function(html, textStatus){
				$("#new_prod").html(html);
			},
			error : function(xht, textStatus, errorThrown){
				alert("Error : " + errorThrown);
			}
	});
}
</script>	

<script> <!--1 Show subcat-->
function get_sub(){
	var catId =$("#catId").val();
	//alert(catId);
	$.ajax({
			type : "GET",
			url : "userscript.php",
			dataType : "html",
			cache : "false",
			data : {
				
				catId : catId,
			},
			success : function(html, textStatus){
				$("#suboption").html(html);
			},
			error : function(xht, textStatus, errorThrown){
				alert("Error : " + errorThrown);
			}
	});
}
</script>
<script> <!--2 Show products-->
function get_prod(){
	var subCatId =$("#subCatId").val();
	//alert(subCatId);
	$.ajax({
			type : "GET",
			url : "userscript.php",
			dataType : "html",
			cache : "false",
			data : {
				
				subCatId : subCatId,
			},
			success : function(html, textStatus){
				$("#prodoption").html(html);
			},
			error : function(xht, textStatus, errorThrown){
				alert("Error : " + errorThrown);
			}
	});
}
</script>
<script> <!--3 start new post-->
function new_post(){
	var productId =$("#productId").val();
	//alert(productId);
	$.ajax({
			type : "GET",
			url : "userscript.php",
			dataType : "html",
			cache : "false",
			data : {
				
				productId : productId,
			},
			success : function(html, textStatus){
				$("#new_post_show").html(html);
			},
			error : function(xht, textStatus, errorThrown){
				alert("Error : " + errorThrown);
			}
	});
	$.ajax({
			type : "GET",
			url : "userscript.php",
			dataType : "html",
			cache : "false",
			data : {
				
				posttilte : productId,
			},
			success : function(html, textStatus){
				$("#new_post_title").html(html);
			},
			error : function(xht, textStatus, errorThrown){
				alert("Error : " + errorThrown);
			}
	});
}
</script>
</body>
</html>