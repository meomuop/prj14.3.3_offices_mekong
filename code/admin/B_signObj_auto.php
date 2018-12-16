<?php
/*-------------------------------------------
- PHP Frame work
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/
// ------------------------------
ini_set('display_errors',0);
require_once("../includes/ad_requires.php");

$query = mysql_query("SELECT signObj_name, signObj_id FROM tbl_signobjs WHERE signObj_ununicode LIKE '".$_GET["q"]."%' order by signObj_name");

while($row=mysql_fetch_array($query)) {
	echo $row['signObj_name']."|".$row['signObj_id']."\n";
}
?>
