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
    <link rel="stylesheet" type="text/css" href="assets/css/index9.css" />
    <!--[if IE]>
    <style>.form-category .icon {display: none;}</style>
    <![endif]--> 
    <link rel="stylesheet" type="text/css" href="assets/css/quick-view.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/responsive9.css" />
    <title>INVEST</title>
</head>
<body class="home market-home">
<!-- HEADER -->
<?php include("header.php");?>
<!-- end header -->
<!-- Home slideder-->


<!---->
<div class="content-page">
    <div class="container">
        <div class="product-single main-product">
            <div class="navbar nav-menu">
                <div class="navbar-label"><h3 class="title"><span class="icon fa fa-star"></span><span class="label-prod">INVESTMENTS IN RWANDA</span></h3></div>
            </div>
            <div class="tab-container">
                <div id="tab-1" class="tab-panel active">
                    <ul class="product-list owl-carousel" data-dots="false" data-loop="true" data-nav = "true" data-margin = "0" data-autoplayTimeout="1000" data-autoplayHoverPause = "true" data-responsive='{"0":{"items":1},"480":{"items":2}, "991":{"items":3},"1200":{"items":4}}'>
                     <?php
							include ("db.php");
							$sql2 = $db->query("SELECT * FROM `items1` ORDER BY itemId DESC");
							while($row = mysqli_fetch_array($sql2))
								{
									$postTitle = $row['itemName'];
									//$priceStatus = $row['unit'];
									$price = $row['unitPrice'];
									//$postDeadline = $row['postDeadline'];
									echo'   <li class="item">
															<div class="left-block">
                                <a href="post.php?postId='.$row['itemId'].'">
                                    <img class="img-responsive" alt="'.$postTitle.'" src="products/'.$row['itemId'].'.jpg"/>
                                </a>
                                <br/><br/>
                                <div class="add-to-cart">
                                    <a title="Add to Cart" class="" href="post.php?postId='.$row['itemId'].'">View</a>
                                </div>
                            </div>
                            <div class="right-block">
                                <div class="left-p-info">
                                    <h5 class="product-name"><a href="post.php?postId='.$row['itemId'].'">'.$postTitle.'</a></h5>
                                    <div class="product-star">
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                    </div>
                                </div>
                                <div class="content_price">
                                    <span class="price product-price">'.number_format($price).' Rwf</span>
                                </div>
                            </div>
							<div class="right-block">
                                <div class="left-p-info">
                                    <h5 class="product-name">Ending:</h5>
                                    
                                </div>
                                <div class="content_price">
                                    
                                </div>
                            </div>
                        </li>';}
					 ?>
                     </ul>

                </div>
            </div>
        </div>
       
     </div>
</div>

<a href="#" class="scroll_top" title="Scroll to Top" style="display: inline;">Scroll</a>
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
<script src="js/jquery.js"></script>
<script>
(function cart(){ 
var cart = '1';
	$.ajax({
			type : "GET",
			url : "cartBack.php",
			dataType : "html",
			cache : "false",
			data : {				
				cart : cart,
			},
			success : function(html, textStatus){
				$("#cartDiv").html(html);
			},
			error : function(xht, textStatus, errorThrown){
				alert("Error : " + errorThrown);
			}
	});
})();
</script>
</body>
</html>