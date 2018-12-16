<?php
/*-------------------------------------------
- PHP Frame work
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/
// ------------------------------
ini_set('display_errors',0);
require_once("../includes/ad_requires.php");

$query = mysql_query("SELECT user_fullname FROM tbl_users WHERE user_fullname LIKE '".$_GET["q"]."%' and user_level in (4,5) order by user_level");

while($row=mysql_fetch_array($query)) {
	echo $row['user_fullname']."\n";
}
unset($query);
unset($row);

$query = mysql_query("SELECT department_name FROM tbl_departments WHERE department_name LIKE '".$_GET["q"]."%' order by department_sort");

while($row=mysql_fetch_array($query)) {
    echo $row['department_name']."\n";
}
?>
