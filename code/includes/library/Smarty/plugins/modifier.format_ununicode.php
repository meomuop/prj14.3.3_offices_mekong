<?php
/**
 * Smarty plugin
 * @package Smarty
 * @subpackage plugins
 */


/**
 * Smarty plugin
 *
 * File:     modifier.format_ununicode.php
 * Type:     modifier
 * Name:     fomat_ununicode
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
function smarty_modifier_format_ununicode($string,$istrue)
{
   /*
   $string = trim($string);	
   $text = str_replace(
    array(' ','%',"''",'?','<','>',"","^","`","'","=","!",":" ,",,","..","*","&","__","▄"),
    array(' ','' ,'' ,'' ,'' ,'' ,'' ,'' ,'' ,'' ,'' ,'' ,'-','' ,'-','' ,'' ,'' , "_" ,"" ,""),
    $string);
		//chuyen thanh a
		$string_array = array("?","?","á","Á","à","À","ạ","Ạ","ấ","Ấ","ậ","Ậ","ã","Ã","â","Â","ả","Ả","a","A","ầ","á","à","ạ","ả","ã","â","ấ","ầ", "ậ","ẩ","ẫ","ă","ắ","ằ","ặ","ẳ","� �","Á","À","Ạ","Ả","Ã","Â","Ấ","Ầ", "Ậ","Ẩ","Ẫ","Ă","Ắ","Ằ","Ặ","Ẳ","� �");
		
		$string = str_replace($string_array,"a",$string);
		//chuyen thanh i
		$string_array = array("í","Í","ĩ","Ĩ","ị","Ị","ì","Ì","i","I");
		$string = str_replace($string_array,"i",$string);
		//chuyen thanh d
		$string_array = array("d","Đ","đ");
		$string = str_replace($string_array,"d",$string);
		//chuyen thanh o
		$string_array = array("ó","Ó","ò","Ò","ờ","Ờ","ỏ","Ỏ","ọ","Ọ","ố","Ố","ỗ","Ỗ","õ","Õ","ơ","Ơ","ô","Ô","ộ","Ộ","ồ","Ồ","ớ","Ớ","o","O","ó","ò","ọ","ỏ","õ","ô","ố","ồ", "ộ","ổ","ỗ","ơ","ớ","ờ","ợ","ở","� �","Ó","Ò","Ọ","Ỏ","Õ","Ô","Ố","Ồ", "Ộ","Ổ","Ỗ","Ơ","Ớ","Ờ","Ợ","Ở","� �");
		$string = str_replace($string_array,"o",$string);
		//chuyen thanh e
		$string_array = array("é","è","ẹ","ẻ","ẽ","ê","ế","ề" ,"ệ","ể","ễ","É","È","Ẹ","Ẻ","Ẽ","Ê","Ế","Ề" ,"Ệ","Ể","Ễ");
		$string = str_replace($string_array,"e",$string);
		//chuyen thanh u
		$string_array = array("ú","Ú","ù","Ù","ủ","Ủ","ứ","Ứ","ừ","Ừ","u","U","u","U","ự","Ự","ữ","Ữ","ư",'ụ',"ú","ù","ụ","ủ","ũ","ư","ứ","ừ", "ự","ử","ữ","Ú","Ù","Ụ","Ủ","Ũ","Ư","Ứ","Ừ", "Ự","Ử","Ữ");
		$string = str_replace($string_array,"u",$string);
		//chuyen thanh y
		$string_array = array("ý","Ý","ỳ","Ỳ","ỵ","Ỵ","ỹ","Ỹ","y","Y");
		$string = str_replace($string_array,"y",$string);
		$string_array = array("'",'"');
		$string = str_replace($string_array,"",$string);
		$string_array = array("-",'');
		$string = str_replace($string_array,"",$string);
		//chuyen thanh _	
		$string = str_replace(" ","_",$string);
		$a =  strtolower($string);	
		return strip_tags($a);
	*/
	$string = @mb_convert_encoding($string, "HTML-ENTITIES", "UTF-8");
	$htmlEntities = array_values(get_html_translation_table(HTML_ENTITIES, ENT_QUOTES));
	$entitiesDecoded = array_keys(get_html_translation_table(HTML_ENTITIES, ENT_QUOTES));
	$num = count ($entitiesDecoded);
	for ($u = 0; $u < $num; $u++) {
		$utf8Entities[$u] = '&#'.ord($entitiesDecoded[$u]).';';
	}
	$string = str_replace($htmlEntities, $utf8Entities, $string);
	if ( !function_exists('utf8_nosign_callback') ) {
		function utf8_nosign_callback($t) {
			$_SIGN2NOSIGN = array(
			"195160"        =>    97,
			"195161"        =>    97,
			"225186163"     =>    97,
			"195163"        =>    97,
			"225186161"     =>    97,
			"195162"        =>    97,
			"225186167"     =>    97,
			"225186165"     =>    97,
			"225186169"     =>    97,
			"225186171"     =>    97,
			"225186173"     =>    97,
			"196131"        =>    97,
			"225186177"     =>    97,
			"225186175"     =>    97,
			"225186179"     =>    97,
			"225186181"     =>    97,
			"225186183"     =>    97,
			"195128"        =>    65,
			"195129"        =>    65,
			"225186162"     =>    65,
			"195131"        =>    65,
			"225186160"     =>    65,
			"195130"        =>    65,
			"225186166"     =>    65,
			"225186164"     =>    65,
			"225186168"     =>    65,
			"225186170"     =>    65,
			"225186172"     =>    65,
			"196130"        =>    65,
			"225186176"     =>    65,
			"225186174"     =>    65,
			"225186178"     =>    65,
			"225186180"     =>    65,
			"225186182"     =>    65,
			"195172"        =>    105,
			"195173"        =>    105,
			"225187137"     =>    105,
			"196169"        =>    105,
			"225187139"     =>    105,
			"195140"        =>    73,
			"195141"        =>    73,
			"225187136"     =>    73,
			"196168"        =>    73,
			"225187138"     =>    73,
			"225187179"     =>    121,
			"195189"        =>    121,
			"225187183"     =>    121,
			"225187185"     =>    121,
			"225187181"     =>    121,
			"225187178"     =>    89,
			"195157"        =>    89,
			"225187182"     =>    89,
			"225187184"     =>    89,
			"225187180"     =>    89,
			"195178"        =>    111,
			"195179"        =>    111,
			"225187143"     =>    111,
			"195181"        =>    111,
			"225187141"     =>    111,
			"195180"        =>    111,
			"225187147"     =>    111,
			"225187145"     =>    111,
			"225187149"     =>    111,
			"225187151"     =>    111,
			"225187153"     =>    111,
			"198161"        =>    111,
			"225187157"     =>    111,
			"225187155"     =>    111,
			"225187159"     =>    111,
			"225187161"     =>    111,
			"225187163"     =>    111,
			"195146"        =>    79,
			"195147"        =>    79,
			"225187142"     =>    79,
			"195149"        =>    79,
			"225187140"     =>    79,
			"195148"        =>    79,
			"225187146"     =>    79,
			"225187144"     =>    79,
			"225187148"     =>    79,
			"225187150"     =>    79,
			"225187152"     =>    79,
			"198160"        =>    79,
			"225187156"     =>    79,
			"225187154"     =>    79,
			"225187158"     =>    79,
			"225187160"     =>    79,
			"225187162"     =>    79,
			"195168"        =>    101,
			"195169"        =>    101,
			"225186187"     =>    101,
			"225186189"     =>    101,
			"225186185"     =>    101,
			"195170"        =>    101,
			"225187129"     =>    101,
			"225186191"     =>    101,
			"225187131"     =>    101,
			"225187133"     =>    101,
			"225187135"     =>    101,
			"195136"        =>    69,
			"195137"        =>    69,
			"225186186"     =>    69,
			"225186188"     =>    69,
			"225186184"     =>    69,
			"195138"        =>    69,
			"225187128"     =>    69,
			"225186190"     =>    69,
			"225187130"     =>    69,
			"225187132"     =>    69,
			"225187134"     =>    69,
			"195185"        =>    117,
			"195186"        =>    117,
			"225187167"     =>    117,
			"197169"        =>    117,
			"225187165"     =>    117,
			"198176"        =>    117,
			"225187171"     =>    117,
			"225187169"     =>    117,
			"225187173"     =>    117,
			"225187175"     =>    117,
			"225187177"     =>    117,
			"195153"        =>    85,
			"195154"        =>    85,
			"225187166"     =>    85,
			"197168"        =>    85,
			"225187164"     =>    85,
			"198175"        =>    85,
			"225187170"     =>    85,
			"225187168"     =>    85,
			"225187172"     =>    85,
			"225187174"     =>    85,
			"225187176"     =>    85,
			"196145"        =>    100,
			"196144"        =>    68,
			);
			
			$dec = $t[1];
			if ($dec < 128) {
				$utf = chr($dec);
			}else if ($dec < 2048) {
				$ord1 = 192 + (($dec - ($dec % 64)) / 64);
				$ord2 = 128 + ($dec % 64);
				$utf = chr($_SIGN2NOSIGN["$ord1$ord2"]);
			}else {
				$ord1 = 224 + (($dec - ($dec % 4096)) / 4096);
				$ord2 = 128 + ((($dec % 4096) - ($dec % 64)) / 64);
				$ord3 = 128 + ($dec % 64);
				$utf = chr($_SIGN2NOSIGN["$ord1$ord2$ord3"]);
			}
			return $utf;
		}
	}
	
	if($istrue==true):
	$a = preg_replace_callback('|&#([0-9]{1,});|', 'utf8_nosign_callback', $string);
	$b = str_replace(array(' ','%',':','"','/',"'","”","?"),array('-','per','-','','','',"",""),$a);
	else:
	$a = preg_replace_callback('|&#([0-9]{1,});|', 'utf8_nosign_callback', $string);
	$b = str_replace(array('%',':','"','/',"'","”","?"),array('per','-','','','',"",""),$a);
	endif;
	return strip_tags($b);

}

/* vim: set expandtab: */

?>
