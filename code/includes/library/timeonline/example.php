<?php

include ("time_online.class.php");


$test = new time_online;

echo "<br> Curent time on page: ";
$test -> display_time("current_page"); // will display the time the user spent on the current page (dinamyc)

echo "<br> Curent time on site: ";
$test -> display_time("current_session"); // will display the time the user spent on the site on current session (dinamyc)

echo "<br> Total time on site: ";
$test -> display_time("total_time"); // will display the time the user spent on the site from all the visits (dinamyc)

echo "<br> Curent time on site: ";
print_r($test -> userTO); // display the array with the time the user spent on the site iin current session (static)

echo "<br> Total time on site: ";
print_r($test -> userTT); // display the array with the time the user spent on the site from all the visits (static)


?>