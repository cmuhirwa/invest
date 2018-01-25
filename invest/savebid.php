<?php
if(isset($_GET['bidAmount'])){
	$bidAmount = $_GET['bidAmount'];
	$bidNumber = $_GET['bidNumber'];
	$bidName = $_GET['bidName'];
	$bidItemCode = $_GET['bidItemCode'];
	$results="";
	require_once('classes/sms/AfricasTalkingGateway.php');
	$username   = "cmuhirwa";
	$apikey     = "17700797afea22a08117262181f93ac84cdcd5e43a268e84b94ac873a4f97404";
	
	
	include('db.php');
	$sql = $db->query("
	INSERT INTO `bids`
	(`trUnityPrice`, `itemCode`, `customerName`, `customerRef`, `doneOn`)
	VALUES
	('$bidAmount','$bidItemCode','$bidName','$bidNumber', now())
	");
	$sqlBidName = $db->query("SELECT `itemName` FROM items1 WHERE `itemId` = '$bidItemCode'");
	while($rowBidName = mysqli_fetch_array($sqlBidName)){
		$bidItemName = $rowBidName['itemName'];
		}
	$sqlselectbiders = $db->query("select * from bids where itemCode = '$bidItemCode' AND customerRef <> '$bidNumber' group by customerRef");
	while($rowbider = mysqli_fetch_array($sqlselectbiders)){
		$bidernum = $rowbider['customerRef'];
		$otherBidderName = $rowbider['customerName'];
		$recipientsbidder = '+25'.$bidernum;
		// SMS OTHER BIDERS
			$messagebidder    = 'Hey '.$otherBidderName.', did you know that '.$bidName.' bet you on the bid ('.$bidItemName.') with '.number_format($bidAmount).'? please go online and win the bid by adding some amount.';// Specify your AfricasTalking shortCode or sender id
			$from = "uplus";

			  $gateway    = new AfricasTalkingGateway($username, $apikey);

			  try 
			  {
			     
			     $results = $gateway->sendMessage($recipientsbidder, $messagebidder, $from);
			        
			    foreach($results as $result) {
			    }
			  }
			  catch ( AfricasTalkingGatewayException $e )
			  {
			    echo "<div style='color=red;'>Network Error()</div>";
			  }
	}
	
	$recipients = '+25'.$bidNumber;
	$message    = 'Thanks '.$bidName.' For bidding for ('.$bidItemName.'), Now you are the first bidder with '.number_format($bidAmount).', We will be updating you if we get a higher bedder than you.';// Specify your AfricasTalking shortCode or sender id
	$from = "uplus";

	  $gateway    = new AfricasTalkingGateway($username, $apikey);

	  try 
	  {
	     
	     $results = $gateway->sendMessage($recipients, $message, $from);
	        
	    foreach($results as $result) {
	     // echo " Number: " .$result->number;
	     // echo " Status: " .$result->status;
	     // echo " MessageId: " .$result->messageId;
	     // echo " Cost: "   .$result->cost."\n";
	    }
	  }
	  catch ( AfricasTalkingGatewayException $e )
	  {
	    echo "<div style='color=red;'>Network Error()</div>";
	  }


}

?>
<div class="status-product">
	<p class="price"><?php echo number_format($_GET['bidAmount']);?> Rwf</p>
	<span class="status"> NEW</span>
</div>

<div class="action-detail">
Thanks! <?php echo $bidName;?> for your Bid, currently you
 are the top bidder with <?php echo number_format($bidAmount);?> Rwf<br/>
 We shall inform you if we get another bidder or if you won the Bid.
</div>
                            