<?php
/*-------------------------------------------
- PHP Frame work
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/
// ------------------------------
ini_set('display_errors',0);
require_once("../includes/ad_requires.php");

$query = mysql_query("SELECT doc_code, doc_id FROM tbl_docs WHERE doc_code LIKE '".$_GET["q"]."%' order by  doc_id");

while($row=mysql_fetch_array($query)) {
	echo $row['doc_code']."|".$row['doc_id']."\n";
}

