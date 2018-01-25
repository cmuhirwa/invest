
<?php
	if(isset($_POST['closeit']))
	{
		$itemCode = $_POST['itemCode'];
		include("../db.php");
		$sql = $db->query("UPDATE `items1` SET `status`='close', changeOn=now() WHERE itemId = '$itemCode'");
	
	header("location: market.php");
	exit();
	}
	
	if(isset($_POST['openIt']))
	{
		echo '<br/>'.$newQty		= $_POST['newQty'];
		echo '<br/>'.$newMinQty     = $_POST['newMinQty'];
		echo '<br/>'.$oldMinQty     = $_POST['oldMinQty'];
		echo '<br/>'.$oldQty		= $_POST['oldQty'];
		echo '<br/>'.$newAskPrice   = $_POST['newAskPrice'];
		echo '<br/>'.$newBidPrice   = $_POST['newBidPrice'];
		echo '<br/>'.$oldAskPrice 	= $_POST['oldAskPrice'];
		echo '<br/>'.$oldBidPrice 	= $_POST['oldBidPrice'];
		echo '<br/>'.$companyId 	= $_POST['companyId'];
		echo '<br/>'.$itemCode 		= $_POST['itemCode'];
		echo '<br/>'.$doneBy 		= $_POST['doneBy'];
		include("../db.php");
		$sqlOld = $db->query("INSERT INTO 
			theask(companyId, unitPrice, bidPrice, qty,
			minQty, priceType, itemCode, doneOn,
			doneBy, operation)
			values('$companyId', '$oldAskPrice', '$oldBidPrice', '$oldQty',
			'$oldMinQty', 'prev', '$itemCode', now(),
			'$doneBy', 'close')");
		
		$sqlNew = $db->query("INSERT INTO 
			theask(companyId, unitPrice, bidPrice, qty,
			minQty, priceType, itemCode, doneOn,
			doneBy, operation)
			values('$companyId', '$newAskPrice', '$newBidPrice', '$newQty',
			'$newMinQty', 'current', '$itemCode', now(),
			'$doneBy', 'open')");
		$sql = $db->query("UPDATE `items1` SET `status`='open', changeOn=now() WHERE itemId = '$itemCode'");
	
	header("location: market.php");
	exit();
	}
?>

<!doctype html>
<!--[if lte IE 9]> <html class="lte-ie9" lang="en"> <![endif]-->
<!--[if gt IE 9]><!--> 
<html lang="en"> <!--<![endif]-->
<?php include'userheader.php' ;?>
<link rel="stylesheet" href="assets/css/style.css" />
    <script type="text/javascript" src="assets/js/jquery.min.js"></script>
		
<?php 
	$sql2 = $db->query("SELECT * FROM `items1` WHERE createdBy = '$username' AND status ='open' ORDER BY itemId DESC");
	$countItems = mysqli_num_rows($sql2);
	$sql3 = $db->query("SELECT * FROM `items1` WHERE createdBy = '$username' AND status ='close' ORDER BY itemId DESC");
	$countCloseItems = mysqli_num_rows($sql3);
?>
	
<div id="new_prod">
<div id="page_content">
	<div id="page_content_inner">
		<h4 class="heading_b uk-margin-bottom">
            <a href="user.php"><i class="uk-icon-angle-double-left"></i> Back</a>&nbsp;&nbsp;&nbsp; SETUP <?php echo $companyName;?> STOCK
		</h4>
		<div id="tabing" class="uk-grid uk-grid-medium" data-uk-grid-margin>
			<div class="uk-width-large-2-4">
				<span class="currentSpan"></span>
	<div onclick="openCity(event, '1')" id="defaultOpen" class=" activeTab md-card">
				Open (<?php echo $countItems;?>)
				</div>
			</div>
			<div class="uk-width-large-2-4">
				<div onclick="openCity(event, '2'), changeTab(tab=2)" class="otherTab md-card">
				Closed (<?php echo $countCloseItems;?>)
				</div>
			</div>
		</div>
		<div class="uk-grid uk-grid-medium" >
			<div class="uk-width-large-4-4">
				<div class="md-card ">
					<div class=" tabcontent" id="1">
						<?php 
						if($countItems > 0)
						{
						echo'<table class="uk-table" cellspacing="0" width="100%">
												<thead>
													<tr>
														<th style="width: 10px;">#</th>
														<th>Product</th>
														<th>Quantity</th>
														<th>Prev Price (Ask / Bid)</th>
														<th>Curr Price (Ask / Bid)</th>
														<th>Change (Ask / Bid)</th>
														<th>Action</th>
													</tr>
												</thead>
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
									 $prevBidPrice = number_format(($rowPrevPrice['bidPrice']),2);
									$updatedDate = $rowNewPrice['doneOn'];
									$qty = $rowNewPrice['qty'];
									$minQty = $rowNewPrice['minQty'];
									$currentPrice = number_format(($rowNewPrice['unitPrice']),2);
									$currentBidPrice = number_format(($rowNewPrice['bidPrice']),2);
									$indicator = $currentPrice - $prevPrice;
									 $indicatorBid = $currentBidPrice - $prevBidPrice;
									 if($prevPrice > 0){$percindicator = round(($indicator * 100/$prevPrice),2);}
									 else{$percindicator = 0;} 
									 if($prevBidPrice > 0){$percindicatorBid = round(($indicatorBid * 100/$prevBidPrice),2);}
									 else{$percindicatorBid = 0;}
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
											$sign = "(+".number_format(($indicator),2).") +".$percindicatorBid.'%';
										}
										
										if($prevBidPrice > $currentBidPrice)
										{
											$signBid = '('.number_format(($indicatorBid),2).') '.$percindicatorBid.'%';
										}
										elseif($prevBidPrice == $currentBidPrice)
										{
											$signBid = "(0)";
										}
										else
										{
											$signBid = "(+".number_format(($indicatorBid),2).") +".$percindicatorBid.'%';
										}
									$n++;
									echo '<form action="market.php" method="post">
										<tr>
											<td>'.$n.'</td>
											<td onclick="showMarket(marketId='.$itemId.')" class="itemStat">'.$postTitle.' ('.$abrev.')</td>
											<td>
												'.$qty.'
												 Min: '.$minQty.'
											</td>
											<td>
												'.$prevPrice.' / '.$prevBidPrice.' Rwf
											</td>
											<td>'.$currentPrice.' / '.$currentBidPrice.' Rwf</td>
											<td>'.$sign.' / '.$signBid.'</td>
											<td>
												<input type="hidden" name="itemCode" value="'.$itemId.'"/>
												<input type="submit" name="closeit" value="Close" />
											</td>
										</tr></form>
										';
									}
									echo '		</tbody>
											</table>
										';
						}
						else
						{
							echo '<center><h4>Opps No Item Yet!!!, Please add some</h4></center>';
						}
						?>
					</div>
					<div id="2" class="tabcontent">
						<?php 
						if($countCloseItems > 0)
						{
						echo'<table class="uk-table" cellspacing="0" width="100%">
												<thead>
													<tr>
														<th style="width: 10px;">#</th>
														<th>Product</th>
														<th>Quantity (Available / Minimum)</th>
														<th>Price (Ask / Bid)</th>
														<th>Closed On</th>
														<th>Action</th>
													</tr>
												</thead>

												
												<tbody>';
												$n=0;
									while($row = mysqli_fetch_array($sql3)){
									$itemId = $row['itemId'];
									$postTitle = $row['itemName'];
									$abrev = $row['abrev'];
									$changeOn = $row['changeOn'];
									
									$sqlPrevPrice = $db->query("SELECT * FROM (SELECT * FROM `theask`  WHERE itemCode = '$itemId' ORDER BY `transactionId` DESC LIMIT 2) AS Ptab ORDER BY `transactionId` ASC LIMIT 1");
									$sqlNewPrice = $db->query("SELECT * FROM theask WHERE itemCode = '$itemId' ORDER BY transactionID DESC limit 1");
									$rowPrevPrice = mysqli_fetch_array($sqlPrevPrice);
									$rowNewPrice = mysqli_fetch_array($sqlNewPrice);
									$prevPrice = number_format(($rowPrevPrice['unitPrice']),2);
									$prevBidPrice = number_format(($rowPrevPrice['bidPrice']),2);
									$updatedDate = $rowNewPrice['doneOn'];
									$qty = $rowNewPrice['qty'];
									$minQty = $rowNewPrice['minQty'];
									$currentPrice = number_format(($rowNewPrice['unitPrice']),2);
									$currentBidPrice = number_format(($rowNewPrice['bidPrice']),2);
									
									$n++;
									echo '<form action="market.php" method="post">
										<tr>
											<td>'.$n.'</td>
											<td onclick="showMarket(marketId='.$itemId.')" class="itemStat">'.$postTitle.' ('.$abrev.')</td>
											<td>
												<input type="text" name="newQty" style="width: 120px;" value="'.$qty.'"/> / 
												<input type="text" name="newMinQty" style="width: 90px;" value="'.$minQty.'"/>
											</td>
											<td>
												<input type="text" name="newAskPrice" style="width: 90px;" value="'.$currentPrice.'"/> / 
												<input type="text" name="newBidPrice" style="width: 90px;" value="'.$currentBidPrice.'"/>
											</td>
											<td>'.$changeOn.'
											</td>
											<td>
												<input type="hidden" name="oldQty" value="'.$qty.'"/>
												<input type="hidden" name="oldMinQty" value="'.$minQty.'"/>
												<input type="hidden" name="oldAskPrice" value="'.$currentPrice.'"/>
												<input type="hidden" name="oldBidPrice" value="'.$currentBidPrice.'"/>
												<input type="hidden" name="companyId" value="'.$companyid.'"/>
												<input type="hidden" name="itemCode" value="'.$itemId.'"/>
												<input type="hidden" name="doneBy" value="'.$username.'"/>
												<input type="submit" value="Open" name="openIt"/>
											
											</td>
										</tr></form>
										';
									}
									echo '		</tbody>
											</table>
										';
						}
						else
						{
							echo '<center><h4>Opps No Item Yet!!!, Please add some</h4></center>';
						}
						?>
					
					</div>
				</div>
			</div>
			<div class="uk-width-large-4-4">
				<div class="md-card ">
					<?php if(isset($_GET['tosellid'])){
						$tosellid = $_GET['tosellid'];
						$sql7 = $db->query("SELECT * FROM `items1` WHERE itemId ='$tosellid'");
						$rowtosell = mysqli_fetch_array($sql7);
						
						echo '<h4 style="text-align: center; padding: 15px">'.$rowtosell['itemName'];?></h4>
					<script type="text/javascript">
            $(document).ready(function() {
                var options = {
                    chart: {
                        renderTo: 'container',
                        type: 'line'
                    },
                    title: {
                        text: '',
                        x: -20 //center
                    },
                    xAxis: {
                        categories: [],
                        title: {
                            text: 'Days'
                        }
                    },
                    yAxis: {
                        title: {
                            text: 'Prices'
                        },
                        plotLines: [{
                                value: 0,
                                width: 1,
                                color: '#808080'
                            }]
                    },
                    tooltip: {
                        valueSuffix: 'Price / Date'
                    },
                    legend: {
                        layout: 'vertical',
                        align: 'right',
                        verticalAlign: 'middle',
                        borderWidth: 0
                    },
                    series: []
                };
                $.getJSON("data.php?itemId=<?php echo $tosellid;?>", function(json) {
                    options.xAxis.categories = json[0]['data']; //xAxis: {categories: []}
                    options.series[0] = json[1];
                    chart = new Highcharts.Chart(options);
                });
            });
        </script>
       
					<div id="container" style="min-width: 400px; height: 400px; margin: 0 auto"></div>
					<?php }
					?>
				</div>
			</div>
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
<script>
function openCity(evt, cityName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " active";
}

// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();

function changeTab(tab)
{
	var shares = '<div class="mdl-card mdl-cell mdl-cell--3-col fbShare" id="shareBtn">Share facebook</div>'
	+'<div class="mdl-card mdl-cell mdl-cell--3-col twtShare">share Twitter</div>';
	if(tab == 1)
	{
		document.getElementById('tabing').innerHTML =
			'<div class="uk-width-large-2-4"><span class="currentSpan"></span><div onclick="openCity(event, 1)" id="defaultOpen" class=" activeTab md-card">Open (<?php echo $countItems;?>)</div></div>'
			+'<div class="uk-width-large-2-4"><div onclick="openCity(event, 2), changeTab(tab=2)" class="otherTab md-card">Closed (<?php echo $countCloseItems;?>)</div></div>';
	}
	else if(tab == 2)
	{
		document.getElementById('tabing').innerHTML = 
			'<div class="uk-width-large-2-4"><div onclick="openCity(event, 1) , changeTab(tab=1)"  class="otherTab  md-card">Open (<?php echo $countItems;?>)</div></div>'
			+'<div class="uk-width-large-2-4"><span class="currentSpan" style="background: #FF5722;"></span><div onclick="openCity(event, 2)" id="defaultOpen" class="activeTab md-card">Closed (<?php echo $countCloseItems;?>)</div></div>';

	}
}
function showMarket(marketId)
{
	window.location.replace("market.php?tosellid="+marketId);
}
</script>
 <script src="assets/js/highchats.js"></script>
       
</body>
</html>