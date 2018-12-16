<?php 
//RS Project

/**
 * Set up session handling
 */
function rsSessionSetup(){
    $path = rsGetBaseURI();
    if (empty($path)) {
        $path = '/';
    }
    
    $host = rsServerGetVar('HTTP_HOST');
    $host = preg_replace('/:.*/', '', $host);
    // PHP configuration variables
    // Stop adding SID to URLs
    ini_set('session.use_trans_sid', 0);
    // User-defined save handler
    //ini_set('session.save_handler', 'user');
    // How to store data
    //ini_set('session.serialize_handler', 'php');
    // Use cookie to store the session ID
    ini_set('session.use_cookies', 1);
    // Name of our cookie
    ini_set('session.name', 'RSSID');
    $lifetime = 0;
    ini_set('session.referer_check', "$host");
    ini_set('session.cookie_lifetime', $lifetime);
    // Auto-start session
    ini_set('session.auto_start', 1);
    // Session handlers
    /**
    session_set_save_handler("rsSessionOpen",
                             "rsSessionClose",
                             "rsSessionRead",
                             "rsSessionWrite",
                             "rsSessionDestroy",
                             "rsSessionGC");
    */
    return true;
} 

/**
 * Get a session variable
 * @param name $ name of the session variable to get
 */
function rsSessionGetVar($name){
    if(isset($_SESSION['RS' . $name])) {
        return $_SESSION['RS' . $name];
    }
    return false;
}

/**
 * Determine a session variable is set or not
 * @param name $ name of the session variable
 */
function rsSessionExist($name) {
	if(isset($_SESSION['RS' . $name])) {
    return true;
  }
  return false;
}

/**
 * Set a session variable
 * @param name $ name of the session variable to set
 * @param value $ value to set the named session variable
 */
function rsSessionSetVar($name, $value){
    $_SESSION['RS' . $name] = $value;
    return true;
} 

/**
 * Delete a session variable
 * @param name $ name of the session variable to delete
 */
function rsSessionDelVar($name){
    unset($_SESSION['RS' . $name]);
    unset($GLOBALS['RS' . $name]);
    return true;
} 

/**
 * Initialise session
 */
function rsSessionInit(){
	global $dbconn;
    foreach($GLOBALS as $k => $v) {
        if (preg_match('/^RS/', $k)) {
            return false;
        }
    }
    // Kick it
    session_start();
    Header('Cache-Control: cache');

    $sessid = session_id();
    // Get (actual) client IP addr
	  $ipaddr = rsServerGetVar('REMOTE_ADDR');
	  if (empty($ipaddr)) {
        $ipaddr = rsServerGetVar('HTTP_CLIENT_IP');
    }
    $tmpipaddr = rsServerGetVar('HTTP_CLIENT_IP');
    if (!empty($tmpipaddr)) {
        $ipaddr = $tmpipaddr;
    }
	  $fwdipaddr = rsServerGetVar('HTTP_X_FORWARDED_FOR');
    if (!empty($fwdipaddr)) {
        $ipaddr = preg_replace('/,.*/', '', $fwdipaddr);
    }
    $tmpipaddr = $fwdipaddr;
    if (!empty($tmpipaddr)) {
        $ipaddr = preg_replace('/,.*/', '', $tmpipaddr);
    }

    return true;
} 

function rsSessionOpen($path, $name){ 
    return true;
} 


function rsSessionClose(){ 
    return true;
} 


function rsSessionRead($sessid){
    return true;
} 

function rsSessionWrite($sessid, $vars){
    return true;
} 

function rsSessionDestroy($sessid){
    return true;
} 


function pnSessionGC($maxlifetime){
    return true;
} 

?>