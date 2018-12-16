<?php
/*-------------------------------------------
- PHP Frame work
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/
// ------------------------------
ini_set('display_errors',0);
require_once("../includes/ad_requires.php");

$query = mysql_query("SELECT user_fullname, user_id FROM tbl_users WHERE user_fullname LIKE '".$_GET["q"]."%' and unit_id = ".$_SESSION['access_unit_id']." order by user_fullname");

while($row=mysql_fetch_array($query)) {
	echo $row['user_fullname']."|".$row['user_fullname']."\n";
}
?>

