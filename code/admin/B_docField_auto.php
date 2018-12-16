<?php
/*-------------------------------------------
- PHP Frame work
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/
// ------------------------------
ini_set('display_errors',0);
require_once("../includes/ad_requires.php");

$query = mysql_query("SELECT docField_name, docField_id FROM tbl_docfields WHERE docField_ununicode LIKE '".$_GET["q"]."%' order by docField_name");

while($row=mysql_fetch_array($query)) {
	echo $row['docField_name']."|".$row['docField_id']."\n";
}
?>
