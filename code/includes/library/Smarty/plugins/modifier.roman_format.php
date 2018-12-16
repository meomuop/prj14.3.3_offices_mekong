<?php
/**
 * Smarty plugin
 * @package Smarty
 * @subpackage plugins
 */


/**
 * Smarty plugin
 *
 * File:     modifier.price_format.php
 * Type:     modifier
 * Name:     format_price
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
 
function smarty_modifier_roman_format($num) 
{
	 // Make sure that we only use the integer portion of the value
	 $n = intval($num);
	 $result = '';
	
	 // Declare a lookup array that we will use to traverse the number:
	 $lookup = array('M' => 1000, 'CM' => 900, 'D' => 500, 'CD' => 400,
	 'C' => 100, 'XC' => 90, 'L' => 50, 'XL' => 40,
	 'X' => 10, 'IX' => 9, 'V' => 5, 'IV' => 4, 'I' => 1);
	
	 foreach ($lookup as $roman => $value) 
	 {
		 // Determine the number of matches
		 $matches = intval($n / $value);
	
		 // Store that many characters
		 $result .= str_repeat($roman, $matches);
	
		 // Substract that from the number
		 $n = $n % $value;
	 }
	
	 // The Roman numeral should be built, return it
	 return $result;
}

/* vim: set expandtab: */

?>
