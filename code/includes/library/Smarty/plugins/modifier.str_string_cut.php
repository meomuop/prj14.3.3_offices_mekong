<?php
/**
 * Smarty plugin
 * @package Smarty
 * @subpackage plugins
 */


/**
 * Smarty plugin
 *
 * File:     modifier.str_string.php
 * Type:     modifier
 * Name:     cut_string
 * Date:     Sep 03, 2004
 * Purpose:  Format given value according to the locale settings.
 *           A second argument can be supplied which controls the left precision (default is 2).
 *           Input will be converted to float, if conversion fails input will be returned unchanged.
 * Example:  {$price|price_fomat}
 *           {$price|price_format:2}
 * Install:  Drop into the plugin directory.
 * @version  1.1
 * @author   Markus Zapke-Gruendemann <markuszapke at gmx dot net>
 * @param float
 * @param int
 * @return string
 */
function smarty_modifier_str_string_cut($string,$len,$more)
{
   
	if (is_array($string)) return $string;
	$string = trim($string);
	if (strlen($string) <= $len) return $string;
	$string = substr($string,0,$len);
	if ($string != "") {
		if (!substr_count($string," ")) {
			if ($more) $string .= " ...";
			return $string;
		}
		while(strlen($string) && ($string[strlen($string)-1] != " ")) {
		$string = substr($string,0,-1);
	}
	$string = substr($string,0,-1);
	if ($more) $string .= " ...";
	}
return $string;

}

/* vim: set expandtab: */

?>
