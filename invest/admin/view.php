<!doctype html>
<!--[if lte IE 9]> <html class="lte-ie9" lang="en"> <![endif]-->
<!--[if gt IE 9]><!--> <html lang="en"> <!--<![endif]-->
<?php include("userheader.php");?>
<?php
if(isset($_GET['viewid']))
{
	$viewid = $_GET['viewid'];
	$sqlview = $db->query("SELECT * FROM clients where id = '$viewid'");
	while($row = mysqli_fetch_array($sqlview))
	{
		$title = $row['title'];
		$surname = $row['surname'];
		$otherNames = $row['otherNames'];
		$dob = $row['dob'];
		$gender = $row['gender'];
		$nidPassport = $row['nidPassport'];
		$nationality = $row['nationality'];
		$postalLine1 = $row['postalLine1'];
		$postalLine2 = $row['postalLine2'];
		$phyisicalLine3 = $row['phyisicalLine3'];
		$postCode = $row['postCode'];
		$city = $row['city'];
		$country = $row['country'];
		$taxCode = $row['taxCode'];
		$residentIn = $row['residentIn'];
		$telephone = $row['telephone'];
		$fax = $row['fax'];
		$email = $row['e-mail'];
		$bankName = $row['bankName'];
		$branch = $row['branch'];
		$accountNumber = $row['accountNumber'];
		$csdAccount= $row['csdAccount'];
	}
	$sqlImg = $uplusdb->query("SELECT * FROM investments WHERE requestId = '$viewid'");
	$rowImg = mysqli_fetch_array($sqlImg);
	$imgId = $rowImg['userId'];
}?>
    <div id="page_content">
        <div id="page_content_inner">
			<table width="100%" >
				<tr>
					<td width="10%"><img src="../assets/images/bnr.jpg"></td>
					<td width="65%">
						<center >
							<h2><b>Central Securities Depository - Rwanda</h2>
							<h4>Securities Account Opening/Update Form - Individuals: No <b>12345</b></h4>
						</center>
					</td>
					<td width="15%"><img src="../../uplusProd/temp/investor<?php echo $imgId;?>.jpeg" width="300" height="100"></td>
				<tr>
			</table>
			<hr style="margin: unset;">
			</b>
            <div class="uk-grid uk-grid-medium" data-uk-grid-margin>
                <div class="uk-width-large-4-4">
                    <div class="md-card uk-margin-medium-bottom">
                        <div class="md-card-content">
							<center><h3 style="margin: unset; color:#b1461b;"><b>To be completed in BLOCK LETTERS</b></h3></center>
							<table width="100%" border="1" style="border-spacing: unset;">
								<tr>
									<td><b>Primary Applicant</b></td>
								</tr>
								<tr>
									<td>
										<table width="100%">
											<tr>
												<td>
													<table>
														<tr>
															<td width="5%">Title:<br><input value="<?php echo $title;?>" disabled></td>
															<td width="65%">Surname:<br><input value="<?php echo $surname;?>" disabled></td>
															<td width="30%">OtherName:<br><input value="<?php echo $otherNames;?>" disabled></td>
														</tr>
													</table>
												</td>
											</tr>
											<tr>
												<td>
													<table>
														<tr>
															<td width="30%">Date Of Birth:<br><input value="<?php echo $dob;?>" disabled></td>
															<td width="20%">Gender:<br><input value="<?php echo $gender;?>" disabled></td>
															<td width="40%">National ID/Passport No:<br><input value="<?php echo $nidPassport;?>" disabled></td>
															<td width="30%">Nationality:<br><input value="<?php echo $nationality;?>" disabled></td>
														</tr>
													</table>
												</td>
											</tr>
											<tr><td></td></tr>
											<tr><td></td></tr>
										</table>
									</td>
							</table>
<br>

<div id="csd"><button onclick="approved()">Approved</button>
<button>Declined</button>
</div>
<button onClick="window.print()" class="md-btn"><i class="material-icons">print</i></button>

						</div>
                    </div>
                </div>
            </div>
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

    <!-- page specific plugins -->
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
    
     <!-- page specific plugins -->
    <!-- d3 -->
    <script src="bower_components/d3/d3.min.js"></script>
    <!-- c3.js (charts) -->
    <script src="bower_components/c3js-chart/c3.min.js"></script>
    
    <!--  charts functions -->
    <script src="assets/js/pages/plugins_charts.min.js"></script>
    
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
<script>
	function approved(){
		document.getElementById('csd').innerHTML = 'CSD Account Number:<input type="text" id="csdnumber"><button onclick="saveCsd()">Approve</button>';
	}
	function saveCsd(){
		var csdnumber =$("#csdnumber").val();	
		if (csdnumber == null || csdnumber == "") {
			alert("csdnumber must be filled out");
			return false;
		}
		document.getElementById('csd').innerHTML = 'Approved <input type="checkbox" value="check"><br>CSD Account Number: '+csdnumber;
	}
</script>
</body>
</html>
<!-- Localized -->