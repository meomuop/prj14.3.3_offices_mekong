<?php
/*-------------------------------------------
- PHP Frame work
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/
// ------------------------------
ini_set('display_errors',0);
require_once("../includes/ad_requires.php");

$query = mysql_query("SELECT signPer_name, signPer_id FROM tbl_signpers WHERE signPer_ununicode LIKE '".$_GET["q"]."%' order by signPer_name");

while($row=mysql_fetch_array($query)) {
	echo $row['signPer_name']."|".$row['signPer_id']."\n";
}
?>

