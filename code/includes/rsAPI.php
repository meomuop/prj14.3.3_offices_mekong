<?php
//XXXXX Project

define('_rs_VERSION_NUM','1.0');
define('_rs_VERSION_ID','JAMA');
define('_rs_VERSION_SUB','HATO');


//get Current time in format YYYY/MM/DD HH:mm:ss
function getNowTime() {
    return date("Y/m/d H:i:s");
}


/**
 Convert DB string to specified encoding string
 Now, it convert from db encoded (auto) to Shift-JIS
 Use for mobile contents
*/
function rsReadDBStr($str) {
	
   global $output_charset;
   
   return JcodeConvert($str,0,$output_charset);
 }
/**
Convert input string to specified DB encode
Now , it convert input string to EUC -> default charset for Linux
No need to set on PC version
*/
function rsWriteDBStr($str) {
	
   global $dbconfig;
   
   return JcodeConvert($str,0,$dbconfig['dbcharset']);
}

function rsConfigGetVar($name){
  if (isset($GLOBALS['rsconfig'][$name])) {
    $result = $GLOBALS['rsconfig'][$name];
  } else {
    $result = "";
  }
  return $result; 
}
    	
/**
 * strip slashes
 * 
 * stripslashes on multidimensional arrays.
 * Used in conjunction with rsVarCleanFromInput
 * 
 * @access private 
 * @param any $ variables or arrays to be stripslashed
 */
function rsStripslashes (&$value) {
    if(!is_array($value)) {
        $value = stripslashes($value);
    } else {
        array_walk($value,'rsStripslashes');
    }
}

/**
 * clean user input
 * @param var $ name of variable to get
 * @param  $ ...
 * @return mixed prepared variable if only one variable passed
 * in, otherwise an array of prepared variables
 */
function rsVarClean(){
    // Create an array of bad objects to clean out of input variables
	$search	= array('|</?\s*SCRIPT.*?>|si',
					'|</?\s*FRAME.*?>|si',
					'|</?\s*OBJECT.*?>|si',
					'|</?\s*META.*?>|si',
					'|</?\s*APPLET.*?>|si',
					'|</?\s*LINK.*?>|si',
					'|</?\s*IFRAME.*?>|si',
					'|STYLE\s*=\s*"[^"]*"|si');

	$replace = array('');
	$resarray =	array();
	
	foreach (func_get_args() as $var) {
	    if (empty($var) || is_array($var)) {
	        return;
	    }
	    if (isset($_REQUEST[$var])) {
            // Set $ourvar from the $_REQUEST superglobal
            $ourvar = $_REQUEST[$var];
            // If magic_quotes_gpc is on strip out the slashes
            if (get_magic_quotes_gpc()) {
                rsStripslashes($ourvar);
            }
	    } else if (isset($_FILES[$var])) {
            // Set $ourvar from the $_FILES superglobal
            $ourvar = $_FILES[$var];
	    } else {
	        $ourvar = null;
	    }
	    // Add the cleaned var to the return array
	    array_push($resarray, $ourvar);
	}

	// If there was only one parameter passed return a variable
	if (func_num_args()	== 1) {
		return $resarray[0];
	// Else return an array
	} else {
		return $resarray;
	}
} 

/**
 * ready databse output
 * <br />
 * Gets a variable, cleaning it up such that the text is
 * stored in a database exactly as expected
 * 
 * @param var $ variable to prepare
 * @param  $ ...
 * @return mixed prepared variable if only one variable passed
 * in, otherwise an array of prepared variables
 */
function rsVarPrepForStore(){
    $resarray = array();
    foreach (func_get_args() as $ourvar) {
        // Prepare var
        if (!get_magic_quotes_runtime()) {
            $ourvar = addslashes($ourvar);
        }
        // Add to array
        array_push($resarray, $ourvar);
    }
    // Return vars
    if (func_num_args() == 1) {
        return $resarray[0];
    } else {
        return $resarray;
    }
}

//get vars from Config
function rsGetConfig($arr) {
	
	global $$arr;  
  $ret=$$arr;

  return $ret;
}


/**
 * ready user output
 * <br />
 * Gets a variable, cleaning it up such that the text is
 * shown exactly as expected
 * 
 * @param var $ variable to prepare
 * @param  $ ...
 * @return mixed prepared variable if only one variable passed
 * in, otherwise an array of prepared variables
 */
function rsVarPrepForDisplay(){
    static $search = array('/(.)@(.)/se');
    static $replace = array('"&#" .
                            sprintf("%03d", ord("\\1")) .
                            ";&#064;&#" .
                            sprintf("%03d", ord("\\2")) . ";";');

    $resarray = array();
    foreach (func_get_args() as $ourvar) {
        // Prepare var
        $ourvar = htmlspecialchars($ourvar);
        $ourvar = preg_replace($search, $replace, $ourvar);
        // Add to array
        array_push($resarray, $ourvar);
    }
    // Return vars
    if (func_num_args() == 1) {
        return $resarray[0];
    } else {
        return $resarray;
    }
}
/**
 * get base URI 
 */
function rsGetBaseURI(){
	$path = rsServerGetVar('REQUEST_URI');

    if ((empty($path)) || (substr($path, -1, 1) == '/')) {
        $path = rsServerGetVar('PATH_INFO');
        if (empty($path)) {
			$path = rsServerGetVar('SCRIPT_NAME');
        } 
    } 
    $path = preg_replace('/[#\?].*/', '', $path);
    $path = dirname($path);

    if (preg_match('!^[/\\\]*$!', $path)) {
        $path = '';
    } 

    return $path;
}
/**
 * get base URL
 */
function rsGetBaseURL(){
	$server = rsServerGetVar('HTTP_HOST');

    // IIS sets HTTPS=off
	$https = rsServerGetVar('HTTPS');
    if (isset($https) && $https != 'off') {
        $proto = 'https://';
    } else {
        $proto = 'http://';
    } 

    $path = rsGetBaseURI();

    return "$proto$server$path/";
}

/**
 * Gets a server variable
 */
function rsServerGetVar($name){
    // Check the relevant superglobals
    if (isset($_SERVER[$name])) {
        return $_SERVER[$name];
    }
    if (isset($_ENV[$name])) {
        return $_ENV[$name];
    }
    if ($val = getenv($name)) {
        return $val;
    }
    return; // we found nothing here
}

/**
 * check to see if this is a local referral
 * @return bool true if locally referred, false if not
 */
function rsLocalReferer(){
	$server = rsServerGetVar('HTTP_HOST');
  $referer = rsServerGetVar('HTTP_REFERER');

  if (empty($referer) || preg_match("!^http://$server/!", $referer)) {
    return true;
  } else {
    return false;
  } 
}

/**
 * Get current URI (and optionally add/replace some parameters)
 *
 * @access public
 * @param args array additional parameters to be added to/replaced in the URI (e.g. theme, ...)
 * @return string current URI
 */
function rsGetCurrentURI($args = array()){
    // get current URI
    $request = rsServerGetVar('REQUEST_URI');

    if (empty($request)) {
        $scriptname = rsServerGetVar('SCRIPT_NAME');
        $pathinfo = rsServerGetVar('PATH_INFO');
        if ($pathinfo == $scriptname) {
            $pathinfo = '';
        }
        if (!empty($scriptname)) {
            $request = $scriptname . $pathinfo;
            $querystring = rsServerGetVar('QUERY_STRING');
            if (!empty($querystring)) $request .= '?'.$querystring;
        } else {
            $request = '/';
        }
    }

    // add optional parameters
    if (count($args) > 0) {
        if (strpos($request,'?') === false) $request .= '?';
        else $request .= '&';

        foreach ($args as $k=>$v) {
            if (is_array($v)) {
                foreach($v as $l=>$w) {
                // TODO: replace in-line here too ?
                    if (!empty($w)) $request .= $k . "[$l]=$w&";
                }
            } else {
                // if this parameter is already in the query string...
                if (preg_match("/(&|\?)($k=[^&]*)/",$request,$matches)) {
                    $find = $matches[2];
                    // ... replace it in-line if it's not empty
                    if (!empty($v)) {
                        $request = preg_replace("/(&|\?)$find/","$1$k=$v",$request);

                    // ... or remove it otherwise
                    } elseif ($matches[1] == '?') {
                        $request = preg_replace("/\?$find(&|)/",'?',$request);
                    } else {
                        $request = preg_replace("/&$find/",'',$request);
                    }
                } elseif (!empty($v)) {
                    $request .= "$k=$v&";
                }
            }
        }

        $request = substr($request, 0, -1);
    }

    return $request;
}

/* 
 Protects better diverse attempts of Cross-Site Scripting attacks
*/
function rsSecureInput() {
	// Cross-Site Scripting attack defense 
	if (count($_GET) > 0) {
		//        Lets now sanitize the GET vars
        foreach ($_GET as $secvalue) {
        	if (!is_array($secvalue)) {
                if ((eregi("<[^>]*script.*\"?[^>]*>", $secvalue)) ||
                        (eregi(".*[[:space:]](or|and)[[:space:]].*(=|like).*", $secvalue)) ||
                        (eregi("<[^>]*object.*\"?[^>]*>", $secvalue)) ||
                        (eregi("<[^>]*iframe.*\"?[^>]*>", $secvalue)) ||
                        (eregi("<[^>]*applet.*\"?[^>]*>", $secvalue)) ||
                        (eregi("<[^>]*meta.*\"?[^>]*>", $secvalue)) ||
                        (eregi("<[^>]*style.*\"?[^>]*>", $secvalue)) ||
                        (eregi("<[^>]*form.*\"?[^>]*>", $secvalue)) ||
                        (eregi("<[^>]*window.*\"?[^>]*>", $secvalue)) ||
                        (eregi("<[^>]*alert.*\"?[^>]*>", $secvalue)) ||
                        (eregi("<[^>]*img.*\"?[^>]*>", $secvalue)) ||
                        (eregi("<[^>]*document.*\"?[^>]*>", $secvalue)) ||
                        (eregi("<[^>]*cookie.*\"?[^>]*>", $secvalue)) ||
                        (eregi("\"", $secvalue))) {
                        Header("Location: index.php");
                }
        	}
        }
	}

	// Lets now sanitize the POST vars
	if ( count($_POST) > 0) {
        foreach ($_POST as $secvalue) {
        	if (!is_array($secvalue)) {
                if ((eregi("<[^>]*script.*\"?[^>]*>", $secvalue)) ||
                        (eregi("<[^>]*object.*\"?[^>]*>", $secvalue)) ||
                        (eregi("<[^>]*iframe.*\"?[^>]*>", $secvalue)) ||
                        (eregi("<[^>]*applet.*\"?[^>]*>", $secvalue)) ||
                        (eregi("<[^>]*window.*\"?[^>]*>", $secvalue)) ||
                        (eregi("<[^>]*alert.*\"?[^>]*>", $secvalue)) ||
                        (eregi("<[^>]*document.*\"?[^>]*>", $secvalue)) ||
                        (eregi("<[^>]*cookie.*\"?[^>]*>", $secvalue)) ||
                        (eregi("<[^>]*meta.*\"?[^>]*>", $secvalue))
                        ) {
                        Header("Location: index.php");
                }
         	}
        }
	}

	//Lets now sanitize the COOKIE vars
	if ( count($_COOKIE) > 0) {
        foreach ($_COOKIE as $secvalue) {
			if (!is_array($secvalue)) {
                if ((eregi("<[^>]*script.*\"?[^>]*>", $secvalue)) ||
                        (eregi(".*[[:space:]](or|and)[[:space:]].*(=|like).*", $secvalue)) ||
                        (eregi("<[^>]*object.*\"?[^>]*>", $secvalue)) ||
                        (eregi("<[^>]*iframe.*\"?[^>]*>", $secvalue)) ||
                        (eregi("<[^>]*applet.*\"?[^>]*>", $secvalue)) ||
                        (eregi("<[^>]*meta.*\"?[^>]*>", $secvalue)) ||
                        (eregi("<[^>]*style.*\"?[^>]*>", $secvalue)) ||
                        (eregi("<[^>]*form.*\"?[^>]*>", $secvalue)) ||
                        (eregi("<[^>]*window.*\"?[^>]*>", $secvalue)) ||
                        (eregi("<[^>]*alert.*\"?[^>]*>", $secvalue)) ||
                        (eregi("<[^>]*document.*\"?[^>]*>", $secvalue)) ||
                        (eregi("<[^>]*cookie.*\"?[^>]*>", $secvalue)) ||
                        (eregi("<[^>]*img.*\"?[^>]*>", $secvalue))
                        ) {
                        Header("Location: index.php");
                }
        	}
        }
	}
}

/** 
send plain text mail
*/
function rsSendMail($from, $to, $subject, $message,$cc=""){
    global $lfconfig;
    
    if (!$to) return false;
    
    $headers = "From: $from\r\n";
    if ($cc != "") $headers .= "Cc: $cc\r\n";
    $headers .= "Content-Type: text/plain; charset=iso-2022-jp\r\n"
             ."Content-Transfer-Encoding: 7bit\r\n";
    $subject = "=?iso-2022-jp?B?" . base64_encode(JcodeConvert($subject,0,3)) . "?=";
    $message = JcodeConvert($message,0,3);
    mail($to, $subject, $message, $headers);
}

/**
send html mail
*/
function rsSendHTMLMail($from , $to, $subject, $body,$cc="") {
    $headers = "From: $from\r\n"; 
    if ($cc != "") $headers .= "Cc: $cc\r\n";
    //specify MIME version 1.0 
    $headers .= "MIME-Version: 1.0\r\n"; 
  
    //unique boundary 
    $boundary = uniqid("JAMAHTMLMAIL"); 

    //tell e-mail client this e-mail contains//alternate versions 
    $headers .= "Content-Type: multipart/alternative" . 
              "; boundary = $boundary\r\n\r\n"; 

    //message to people with clients who don't 
    //understand MIME 
    $headers .= "This is a MIME encoded message.\r\n\r\n"; 

    //plain text version of message 
    $headers .= "--$boundary\r\n" . 
     "Content-Type: text/plain; charset=iso-2022-jp\r\n" . 
     "Content-Transfer-Encoding: 7bit\n";
  
    $headers .= chunk_split(base64_encode("This is the plain text version!")); 

    //HTML version of message 
    $headers .= "--$boundary\r\n" . 
             "Content-Type: text/html; charset=iso-2022-jp\r\n" . 
             "Content-Transfer-Encoding: 7bit\n"; 
    $headers .= chunk_split(base64_encode("This the <b>HTML</b> version!")); 
  
    $subject = "=?iso-2022-jp?B?" . base64_encode(jcodeconvert($subject,0,3)) . "?="; 
    $body = jcodeconvert($body,0,2);

    //send message 
    mail($to, $subject, $body, $headers); 
 
 }

function rsCheckNum($str,$isNull = false) {
  if ($str == "") {
    if ($isNull) return true;
    else return false;
  }else {
    if (!is_numeric($str)) {
      return false;
    }
    else return true;
  }
  return true;
}
?>