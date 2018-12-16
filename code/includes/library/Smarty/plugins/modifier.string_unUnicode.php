<?php
/**
 * Smarty plugin
 * @package Smarty
 * @subpackage plugins
 */


/**
 * Smarty modifier.string_unUnicode modifier plugin
 *
 * Type:     modifier<br>
 * Name:     string_unUnicode<br>
 * Purpose:  format strings via sprintf
 * @link http://smarty.php.net/manual/en/language.modifier.string.format.php
 *          string_format (Smarty online manual)
 * @param string
 * @param string
 * @return string
 */
function smarty_modifier_unUnicode($string)
{
    $str = trim($string);	
		//chuyen thanh a
		$str_array = array("?","?","á","Á","à","À","ạ","Ạ","ấ","Ấ","ậ","Ậ","ã","Ã","â","Â","ả","Ả","a","A","ầ");
		$str = str_replace($str_array,"a",$str);
		//chuyen thanh i
		$str_array = array("í","Í","ĩ","Ĩ","ị","Ị","ì","Ì","i","I");
		$str = str_replace($str_array,"i",$str);
		//chuyen thanh d
		$str_array = array("d","Đ","đ");
		$str = str_replace($str_array,"d",$str);
		//chuyen thanh o
		$str_array = array("ó","Ó","ò","Ò","ờ","Ờ","ỏ","Ỏ","ọ","Ọ","ố","Ố","ỗ","Ỗ","õ","Õ","ơ","Ơ","ô","Ô","ộ","Ộ","ồ","Ồ","ớ","Ớ","o","O");
		$str = str_replace($str_array,"o",$str);
		//chuyen thanh e
		$str_array = array("é","É","ệ","Ệ","ẽ","Ẽ","ê","Ê","ẹ","Ẹ");
		$str = str_replace($str_array,"e",$str);
		//chuyen thanh u
		$str_array = array("ú","Ú","ù","Ù","ủ","Ủ","ứ","Ứ","ừ","Ừ","u","U","u","U","ự","Ự","ữ","Ữ","ư",'ụ');
		$str = str_replace($str_array,"u",$str);
		//chuyen thanh y
		$str_array = array("ý","Ý","ỳ","Ỳ","ỵ","Ỵ","ỹ","Ỹ","y","Y");
		$str = str_replace($str_array,"y",$str);
		$str_array = array("'",'"');
		$str = str_replace($str_array,"",$str);
		$str_array = array("-",'');
		$str = str_replace($str_array,"",$str);
		//chuyen thanh _	
		$str = str_replace(" ","_",$str);
		return strtolower($str);	

/* vim: set expandtab: */

?>
