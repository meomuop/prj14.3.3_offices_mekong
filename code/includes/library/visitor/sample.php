<?php

	require_once("../config.php");
	require_once("class.database.php");
	require_once("class.visitors.php");

	$visitor = new visitors();
	$visitor->insert();
	// display online users, no parameters
	echo $visitor->display(); 
	
	echo "<br>";
	// display hits
	echo $visitor->display(1); 
	echo "<br>";
	// display online users, same as without parameters
	echo $visitor->display(2); 

?>

