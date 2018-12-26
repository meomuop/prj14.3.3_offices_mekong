<?php
/*-------------------------------------------
- PHP Frame work
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/
// ------------------------------
ini_set('display_errors',0);
require_once("../includes/ad_requires.php");

$query = mysql_query("SELECT docOut_code, docOut_id FROM tbl_docouts WHERE docOut_code LIKE '".$_GET["q"]."%' order by  docOut_id");

while($row=mysql_fetch_array($query)) {
	echo $row['docOut_code']."|".$row['docOut_id']."\n";
}

