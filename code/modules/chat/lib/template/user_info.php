<?php
$conn = mysql_connect('localhost', 'root', '') or die ('Error connecting to mysql');
if(isset($_POST['db_year'])) $_SESSION['db_year'] = $_POST['db_year'];
elseif(!isset($_POST['db_year']) && !isset($_SESSION['db_year'])) $_SESSION['db_year'] = date('Y');
mysql_select_db('db14_0_tha_offices_'.$_SESSION['db_year']);
mysql_query("SET NAMES 'utf-8'");

$sql = "select * from tbl_users where user_active = 1";
$result = mysql_query($sql) or die($sql);
if($result):
	$i = 0;
	while($row_user = mysql_fetch_array($result)):
		echo $row_user['user_name'];
		$i++;
	endwhile;
endif;
?>