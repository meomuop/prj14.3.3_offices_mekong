<?php
//STSC Project
//Dadabase functions.
//Rev 2004.4.16


/*Initialise tables list avaiable and connect to DB
*/
function Init(){
	global $INCLUDE_PATH;
	global $LIBS_PATH;
	ini_set("magic_quote_gpc",0);

 	//session_start();
 	
    include $LIBS_PATH.'adodb/adodb.inc.php';

    // Initialise and load configuration
    global $dbconfig;
    $dbconfig = array();
    include $INCLUDE_PATH.'config.php';
    // Connect to database
    if (!DBInit()) {
        die('Database initialisation failed');
    }
    return true;
}

//Connect to DB

function DBInit(){
    // Get database parameters
    global $dbconfig;
    $dbtype = $dbconfig['dbtype'];
    $dbhost = $dbconfig['dbhost'];
    $dbname = $dbconfig['dbname'];
    $dbuname = $dbconfig['dbuname'];
    $dbpass = $dbconfig['dbpass'];

    // Database connection is a global (for now)
    global $dbconn;
	
    // Start connection
    $dbconn = ADONewConnection($dbtype);
	//$dbconn->charSet = 'utf-8';
    //$dbconn->debug = true;

    $dbh = $dbconn->PConnect($dbhost, $dbuname, $dbpass, $dbname);
    if (!$dbh) {
    	$dbpass = "";
		unset($_POST['db_year']);
		unset($_SESSION['db_year']);
		echo "Khong the ket noi co so du lieu !!!<br>";
		echo "<a href='../admin/login.php' style='color:#000; text-decoration:none'><< Quay lai</a>";
        die();
    }
	
    global $ADODB_FETCH_MODE;
    $ADODB_FETCH_MODE = ADODB_FETCH_NUM;

    // force oracle to a consistent date format for comparison methods later on
    if (strcmp($dbtype, 'oci8') == 0) {
        $dbconn->Execute("alter session set NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS'");
    }
	$dbconn->Execute("SET NAMES 'utf8'");

    return true;
}

/**
 * get a list of database connections
 * @returns array
 * @return array of database connections
 */

function DBGetConn(){
    global $dbconn;
    return array($dbconn);
}

Init();
?>