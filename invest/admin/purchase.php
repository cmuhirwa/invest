
<!doctype html>
<!--[if lte IE 9]> <html class="lte-ie9" lang="en"> <![endif]-->
<!--[if gt IE 9]><!--> <html lang="en"> <!--<![endif]-->
<?php include'userheader.php' ;?>
<?php
$totalHave ="";												 
$tableshow ="";												 
$sql = $db->query("SELECT I.`itemId`, I.`itemName`,
IFNULL((SELECT SUM(T.`qty`) FROM `transactions` T WHERE `operation`='In' AND T.`itemCode` = I.`itemId`),0) Ins,
IFNULL((SELECT SUM(T.`qty`) FROM `transactions` T WHERE `operation`='Out' AND T.`itemCode` = I.`itemId`),0)  Outs,
IFNULL((SELECT SUM(T.`qty`) FROM `transactions` T WHERE `operation`='In' AND T.`itemCode` = I.`itemId`),0) -
IFNULL((SELECT SUM(T.`qty`) FROM `transactions` T WHERE `operation`='Out' AND T.`itemCode` = I.`itemId`),0)  Balance
,I.`unit`, I.`unitPrice`
FROM `items1` I WHERE I.itemCompanyCode= '$companyid' ORDER BY Balance DESC");
										$n=0;
			$countResults = mysqli_num_rows($sql);
			if($countResults > 0){
										WHILE($row= mysqli_fetch_array($sql))
										{
											$n++;
											$qty = $row['Balance'];
											$up = $row['unitPrice'];
											$outstanding = $qty * $up;
										$tableshow.='<tr class="gradeX">
                                            <td>'.$row['itemName'].'
                                            </td>
                                            <td>'.number_format($row['Balance']).' '.$row['unit'].'s</td>
                                            <td>'.number_format($row['unitPrice']).' Rwf</td>
                                            <td>'.number_format($outstanding).' Rwf</td>
                                            <td class="hidden-print"">
                                                &nbsp;&nbsp;&nbsp;
												<a href="javascript:void()" onclick="itemInfo(itemInfoId='.$row['itemId'].')"   data-toggle="modal" data-target="#itemHist">info</a>
											</td>
                                        </tr>';
										$totalHave = $outstanding + $totalHave;
										}
			}else{
				$tableshow.='No records Yet';
				$totalHave = 0;
			}
										?>
	<!-- main sidebar -->

	
	<div id="new_prod">
<div id="page_content">
	<div id="page_content_inner">
		<h4 class="heading_b uk-margin-bottom">
            <a href="user.php"><i class="uk-icon-angle-double-left"></i> Back</a>&nbsp;&nbsp;&nbsp; PURCHASES AND SALES OF <?php echo $companyName;?></h4>

       
				<?php 

					include ("../db.php");

					$sql2 = $db->query("SELECT * FROM `items1` WHERE createdBy = '$username' ORDER BY itemId DESC");
					$countItems = mysqli_num_rows($sql2);
					if($countItems > 0){
					?>
					<div class="uk-grid uk-grid-medium" data-uk-grid-margin>
                <div class="uk-width-large-3-5">
                    <div class="md-card uk-margin-medium-bottom">
                        <div class="md-card-content">
                            <table class="uk-table" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th>Product</th>
                                        <th>Qyt</th>
                                        <th>Unit Price</th>
                                        <th>Outstanding</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>

                                <tbody>
                                <?php echo $tableshow;?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="uk-width-large-2-5" id="itemInfoPop">
                	
                </div>
            </div>
            <?php
        }
					else{
						echo '<center><h4>Opps No Item Yet!!!, Please add some</h4></center>';
					}
				?>
	</div>
</div>
<div class="md-fab-wrapper">
        <a class="md-fab md-fab-success" href="javascript:void(0)" onclick="purchase()">
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

    <!-- chartist -->
    <script src="bower_components/chartist/dist/chartist.min.js"></script>

    <!--  charts functions -->
    <script src="assets/js/pages/plugins_charts.min.js"></script>
	
    <!--  preloaders functions -->
    <script src="assets/js/pages/components_preloaders.min.js"></script>

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
function purchase(){
	var purchase = 'yes';
	$.ajax({
			type : "GET",
			url : "purchaseScript.php",
			dataType : "html",
			cache : "false",
			data : {
				
				purchase : purchase,
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
// 5 INVOICE ITEM TOTAL
function purchaseTotal(){
	var unityPriceToAdd = document.getElementById('unityPrice').value;
	var invoiceQtyToAdd = document.getElementById('qty').value;
	
	var totalPrice = unityPriceToAdd * invoiceQtyToAdd;
	document.getElementById("purchaseTotalPrice").innerHTML = '<label class="uk-form-label" for="kUI_masked_postcode">Total Price:</label><input class="form-control" value="'+totalPrice+'"disabled/>';
	
}
<!--INSERT ITEM
function insertItem()
{
	
	var purchaseOrder = document.getElementById('purchaseOrder').value;
	//alert(purchaseOrder);
	if (purchaseOrder == null || purchaseOrder == "") {
        alert("Purchase Order must be filled out");
        return false;
    }
	var deliverlyNote = document.getElementById('deliverlyNote').value;
	//alert(deliverlyNote);
	if (deliverlyNote == null || deliverlyNote == "") {
        alert("Deliverly Note must be filled out");
        return false;
    }
	var docRefNumber = document.getElementById('docRefNumber').value;
	//alert(docRefNumber);
	if (docRefNumber == null || docRefNumber == "") {
        alert("docRefNumber Note must be filled out");
        return false;
    }
	var customerName = document.getElementById('customerName').value;
	//alert(customerName);
	if (customerName == null || customerName == "") {
        alert("customerName Note must be filled out");
        return false;
    }
	var customerRef = "N/A";
	//alert(customerRef);
	
	var itemCode = document.getElementById('itemCode').value;
	//alert(itemCode);
	
	var qty = document.getElementById('qty').value;
	//alert(qty);
	if (qty == null || qty == "") {
        alert("Deliverly Note must be filled out");
        return false;
    }
	var unityPrice = document.getElementById('unityPrice').value;
	//alert(unityPrice);
	if (unityPrice == null || unityPrice == "") {
        alert("Unity Price Note must be filled out");
        return false;
    }
	var operationNotes = document.getElementById('operationNotes').value;
	//alert(operationNotes);
	if (operationNotes == null || operationNotes == "") {
        alert("operationNotes Note must be filled out");
        return false;
    }
	
	//document.getElementById('tempTable').innerHTML = '';
		$.ajax({
			type : "GET",
			url : "userscript.php",
			dataType : "html",
			cache : "false",
			data : {
				
				purchaseOrder : purchaseOrder,
				deliverlyNote : deliverlyNote,
				unityPrice : unityPrice,
				itemCode : itemCode,
				qty : qty,
				docRefNumber : docRefNumber,
				customerName : customerName,
				customerRef : customerRef,
				operationNotes : operationNotes,
				
				
			},
			success : function(html, textStatus){
				$("#listTable").html(html);
			},
			error : function(xht, textStatus, errorThrown){
				alert("Error : " + errorThrown);
			}
	});
}
<!--Item information-->
function itemInfo(itemInfoId){ 
document.getElementById('itemInfoPop').innerHTML = '<div class="md-preloader"><svg xmlns="http://www.w3.org/2000/svg" version="1.1" height="96" width="96" viewbox="0 0 75 75"><circle cx="37.5" cy="37.5" r="33.5" stroke-width="4"/></svg></div>';

$.ajax({
			type : "GET",
			url : "userscript.php",
			dataType : "html",
			cache : "false",
			data : {
				
				itemInfoId : itemInfoId,
				
				
				
			},
			success : function(html, textStatus){
				$("#itemInfoPop").html(html);
			},
			error : function(xht, textStatus, errorThrown){
				alert("Error : " + errorThrown);
			}
	});
}
</script>
</body>
</html>