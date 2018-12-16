<?php
ini_set('display_errors',0);
require_once("../includes/ad_requires.php");
ob_start();
session_start();
session_destroy();
redirect("login.php");
?>

