<?php
if(isset($_GET['postId']))
{
	$postId = $_GET['postId'];
	//echo $postId;
    include("db.php");
	$sql = $db->query("
	SELECT I.itemId, I.itemName, I.description, I.inDate, I.itemCompanyCode, I.productCode,
    
    IFNULL((SELECT SUM(T.`qty`) FROM `bids` T WHERE `operation`='In' AND itemCode = '$postId' AND T.`itemCode` = I.`itemId`),0) -
IFNULL((SELECT SUM(T.`qty`) FROM `bids` T WHERE `operation`='Out' AND itemCode = '$postId' AND T.`itemCode` = I.`itemId`),0)  Balance
,I.`unit`, I.`unityPrice`   
FROM `items1` I WHERE  itemId = '$postId'
");
	while($row = mysqli_fetch_array($sql))
	{
		$postTitle = $row['itemName'];
		$quantity = $row['Balance'];
		$price = $row['unityPrice'];
		$priceStatus = $row['unit'];
		$postDesc = $row['description'];
		$postedDate = $row['inDate'];
		$postedBy = $row['itemCompanyCode'];
		$productCode = $row['productCode'];
        //echo '<br/>productCode'.$productCode;
	}

	// Related ITEMS
	$relatedItems="";
	
	$getrelatedItems = $db->query("
		SELECT I.`itemId`, I.`itemName`, I.description, I.inDate, I.itemCompanyCode, I.productCode,
	
		IFNULL((SELECT SUM(T.`qty`) FROM `bids` T WHERE `operation`='In' AND T.`itemCode` = I.`itemId`),0) -
		IFNULL((SELECT SUM(T.`qty`) FROM `bids` T WHERE `operation`='Out' AND T.`itemCode` = I.`itemId`),0)  Balance
		,I.`unit`, I.`unityPrice`	
		FROM `items1` I  WHERE `productCode` = '$productCode' AND itemId != '$postId' LIMIT 3");
	$countRelated = mysqli_num_rows($getrelatedItems);
	if($countRelated > 0)
	{
		while($row = mysqli_fetch_array($getrelatedItems))
		{
			$relatedItems.='<li class="item">
								<div class="left-block">
									<a href="post.php?postId='.$row['itemId'].'">
										<img class="img-responsive" alt="'.$row['itemName'].'" src="products/'.$row['itemId'].'.jpg" />
									</a>
								</div>
								<div class="right-block">
									<div class="left-p-info">
										<h5 class="product-name"><a href="post.php?postId='.$row['itemId'].'">'.$row['itemName'].'</a></h5>
										<div class="product-star">
											<i class="fa fa-star-o"></i>
											<i class="fa fa-star-o"></i>
											<i class="fa fa-star-o"></i>
											<i class="fa fa-star-o"></i>
											<i class="fa fa-star-o"></i>
										</div>
									</div>
									<div class="content_price">
										<span class="price product-price">'.number_format($row['unityPrice']).'Rwf/ '.$row['unit'].'</span>
									</div>
								</div>
							</li>
						   ';
		}	
	}else
	{
		$relatedItems.='<li class="item">
				No related Items!
			</li>';
	}
	
	// Company INFO
	$getcompany=$db->query("SELECT * FROM `company1` WHERE `companyId` = '$postedBy'");
	while($row = mysqli_fetch_array($getcompany))
	{
		$companyId = $row['companyId'];
		$companyName = $row['companyName'];
		$companyDescription = $row['companyDescription'];
		$location = $row['location'];
		$businessType = $row['businessType'];
		$dateIn = $row['dateIn'];
	}
	
	// ITEMS IN THE SAME COMPANY
	$samecompany="";
	$getsamecompant = $db->query("
		SELECT I.`itemId`, I.`itemName`, I.description, I.inDate, I.itemCompanyCode, I.productCode,
	
		IFNULL((SELECT SUM(T.`qty`) FROM `bids` T WHERE `operation`='In' AND `itemCompanyCode` = '$postedBy' AND T.`itemCode` = I.`itemId`),0) -
		IFNULL((SELECT SUM(T.`qty`) FROM `bids` T WHERE `operation`='Out' AND `itemCompanyCode` = '$postedBy' AND T.`itemCode` = I.`itemId`),0)  Balance
		,I.`unit`, I.`unityPrice`	
		FROM `items1` I  WHERE `itemCompanyCode` = '$postedBy' AND itemId != '$postId' LIMIT 3");
	$countsame = mysqli_num_rows($getsamecompant);
	if($countsame > 0)
	{
		while($row = mysqli_fetch_array($getsamecompant))
		{
			$samecompany.=' <li>
                                            <div class="left-block">
                                                <a href="post.php?postId='.$row['itemId'].'">
                                                    <img class="img-responsive" alt="'.$row['itemName'].'" src="products/'.$row['itemId'].'.jpg" />
                                                </a>
                                                <div class="action">
                                                    <a title="Add to my wishlist" class="heart fa fa-heart" href="post.php?postId='.$row['itemId'].'"></a>
                                                    <a title="Add to compare" class="compare fa fa-retweet" href="post.php?postId='.$row['itemId'].'"></a>
                                                    <a title="Quick view" class="search quickview fa fa-arrows" href="post.php?postId='.$row['itemId'].'"></a>
                                                </div>
                                                <div class="add-to-cart">
                                                    <a title="Add to Cart" class="" href="post.php?postId='.$row['itemId'].'">Add to Cart</a>
                                                </div>
                                                <div class="group-price">
                                                    <span class="product-new">NEW</span>
                                                    <span class="product-sale">Sale</span>
                                                </div>
                                            </div>
                                            <div class="right-block">
                                                <div class="left-p-info">
                                                    <h5 class="product-name"><a href="post.php?postId='.$row['itemId'].'">'.$row['itemName'].'</a></h5>
                                                    <div class="product-star">
                                                        <i class="fa fa-star-o"></i>
                                                        <i class="fa fa-star-o"></i>
                                                        <i class="fa fa-star-o"></i>
                                                        <i class="fa fa-star-o"></i>
                                                        <i class="fa fa-star-o"></i>
                                                    </div>
                                                </div>
                                                <div class="content_price">
                                                    <span class="price old-price">0</span>
                                                    <span class="price product-price">'.number_format($row['Balance']).'Rwf</span>
                                                </div>
                                            </div>
                                        </li>
                                    
						   ';
		}	
	}else
	{
		$relatedItems.='<li class="item">
				No related Items!
			</li>';
	}
	
	// subSubCategory
	$subSubCategory=$db->query("SELECT * FROM `products` WHERE `productId` = '$productCode' LIMIT 1");
	while($row = mysqli_fetch_array($subSubCategory))
	{
		$productName = $row['productName'];
		$subCatCode = $row['subCatCode'];
		// subCategory
		$subCategory=$db->query("SELECT * FROM productsubcategory WHERE `subCatId` = '$subCatCode' LIMIT 1");
		while($row = mysqli_fetch_array($subCategory))
		{
			$subCatName = $row['subCatName'];
			$CatCode = $row['CatCode'];
		
			// category
			$category=$db->query("SELECT * FROM productcategory WHERE `catId` = '$CatCode' LIMIT 1");
			while($row = mysqli_fetch_array($category))
			{
				$catNane = $row['catNane'];
			}
		}
	}
	
}

?><!DOCTYPE html>
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
    <title><?php echo $postTitle;?></title>
	  <script src="js/jquery.js"></script>
</head>
<body class="shop-single-product detail-page" style="font-size: 14px; -webkit-font-smoothing: unset;">
    <div class="wrapper">
	
        <div class="main-page">
            <div class="breadcrumb clearfix" style="background-color: #00897b;">
                <div class="container" >
                    <ul class="list-breadcr">
                        <li class="home"><a href="index.php" title="Back to Home">Shop</a></li>
                        <li><span><?php echo $postTitle;?></span></li>
                    </ul>
                </div>
            </div>
            <div class="page-content">
                <div class="container">
                    <div class="row">
                        <!-- Main content -->
                        <div class="col-lg-9 col-md-9 col-sm-12 detail">
                            <div class="primary-box">
                                <!-- product-imge-->
                                <div class="product-image">
                                  
                                    <div class="product-full">
                                        <img id="product-zoom" src="products/<?php echo $postId;?>.jpg" data-zoom-image="products/<?php echo $postId;?>.jpg" alt="product"/>
                                    </div>
                                </div>
                                <!-- product-imge-->
                            </div>
                            <div class="secondary-box">
                                <h3 class="name"><?php echo $postTitle;?></h3>
                                
                                <div class="rating-review">
                                    <div class="product-star">
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                    </div>
                                    <span class="count-review">
									<?php 
									$sql5 = $db->query("SELECT * FROM `postscomments` WHERE visibilityStatus='Public' AND postCode='$postId' ORDER by commentId DESC") or die(mysqli_error());
							$countReviews = mysqli_num_rows($sql5);
							
							echo $countReviews;?>
							the ask</span>
                                    
                                </div>
							<div id="bidResults">
                                <div class="status-product">
                                    <p class="price"><?php
										$sqlprice = $db->query("SELECT trUnityPrice FROM bids WHERE itemCode='$postId' ORDER BY trUnityPrice DESC LIMIT 1");
										$fetchprice = mysqli_fetch_array($sqlprice);
										$trUnityPrice = $fetchprice['trUnityPrice'];
										if($trUnityPrice == 0){
											echo number_format($price);
										}else{
										echo number_format($trUnityPrice);
										}?> Rwf</p>
                                    <span class="status">Now</span>
                                </div>

                                <div class="short-text">
                                    <p><?php echo $postDesc;?></p>
                                </div>
								<div class="action-detail">
								<input id="bidItemCode" value="<?php echo $postId;?>" type="hidden">
									Name: <input id="bidName"/><br/>
                                    Amount: <input type="number" id="bidAmount" row="4" min="<?Php if($trUnityPrice == 0){
											echo round($price)+100;
										}else{
										echo round($trUnityPrice)+100;
										}?>" value="<?Php if($trUnityPrice == 0){
											echo round($price)+100;
										}else{
										echo round($trUnityPrice)+100;
										}?>" />
									<br>Phone: <input type="number" id="bidNumber" placeholder="+250"/></br>
                                    <div class="action">
                                        <div class="add-to-cart">
                                            <a title="Add to Cart" class="" onclick="bidfx()">Bid</a>
                                        </div>
									</div>
                                </div>
                            </div>
                                <div class="product-data">
                                    <p class="product-code">Product code: #<span><?php echo $postId;?></span></p>
                                    <p class="product-tags">Product tags: 
                                        <a href=""><span><?php echo $catNane;?>,</span></a>
                                        <a href=""><span><?php echo $subCatName;?>,</span></a>
                                        <a href=""><span><?php echo $productName;?></span></a>
                                    </p>
                                </div>
                            </div>
                            <div class="tab-detail">
                                <!-- tab product -->
                                <div class="product-tab">
                                    <ul class="nav-tab">
                                        <li class="active">
                                            <a aria-expanded="false" data-toggle="tab" href="shop-single-product.html#description">Description</a>
                                        </li>
                                        <li>
                                            <a aria-expanded="true" data-toggle="tab" href="shop-single-product.html#specification">Company</a>
                                        </li>
                                        <li>
                                            <a data-toggle="tab" href="shop-single-product.html#reviews">reviews</a>
                                        </li>
                                    </ul>
                                    <div class="tab-container">
                                        <div id="description" class="tab-panel active">
                                            <p><?php echo $postDesc;?>.</p>
                                        </div>
                                        <div id="specification" class="tab-panel">
                                            <table class="table table-bordered">
                                                <tr>
                                                    <td>Company Name</td>
                                                    <td><?php echo $companyName; ?></td>
                                                </tr>
                                                <tr>
                                                    <td>companyDescription</td>
                                                    <td><?php echo $companyDescription; ?></td>
                                                </tr>
                                                <tr>
                                                    <td>location</td>
                                                    <td><?php echo $location; ?></td>
                                                </tr>
												<tr>
                                                    <td>businessType</td>
                                                    <td><?php echo $businessType; ?></td>
                                                </tr>
												<tr>
                                                    <td>dateIn</td>
                                                    <td><?php echo $dateIn; ?></td>
                                                </tr>
                                                <tr>
                                                	<td>Logo</td>
                                                	<td><img src="company/<?php echo $companyId;?>.jpg" height="100"></td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div id="reviews" class="tab-panel">
                                            <div class="product-comments-block-tab">
                                                 <p>
                                                    <div id="newComment">
									<a class="add-review" href="javascript:void()" onclick="initiateComment(postCode=<?php echo $postId;?>)">Add your review</a></div>
                                                </p>
							<?php 
							$n=0;
							$sql4 = $db->query("SELECT * FROM `postscomments` WHERE visibilityStatus='Public' AND postCode='$postId' ORDER by commentId DESC") or die(mysqli_error());
							while($row = mysqli_fetch_array($sql4)){
								$n++;
								$commentCode=$row['commentId'];
							echo'<div class="comment row">
                                                    <div class="col-sm-3 author">
                                                        <div class="grade">
                                                            <span>'.$n.' Grade</span>
                                                            <div class="product-star">
                                                                <i class="fa fa-star-o"></i>
                                                                <i class="fa fa-star-o"></i>
                                                                <i class="fa fa-star-o"></i>
                                                                <i class="fa fa-star-o"></i>
                                                                <i class="fa fa-star-o"></i>
                                                            </div>
                                                        </div>
                                                        <div class="info-author">
                                                            <span><strong>'.$row['commentBy'].'</strong></span>
                                                            <em>04/08/2015</em>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-9 commnet-dettail">
                                                        '.$row['commentNote'].'
													<div id="reply'.$row['commentId'].'">
														<i><a href="javascript:void()" onclick="reply(commentId='.$row['commentId'].', postCode='.$postId.')">Reply</a></i>
													</div>	';
							$f=0;
							$sql5 = $db->query("SELECT * FROM `commentreplies` WHERE visibilityStatus='Public' AND commentCode='$commentCode' ORDER by replyID DESC") or die(mysqli_error());
							while($row = mysqli_fetch_array($sql5))
								{
									$f++;
									echo'.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'.$f.' <b>'.$row['replyBy'].'</b>: '.$row['replyNotes'].'<br/>';
								}
							echo'</div>
                               </div>';
							}
							?>
					
												
                                            </div>
                                        </div>
                                      </div>
                                </div><!-- end tab product -->
                            </div>
                        </div><!-- End Main content -->
                        <!-- Column left -->
                        <div class="col-left col-lg-3 col-md-3 col-sm-12 col-xs-12">
                            <div class="relative-product">
                                <div class="nav-menu custom-menu">
                                    <div class="navbar-label">
                                        <h3 class="title"><span>Related Items</span></h3>
                                    </div>
                                </div>
                                <div class="tab-container custom-product">
                                    <div class="content-product">
                                        <ul class="product-list">
                                            <?php echo $relatedItems;?>
										</ul>
                                    </div>
                                </div>
                            </div>
                            <div class="left-banner">
                                <a href="shop-single-product.html#"><img class="img-responsive" src="assets/images/col-right-banner.jpg" alt="banner"></a>
                            </div>
                            <!-- end Block fillter -->
                        </div><!-- End Column left -->
                    </div>
                    <div class="row">
                        <div class="popular-tabs control col-lg-12 col-md-12">
                            <div class="navbar nav-menu">
                    <!-- Brand and toggle get grouped for better mobile display -->
                                <div class="navbar-label"><h3 class="title"><span>Other Products from <?php echo $companyName; ?></span></h3></div>
                            </div>
                            <div class="tab-container">
                                <div id="tab-1" class="tab-panel active">
                                    <ul class="product-list owl-carousel" data-dots="false" data-loop="true" data-nav = "true" data-margin = "30" data-autoplayTimeout="1000" data-autoplayHoverPause = "true" data-responsive='{"0":{"items":1},"500":{"items":2},"800":{"items":3},"1000":{"items":4}}'>
                                       <?php echo $samecompany;?> 
									</ul>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
         <a href="shop-single-product.html#" class="scroll_top" title="Scroll to Top" style="display: inline;">Scroll</a>
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
<!-- <script type="text/javascript" src="assets/js/equalheight.js"></script> -->
<script> 
<!--1 Load product to Edit-->
function subshow(subshowid){
	//alert(subshowid);
	$.ajax({
			type : "GET",
			url : "scripthome.php",
			dataType : "html",
			cache : "false",
			data : {
				
				subshowid : subshowid,
			},
			success : function(html, textStatus){
				$("#dynamiclist").html(html);
			},
			error : function(xht, textStatus, errorThrown){
				alert("Error : " + errorThrown);
			}
	});
} 
<!--2 Load comment box-->
function initiateComment(postCode)
{
	//alert('yeahp');
	var postCode = postCode;
	var comment = '1';
	$.ajax({
			type : "GET",
			url : "scripthome.php",
			dataType : "html",
			cache : "false",
			data : {
				
				comment : comment,
				postCode : postCode,
			},
			success : function(html, textStatus){
				$("#newComment").html(html);
			},
			error : function(xht, textStatus, errorThrown){
				alert("Error : " + errorThrown);
			}
	});
}<!--5 Load comment box-->
<!-- 3 save comment-->
function saveComment(){
	var commentBy = document.getElementById('commentBy').value;
	var commentNote = document.getElementById('commentNote').value;
	if (commentNote == null || commentNote == "") {
        alert("commentNote must be filled out");
        return false;
    }
	var visibilityStatus = document.getElementById('visibilityStatus').value;
	if (visibilityStatus == null || visibilityStatus == "") {
        alert("visibilityStatus must be filled out");
        return false;
    }
	var postCode = document.getElementById('postCode').value;
	if (postCode == null || postCode == "") {
        alert("postCode must be filled out");
        return false;
    }
	$.ajax({
			type : "GET",
			url : "scripthome.php",
			dataType : "html",
			cache : "false",
			data : {
				
				commentNote : commentNote,
				commentBy : commentBy,
				visibilityStatus : visibilityStatus,
				postCode : postCode,
			},
			success : function(html, textStatus){
				$("#newComment").html(html);
			},
			error : function(xht, textStatus, errorThrown){
				alert("Error : " + errorThrown);
			}
	});
}
<!--4 Load reply box-->
function reply(commentId,postCode)
{
	var commentId = commentId;
	var postCode = postCode;
	$.ajax({
			type : "GET",
			url : "scripthome.php",
			dataType : "html",
			cache : "false",
			data : {
				
				commentId : commentId,
				postCode : postCode,
			},
			success : function(html, textStatus){
				$("#reply"+commentId+"").html(html);
			},
			error : function(xht, textStatus, errorThrown){
				alert("Error : " + errorThrown);
			}
	});
}

<!-- 5 save reply-->
function replyComment(){
	var replyBy = document.getElementById('replyBy').value;
	var postCode = document.getElementById('postCode').value;
	var replyNotes = document.getElementById('replyNote').value;
	if (replyNotes == null || replyNotes == "") {
        alert("replyNotes must be filled out");
        return false;
    }
	var visibilityStatus = document.getElementById('visibilityStatus').value;
	if (visibilityStatus == null || visibilityStatus == "") {
        alert("visibilityStatus must be filled out");
        return false;
    }
	var commentCode = document.getElementById('commentCode').value;
	if (commentCode == null || commentCode == "") {
        alert("commentCode must be filled out");
        return false;
    }
	$.ajax({
			type : "GET",
			url : "scripthome.php",
			dataType : "html",
			cache : "false",
			data : {
				
				replyNotes : replyNotes,
				postCode : postCode,
				replyBy : replyBy,
				visibilityStatus : visibilityStatus,
				commentCode : commentCode,
			},
			success : function(html, textStatus){
				$("#reply"+commentCode+"").html(html);
			},
			error : function(xht, textStatus, errorThrown){
				alert("Error : " + errorThrown);
			}
	});
}
function bidfx(){
	var bidAmount = document.getElementById('bidAmount').value;
	var bidNumber = document.getElementById('bidNumber').value;
	var bidName = document.getElementById('bidName').value;
	var bidItemCode = document.getElementById('bidItemCode').value;
	document.getElementById('bidResults').innerHTML = '<br/><br/><h4>Wait a minute, we are bidding for you ...<h4><br/><br/><br/>';
		$.ajax({
			type : "GET",
			url : "savebid.php",
			dataType : "html",
			cache : "false",
			data : {
				
				bidAmount : bidAmount,
				bidNumber : bidNumber,
				bidName : bidName,
				bidItemCode : bidItemCode,
			},
			success : function(html, textStatus){
				$("#bidResults").html(html);
			},
			error : function(xht, textStatus, errorThrown){
				alert("Error : " + errorThrown);
			}
	});

}
</script>
</body>
</html>