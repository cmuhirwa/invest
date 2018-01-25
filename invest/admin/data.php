<?php
if(isset($_GET['itemId'])){
	$itemId = $_GET['itemId'];
#Basic Line
include("db.php");

$result = $db->query("SELECT AVG( unitPrice ) AS JUMLAH,`doneOn` BULAN
	FROM theask WHERE `priceType` = 'current' AND itemCode ='$itemId'
	group by DATE(`doneOn`)");
}

$bln = array();
$bln['name'] = 'Dates';
$rows['name'] = 'Prices';
while ($r = mysqli_fetch_array($result)) {
    $bln['data'][] = strftime("%d %b", strtotime($r['BULAN']));
    $rows['data'][] = $r['JUMLAH'];
}
$rslt = array();
array_push($rslt, $bln);
array_push($rslt, $rows);
print json_encode($rslt, JSON_NUMERIC_CHECK);

//echo '<hr/>';

?>



