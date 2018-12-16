<?php
/*-------------------------------------------
- PHP Frame work
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/
// ------------------------------
ini_set('display_errors',0);
require_once("../includes/ad_requires.php");

$query = mysql_query("SELECT docCat_name, docCat_id FROM tbl_doccats WHERE docCat_ununicode LIKE '".$_GET["q"]."%' order by  docCat_name");

while($row=mysql_fetch_array($query)) {
	echo $row['docCat_name']."|".$row['docCat_id']."\n";
}
?>
