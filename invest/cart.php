<?PHP require('db.php');?>
<?php 
// This file is www.developphp.com curriculum material
// Written by Adam Khoury January 01, 2011
$link='';
$steps='';
session_start(); // Start session first thing in script<?php // Session user
// GIVE ME THE SIGNED IN USER IN CASE I NEED TO USE HIM/HER
if (isset($_SESSION["username"])) 
	{
		$username = preg_replace('#[^A-Za-z0-9]#i', '', $_SESSION["username"]);
		$getuserName = $db->query("SELECT * FROM users WHERE loginId='$username'");
		WHILE($row= mysqli_fetch_array($getuserName))
			{
				$doneBy = $row['names'];
			}
		$link.='<a class="next-btn" href="saveorder.php?next=2">Proceed to checkout</a>';
		$steps.='<li class="current-step"><span>01. Summary</span></li>
                                <li><span>02. Payment Options</span></li>
                                <li><span>03. Shipping</span></li>
                                <li><span>04. Payment</span></li>';
	}else{
		$link.='<a class="next-btn" href="login.php?page=cart.php">Sign in</a> <a class="next-btn" href="register.php?page=cart.php">Register</a>'; // filter everything but numbers and letters
		$steps.='<li class="current-step"><span>01. Summary</span></li>
                                <li><span>02. Sign in</span></li>
                                <li><span>03. Payment Options</span></li>
                                <li><span>04. Shipping</span></li>
                                <li><span>05. Payment</span></li>';
	}
?>
<?php
// Script Error Reporting
error_reporting(E_ALL);
ini_set('display_errors', '1');
?>
<?php 
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//       Section 1 (if user attempts to add something to the cart from the product page)
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if (isset($_GET['pid'])) {
    $pid = $_GET['pid'];
	$wasFound = false;
	$i = 0;
	// If the cart session variable is not set or cart array is empty
	if (!isset($_SESSION["cart_array"]) || count($_SESSION["cart_array"]) < 1) { 
	    // RUN IF THE CART IS EMPTY OR NOT SET
		$_SESSION["cart_array"] = array(0 => array("item_id" => $pid, "quantity" => 1));
	} else {
		// RUN IF THE CART HAS AT LEAST ONE ITEM IN IT
		foreach ($_SESSION["cart_array"] as $each_item) { 
		      $i++;
		      while (list($key, $value) = each($each_item)) {
				  if ($key == "item_id" && $value == $pid) {
					  // That item is in cart already so let's adjust its quantity using array_splice()
					  array_splice($_SESSION["cart_array"], $i-1, 1, array(array("item_id" => $pid, "quantity" => $each_item['quantity'] + 1)));
					  $wasFound = true;
				  } // close if condition
		      } // close while loop
	       } // close foreach loop
		   if ($wasFound == false) {
			   array_push($_SESSION["cart_array"], array("item_id" => $pid, "quantity" => 1));
		   }
	}
	header("location: cart.php"); 
    exit();
}
?>
<?php 
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//       Section 2 (if user chooses to empty their shopping cart)
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if (isset($_GET['cmd']) && $_GET['cmd'] == "emptycart") {
    unset($_SESSION["cart_array"]);
}
?>
<?php 
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//       Section 3 (if user chooses to adjust item quantity)
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if (isset($_POST['item_to_adjust']) && $_POST['item_to_adjust'] != "") {
    // execute some code
	$item_to_adjust = $_POST['item_to_adjust'];
	$quantity = $_POST['quantity'];
	$quantity = preg_replace('#[^0-9]#i', '', $quantity); // filter everything but numbers
	if ($quantity >= 100) { $quantity = 99; }
	if ($quantity < 1) { $quantity = 1; }
	if ($quantity == "") { $quantity = 1; }
	$i = 0;
	foreach ($_SESSION["cart_array"] as $each_item) { 
		      $i++;
		      while (list($key, $value) = each($each_item)) {
				  if ($key == "item_id" && $value == $item_to_adjust) {
					  // That item is in cart already so let's adjust its quantity using array_splice()
					  array_splice($_SESSION["cart_array"], $i-1, 1, array(array("item_id" => $item_to_adjust, "quantity" => $quantity)));
				  } // close if condition
		      } // close while loop
	} // close foreach loop
}
?>
<?php 
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//       Section 4 (if user wants to remove an item from cart)
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if (isset($_GET['index_to_remove']) && $_GET['index_to_remove'] != "") {
    // Access the array and run code to remove that array index
 	$key_to_remove = $_GET['index_to_remove'];
	if (count($_SESSION["cart_array"]) <= 1) {
		unset($_SESSION["cart_array"]);
		//echo'it was <=1'.$key_to_remove;
	} else {
		unset($_SESSION["cart_array"]["$key_to_remove"]);
		sort($_SESSION["cart_array"]);
		//echo'it was not <=1'.$key_to_remove;
	}
}//else{echo'do nothing';}
?>
<?php 
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//       Section 5  (render the cart for the user to view on the page)
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
$cartOutput = "";
$cartTotal = "";
$i = 0;
$pp_checkout_btn = '';
$product_id_array = '';
if (!isset($_SESSION["cart_array"]) || count($_SESSION["cart_array"]) < 1) 
{
	$cartOutput = "";
}
else
	{
	// Start PayPal Checkout Button
	$pp_checkout_btn .= '<form action="https://www.paypal.com/cgi-bin/webscr" method="post">
    <input type="hidden" name="cmd" value="_cart">
    <input type="hidden" name="upload" value="1">
    <input type="hidden" name="business" value="you@youremail.com">';
	// Start the For Each loop
	$i = 0; 
   foreach ($_SESSION["cart_array"] as $each_item) 
   { 
		$item_id = $each_item['item_id'];
		$sql = $db->query("SELECT * FROM items1 WHERE itemId='$item_id' LIMIT 1");
		while ($row = mysqli_fetch_array($sql)) {
			$product_name = $row["itemName"];
			$price = $row["unityPrice"];
			$details = $row["description"];
		}
		$pricetotal = $price * $each_item['quantity'];
		$cartTotal = $pricetotal + $cartTotal;
		//echo $cartTotal;
		setlocale(LC_MONETARY, "en_US");
       // $pricetotal = money_format("%10.2n", $pricetotal);
		// Dynamic Checkout Btn Assembly
		$x = $i + 1;
		$pp_checkout_btn .= '<input type="hidden" name="item_name_' . $x . '" value="' . $product_name . '">
        <input type="hidden" name="amount_' . $x . '" value="' . $price . '">
        <input type="hidden" name="quantity_' . $x . '" value="' . $each_item['quantity'] . '">  ';
		// Create the product array variable
		$product_id_array .= "$item_id-".$each_item['quantity'].","; 
		// Dynamic table row assembly
		
		$cartOutput .= "<tr>";
		$cartOutput .= '
		<td class="cart_product">
		<a href="shop-single-product.html"><img src="products/'.$item_id.'.jpg" alt="Product"></a>
		</td>';
		$cartOutput .= '<td class="cart_description">
                                                <p class="product-name"><a href="post.php?postId='.$item_id.'">'.$product_name.'</a></p>
                                                <small><a href="post.php?postId='.$item_id.'">'.$details.'</a></small><br>
                                            </td>';
		$cartOutput .= '<td>' . $price . ' Rwf</td>';
		$cartOutput .= '<td class="qty"><form action="cart.php" method="post">
		
                                                <input class="option-product-qty" name="quantity" type="text" value="' . $each_item['quantity'] . '" size="1" maxlength="2" />
                                                <div class="custom-qty">
                                                    <a class="up" href="order.html#"></a>
                                                    <a class="down" href="order.html#"></a>
                                                </div>
                                           
		<input name="adjustBtn' . $item_id . '" type="submit" value="change" />
		<input name="item_to_adjust" type="hidden" value="' . $item_id . '" />
		</form> </td>';
		$cartOutput .= '<td class="price"><span>' . $pricetotal . ' Rwf</span></td>';
		$cartOutput .= '<td><a href="cart.php?index_to_remove='. $item_id .'" class="fa fa-trash-o">'.$item_id.'</a></td>';
		$cartOutput .= '</tr>';
		$i++; 
    } 
	//setlocale(LC_MONETARY, "en_US");
   // $cartTotal = money_format("%10.2n", $cartTotal);
	$cartTotal = "".$cartTotal." Rwf";
    // Finish the Paypal Checkout Btn
	$pp_checkout_btn .= '
	<form action="peyment.php" method="post">
	<input type="text" name="itemCode" value="' . $item_id . '">
	<input type="text" name="quantity" value="' . $each_item['quantity'] . '">
	</form>';
}

if($i>0)
{
	$itemsarethere = "Your shopping cart contains:  <span>".$i." Product </span> / <a href='cart.php?cmd=emptycart'>Empty</a>";
}
else
{
	$itemsarethere = "Your shopping cart is empty";
}
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="assets/lib/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="assets/lib/font-awesome/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="assets/lib/Linearicons/css/demo.css" />
    <link rel="stylesheet" type="text/css" href="assets/lib/select2/css/select2.min.css" />
    <link rel="stylesheet" type="text/css" href="assets/lib/jquery.bxslider/jquery.bxslider.css" />
    <link rel="stylesheet" type="text/css" href="assets/lib/owl.carousel/owl.carousel.css" />
    <link rel="stylesheet" type="text/css" href="assets/lib/fancyBox/jquery.fancybox.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/animate.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/reset.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/index2.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/quick-view.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/responsive2.css" />
    <title>SSAWASAWA_Cart</title>
</head>
<body class="onsale-product">
    <div class="wrapper">
        <div class="main-page">
            <div class="breadcrumb clearfix">
                <div class="container">
                    <ul class="list-breadcr">
                        <li class="home"><a href="index.php" title="Back to Home">Home</a></li>
                        <li><span>Your shopping cart</span></li>
                    </ul>
                </div>
            </div>
            <div class="page-content">
                <!-- Column left -->
                <div class="container">
                    <div class="page-title">
                        <h3 class="title">Shopping cart</h3>
                    </div>
                    <div class="row-none">
                        <!-- Main content -->
                        <div class="page-order">
                            <ul class="step clearfix"><?php echo $steps;?>
                            </ul>
                            <div class="heading-counter warning"><?php echo $itemsarethere;?>
                            </div>
                            <div class="order-detail-content">
                                <table class="table table-bordered table-responsive cart_summary">
                                    <thead>
                                        <tr>
                                            <th class="cart_product">Product</th>
                                            <th>Description</th>
                                            <th>Unit price</th>
                                            <th>Qty</th>
                                            <th>Total</th>
                                            <th  class="action">Remove </th>
                                        </tr>
                                    </thead>
                                    <tbody>
										<?php echo $cartOutput;?>
									</tbody>
                                    <tfoot>
                                        <tr>
                                            <td colspan="2" rowspan="2"></td>
                                            <td colspan="3">Total products</td>
                                            <td colspan="2"><?php echo $cartTotal;?></td>
                                        </tr>
                                        <tr>
                                            <td colspan="3"><strong>Total</strong></td>
                                            <td colspan="2"><strong><?php echo $cartTotal;?></strong></td>
                                        </tr>
                                    </tfoot>    
                                </table>
                                <div class="cart_navigation">
                                    <a class="prev-btn" href="index.php">Continue shopping</a>
                                    <?php echo $link;?>
                                </div>
                            </div>
                        </div>
                        <!-- End Main content -->
                    </div>
                </div>
            </div>
            <!-- end part -->
        </div>
        <a href="order.html#" class="scroll_top" title="Scroll to Top" style="display: inline;">Scroll</a>
    </div>
<!-- Script-->
<script type="text/javascript" src="assets/lib/jquery/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="assets/lib/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="assets/lib/select2/js/select2.min.js"></script>
<script type="text/javascript" src="assets/lib/jquery.bxslider/jquery.bxslider.min.js"></script>
<script type="text/javascript" src="assets/lib/owl.carousel/owl.carousel.min.js"></script>
<script type="text/javascript" src="assets/lib/jquery.countdown/jquery.countdown.min.js"></script>
<script type="text/javascript" src="assets/lib/fancyBox/jquery.fancybox.js"></script>
<script type="text/javascript" src="assets/lib/jquery.elevatezoom.js"></script>
<script type="text/javascript" src="assets/js/theme-script.js"></script>
<script type="text/javascript" src="assets/js/equalheight.js"></script>

</body>
</html>