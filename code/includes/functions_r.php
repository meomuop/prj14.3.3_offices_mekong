<?php
/**
 * functions_r.php : Ø¿(RunSystem)
 * @author ngotau@runsystem.net
*/
//ini_set("magic_quote_gpc",0);


//RSÑ¶API
function addHighlight($strIn, $keyWords)
{
	if ((strlen(trim($strIn)) > 0 && is_array($keyWords)))
	{
		while ($keyInd=each($keyWords))
		{
			$strIn = str_replace($keyInd["value"], "*|*" . $keyInd["value"] . "*||*", $strIn);
		}
	}
	
	$strIn = str_replace("*|*",  "<SPAN CLASS=CPhighlight>", $strIn);
	$strIn = str_replace("*||*", "</SPAN>", $strIn);
	return $strIn;
}
function validHTML($aString)
{
	$tempString = trim($aString);

	if (is_null($tempString) || empty($tempString) || (strlen($tempString) == 0)) return "";

	//Clean up HTML
	$tempString = str_replace("<", " ", $tempString);
	$tempString = str_replace(">", " ", $tempString);
	$tempString = str_replace("\"","'", $tempString);
	$tempString = addslashes($tempString);
	return $tempString;
}

function checkNumber($str){
	if(is_numeric($str)){
		return 1;
	}else{
		return 0;
	}
}

function validSQL($aString,$aType)
{
	//Declare Variables
	$tempString = trim($aString);
	
	//Check for empty values
	if (is_null($tempString) || empty($tempString) || (strlen($tempString) == 0)) return "";
	
	//Clean up SQL
	if (strtolower($tempString) == "null")  //Nulls
		$validSQL = $tempString;
	else
	{
		switch(trim(strtoupper ($aType)))
		{
			case "I":									//Integer
				$validSQL = (int)($tempString); break;
			case "D":									//Double
				$validSQL = (double)($tempString); break;
			default:									//Alphanumeric
				$tempString = str_replace("--"," ", $tempString);
				$tempString = str_replace("=="," ", $tempString);
				$tempString = str_replace(";", " ", $tempString);
				$validSQL   = addslashes($tempString);
				break;
		}
	}
	return $validSQL;
}
//check email address
function validateEmail($str){
    $length = strlen($str);
    $idx = 0;
    while($length--) {
       $c = $str[$idx++];
       if(ord($c) > 127){
          return false;
       }
    }
    $regexp = '/^(?:[^\s\000-\037\177\(\)<>@,;:\\"\[\]]\.?)+@(?:[^\s\000-\037\177\(\)<>@,;:\\\"\[\]]\.?)+\.[a-z]{2,6}$/Ui';
    if(preg_match($regexp,$str)) {
        return true;
    } else {
        return false;
    }
}

//check URL
function validateURL($str) {
    $length = strlen($str);
    $idx = 0;
    while($length--) {
       $c = $str[$idx++];
       if(ord($c) > 127){
          return false;
       }
    }
    $regexp = "/https?:\/\/([a-zA-Z0-9]+.)+[a-zA-Z0-9-_?&=:\/.]+/i";
    if(preg_match($regexp,$str)) {
        return true;
    } else {
        return false;
    }
}

//check Japan post number
//
function validatePostNo($str, $length="") {
  $strlength = strlen($str);
  if($length != "" && is_numeric($length))
  	if($strlength != $length)
		return false;
    $idx = 0;
    while($strlength--) {
       $c = $str[$idx++];
       if( (ord($c) < 48) || (ord($c) > 57) ){
          return false;
       }
    }
    //if (!eregi("^[0-9]{3}\-[0-9]{4}$", $str)) {
    if (!eregi("^[0-9]+[0-9]$", $str)) {
      return false;
    }
    return true;
}
//check number
function validateDate($strMonth,$strDay) {
	if(trim($strMonth)!=""){
		if (!ereg("[0-9]{1,2}", $strMonth)) {
//			echo 1;
			return false;
		}else{
			if(intval($strMonth) >12 || intval($strMonth) <= 0) {
		//	echo 2;
				return false;
				
			}
		}
	}
	if(trim($strDay) != ""){
		if (!ereg("[0-9]{1,2}", $strDay)) {
//		echo 3;
		  return false;
		}else{
			if(intval($strDay)>31 || intval($strDay) <= 0) {
		//	echo 4;
				return false;
			}
		}
	}
    return true;
}
//check Japan post number
function validateTelNo($str) {
    
    $idx = 0;
    $str = str_replace("-","",$str);
    $length = strlen($str);
    while($length--) {
       $c = $str[$idx++];
       if( (ord($c) < 48) || (ord($c) > 57) ){
          return false;
       }
    }
    if (!eregi("^[0-9]+[0-9]$", $str)) {
      return false;
    }
    return true;
}

//convert kana
function convertKana($str) {
	return mb_convert_kana($str, "KVRN","SJIS");
}

//Ê¸Ã¥ check full japanese character
//str -> string
//nullFlg, check if str is null, É¬Ü¤Ã¤nullFlg = true
function validateKana($str,$nullFlg=false) {
    if (empty($str)) {
        if ($nullFlg) return true;
        else return false;
    }else {
        $kanaStr = convertKana($str);
        
        if ($kanaStr == $str) {
            return true;
        }
        else {
            return false;
        }
    }
}

//Ò¤é¤¬Ê¥Ã¥ check hiragana
function validateHiragana($str,$nullFlg=false) {
    if (empty($str)) {
        if ($nullFlg) return true;
        else return false;
    }else {
    	//pending
        return true;
    }
}
//Ê¥Ã¥ check katakana
function validateKatakana($str,$nullFlg=false) {
    $zenkana = "'Ä¥Æ¥È¥Â¥Å¥Ç¥É¥Þ¥ß¥Ï¥Ò¥Õ¥Ø¥Û¥Ð¥Ó¥Ö¥Ù¥Ü¥Ñ¥Ô¥×¥Ú¥Ý¥Ê¥Ë¥Ì¥Í¥Î¥ò¥¡¥Ã¡î¡¦";
    //$zenkana = stripslashes($zenkana);
    //$str = stripslashes($str);
    if (empty($str)) {
        if ($nullFlg) return true;
        else return false;
    }else {
      //pending
      $length = mb_strlen($str,"SJIS");
      $idx = 0;
      while($length--) {
       $mc = mb_substr($str,$idx++,1,"SJIS");
       $p = mb_strpos($zenkana,$mc,0,"SJIS");
       if (mb_strpos($zenkana,$mc,0,"SJIS") === false){
         return false;
       }
      }
     return true;
    }
}

//Ñ¥ï¡¼É¥Ã¥ check password
//6Ê¸Ê¾å¡¢20Ê¸È¾Ñ±Ñ¿
function validatePassword($str) {
  $length = strlen($str);
  
  if (($length < 6) || ($length > 20)) {
    return false;
  }
  
  $idx = 0;
  while($length--) {
     $c = $str[$idx++];
     if(ord($c) > 127){
       return false;
     }
  }
  if (!eregi("^[a-zA-Z0-9]", $str)) {
    return false;
  }
  return true;
}

// Author:		ngoctb@runsystem.net	  
// Purpose: 	format date in Japanese style 
// Lastupdate: 	05/08/2005
// Parameters: 	date value
// Return type: formated date in string type
function Format2JpDate($date){
	$Y=substr($date,0,4);
	$M=substr($date,5,2);
	$D=substr($date,8,2);
	$H=substr($date,11,2);
	$i=substr($date,14,2);
	$newDate=$Y.'Ç¯ '.$M.' '.$D.'';
	//return mb_convert_encoding($newDate,'SJIS');
	return $newDate;
}

//make unique key
define('_SYLLABELS', "*abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz0123456789");
define('_MAKEPASS_LEN', 8);
define('_MAKEPASS_BOX', 5000);

//random seed
function _make_seed(){
    list($usec, $sec) = explode(' ', microtime());
    return (float) $sec + ((float) $usec * 100000);
}

//make random unique id or password
function makeUnique(){
    // init some
    $result = '';
    mt_srand(_make_seed());
    $syllabels = _SYLLABELS;
    $len = strlen($syllabels) - 1;
    $box = "";

    // create box
    for($i = 0; $i < _MAKEPASS_BOX; $i++) {
        $ch = $syllabels[mt_rand(0, $len)];
        // about 20% upper case letters
        if (mt_rand(0, $len) % 5 == 1) {
            $ch = strtoupper($ch);
        }
        // filling up the box with random chars
        $box .= $ch;
    }
    // now collect key from box
    for($i = 0; $i < _MAKEPASS_LEN; $i++) {
        $result .= $box[mt_rand(0, (_MAKEPASS_BOX - 1))];
    }
    return $result;
}

//add number to vdate
//vdate is timestamp
//return time stamp
/*
    $interval can be:
    yyyy - Number of full years
    q - Number of full quarters
    m - Number of full months
    y - Difference between day numbers
      (eg 1st Jan 2004 is "1", the first day. 2nd Feb 2003 is "33". The datediff is "-32".)
    d - Number of full days
    w - Number of full weekdays
    ww - Number of full weeks
    h - Number of full hours
    n - Number of full minutes
    s - Number of full seconds (default)
  */
//e.g $startdate = "2004/08/12"
//    $vdate = strtotime($startdate." 00:00:00");
//    $diff = rsConfigGetVar['job_period']
//    $enddate = date("Y/m/d :H:i:s", DateAdd("d",$diff,$vdate));

//Check file type
function validateImageType($filename) {
	//check file extension
	$image_type = substr($filename, -4);
	$image_type = strtolower($image_type); 
	if ( ($image_type != ".jpg") && ($image_type != ".png") && ($image_type != ".gif")){
		return false;
	}
	return true;
}

//Resize image to propertly size
function resizeImage($filename,$newfilename,$path,$maxwidth,$maxheight) {
	//file extension
	$image_type = substr($filename, -4);

    switch($image_type) {
		case '.jpg':
			$source = imagecreatefromjpeg($filename);
			break;
		case '.png':
			$source = imagecreatefrompng($filename);
			break;
		case '.gif':
			$source = imagecreatefromgif($filename);
			break;
		default:
			return false;
			die;
		break;
	}
	
	//new file name
	$nfile = $newfilename . $image_type;
	//full new file path
	$fullpath = $path . $nfile;
	//original file size
	list($width, $height) = getimagesize($filename);
	
	//calculate new image size
	$newwidth = $width;
	$newheight = $height;
	
	$xratio = $maxwidth/$width;
	$yratio = $maxheight/$height;
	if (($xratio >=1) && ($yratio >=1)) {
		$newwidth = $width;
		$newheight = $height;
	}else {
		$minratio = min($xratio,$yratio);
		$newwidth = $minratio * $width;
		$newheight = $minratio * $height;
	}
	//
	//create new images with new size
	$newimage = imagecreatetruecolor($newwidth, $newheight);
	//rewsize
	imagecopyresized($newimage, $source, 0, 0, 0, 0, $newwidth, $newheight, $width, $height);
	//set quality
	imagejpeg($newimage, $fullpath, 80);
	
	imagedestroy($source);
    imagedestroy($newimage);
    //return full path of new image
	return $fullpath;

}

//get image path for job & pr & gift
//type is one of 'job','gift','pickup','banner'
//add is A1->A4 or B1-B4 in-case type is job
function getImagePath($type,$id,$add = "") {
	global $GIFT_IMG_DIR,$JOB_IMG_DIR,$PICKUP_IMG_DIR,$BANNER_IMG_DIR;
	
	$imgpath = "../";
	if ($type == "job") {
		$imgpath .= $JOB_IMG_DIR;
	}elseif($type == "gift"){
		$imgpath .= $GIFT_IMG_DIR;
	}
	elseif($type == "pickup"){
		$imgpath .= $PICKUP_IMG_DIR;
	}
	elseif($type == "banner"){
		$imgpath .= $BANNER_IMG_DIR;
	}
	$fullid = substr("00000000".$id,-8);
	$jpgpath = $imgpath.$fullid.$add.".jpg";
	$giftpath = $imgpath.$fullid.$add.".gif";
	$pngpath = $imgpath.$fullid.$add.".png";
	
	$ret = "";
	if(file_exists(realpath("../".$jpgpath))) {
		$ret = $jpgpath;
	}elseif(file_exists(realpath("../".$giftpath))) {
		$ret = $giftpath;
	}elseif(file_exists(realpath("../".$pngpath))) {
		$ret = $pngpath;
	}
	return $ret;
}
// Author:		bacnv@runsystem.net	  
// Purpose: 	get array file name from folder
// Lastupdate: 	19/08/2005
// Parameters: 	$dir
// Return type: aray
function array_file($dir)
{
	
	//$handle=opendir('../../data/img.gif');	
	$handle=opendir($dir);
	$arr=array();
	$i=0;
	while (false !== ($file = readdir($handle)))
	{     
		$arr[$i]=$file;
		$i++;
	}
	closedir($handle); 
	return $arr;		
}
function DateDiff($interval, $datefrom, $dateto, $using_timestamps = false) {
  /*
    $interval can be:
    yyyy - Number of full years
    q - Number of full quarters
    m - Number of full months
    y - Difference between day numbers
      (eg 1st Jan 2004 is "1", the first day. 2nd Feb 2003 is "33". The datediff is "-32".)
    d - Number of full days
    w - Number of full weekdays
    ww - Number of full weeks
    h - Number of full hours
    n - Number of full minutes
    s - Number of full seconds (default)
  */
  //echo $datefrom . "__".$dateto."<br>";
  if (!$using_timestamps) {
    $datefrom = strtotime($datefrom, 0);
    $dateto = strtotime($dateto, 0);
  }
  $difference = $dateto - $datefrom; // Difference in seconds
   
  switch($interval) {
   
    case 'yyyy': // Number of full years
      $years_difference = floor($difference / 31536000);
      if (mktime(date("H", $datefrom), date("i", $datefrom), date("s", $datefrom), date("n", $datefrom), date("j", $datefrom), date("Y", $datefrom)+$years_difference) > $dateto) {
        $years_difference--;
      }
      if (mktime(date("H", $dateto), date("i", $dateto), date("s", $dateto), date("n", $dateto), date("j", $dateto), date("Y", $dateto)-($years_difference+1)) > $datefrom) {
        $years_difference++;
      }
      $datediff = $years_difference;
      break;
    case "q": // Number of full quarters
      $quarters_difference = floor($difference / 8035200);
      while (mktime(date("H", $datefrom), date("i", $datefrom), date("s", $datefrom), date("n", $datefrom)+($quarters_difference*3), date("j", $dateto), date("Y", $datefrom)) < $dateto) {
        $months_difference++;
      }
      $quarters_difference--;
      $datediff = $quarters_difference;
      break;
    case "m": // Number of full months
      $months_difference = floor($difference / 2678400);
      while (mktime(date("H", $datefrom), date("i", $datefrom), date("s", $datefrom), date("n", $datefrom)+($months_difference), date("j", $dateto), date("Y", $datefrom)) < $dateto) {
        $months_difference++;
      }
      $months_difference--;
      $datediff = $months_difference;
      break;
    case 'y': // Difference between day numbers
      $datediff = date("z", $dateto) - date("z", $datefrom);
      break;
    case "d": // Number of full days
      $datediff = floor($difference / 86400);
      break;
    case "w": // Number of full weekdays
      $days_difference = floor($difference / 86400);
      $weeks_difference = floor($days_difference / 7); // Complete weeks
      $first_day = date("w", $datefrom);
      $days_remainder = floor($days_difference % 7);
      $odd_days = $first_day + $days_remainder; // Do we have a Saturday or Sunday in the remainder?
      if ($odd_days > 7) { // Sunday
        $days_remainder--;
      }
      if ($odd_days > 6) { // Saturday
        $days_remainder--;
      }
      $datediff = ($weeks_difference * 5) + $days_remainder;
      break;
    case "ww": // Number of full weeks
      $datediff = floor($difference / 604800);
      break;
    case "h": // Number of full hours
      $datediff = floor($difference / 3600);
      break;
    case "n": // Number of full minutes
      $datediff = floor($difference / 60);
      break;
    default: // Number of full seconds (default)
      $datediff = $difference;
      break;
  } 
  return $datediff;

}

function isNull($str){
  if(!$str || strlen($str)==0)
    return true;
  return false;
  
}
function format_date($date, $type=1)
{
	if($type==1):
		if ($date!=""):
			$tmp=split("/",$date);
			if(count($tmp)==3){
				$date=$tmp[2]."-".$tmp[1]."-".$tmp[0];
			} 
		endif;
	elseif($type==2):
		$date = date('d-m-Y',strtotime($date));
	endif;
    return $date;
}

function view_date($date)
{
    if ($date!=""){
    	$temp = split(" ",$date);
    	$tmp=split("-",$temp[0]);
    	if(count($tmp)==3){
    		$date=$tmp[2]."/".$tmp[1]."/".$tmp[0];
    	} 
    }
    return $date;
}
function format_date_db($date)
{
    if ($date!=""){
    	$tmp=split("-",$date);
    	if(count($tmp)==3){
    		$date=substr($tmp[2],0,2)."/".$tmp[1]."/".$tmp[0];
    	} 
    }
    return $date;
}
function format_date_form($date)
{
	if ($date!=""){
    	$tmp=split("-",$date);
    	if(count($tmp)==3){
    		$date=$tmp[0]."-".$tmp[1]."-".substr($tmp[2],0,2);
    	} 
    }
    return $date;
}
function encodeName($strName) 
{
	$addNumber = rand();
	$strCard = $strName.$addNumber;
	$begin = strlen(substr(crc32($strCard),2,6));
	$temp = substr(crc32($strCard),2,6);
	for ($i=$begin; $i <8; $i++) {
		$subNumber = rand(1,9);
		$temp .= $subNumber;
	}
	
	return "vb".$temp;
}

function send_mail($emailaddress, $fromaddress, $emailsubject, $body, $attachments=false)
{
  $eol="\r\n";
  $mime_boundary=md5(time());
  
  # Common Headers
  $headers .= 'From: MyName<'.$fromaddress.'>'.$eol;
  $headers .= 'Reply-To: MyName<'.$fromaddress.'>'.$eol;
  $headers .= 'Return-Path: MyName<'.$fromaddress.'>'.$eol;    // these two to set reply address
  $headers .= "Message-ID: <".$now." TheSystem@".$_SERVER['SERVER_NAME'].">".$eol;
  $headers .= "X-Mailer: PHP v".phpversion().$eol;          // These two to help avoid spam-filters

  # Boundry for marking the split & Multitype Headers
  $headers .= 'MIME-Version: 1.0'.$eol;
  $headers .= "Content-Type: multipart/related; boundary=\"".$mime_boundary."\"".$eol;

  $msg = "";      
  
  if ($attachments !== false)
  {

    for($i=0; $i < count($attachments); $i++)
    {
      if (is_file($attachments[$i]["file"]))
      {   
        # File for Attachment
        $file_name = substr($attachments[$i]["file"], (strrpos($attachments[$i]["file"], "/")+1));
        
        $handle=fopen($attachments[$i]["file"], 'rb');
        $f_contents=fread($handle, filesize($attachments[$i]["file"]));
        $f_contents=chunk_split(base64_encode($f_contents));    //Encode The Data For Transition using base64_encode();
        fclose($handle);
        
        # Attachment
        $msg .= "--".$mime_boundary.$eol;
        $msg .= "Content-Type: ".$attachments[$i]["content_type"]."; name=\"".$file_name."\"".$eol;
        $msg .= "Content-Transfer-Encoding: base64".$eol;
        $msg .= "Content-Disposition: attachment; filename=\"".$file_name."\"".$eol.$eol; // !! This line needs TWO end of lines !! IMPORTANT !!
        $msg .= $f_contents.$eol.$eol;
        
      }
    }
  }
  
  # Setup for text OR html
  $msg .= "Content-Type: multipart/alternative".$eol;
  
  # Text Version
  $msg .= "--".$mime_boundary.$eol;
  $msg .= "Content-Type: text/plain; charset=iso-8859-1".$eol;
  $msg .= "Content-Transfer-Encoding: 8bit".$eol;
  $msg .= strip_tags(str_replace("<br>", "\n", $body)).$eol.$eol;
  
  # HTML Version
  $msg .= "--".$mime_boundary.$eol;
  $msg .= "Content-Type: text/html; charset=iso-8859-1".$eol;
  $msg .= "Content-Transfer-Encoding: 8bit".$eol;
  $msg .= $body.$eol.$eol;
  
  # Finished
  $msg .= "--".$mime_boundary."--".$eol.$eol;  // finish with two eol's for better security. see Injection.
    
  # SEND THE EMAIL
  ini_set(sendmail_from,$fromaddress);  // the INI lines are to force the From Address to be used !
  mail($emailaddress, $emailsubject, $msg, $headers);
  ini_restore(sendmail_from);
}

 function get_paging_string($url_process, $curpage, $num_page){
	 $pager_str = "<div>Trang ";
	 // ------ [1 - 10][11 - 20]...[] < curpage
	 for ($i = 1; $i < (ceil($curpage/10)); $i++)
	 {
		$pager_str .= "&nbsp;<a href='#' id='page-list' onClick='gotoPage(\"$url_process\", ".(($i-1)*10+1).");'>[".(($i-1)*10+1)."-".($i*10)."]</a>";
	 }
	 $end_page = ($num_page > ((ceil($curpage/10))*10))?((ceil($curpage/10))*10):$num_page;
	 
	 // ----- curpage
	 for ($i = ((ceil($curpage/10)-1)*10+1); $i <= $end_page; $i++)
	 {
		if ($i == $curpage) $pager_str .= "&nbsp;".$i;
		else $pager_str .= "&nbsp;<a href='#' id='page' onClick='gotoPage(\"$url_process\", ".$i.");'>$i</a>";
	 }
	 // --- [ceil($vars['curpage']/10) - ceil($num_page/10)] ----
	 for ($i = (ceil($curpage/10)); $i < (ceil($num_page/10)); $i++)
	 {
		$end_page = ($num_page > ($i+1)*10)?(($i+1)*10):$num_page;
		$pager_str .= "&nbsp;<a href='#' id='current-page' onClick='gotoPage(\"$url_process\", ".($i*10+1).");'>[".($i*10+1)."-".$end_page."]</a>";
	 }
	 $pager_str .=	"</div>";
	 return $pager_str;	
 } 


	function fnsUnUnicode($str, $type = 3) 
	{
		$str = trim($str);	
		//chuyen thanh a
		$str_array = array("?","?","á","à","ạ","ấ","ậ","ã","â","ả","a","ầ","á","à","ạ","ả","ã","â","ấ","ầ","ậ","ẩ","ẫ","ă","ắ","ằ","ặ","ẳ","� �");
		$str = str_replace($str_array,"a",$str);
		//chuyen thanh A
		$str_array = array("Á","À","Ạ","Ấ","Ậ","Ã","Â","Ả","A","Á","À","Ạ","Ả","Ã","Â","Ấ","Ầ","Ậ","Ẩ","Ẫ","Ă","Ắ","Ằ","Ặ","Ẳ","� �");
		$str = str_replace($str_array,"A",$str);
		
		//chuyen thanh i
		$str_array = array("í","ĩ","ị","ì","i","ỉ");
		$str = str_replace($str_array,"i",$str);
		//chuyen thanh I
		$str_array = array("Í","Ĩ","Ị","Ì","I","Ỉ");
		$str = str_replace($str_array,"I",$str);
		
		//chuyen thanh d
		$str_array = array("đ");
		$str = str_replace($str_array,"d",$str);
		//chuyen thanh d
		$str_array = array("Đ");
		$str = str_replace($str_array,"D",$str);
		
		//chuyen thanh o
		$str_array = array("ó","ò","õ","ỏ","ọ","o", "ớ","ờ","ỡ","ở","ợ","ơ", "ố","ồ","ỗ","ổ","ộ","ô", "� �");
		$str = str_replace($str_array,"o",$str);
		//chuyen thanh O
		$str_array = array("Ó","Ò","Õ","Ỏ","Ọ","O", "Ớ","Ờ","Ỡ","Ở","Ợ","Ơ", "Ố","Ồ","Ỗ","Ổ","Ộ","Ô", "� �");
		$str = str_replace($str_array,"O",$str);
		
		//chuyen thanh e
		$str_array = array("é","è","ẹ","ẻ","ẽ","ê","ế","ề","ệ","ể","ễ");
		$str = str_replace($str_array,"e",$str);
		//chuyen thanh E
		$str_array = array("É","È","Ẹ","Ẻ","Ẽ","Ê","Ế","Ề" ,"Ệ","Ể","Ễ");
		$str = str_replace($str_array,"E",$str);
		
		//chuyen thanh u
		$str_array = array("ú","ù","ủ","ũ","ụ","u","ứ","ừ","ử","ữ","ự","ư");
		$str = str_replace($str_array,"u",$str);
		//chuyen thanh u
		$str_array = array("Ú","Ù","Ủ","Ũ","Ụ","U","Ứ","Ừ","Ử","Ữ","Ự","Ư");
		$str = str_replace($str_array,"U",$str);
		
		//chuyen thanh y
		$str_array = array("ý","ỳ","ỵ","ỹ","ỷ","y");
		$str = str_replace($str_array,"y",$str);
		//chuyen thanh Y
		$str_array = array("Ý","Ỳ","Ỵ","Ỹ","Ỷ","Y");
		$str = str_replace($str_array,"Y",$str);
		
		//chuyen thanh _	
		if($type ==1):
		$str_array = array("'",'"');
		$str = str_replace($str_array,"",$str);
		$str_array = array("-",'');
		$str = str_replace($str_array,"",$str);
		$str = str_replace(array(" ","%",":","?"),array("-","per","-",""),$str);
		elseif($type ==2):
		$str = str_replace(array("<p>","</p>"),array("",""),$str);
		else:
		$str = str_replace(array("%",":","?","-"),array("per","","",""),$str);
		endif;
		return $str;	

	}
	
	function fnsSubstr($string,$len,$more){
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
	
	function rsprint($var){
		print "<pre>";
		print_r($var);
		print "</pre>";
	}

	function redirect($urlstr){
		echo "<script language='javascript'>window.location='".$urlstr."';</script>";
	}
	
	function fns_numberPrice($float) 
 	{
		// Make sure that we only use the integer portion of the value
		if (!(float) $float) {
			return $float;
		}
		
		/* return money_format("%.{$places}n", $float);*/
		$strPrice1 = trim($float);
		return  number_format($float, 0, ',', '.');
 	}
	
	function date_limit_calculate($date_str,$date_count,$holidays,$sat_ra=2,$sun_ra=2){
		for($i=1; $i<=$date_count; $i++){
			$date_str = $date_str+(24*60*60);
			if (in_array(date("w", $date_str),array(0,6))) $i--;
			elseif (in_array(date('Y-m-d',$date_str),$holidays)) $i--;
		}
		return $date_str;
	}
?>