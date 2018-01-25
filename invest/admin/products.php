<?php
require("db.php");
if(isset($_POST['newItemName']))
{
	$itemName = $_POST['newItemName'];
	$unityPrice = $_POST['newItemPrice'];
	$sql = $db->query("INSERT INTO `items`(`itemName`, `unityPrice`, `inDate`, `addedBy`) 
	VALUES ('$itemName','$unityPrice',now(),'me')
	")or die(mysqli_error());
	header("location:index.php");
	exit();
}
if(isset($_POST['updateItemName']))
{
	$itemName = $_POST['updateItemName'];
	$unityPrice = $_POST['updateItemPrice'];
	$itemId = $_POST['updateItemId'];
	$sql = $db->query("UPDATE `items` SET `itemName`='$itemName',`unityPrice`='$unityPrice' WHERE `itemId` ='$itemId'") or die(mysqli_error());
	header("location:index.php");
	exit();
}
?>
<?php // Destry session if it hasn't been used for 15 minute.
session_start();
if (!isset($_SESSION["username"])) {
 header("location: login.php"); 
    exit();
}
?>
<?php 
$session_id = preg_replace('#[^0-9]#i', '', $_SESSION["id"]); // filter everything but numbers and letters
$username = preg_replace('#[^A-Za-z0-9]#i', '', $_SESSION["username"]); // filter everything but numbers and letters
$password = preg_replace('#[^A-Za-z0-9]#i', '', $_SESSION["password"]); // filter everything but numbers and letters
include "db.php"; 
$sql = $db->query("SELECT * FROM users WHERE loginId='$username' AND pwd='$password' LIMIT 1"); // query the person
// ------- MAKE SURE PERSON EXISTS IN DATABASE ---------
$existCount = mysqli_num_rows($sql); // count the row nums
if ($existCount > 0) { 
	while($row = mysqli_fetch_array($sql)){ 
			 $thisid = $row["id"];
			 $names = $row["names"];
			 $account_type = $row["account_type"];
			}
		} 
		else{
		echo "
		
		<br/><br/><br/><h3>Your account has been temporally deactivated</h3>
		<p>Please contact: <br/><em>(+25) 078 484-8236</em><br/><b>muhirwaclement@gmail.com</b></p>		
		Or<p><a href='../pages/logout.php'>Click Here to login again</a></p>
		
		";
	    exit();
	}
?>


<!DOCTYPE html>
<html>
    
<!-- Mirrored from moltran.coderthemes.com/dark/tables-editable.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 10 Apr 2016 14:12:46 GMT -->
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <meta name="description" content="A fully featured admin theme which can be used to build CRM, CMS, etc.">
        <meta name="author" content="Coderthemes">

        <link rel="shortcut icon" href="assets/images/favicon_1.ico">

        <title>Inventory</title>
        
        <!-- DataTables -->
        <link href="assets/plugins/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/plugins/datatables/buttons.bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/plugins/datatables/fixedHeader.bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/plugins/datatables/responsive.bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/plugins/datatables/scroller.bootstrap.min.css" rel="stylesheet" type="text/css" />

        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
		
        <link href="assets/css/core.css" rel="stylesheet" type="text/css">
        <link href="assets/css/icons.css" rel="stylesheet" type="text/css">
        <link href="assets/css/components.css" rel="stylesheet" type="text/css">
        <link href="assets/css/pages.css" rel="stylesheet" type="text/css">
        <link href="assets/css/menu.css" rel="stylesheet" type="text/css">
        <link href="assets/css/responsive.css" rel="stylesheet" type="text/css">

        <script src="assets/js/modernizr.min.js"></script>

<!-- Plugins css -->
        <link href="assets/plugins/modal-effect/css/component.css" rel="stylesheet">
		
		
        <link href="assets/plugins/jquery-multi-select/multi-select.css" rel="stylesheet" type="text/css">
        <link href="assets/plugins/select2/dist/css/select2.css" rel="stylesheet" type="text/css">
        <link href="assets/plugins/select2/dist/css/select2-bootstrap.css" rel="stylesheet" type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->

		<style>
.loader {
  border: 8px solid #f3f3f3;
  border-radius: 50%;
  border-top: 8px solid #000000;
  width: 50px;
  height: 50px;
  -webkit-animation: spin 1s linear infinite;
  animation: spin 1s linear infinite;
}

@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}
</style>

        <script src="js/jquery.js"></script>

    </head>


    <body class="fixed-left">
        
        <!-- Begin page -->
        <div id="wrapper">
        
            <!-- Top Bar Start -->
            <?php include('topheader.php');?>
			<!-- Top Bar End -->


            <!-- ========== Left Sidebar Start ========== -->

            <div class="left side-menu">
                <div class="sidebar-inner slimscrollleft">
                     <div class="user-details">
                        <div class="pull-left">
                            <img src="assets/images/users/<?php echo $thisid;?>.jpg" alt="" class="thumb-md img-circle">
                        </div>
                        <div class="user-info">
                            <div class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><?php echo $names;?> <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="javascript:void(0)"><i class="md md-face-unlock"></i> Profile<div class="ripple-wrapper"></div></a></li>
                                    <li><a href="javascript:void(0)"><i class="md md-settings"></i> Settings</a></li>
                                    <li><a href="javascript:void(0)"><i class="md md-lock"></i> Lock screen</a></li>
                                    <li><a href="logout.php"><i class="md md-settings-power"></i> Logout</a></li>
                                </ul>
                            </div>
                            
                            <p class="text-muted m-0"><?php echo $account_type;?></p>
                        </div>
                    </div>
                   <!--- Divider -->
                    <div id="sidebar-menu">
                        <ul>
                            <li class="">
                                <a href="index.php" class="waves-effect waves-light"><i class="ion-ios7-gear"></i><span>Setup</span></a>
                            </li>
							<li>
                                <a href="javascript:void()" class="waves-effect waves-light active"><i class="ion-bag"></i><span>Products</span></a>
                            </li>
							<li>
                                <a href="po.php" class="waves-effect waves-light"><i class="ion-clipboard"></i><span>Proforma Invoice</span></a>
                            </li>
							<li>
                                <a href="invoices.php" class="waves-effect waves-light"><i class="ion-ios7-albums"></i><span>Invoices</span></a>
                            </li>
							<li>
                                <a href="reports.php" class="waves-effect waves-light"><i class="ion-ios7-pulse-strong"></i><span>Reports</span>
									</a>
								
							</li>
						</ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <!-- Left Sidebar End -->



            <!-- ============================================================== -->
            <!-- Start right Content here -->
            <!-- ============================================================== -->                      
            <div class="content-page">
                <!-- Start content -->
                <div class="content">
                    <div class="container">

                        <!-- Page-Title -->
                        <div class="row">
                            <div class="col-sm-12">
                                <h4 class="pull-left page-title">
								<?php 
								$getmethecompany = $db->query("SELECT * FROM company WHERE cumpanyUserCode = '$thisid'");
										$countComanies1 = mysqli_num_rows($getmethecompany);
										if($countComanies1>0)
											{
												while($row = mysqli_fetch_array($getmethecompany)) 
													{
														$companyId = $row['comanyId'];
														echo ''.$row['companyName'].' ';
													}
											}								
								?><i class="ion-ios7-cart-outline"></i></h4>
                                                                   
                            </div>
                        </div>


                        
                        <div class="row">
                            <div class="col-md-12">
                                <div class="panel panel-success">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">.</h3>
                                    </div>
                                    <div class="panel-body">
										<div class="row">
											<div class="col-sm-12">
												<div class="m-b-30">
												<!-- Large modal -->
                                        <button class="btn btn-success waves-effect waves-light" data-toggle="modal" data-target="#inmodel">RANGURA  </button>
										<button class="btn btn-danger waves-effect waves-light breadcrumb pull-right" onclick="generateInvoice();"  data-toggle="modal" data-target="#outmodel">CURUZA</button>
												
												</div>
											</div>
										</div>
										<div id="itamePlace">
                                        <table id="datatable-buttons" class="table table-striped table-bordered">
                                            <thead>
                                                <tr>
													<th>N/O</th>
													<th>Item Name</th>
													<th>Quantity</th>
													<th>Unity Price</th>
													<th>Reviews</th>
													<th class="hidden-print">Actions</th>
												</tr>
                                            </thead>


                                            <tbody>
                                                 <?php
										
										$sql = $db->query("SELECT I.`itemId`, I.`itemName`,
IFNULL((SELECT SUM(T.`qty`) FROM `transactions` T WHERE `operation`='In' AND companyId = '$companyId' AND T.`itemCode` = I.`itemId`),0) Ins,
IFNULL((SELECT SUM(T.`qty`) FROM `transactions` T WHERE `operation`='Out' AND companyId = '$companyId' AND T.`itemCode` = I.`itemId`),0)  Outs,
IFNULL((SELECT SUM(T.`qty`) FROM `transactions` T WHERE `operation`='In' AND companyId = '$companyId' AND T.`itemCode` = I.`itemId`),0) -
IFNULL((SELECT SUM(T.`qty`) FROM `transactions` T WHERE `operation`='Out' AND companyId = '$companyId' AND T.`itemCode` = I.`itemId`),0)  Balance
,I.`unit`, I.`unityPrice`	
FROM `items` I WHERE  itemCompanyCode = '$companyId' ORDER BY itemId DESC");
										$n=0;
										WHILE($row= mysqli_fetch_array($sql))
										{
											$n++;
											$qty = $row['Balance'];
											$up = $row['unityPrice'];
											
										echo'<tr class="gradeX">
                                            <td>'.$n.'</td>
                                            <td>'.$row['itemName'].'
                                            </td>
                                            <td>'.number_format($row['Balance']).' '.$row['unit'].'s</td>
                                            <td>'.number_format($row['unityPrice']).' Rwf</td>
                                            <td> </td>
                                            <td class="hidden-print"">
                                                &nbsp;&nbsp;&nbsp;
												<a href="javascript:void()" onclick="itemInfo(itemInfoId='.$row['itemId'].')"   data-toggle="modal" data-target="#itemHist">info</a>
											</td>
                                        </tr>';
										}
										
										?>

                                             </tbody>
                                        </table>
										</div>
                                    </div>
                                </div>
                            </div>

                        </div> <!-- End Row -->

                    </div> <!-- container -->
                               
                </div> <!-- content -->

                <footer class="footer text-right">
                    2015 © Moltran.
                </footer>

            </div>
            <!-- ============================================================== -->
            <!-- End Right content here -->
            <!-- ============================================================== -->

        </div>
        <!-- END wrapper -->
    <!--  Modal content for the above example -->
<div class="modal fade bs-example-modal-lg" id="inmodel" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none">
	<div class="modal-dialog modal-lg">
	   <div class="modal-content p-0 b-0">
	    	<div class="panel panel-color panel-primary">
				<div class="panel-heading"> 
						<div class="row">
							<div class="col-md-3">
							PURC ORD <input required name="purchaseOrder" id="purchaseOrder" value="N/A"  onkeyup="checkExistance()" class="form-control">
							</div>
							<div class="col-md-2">
							DELIV NOT<input required name="deliverlyNote" id="deliverlyNote" value="N/A" onkeyup="checkExistance()" onchange="checkExistance()" class="form-control">
							</div>
							<div class="col-md-2">
							DOC REF NO.
							
							<input required name="docRefNumber" id="docRefNumber" value="N/A" class="form-control">
							</div>
							<div class="col-md-3">
							PROVIDER NAME<input required name="customerName" id="customerName" value="N/A" class="form-control">
							</div>
							<div class="col-md-2">
							PROVIDER REF.<input required name="customerRef" id="customerRef" value="N/A" class="form-control">
							</div>										
						</div>
				</div> 
				<div class="panel-body"> 
					
				<div class="panel panel-default">
                                    <div class="panel-heading">
                                        	<div class="row">
									<div class="col-sm-3">
										<div class="form-group"> 
											<label for="itemCode" class="control-label">Item Name:</label>
											<select class="select2 form-control" data-placeholder="Choose an Item..."  name="itemCode" id="itemCode" onchange="getItemsDet()">
												<option >Select item</option>
												<?php
													$sql = $db->query("SELECT * FROM items WHERE itemCompanyCode = '$companyId' ORDER BY itemId DESC");
													$n=0;
													WHILE($row= mysqli_fetch_array($sql))
													{
													echo'<option value="'.$row['itemId'].'">'.$row['itemName'].'</option>';
													}
												?>
											</select>
										</div>
									</div>
									<div id="qtydiv">
										<div class="col-sm-3">
											<div class="form-group"> 
												<label for="itemCode" class="control-label">Quantity:</label>
												<div class="input-group">
													<input class="form-control" name="" disabled id=""/>
													<span class="input-group-addon">Unit</span>									
												</div>
											</div>
										</div>
										<div class="col-sm-2">
											<div class="form-group"> 
												<label for="itemCode" class="control-label">Unit Price:</label>
												<input class="form-control" name="" disabled id=""/>							
											</div>
										</div>
										<div class="col-sm-2">
											<div class="form-group"> 
												<label for="itemCode" class="control-label">Total Price:</label>
												<div class="input-group">
													<input class="form-control" name="" disabled id=""/>
													<span class="input-group-addon">RWF</span>
												</div>
											</div>
										</div>
									</div>
								
								<div id="itamePlace">
								
								</div>
									
									
								</div>
							
                                    </div>
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-md-12 col-sm-12 col-xs-12">
											<div id="infoDiv">
								</div>
                                                <div id="listTable">
													
												</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
				
				<div class="row"> 
					<div class="col-md-12"> 
						<div class="form-group no-margin"> 
							<label for="operationNotes" class="control-label">Note:</label> 
							<textarea required class="form-control autogrow" name="operationNotes" id="operationNotes" 
							placeholder="Write something about this operation" style="overflow: hidden; word-wrap: break-word; resize: horizontal; height: 104px"></textarea>
						</div> 
						<div class="form-group">
						<label for="attachedFile" class="control-label">Attache optional file:</label> 
						<input class="form-control" type="file"></div>
					</div> 
				</div>
				<hr/>
				<div class="row"> 
					<div class="col-md-12"> 
						<div class="pull-right">
							<button type="button" class="btn btn-danger waves-effect" data-dismiss="modal">Close</button> 
							<button type="button" class="btn btn-inverse waves-effect waves-light"><i class="fa fa-print"></i></button> 
						</div>
					</div>
				</div>				
				</div>
			</div>
		
		</div><!-- /.modal-content -->
	 </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
	<!-- END wrapper -->
	<!--  Modal content for the above example -->
<div class="modal fade bs-example-modal-lg" id="outmodel" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none">
	<div class="modal-dialog modal-lg">
	   <div class="modal-content p-0 b-0">
	  
			<div class="panel panel-color panel-primary">
				<div class="panel-heading"> 
					<div class="row">
						<div class="col-md-3">
							INVOICE NO. <div id="generatedInv"><input name="InvoinceNo" id="InvoinceNo" onkeyup="checkInvoince();bringPrint();" class="form-control"></div>
						</div>
						<div class="col-md-2">
							DOC REF
							<div class="input-group">
							<div class="input-group-btn">
								<button type="button" class="btn waves-effect waves-light btn-inverse dropdown-toggle" data-toggle="dropdown" style="overflow: hidden; position: relative"><span class="caret"></span></button>
								<ul class="dropdown-menu dropdown-menu-right">
									<li><a href="javascript:void(0)">Cash</a></li>
									<li><a href="javascript:void(0)">Check</a></li>
									<li><a href="javascript:void(0)">Bank Slip</a></li>
									<li class="divider"></li>
									<li><a href="javascript:void(0)">Other</a></li>
								</ul>
							</div>
								<input required name="DocNo" id="DocNo" value="N/A" onkeyup="checkInvoince()" onchange="checkInvoince()" class="form-control">
							</div>
						</div>
						<div class="col-md-3">
							TO NAME:<input required name="InvoiceCustomerName" id="InvoiceCustomerName" value="N/A" class="form-control">
						</div>
						<div class="col-md-2">
							TO ADDRESS<input required name="InvoiceDeliverlyNote" id="InvoiceDeliverlyNote" value="N/A" class="form-control">
						</div>
						<div class="col-md-2">
							TO CONTACTS<input required name="InvoiceCustomerRef" id="InvoiceCustomerRef" value="N/A" class="form-control">
						</div>										
					</div>
				</div> 
				<div class="panel-body"> 
					
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="row">
								<div class="col-sm-3">
									<div class="form-group"> 
										<label for="itemInvoiceCode" class="control-label">Item Name:</label>
										<select class="select2 form-control" data-placeholder="Choose an Item..." name="itemInvoiceCode" id="itemInvoiceCode" onchange="getInvoiceItemsDet()">
											<option >Select item</option>
											<?php
												$sql = $db->query("SELECT * FROM items ORDER BY itemId DESC");
												$n=0;
												WHILE($row= mysqli_fetch_array($sql))
												{
													echo'<option value="'.$row['itemId'].'">'.$row['itemName'].'</option>';
												}
											?>
										</select>
									</div>
								</div>
								<div id="invioceItems">
									<div class="col-sm-3">
										<div class="form-group"> 
											<label for="itemCode" class="control-label">Quantity:</label>
											<div class="input-group">
												<input class="form-control" name="" disabled id=""/>
												<span class="input-group-addon">Unit</span>									
											</div>
										</div>
									</div>
									<div class="col-sm-2">
										<div class="form-group"> 
											<label for="itemCode" class="control-label">Unit Price:</label>
											<input class="form-control" name="" disabled id=""/>							
										</div>
									</div>
									<div class="col-sm-2">
										<div class="form-group"> 
											<label for="itemCode" class="control-label">Total Price:</label>
											<div class="input-group">
												<input class="form-control" name="" disabled id=""/>
												<span class="input-group-addon">RWF</span>
											</div>
										</div>
									</div>
								</div>
								<div id="itamePlace"></div>
							</div>
						</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-md-12 col-sm-12 col-xs-12">
									<div id="infoDiv"></div>
									<div id="listInvoiceTable"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="row"> 
						<div class="col-md-12"> 
							<div class="form-group no-margin"> 
								<label for="InvoiceOperationNotes" class="control-label">Note:</label> 
								<textarea required class="form-control autogrow" name="inOpNote" id="inOpNote" 
								placeholder="Write something about this operation" style="overflow: hidden; word-wrap: break-word; resize: horizontal; height: 104px"></textarea>
							</div> 
						</div> 
					</div> 
					<hr/>
					<div class="row"> 
						<div class="col-md-12"> 
							<div class="pull-right">
								<div id="printInvoice">
									<button type="button" class="btn btn-danger waves-effect" data-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div>
				</div>				
			</div>
		
		</div><!-- /.modal-content -->
	 </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
	<!-- END wrapper -->
	<!--  ITEM HISTORY INFO -->
<div class="modal fade bs-example-modal-lg" id="itemHist" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none">
	<div class="modal-dialog modal-lg">
	   <div class="modal-content p-0 b-0">
		 <div id="itemInfoPop">
			<div class="panel panel-color panel-primary">
				<div class="panel-heading"> 
				Loadding...</div> 
				<div class="panel-body"> 
					
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="row">
								<div class="col-md-12 col-sm-12 col-xs-12">
									<div class="loader"></div>
								</div>
							</div>
						</div>
					</div>
					<hr/>
					<div class="row"> 
						<div class="col-md-12"> 
							<div class="pull-right">
								<div id="printInvoice">
									<button type="button" class="btn btn-danger waves-effect" data-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div>
				</div>				
			</div>
		 </div>
		</div><!-- /.modal-content -->
	 </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
	<!-- END wrapper -->
	   
        <script>
            var resizefunc = [];
        </script>

        <!-- jQuery  -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/detect.js"></script>
        <script src="assets/js/fastclick.js"></script>
        <script src="assets/js/jquery.slimscroll.js"></script>
        <script src="assets/js/jquery.blockUI.js"></script>
        <script src="assets/js/waves.js"></script>
        <script src="assets/js/wow.min.js"></script>
        <script src="assets/js/jquery.nicescroll.js"></script>
        <script src="assets/js/jquery.scrollTo.min.js"></script>

        <script src="assets/js/jquery.app.js"></script>

	     <!-- Datatables-->
        <script src="assets/plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="assets/plugins/datatables/dataTables.bootstrap.js"></script>
        <script src="assets/plugins/datatables/dataTables.buttons.min.js"></script>
        <script src="assets/plugins/datatables/buttons.bootstrap.min.js"></script>
        <script src="assets/plugins/datatables/jszip.min.js"></script>
        <script src="assets/plugins/datatables/pdfmake.min.js"></script>
        <script src="assets/plugins/datatables/vfs_fonts.js"></script>
        <script src="assets/plugins/datatables/buttons.html5.min.js"></script>
        <script src="assets/plugins/datatables/buttons.print.min.js"></script>
        <script src="assets/plugins/datatables/dataTables.responsive.min.js"></script>
        <script src="assets/plugins/datatables/responsive.bootstrap.min.js"></script>
        <script src="assets/plugins/datatables/dataTables.scroller.min.js"></script>

        <!-- Datatable init js -->
        <script src="assets/pages/datatables.init.js"></script>
		<!-- Modal-Effect -->
        <script src="assets/plugins/modal-effect/js/classie.js"></script>
        <script src="assets/plugins/modal-effect/js/modalEffects.js"></script>
	

		
		<script type="text/javascript">
            $(document).ready(function() {
                $('#datatable').dataTable();
                $('#datatable-keytable').DataTable( { keys: true } );
                $('#datatable-responsive').DataTable();
                $('#datatable-scroller').DataTable( { ajax: "assets/plugins/datatables/json/scroller-demo.json", deferRender: true, scrollY: 380, scrollCollapse: true, scroller: true } );
                var table = $('#datatable-fixed-header').DataTable( { fixedHeader: true } );
            } );
            TableManageButtons.init();
        </script>
	
<script> <!--1 INJECT IN THE STOCK-->
function initItem()
{
	var initItem = '1';
	$.ajax({
			type : "GET",
			url : "adminscript.php",
			dataType : "html",
			cache : "false",
			data : {
				
				initItem : initItem,
			},
			success : function(html, textStatus){
				$("#itamePlace").html(html);
			},
			error : function(xht, textStatus, errorThrown){
				alert("Error : " + errorThrown);
			}
	});
}
<!--5 Load product to Edit-->
function editItem(itemId)
{
	var editItem = itemId
	$.ajax({
			type : "GET",
			url : "adminscript.php",
			dataType : "html",
			cache : "false",
			data : {
				
				editItem : editItem,
			},
			success : function(html, textStatus){
				$("#itamePlace").html(html);
			},
			error : function(xht, textStatus, errorThrown){
				alert("Error : " + errorThrown);
			}
	});
}
<!--5 Load product to Edit-->
function getItemsDet()
{
	var itemIdtoGet = $("#itemCode").val();	
	$.ajax({
			type : "GET",
			url : "adminscript.php",
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
<!--5 Load product to Edit-->
function checkExistance()
{
	var purchaseOrder1 = document.getElementById('purchaseOrder').value;
	var deliverlyNote1 = document.getElementById('deliverlyNote').value;
	$.ajax({
			type : "GET",
			url : "adminscript.php",
			dataType : "html",
			cache : "false",
			data : {
				
				purchaseOrder : purchaseOrder1,
				deliverlyNote : deliverlyNote1,
			},
			success : function(html, textStatus){
				$("#listTable").html(html);
			},
			error : function(xht, textStatus, errorThrown){
				alert("Error : " + errorThrown);
			}
	});
}
<!--5 Load product to Edit-->
function insertItem()
{
	
	var purchaseOrder = document.getElementById('purchaseOrder').value;
	//alert(purchaseOrder);
	if (purchaseOrder == null || purchaseOrder == "") {
        alert("Purchase Order must be filled out");
        return false;
    }
	var deliverlyNote = document.getElementById('deliverlyNote').value;
	if (deliverlyNote == null || deliverlyNote == "") {
        alert("Deliverly Note must be filled out");
        return false;
    }
	var unityPrice = document.getElementById('unityPrice').value;
	if (unityPrice == null || unityPrice == "") {
        alert("Unity Price Note must be filled out");
        return false;
    }
	var itemCode = document.getElementById('itemCode').value;
	var qty = document.getElementById('qty').value;
	if (qty == null || qty == "") {
        alert("Deliverly Note must be filled out");
        return false;
    }
	var docRefNumber = document.getElementById('docRefNumber').value;
	var customerName = document.getElementById('customerName').value;
	var customerRef = document.getElementById('customerRef').value;
	var operationNotes = document.getElementById('operationNotes').value;
	
	
	//document.getElementById('tempTable').innerHTML = '';
		$.ajax({
			type : "GET",
			url : "adminscript.php",
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
// 4 REMOVE AN ITEM
function removeOnPo(removeTransaction)
{
	//var txt;
    var r = confirm("Are you sure you want to remove this item from the list");
    if (r == true)
		{
      //  txt = "You pressed OK!";
    
	
	
	var InvoinceNo = document.getElementById('purchaseOrder').value;
	var DocNo = document.getElementById('deliverlyNote').value;
	
	$.ajax({
			type : "GET",
			url : "adminscript.php",
			dataType : "html",
			cache : "false",
			data : {
				
				removeTransaction : removeTransaction,
				purchaseOrder : InvoinceNo,
				deliverlyNote : DocNo,
				
			},
			success : function(html, textStatus){
				$("#listTable").html(html);
			},
			error : function(xht, textStatus, errorThrown){
				alert("Error : " + errorThrown);
			}
	});
	
	}
	else 
	{
       // txt = "You pressed Cancel!";
    }
    //document.getElementById("demo").innerHTML = txt;
	
}
</script>

<script> <!--2 INJECT IN THE STOCK-->
//1 CHECK IF THE INVOICE EXISTS
function generateInvoice(){
	var generateINV = '1';
	$.ajax({
			type : "GET",
			url : "adminscript.php",
			dataType : "html",
			cache : "false",
			data : {
				
				generateINV : generateINV,
			},
			success : function(html, textStatus){
				$("#generatedInv").html(html);
			},
			error : function(xht, textStatus, errorThrown){
				alert("Error : " + errorThrown);
			}
	});
}
//1 CHECK IF THE INVOICE EXISTS
function checkInvoince(){
	var InvoinceNo = document.getElementById('InvoinceNo').value;
	var DocNo = document.getElementById('DocNo').value;
	$.ajax({
			type : "GET",
			url : "adminscript.php",
			dataType : "html",
			cache : "false",
			data : {
				
				InvoinceNo : InvoinceNo,
				DocNo : DocNo,
			},
			success : function(html, textStatus){
				$("#listInvoiceTable").html(html);
			},
			error : function(xht, textStatus, errorThrown){
				alert("Error : " + errorThrown);
			}
	});
}
// 2 SELECT ITEMS FROM DB
function getInvoiceItemsDet(){
	var invioceItemIdtoGet = $("#itemInvoiceCode").val();	
	$.ajax({
			type : "GET",
			url : "adminscript.php",
			dataType : "html",
			cache : "false",
			data : {
				
				invioceItemIdtoGet : invioceItemIdtoGet,
			},
			success : function(html, textStatus){
				$("#invioceItems").html(html);
			},
			error : function(xht, textStatus, errorThrown){
				alert("Error : " + errorThrown);
			}
	});
}
// 3 TAKE OUT AN ITEM
function ouItem(){
	
	var InvoinceNo = document.getElementById('InvoinceNo').value;
	if (InvoinceNo == null || InvoinceNo == "") {
        alert("InvoinceNo must be filled out");
        return false;
    }
	var InvoiceDeliverlyNote = document.getElementById('InvoiceDeliverlyNote').value;
	if (InvoiceDeliverlyNote == null || InvoiceDeliverlyNote == "") {
        alert("InvoiceDeliverlyNote must be filled out");
        return false;
    }
	var InvoiceUnityPrice = document.getElementById('InvioceUnityPrice').value;
	if (InvoiceUnityPrice == null || InvoiceUnityPrice == "") {
        alert("InvoiceUnityPrice must be filled out");
        return false;
    }
	var itemInvoiceCode = document.getElementById('itemInvoiceCode').value;
	var InvioceQty = parseInt(document.getElementById('InvoiceQty').value);
	if (InvioceQty == null || InvioceQty == "") {
        alert("InvioceQty must be filled out");
        return false;
    }
	var DocNo = document.getElementById('DocNo').value;
	if (DocNo == null || DocNo == "") {
        alert("DocNo must be filled out");
        return false;
    }
	var InvoiceCustomerName = document.getElementById('InvoiceCustomerName').value;
	if (InvoiceCustomerName == null || InvoiceCustomerName == "") {
        alert("InvoiceCustomerName must be filled out");
        return false;
    }
	var InvioceustomerRef = document.getElementById('InvoiceCustomerRef').value;
	if (InvioceustomerRef == null || InvioceustomerRef == "") {
        alert("InvioceustomerRef must be filled out");
        return false;
    }
	var InvioceOperationNotes = document.getElementById('inOpNote').value;
	
	var limiter = parseInt(document.getElementById('limiter').value);
	if (limiter == null || limiter == "") {
        alert("nta "+itemInvoiceCode+" ufite muri stoke, wabanje ukarangura? ko ntakwemerera gucuruza ibyo udafite");
        return false;
    }
	
	
	if (DocNo == null || DocNo == "") {
        alert("Name must be filled out");
        return false;
    }
	
	if (InvioceQty > limiter)
	{
	   alert("The qty: "+InvioceQty+" must be less than: "+limiter+", change the qty and try again, ...");
        return false;	
	}
	
	//alert(InvioceOperationNotes);
	//alert('HELLO!');
	//document.getElementById('tempTable').innerHTML = '';
		$.ajax({
			type : "GET",
			url : "adminscript.php",
			dataType : "html",
			cache : "false",
			data : {
				InvoinceNo : InvoinceNo,
				DocNo : DocNo,
				InvoiceDeliverlyNote : InvoiceDeliverlyNote,
				InvoiceUnityPrice : InvoiceUnityPrice,
				itemInvoiceCode : itemInvoiceCode,
				InvioceQty : InvioceQty,
				limiter : limiter,
				InvoiceCustomerName : InvoiceCustomerName,
				InvioceustomerRef : InvioceustomerRef,
				InvioceOperationNotes : InvioceOperationNotes,
				
				
				
			},
			success : function(html, textStatus){
				$("#listInvoiceTable").html(html);
			},
			error : function(xht, textStatus, errorThrown){
				alert("Error : " + errorThrown);
			}
	});
}
// 4 REMOVE AN ITEM
function removeOnInv(removeTransaction)
{
	//var txt;
    var r = confirm("Are you sure you want to remove this item from the list");
    if (r == true)
		{
      //  txt = "You pressed OK!";
    
	
	
	var InvoinceNo = document.getElementById('InvoinceNo').value;
	var DocNo = document.getElementById('DocNo').value;
	
	$.ajax({
			type : "GET",
			url : "adminscript.php",
			dataType : "html",
			cache : "false",
			data : {
				
				removeTransaction : removeTransaction,
				InvoinceNo : InvoinceNo,
				DocNo : DocNo,
				
			},
			success : function(html, textStatus){
				$("#listInvoiceTable").html(html);
			},
			error : function(xht, textStatus, errorThrown){
				alert("Error : " + errorThrown);
			}
	});
	
	}
	else 
	{
       // txt = "You pressed Cancel!";
    }
    //document.getElementById("demo").innerHTML = txt;
	
}
// 5 INVOICE ITEM TOTAL
function invoiceTotal(){
	var unityPriceToAdd = document.getElementById('InvioceUnityPrice').value;
	var invoiceQtyToAdd = document.getElementById('InvoiceQty').value;
	
	var totalPrice = unityPriceToAdd * invoiceQtyToAdd;
	document.getElementById("invoiceTotalPrice").innerHTML = '<input class="form-control" value="'+totalPrice+'"disabled/><span class="input-group-addon">RWF</span>';
	
}
// 5 INVOICE ITEM TOTAL
function purchaseTotal(){
	var unityPriceToAdd = document.getElementById('unityPrice').value;
	var invoiceQtyToAdd = document.getElementById('qty').value;
	
	var totalPrice = unityPriceToAdd * invoiceQtyToAdd;
	document.getElementById("purchaseTotalPrice").innerHTML = '<input class="form-control" value="'+totalPrice+'"disabled/><span class="input-group-addon">RWF</span>';
	
}

function bringPrint(){ 
	var InvoinceNo = document.getElementById('InvoinceNo').value;
	document.getElementById("printInvoice").innerHTML = '<button type="button" class="btn btn-danger waves-effect" data-dismiss="modal">Close</button> <a href="invoices.php?invoiceNo='+InvoinceNo+'" class="btn btn-inverse waves-effect waves-light"><i class="fa fa-print"></i></button>';
}						
</script>
<script>
function itemInfo(itemInfoId){ 
$.ajax({
			type : "GET",
			url : "adminscript.php",
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

 <script src="assets/plugins/select2/dist/js/select2.min.js" type="text/javascript"></script>
 <script type="text/javascript" src="assets/plugins/jquery-multi-select/jquery.multi-select.js"></script>
<script>
//multiselect start

$('#my_multi_select1').multiSelect();
$('#my_multi_select2').multiSelect({
	selectableOptgroup: true
});

$('#my_multi_select3').multiSelect({
	selectableHeader: "<input type='text' class='form-control search-input' autocomplete='off' placeholder='search...'>",
	selectionHeader: "<input type='text' class='form-control search-input' autocomplete='off' placeholder='search...'>",
	afterInit: function (ms) {
		var that = this,
			$selectableSearch = that.$selectableUl.prev(),
			$selectionSearch = that.$selectionUl.prev(),
			selectableSearchString = '#' + that.$container.attr('id') + ' .ms-elem-selectable:not(.ms-selected)',
			selectionSearchString = '#' + that.$container.attr('id') + ' .ms-elem-selection.ms-selected';

		that.qs1 = $selectableSearch.quicksearch(selectableSearchString)
			.on('keydown', function (e) {
				if (e.which === 40) {
					that.$selectableUl.focus();
					return false;
				}
			});

		that.qs2 = $selectionSearch.quicksearch(selectionSearchString)
			.on('keydown', function (e) {
				if (e.which == 40) {
					that.$selectionUl.focus();
					return false;
				}
			});
	},
	afterSelect: function () {
		this.qs1.cache();
		this.qs2.cache();
	},
	afterDeselect: function () {
		this.qs1.cache();
		this.qs2.cache();
	}
});



// Select2
jQuery(".select2").select2({
	width: '100%'
});

</script>

	</body>

<!-- Mirrored from moltran.coderthemes.com/dark/tables-editable.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 10 Apr 2016 14:12:50 GMT -->
</html>