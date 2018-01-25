
<?php
	if(isset($_POST['newPrice']))
	{
		echo $newPrice = $_POST['newPrice'];
		echo $oldPrice = $_POST['oldPrice'];
		echo $companyId = $_POST['companyId'];
		echo $itemCode = $_POST['itemCode'];
		echo $doneBy = $_POST['doneBy'];
		include("../db.php");
		$sqlOld = $db->query("INSERT INTO 
			theask(companyId, unitPrice, priceType, itemCode, doneOn, doneBy, operation)
			values('$companyId', '$oldPrice', 'prev', '$itemCode', now(), '$doneBy', 'close')");
		
		$sqlNew = $db->query("INSERT INTO 
			theask(companyId, unitPrice, priceType, itemCode, doneOn, doneBy, operation)
			values('$companyId', '$newPrice', 'current', '$itemCode', now(), '$doneBy', 'open')");
		
	header("location: items.php");
	exit();
	}
?>

<!doctype html>
<!--[if lte IE 9]> <html class="lte-ie9" lang="en"> <![endif]-->
<!--[if gt IE 9]><!--> 
<html lang="en"> <!--<![endif]-->
<?php include'userheader.php' ;?>
	<!-- main sidebar -->

	
<div id="new_prod">
<div id="page_content">
	<div id="page_content_inner">
		<h4 class="heading_b uk-margin-bottom">
            <a href="user.php"><i class="uk-icon-angle-double-left"></i> Back</a>&nbsp;&nbsp;&nbsp; SETUP <?php echo $companyName;?> STOCK</h4>
		<?php 
			include ("../db.php");

			$sql2 = $db->query("SELECT * FROM `items1` WHERE createdBy = '$username' ORDER BY itemId DESC");
			$countItems = mysqli_num_rows($sql2);
			if($countItems > 0)
			{
			echo'<div class="uk-grid uk-grid-medium" data-uk-grid-margin>
					<div class="uk-width-large-4-4">
						<div class="md-card uk-margin-medium-bottom">
							<div class="md-card-content">
								<table id="dt_individual_search" class="uk-table" cellspacing="0" width="100%">
									<thead>
										<tr>
											<th>#</th>
											<th>Product</th>
											<th>Change</th>
											<th>Previous Price</th>
											<th>Current Price</th>
											<th>Last Update</th>
											<th>New Price</th>
										</tr>
									</thead>

									<tfoot>
										<tr>
											<th>#</th>
											<th>Product</th>
											<th>Change</th>
											<th>Previous Price</th>
											<th>Current Price</th>
											<th>Last Update</th>
											<th>New Price</th>
										</tr>
									</tfoot>

									<tbody>';
									$n=0;
						while($row = mysqli_fetch_array($sql2)){
						$itemId = $row['itemId'];
						$postTitle = $row['itemName'];
						$abrev = $row['abrev'];
						
						$sqlPrevPrice = $db->query("SELECT * FROM (SELECT * FROM `theask`  WHERE itemCode = '$itemId' ORDER BY `transactionId` DESC LIMIT 2) AS Ptab ORDER BY `transactionId` ASC LIMIT 1");
						$sqlNewPrice = $db->query("SELECT * FROM theask WHERE itemCode = '$itemId' ORDER BY transactionID DESC limit 1");
						$rowPrevPrice = mysqli_fetch_array($sqlPrevPrice);
						$rowNewPrice = mysqli_fetch_array($sqlNewPrice);
						$prevPrice = number_format(($rowPrevPrice['unitPrice']),2);
						$updatedDate = $rowNewPrice['doneOn'];
						$currentPrice = number_format(($rowNewPrice['unitPrice']),2);
						$indicator = $currentPrice - $prevPrice;
						$percindicator = round(($indicator * 100/$prevPrice),2);
						if($prevPrice > $currentPrice)
						{
							$sign = '('.number_format(($indicator),2).') '.$percindicator.'%';
						}
						elseif($prevPrice == $currentPrice)
						{
							$sign = "(0)";
						}
						else
						{
							$sign = "(+".number_format(($indicator),2).") +".$percindicator.'%';
						}
						$n++;
						echo '<tr>
								<td>'.$n.'</td>
								<td>'.$postTitle.' ('.$abrev.')</td>
								<td>'.$sign.'</td>
								<td>'.$prevPrice.' Rwf</td>
								<td>'.$currentPrice.' Rwf</td>
								<td>'.$updatedDate.'</td>
								<td>
								<form action="items.php" method="post">
								 
									<input type="hidden" name="oldPrice" value="'.$currentPrice.'"/>
									<input type="hidden" name="companyId" value="'.$companyid.'"/>
									<input type="hidden" name="itemCode" value="'.$itemId.'"/>
									<input type="hidden" name="doneBy" value="'.$username.'"/>
									<input type="text" name="newPrice"/>
									<input type="submit" value="Update" />
								</form>
								</td>
							</tr>
							';
						}
						echo '		</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>';
			}
			else
			{
				echo '<center><h4>Opps No Item Yet!!!, Please add some</h4></center>';
			}
		?>
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
    <script src="assets/js/altair_admin_common.min.js"></script><!-- page specific plugins -->
    <!-- datatables -->
    <script src="bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
    <!-- datatables buttons-->
    <script src="bower_components/datatables-buttons/js/dataTables.buttons.js"></script>
    <script src="assets/js/custom/datatables/buttons.uikit.js"></script>
    <script src="bower_components/jszip/dist/jszip.min.js"></script>
    <script src="bower_components/pdfmake/build/pdfmake.min.js"></script>
    <script src="bower_components/pdfmake/build/vfs_fonts.js"></script>
    <script src="bower_components/datatables-buttons/js/buttons.colVis.js"></script>
    <script src="bower_components/datatables-buttons/js/buttons.html5.js"></script>
    <script src="bower_components/datatables-buttons/js/buttons.print.js"></script>
    
    <!-- datatables custom integration -->
    <script src="assets/js/custom/datatables/datatables.uikit.min.js"></script>

    <!--  datatables functions -->
    <script src="assets/js/pages/plugins_datatables.min.js"></script>

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