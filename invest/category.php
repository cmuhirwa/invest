<?php
if (isset($_GET['CatID'])) {
	$catId = $_GET['CatID'];
	echo $catId;
	include ("db.php");
	$sql = $db->query("SELECT * FROM productcategory WHERE catId = '2'");
	while($row = mysqli_fetch_array($sql))
	{
		$catName = $row['catNane'];
		
	}
}
?>
All in <?php echo $catName;?>.