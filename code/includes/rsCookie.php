<?php 
//RS Project

/**
 * Cookie handling
 */

function rsCookieExist($name) {
	if(isset($_COOKIE['RS' . $name])) {
    return true;
  }
  return false;
}

/**
 * Get a cookie variable
 * @param name $ name of the session variable to get
 */
function rsCookieGetVar($name){
    if(isset($_COOKIE['RS' . $name])) {
        return $_COOKIE['RS' . $name];
    }
    return false;
}

/**
 * Set a cookie variable
 * @param name $ name of the session variable to set
 * @param value $ value to set the named session variable
 */
function rsCookieSetVar($name, $value){
    setcookie ('RS' . $name, $value,time()+_COOKIE_EXPIRE); 
    return true;
} 

/**
 * Delete a cookie variable
 * @param name $ name of the session variable to delete
 */
function rsCookieDelVar($name){
    unset($_COOKIE['RS' . $name]);
    return true;
} 
