<?php

/*$http_root = 'http://domain.ext/';
$dbconfig[dbhost]='localhost';
$dbconfig[dbuname]='db_username';
$dbconfig[dbpass]='db_password';
$dbconfig[dbname]='db_name';
$dbconfig[dbtype]='mysql';
extract($dbconfig, EXTR_OVERWRITE);
*/

if(isset($_POST['db_year'])) $_SESSION['db_year'] = $_POST['db_year'];
elseif(!isset($_POST['db_year']) && !isset($_SESSION['db_year'])) $_SESSION['db_year'] = date('Y');
$http_root 			= 'http://'.$_SERVER["SERVER_NAME"].':'.$_SERVER['SERVER_PORT'].'/smarty/prj14.3.3_offices_mekong/code/';

$dbconfig[dbhost]	= 'localhost';
$dbconfig[dbuname]	= 'root';
$dbconfig[dbpass]	= '123456789';
$dbconfig[dbname]	= 'db14_3_3_offices_mekong_'.$_SESSION['db_year'];
$dbconfig[dbtype]	= 'mysql';
extract($dbconfig, EXTR_OVERWRITE);

$LIBS_PATH			= ROOT_DIR."/includes/library/";

?>