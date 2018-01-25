<?php // Destry session if it hasn't been used for 15 minute.
session_start();
	
if (!isset($_SESSION["username"])) {
 header("location: ../login.php"); 
    exit();
}
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
		Or<p><a href='../pages/logout.php'>Click Here to login again</a></p>
		
		";
	    exit();
	}
?>

<?php
//error_reporting(0);
if(isset($_POST['add']))
{
	$cat_name = $_POST['cat_name'];
	$cat_desc = $_POST['cat_desc'];
	include ("../db.php");
	$sql = $db->query("INSERT INTO `productcategory`(`catNane`, `catDesc`) 
	VALUES ('$cat_name', '$cat_desc')")or die (mysqli_error());
	header("location: admin.php");
	}
	elseif(isset($_POST['edit']))
	{
		$cat_id = $_POST['cat_id'];
		$cat_name = $_POST['cat_name'];
		$cat_desc = $_POST['cat_desc'];
		include ("../db.php");
		$sql = $db->query("UPDATE productcategory SET catNane = '$cat_name', catDesc= '$cat_desc' WHERE catId = '$cat_id'")or die (mysqli_error());
		header("location: admin.php");
	}
	
if(isset($_POST['adds']))
{
	$CatCode = $_POST['CatCode'];
	$subCatName = $_POST['subCatName'];
	$subCatDesc = $_POST['subCatDesc'];
	include ("../db.php");
	$sql = $db->query("INSERT INTO productsubcategory(subCatName, subCatDesc, CatCode) 
	VALUES ('$subCatName', '$subCatDesc', '$CatCode')")or die (mysqli_error());
	header("location: admin.php");
	}
	elseif(isset($_POST['edits']))
	{
		$subCatId = $_POST['subCatId'];
		$subCatName = $_POST['subCatName'];
		$subCatDesc = $_POST['subCatDesc'];
		include ("../db.php");
		$sql = $db->query("UPDATE productsubcategory SET subCatName = '$subCatName', subCatDesc= '$subCatDesc' WHERE subCatId = '$subCatId'")or die (mysqli_error());
		header("location: admin.php");
	}

// Add product	
if(isset($_POST['addp']))
{
	$productName = $_POST['productName'];
	$subCatCode = $_POST['subCatCode'];
	$productDesc = $_POST['productDesc'];
	echo $productName;
	echo '<br/>';
	echo $subCatCode;
	echo '<br/>';
	echo $productDesc;
	echo '<br/>';
	include ("../db.php");
	$sql = $db->query("INSERT INTO products(productName, productDesc, subCatCode, unit, status, createDate_By) 
	VALUES ('$productName', '$productDesc', '$subCatCode', '10', 'Active', 'me')")or die (mysqli_error());
	header("location: admin.php");
	}
// Edit product
	elseif(isset($_POST['editp']))
	{
		$productId = $_POST['productId'];
		$productName = $_POST['productName'];
		$productDesc = $_POST['productDesc'];
		include ("../db.php");
		$sql = $db->query("UPDATE products SET productName = '$productName', productDesc= '$productDesc' WHERE productId = '$productId'")or die (mysqli_error());
		header("location: admin.php");
	}
?>
<!doctype html>
<!--[if lte IE 9]> <html class="lte-ie9" lang="en"> <![endif]-->
<!--[if gt IE 9]><!--> <html lang="en"> <!--<![endif]-->
<?php include'header.php' ;?>
	<!-- main sidebar -->
   
     <div id="page_content">
        <div id="page_content_inner">

            <div class="uk-width-medium-8-10 uk-container-center reset-print">
                <div class="uk-grid uk-grid-collapse" data-uk-grid-margin>
                    <div class="uk-width-large-7-10">
                        <div class="md-card md-card-single main-print" id="invoice">
                            <div id="invoice_preview"></div>
                            <div id="invoice_form"></div>
                        </div>
                    </div>
                    <div class="uk-width-large-3-10 hidden-print uk-visible-large">
                        <div class="md-list-outside-wrapper">
                            <ul class="md-list md-list-outside invoices_list" id="invoices_list">
    
                                <li class="heading_list">October 2016</li>

        
                                <li>
                                    <a href="#" class="md-list-content" data-invoice-id="2">
                                        <span class="md-list-heading uk-text-truncate">Invoice 190/2015 <span class="uk-text-small uk-text-muted">(18 Oct)</span></span>
                                        <span class="uk-text-small uk-text-muted">Russel, Bogisich and Barrows</span>
                                    </a>
                                </li>

                    </ul>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <div id="sidebar_secondary">
        <div class="sidebar_secondary_wrapper uk-margin-remove"></div>
    </div>

    <script id="invoice_template" type="text/x-handlebars-template">
        <div class="md-card-toolbar{{#if invoice.header}} hidden-print{{/if}}">
            <div class="md-card-toolbar-actions hidden-print">
                <i class="md-icon material-icons" id="invoice_print">&#xE8ad;</i>
                <div class="md-card-dropdown" data-uk-dropdown="{pos:'bottom-right'}">
                    <i class="md-icon material-icons">&#xE5D4;</i>
                    <div class="uk-dropdown uk-dropdown-small">
                        <ul class="uk-nav">
                            <li><a href="#">Archive</a></li>
                            <li><a href="#" class="uk-text-danger">Remove</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <h3 class="md-card-toolbar-heading-text large" id="invoice_name">
                Invoice {{invoice.invoice_number}}
            </h3>
        </div>
        <div class="md-card-content invoice_content print_bg{{#if invoice.footer}} invoice_footer_active{{/if}}">
            {{#if invoice.header}}
                <div class="invoice_header md-bg-blue-grey-500">
                    <img src="assets/img/logo_light.png" alt="" height="30" width="140"/>
                    <img class="uk-float-right" src="assets/img/others/html5-css-javascript-logos.png" alt="" height="80" width="205"/>
                </div>
            {{/if}}
            <div class="uk-margin-medium-bottom">
                {{#if invoice.header}}
                <h3 class="heading_a uk-margin-bottom"> Invoice {{invoice.invoice_number}} </h3>
                {{/if}}
                <span class="uk-text-muted uk-text-small uk-text-italic">Date:</span> {{invoice.invoice_date}}
                <br/>
                <span class="uk-text-muted uk-text-small uk-text-italic">Due Date:</span> <span {{#if invoice.overdue}} class="uk-text-danger uk-text-bold"{{/if}}>{{invoice.invoice_due_date}}</span>
            </div>
            <div class="uk-grid" data-uk-grid-margin>
                <div class="uk-width-small-3-5">
                    <div class="uk-margin-bottom">
                        <span class="uk-text-muted uk-text-small uk-text-italic">From:</span>
                        <address>
                            <p><strong>{{invoice.invoice_from_company}}</strong></p>
                            <p>{{invoice.invoice_from_address_1}}</p>
                            <p>{{invoice.invoice_from_address_2}}</p>
                        </address>
                    </div>
                    <div class="uk-margin-medium-bottom">
                        <span class="uk-text-muted uk-text-small uk-text-italic">To:</span>
                        <address>
                            <p><strong>{{invoice.invoice_to_company}}</strong></p>
                            <p>{{invoice.invoice_to_address_1}}</p>
                            <p>{{invoice.invoice_to_address_2}}</p>
                        </address>
                    </div>
                </div>
                <div class="uk-width-small-2-5">
                    <span class="uk-text-muted uk-text-small uk-text-italic">Total:</span>
                    <p class="heading_b {{#if invoice.overdue}}uk-text-danger{{else}}uk-text-success{{/if}}">{{invoice.invoice_total_value}}</p>
                    <p class="uk-text-small uk-text-muted uk-margin-top-remove">Incl. VAT -
                        {{invoice.invoice_vat_value}}</p>
                </div>
            </div>
            <div class="uk-grid uk-margin-large-bottom">
                <div class="uk-width-1-1">
                    <table class="uk-table">
                        <thead>
                            <tr class="uk-text-upper">
                                <th>Description</th>
                                <th>Rate</th>
                                <th class="uk-text-center">Hours</th>
                                <th class="uk-text-center">Vat</th>
                                <th class="uk-text-center">Total</th>
                            </tr>
                        </thead>
                        <tbody>
                        {{#each invoice.invoice_services}}
                        <tr class="uk-table-middle">
                                <td>
                                    <span class="uk-text-large">{{ service_name }}</span><br/>
                                    <span class="uk-text-muted uk-text-small">{{ service_description }}</span>
                                </td>
                                <td>
                                    {{ service_rate }}
                                </td>
                                <td class="uk-text-center">
                                    {{ service_hours }}
                                </td>
                                <td class="uk-text-center">
                                    {{ service_vat }}
                                </td>
                                <td class="uk-text-center">
                                    {{ service_total }}
                                </td>
                            </tr>
                        {{/each}}
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="uk-grid">
                <div class="uk-width-1-1">
                    <span class="uk-text-muted uk-text-small uk-text-italic">Payment to:</span>
                    <p class="uk-margin-top-remove">
                        {{{ invoice.invoice_payment_info }}}
                    </p>
                    <p class="uk-text-small">Please pay within {{ invoice.invoice_payment_due }} days</p>
                </div>
            </div>
            {{#if invoice.footer}}
            <div class="invoice_footer">
                Wuckert, Schiller and Labadie<span>&middot;</span>39627 Bridgette Alley
New Imani, NM 40394<br>
                </span>+93(7)3004546335<span>&middot;</span>hilda.kutch@gmail.com            </div>
            {{/if}}
        </div>
    </script>

    <script id="invoice_form_template" type="text/x-handlebars-template">
        <form action="" class="uk-form-stacked">
            <div class="md-card-toolbar">
                <div class="md-card-toolbar-actions">
                    <i class="md-icon material-icons">&#xE161;</i>
                </div>
                <input name="invoice_number" id="invoice_number" class="md-card-toolbar-input" type="text" value="" placeholder="Invoice number" />
            </div>
            <div class="md-card-content large-padding">
                <div class="uk-grid" data-uk-grid-margin>
                    <div class="uk-width-medium-1-2">
                        <label class="uk-form-label" for="hobbies">Issue date:</label>
                        <div class="uk-input-group">
                            <span class="uk-input-group-addon"><i class="uk-input-group-icon uk-icon-calendar"></i></span>
                            <label for="invoice_dp">Select date</label>
                            <input class="md-input" type="text" id="invoice_dp" value="" data-uk-datepicker="{format:'DD.MM.YYYY'}">
                        </div>
                    </div>
                    <div class="uk-width-medium-1-2">
                        <label class="uk-form-label uk-margin-bottom" for="hobbies">Due date (days):</label>
                        <span class="icheck-inline">
                            <input type="radio" name="invoice_due_date" id="invoice_due_date_7" data-md-icheck />
                            <label for="invoice_due_date_7" class="inline-label">7</label>
                        </span>
                        <span class="icheck-inline">
                            <input type="radio" name="invoice_due_date" id="invoice_due_date_14" data-md-icheck />
                            <label for="invoice_due_date_14" class="inline-label">14</label>
                        </span>
                        <span class="icheck-inline">
                            <input type="radio" name="invoice_due_date" id="invoice_due_date_21" data-md-icheck />
                            <label for="invoice_due_date_21" class="inline-label">21</label>
                        </span>
                    </div>
                </div>
                <div class="uk-grid uk-grid-divider grid-block" data-uk-grid-margin>
                    <div class="uk-width-medium-1-2">
                        <label class="uk-form-label uk-margin-bottom" for="hobbies">From:</label>
                        <div class="uk-form-row">
                            <label for="invoice_from_company">Company Name</label>
                            <input type="text" class="md-input" id="invoice_from_company" name="invoice_from_company"/>
                        </div>
                        <div class="uk-form-row">
                            <label for="invoice_from_address_1">Address 1</label>
                            <input type="text" class="md-input" id="invoice_from_address_1" name="invoice_from_address_1" />
                        </div>
                        <div class="uk-form-row">
                            <label for="invoice_from_address_2">Address 2</label>
                            <input type="text" class="md-input" id="invoice_from_address_2" name="invoice_from_address_2" />
                        </div>
                    </div>
                    <div class="uk-width-medium-1-2">
                        <label class="uk-form-label uk-margin-bottom" for="hobbies">To:</label>
                        <div class="uk-form-row">
                            <label for="invoice_to_company">Company Name</label>
                            <input type="text" class="md-input" id="invoice_to_company" name="invoice_to_company"/>
                        </div>
                        <div class="uk-form-row">
                            <label for="invoice_to_address_1">Address 1</label>
                            <input type="text" class="md-input" id="invoice_to_address_1" name="invoice_to_address_1" />
                        </div>
                        <div class="uk-form-row">
                            <label for="invoice_to_address_2">Address 2</label>
                            <input type="text" class="md-input" id="invoice_to_address_2" name="invoice_to_address_2" />
                        </div>
                    </div>
                </div>
                <div class="uk-grid" data-uk-grid-margin>
                    <div class="uk-width-1-1">
                        <div id="form_invoice_services"></div>
                        <div class="uk-text-center uk-margin-medium-top uk-margin-bottom">
                            <a href="#" class="md-btn md-btn-flat md-btn-flat-primary" id="invoice_form_append_service_btn">Add new</a>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </script>
    <script id="invoice_form_template_services" type="text/x-handlebars-template">
        {{#ifCond invoice_service_id '!==' 1}}
        <hr class="md-hr"/>
        {{/ifCond}}
        <div class="uk-grid" data-uk-grid-margin data-service-number="{{invoice_service_id}}">
            <div class="uk-width-medium-1-10 uk-text-center">
                <p class="uk-text-large">{{invoice_service_id}}.</p>
            </div>
            <div class="uk-width-medium-9-10">
                <div class="uk-grid uk-grid-small" data-uk-grid-margin>
                    <div class="uk-width-medium-5-10">
                        <label for="inv_service_{{invoice_service_id}}">Service Name</label>
                        <input type="text" class="md-input" id="inv_service_{{invoice_service_id}}" name="inv_service_id_{{invoice_service_id}}" />
                    </div>
                    <div class="uk-width-medium-1-10">
                        <label for="inv_service_{{invoice_service_id}}_rate">Rate</label>
                        <input type="text" class="md-input" id="inv_service_{{invoice_service_id}}_rate" name="inv_service_{{invoice_service_id}}_rate" />
                    </div>
                    <div class="uk-width-medium-1-10">
                        <label for="inv_service_{{invoice_service_id}}_hours">Hours</label>
                        <input type="text" class="md-input" id="inv_service_{{invoice_service_id}}_hours" name="inv_service_{{invoice_service_id}}_hours" />
                    </div>
                    <div class="uk-width-medium-1-10">
                        <label for="inv_service_{{invoice_service_id}}_vat">VAT</label>
                        <input type="text" class="md-input" id="inv_service_{{invoice_service_id}}_vat" name="inv_service_{{invoice_service_id}}_vat" />
                    </div>
                    <div class="uk-width-medium-2-10">
                        <label for="inv_service_{{invoice_service_id}}_vat">Total</label>
                        <input type="text" class="md-input" id="inv_service_{{invoice_service_id}}_vat" name="inv_service_{{invoice_service_id}}_vat" readonly/>
                    </div>
                </div>
                <div class="uk-grid" data-uk-grid-margin>
                    <div class="uk-width-medium-1-1">
                        <label for="inv_service_{{invoice_service_id}}_desc">Description</label>
                        <textarea class="md-input" id="inv_service_{{invoice_service_id}}_desc" name="invoice_service_id_{{invoice_service_id}}_desc" cols="30" rows="2"></textarea>
                    </div>
                </div>
            </div>
        </div>
    </script>

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
    <!-- handlebars.js -->
    <script src="bower_components/handlebars/handlebars.min.js"></script>
    <script src="assets/js/custom/handlebars_helpers.min.js"></script>

    <!--  invoices functions -->
    <script src="assets/js/pages/page_invoices.min.js"></script>
    

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
<script> <!--1 Load cat in the cat to edit-->

</script>
</body>
</html>