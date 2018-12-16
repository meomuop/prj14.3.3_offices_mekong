<?php
/*-------------------------------------------
- PHP Frame work
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/
// ------------------------------
ini_set('display_errors',0);
require_once("../includes/ad_requires.php");
$query = mysql_query("SELECT unit_name, unit_id FROM tbl_units WHERE unit_ununicode LIKE '".$_GET["q"]."%' order by unit_name");

while($row=mysql_fetch_array($query)) {
	echo $row['unit_name']."|".$row['unit_id']."\n";
}
?>
