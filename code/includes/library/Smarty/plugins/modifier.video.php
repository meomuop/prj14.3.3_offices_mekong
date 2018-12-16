<?php
/**
 * Smarty plugin
 * @package Smarty
 * @subpackage plugins
 */


/**
 * Smarty escape modifier plugin
 *
 * Type:     modifier<br>
 * Name:     escape<br>
 * Purpose:  Escape the string according to escapement type
 * @link http://smarty.php.net/manual/en/language.modifier.escape.php
 *          escape (Smarty online manual)
 * @param string
 * @param html|htmlall|url|quotes|hex|hexentity|javascript
 * @return string
 */
 
function smarty_modifier_video($string,$w,$h,$auto,$controls,$swfObject,$swfUrl,$spt)
{
	$http = 'http://';
    /// Include the class
  require_once('function.video.php');
	if($spt != false){
		$a= substr($string,0,7);
		if(strncasecmp($a,$http,7) == 0){
			$videoShow = $string;
		}else{
			$videoShow = '../'.$string;
		}
		
	}else{
		$videoShow = $string;
	}
  /// Player contructor
  $video_player = new VideoPlayer($videoShow, $w, $h, $auto,$controls,$swfObject,$swfUrl);

  if (!$video_player) {
  return ($video_player->getLastError());
  }
  
  /*
   * //Use this method if you use the JW flv player javascript source in your server
   * //Download the javascript source in http://www.jeroenwijering.com/?item=JW_FLV_Player
   * if(!$video_player->setSwfObject('jw_flv_player/swfobject.js')) {
   *   die ($video_player->getLastError());
   * }
   */

  /// Echo the player method for print the player plugin
  if(!$player = $video_player->player()) {
    return ($video_player->getLastError());
  } else {
  	
   return $player;
	
 } 
}

/* vim: set expandtab: */

?>
