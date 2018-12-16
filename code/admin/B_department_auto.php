<?php
/*-------------------------------------------
- PHP Frame work
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/
// ------------------------------
require_once("../includes/ad_requires.php");

$query = mysql_query("SELECT department_name, department_id FROM tbl_departments WHERE department_ununicode LIKE '".$_GET["q"]."%' order by department_name");

while($row=mysql_fetch_array($query)) {
	echo $row['unit_name']."|".$row['unit_id']."\n";
}
?>
