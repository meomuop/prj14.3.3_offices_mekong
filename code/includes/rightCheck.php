<?php
/**
 * Halkul Project
 * rightCheck.php : Get access right of login user
 * Rev 2006.06.01 _ ngotau@runsystem.net
 * @Copyright 2005-2006 by RunSystem Corp. All Rights Reserved.
*/

require_once($CLASSES_PATH."login.php");

/**
 * do login
 * @param $lid -> login id, $password -> pasword, $cookie_flg --> cookie flag
 */
function doLogin($lid,$password,$cookie_flg){
  global $_POST,$HTTP_GET_VARS;
	$loginObj = new login();
  $accessObj = $loginObj->getAccess($lid,$password);
  $fid = $accessObj[0];
  $access = $accessObj[1];
  $vars = array_merge($_POST,$HTTP_GET_VARS);
  
  $success = false;
  if ($vars['loginform'] == "ad") {
      if ($access == _RIGHT_ADMIN) $success = true;
  }else {
      if ( ($access == _RIGHT_COMPANY) || ($access == _RIGHT_STORE) ) $success = true;
  }
  if ( ($fid > -1) && $success ) {
    //login success, save lid, fid, access to session
    rsSessionSetVar('loginid',$lid);
    rsSessionSetVar('fid',$fid);
    rsSessionSetVar('access',$access);
    if ($cookie_flg == 1) {
      rsCookieSetVar('loginid',$lid);
      rsCookieSetVar('fid',$fid);
      rsCookieSetVar('access',$access);
    }
    return true;
  }else {
    //login fail
    if ($vars['loginform'] == "ad") {
      header('Location:ad_login_login.php?error=1');
    }else {
      header('Location:en_login_login.php?error=1');
    }
  }
}

/**
 * check login
 * @param $access --> access level
 * check session , if fid in session is exist then 
 */
function checkLogin($access) {
  //check auto login
  if (rsCookieExist('access') && rsCookieExist('fid') && !rsSessionExist('access')) {
    rsSessionSetVar('access',rsCookieGetVar('access'));
    rsSessionSetVar('fid',rsCookieGetVar('fid'));
  }
  
  $session_access = rsSessionGetVar("access");
  $session_fid = rsSessionGetVar("fid");
  if ( ($session_access > 0) && ($session_fid >-1)) {
    //already login
    
  }else {
    if ($access == _RIGHT_ADMIN) {
      header('Location:ad_login_login.php?error=1');
    }else 
    if ($access == _RIGHT_COMPANY) {
      header('Location:en_login_login.php?error=1');
    }else
    if ($access == _RIGHT_STORE) {
      header('Location:../en/en_login_login.php?error=1');
    }
  }
  return true;
}
?>