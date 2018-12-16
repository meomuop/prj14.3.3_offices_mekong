<?php
/**
* <b>Database Connection</b> class.
* @author Php Object Generator
* @version 3.0e / PHP4
* @see http://www.phpobjectgenerator.com/
* @copyright Free for personal & commercial use. (Offered under the BSD license)
*/

 Class Database
{
	var $connection;

	function Database()
	{
		 global $dbconfig;
   		$dbtype = $dbconfig['dbtype'];
		$dbhost = $dbconfig['dbhost'];
	    $dbname = $dbconfig['dbname'];
	    $dbuname = $dbconfig['dbuname'];
	    $dbpass = $dbconfig['dbpass'];

    // Database connection is a global (for now)
  		//global $connection;
		$databaseName = $GLOBALS['dbconfig']['dbhost'];
		$serverName = $GLOBALS['dbconfig']['host'];
		$databaseUser = $GLOBALS['dbconfig']['dbuname'];
		$databasePassword = $GLOBALS['dbconfig']['dbpass'];
		$databasePort = 3306;
		$this->connection = mysql_connect ($dbhost.":".$databasePort, $dbuname, $dbpass) or die('I cannot connect to the database. Please edit configuration.php with your database configuration.');
		mysql_select_db ($dbname) or die ('I cannot find the specified database "'.$dbname.'". Please edit configuration.php.');
	}

	function Connect()
	{
		static $database = null;
		if (!isset($database))
		{
			$database = new Database();
		}
		return $database->connection;
	}

	function Reader($query, $connection)
	{
		$cursor = mysql_query($query, $connection);
		return $cursor;
	}

	function Read($cursor)
	{
		return mysql_fetch_assoc($cursor);
	}

	function NonQuery($query, $connection)
	{
		mysql_query($query, $connection);
		$result = mysql_affected_rows($connection);
		if ($result == -1)
		{
			return false;
		}
		return $result;

	}

	function Query($query, $connection)
	{
		$result = mysql_query($query, $connection);
		return mysql_num_rows($result);
	}

	function InsertOrUpdate($query, $connection)
	{
		$result = mysql_query($query, $connection);
		return intval(mysql_insert_id($connection));
	}
}
?>