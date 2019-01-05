<?php
/*-------------------------------------------
- PHP Smarty Template Engine
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/

class users_class extends dbBasic {
  	var  $user_id; 
	var  $department_id;
	var  $object_id;
	var  $user_fullname;  
  	var  $user_name; 
  	var  $user_pass;
	var  $user_encode_pass;
	var  $user_phone;
	var  $user_email;
	var  $user_image;
	var  $per_sms;
	var  $user_level_tnvb;
	var  $user_level_soft;
 	
	var $pfields = array (	'user_id',
						  	'department_id',
							'object_id',
							'user_fullname',
							'user_name',
							'user_pass',
							'user_encode_pass',
							'user_phone',
							'user_email',
							'user_image',
							'per_sms',
							'user_level_tnvb',
							'user_level_soft'); //table private fields
							
  	var $pkeys = array ('user_id'); //key fields
  
 	function users_class() { 
    	$this->dbBasic();  
    	$this->tablename = "".TBL."users";
  	}
	
  	function readform()
  	{
  		dbBasic::readform();
  	}  	
	
	function writeform()
  	{
		dbBasic::writeForm();
  	}	
		
	/**
	 * Verify the syntax of the given name.
	 */
	function validate_name($name) {
	  if (!strlen($name)) return 'Bạn phải nhập tên đăng nhập.';
	  if (substr($name, 0, 1) == ' ') return 'Tên đăng nhập không được bắt đầu bằng kí tự rỗng.';
	  if (substr($name, -1) == ' ') return 'Tên đăng nhập không được kết thúc với kí tự rỗng.';
	  if (strpos($name, ' ') !== FALSE) return 'Trong tên đăng nhập không được có kí tự rỗng';
	  if (ereg("[^\x80-\xF7 [:alnum:]@_.-]", $name)) return 'Tên đăng nhập không được có kí tự đặc biệt';
	  if (preg_match('/[\x{80}-\x{A0}'.          // Non-printable ISO-8859-1 + NBSP
					   '\x{AD}'.                 // Soft-hyphen
					   '\x{2000}-\x{200F}'.      // Various space characters
					   '\x{2028}-\x{202F}'.      // Bidirectional text overrides
					   '\x{205F}-\x{206F}'.      // Various text hinting characters
					   '\x{FEFF}'.               // Byte order mark
					   '\x{FF01}-\x{FF60}'.      // Full-width latin
					   '\x{FFF9}-\x{FFFD}'.      // Replacement characters
					   '\x{0}]/u',               // NULL byte
					   $name)) {
		return 'Tên đăng nhập không được có kí tự đặc biệt';
	  }  
/*	  if (preg_match('%(?:'.
			'[\xC2-\xDF][\x80-\xBF]'.        # non-overlong 2-byte
			'|\xE0[\xA0-\xBF][\x80-\xBF]'.               # excluding overlongs
			'|[\xE1-\xEC\xEE\xEF][\x80-\xBF]{2}'.      # straight 3-byte
			'|\xED[\x80-\x9F][\x80-\xBF]'.               # excluding surrogates
			'|\xF0[\x90-\xBF][\x80-\xBF]{2}'.    # planes 1-3
			'|[\xF1-\xF3][\x80-\xBF]{3}'.                  # planes 4-15
			'|\xF4[\x80-\x8F][\x80-\xBF]{2}'.    # plane 16
			')+%xs', $name)) {
		 return 'Tên không được có dấu';       
	  }*/
	  if (strpos($name, '@') !== FALSE && !eregi('@([0-9a-z](-?[0-9a-z])*.)+[a-z]{2}([zmuvtg]|fo|me)?$', $name)){
	  	return 'Tên không được chứa kí tự ID.';
	  }
	  if (strlen($name) > 20) return "Tài khoản $name quá dài: chỉ được 20 kí tự hoặc ít hơn.";
	}
	
	/**
	 * Verify the syntax of the given mail.
	*/
	function validate_mail($mail) {
	  if (!$this->valid_email_address($mail)) {
		return "Địa chỉ E-mail $mail không đúng định dạng.";
	  }
	  if ($this->find_email($mail)) return 'Đã có E-mail trong hệ thống';
	}	
	
	/**
	 * Verify the syntax of the given e-mail address.
	 *
	 * Empty e-mail addresses are allowed. See RFC 2822 for details.
	 *
	 * @param $mail
	 *   A string containing an e-mail address.
	 * @return
	 *   TRUE if the address is in a valid format.
	*/
	function valid_email_address($mail) {
	  $user = '[a-zA-Z0-9_\-\.\+\^!#\$%&*+\/\=\?\`\|\{\}~\']+';
	  $domain = '(?:(?:[a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9\-]*[a-zA-Z0-9])\.?)+';
	  $ipv4 = '[0-9]{1,3}(\.[0-9]{1,3}){3}';
	  $ipv6 = '[0-9a-fA-F]{1,4}(\:[0-9a-fA-F]{1,4}){7}';
	
	  return preg_match("/^$user@($domain|(\[($ipv4|$ipv6)\]))$/", $mail);
	}
	
	function checkForm($edit = FALSE) {
		$error = "";
		if (!$edit){
			if ($this->find_user($this->user_name))
				return "Tài khoản này đã được sử dụng";	
				
			$error = $this->validate_name($this->user_name);	
			
			/*if ($error == "") {
				if ((!is_null($this->user_email)) && ($this->user_email != "")) {
					$error = $this->validate_mail($this->user_email);
				}
			}*/				
		}else {
			$this_obj = new users_class();
			$this_obj->getDBbyPkey($this->user_id);

			if ($this_obj->user_name == "") return "Có lỗi trong quá trình thực hiện";

			$error = $this->validate_name($this->user_name);
			
			if ($this->find_user($this->user_name) && $this->user_name != $this_obj->user_name)		
			 	return 'Đã có tài khoản trong hệ thống';			
			
			if ($error == "") {
				if ((!is_null($this->user_email)) && ($this->user_email != "")) {
					if ($this->user_email != $this_obj->user_email) 
						$error = $this->validate_mail($this->user_email);
				}
			}			
		}

		return $error;
	}
	
	function find_user($name) {
		$strSQL = sprintf(" user_name = '%s' ",$name); 		
		$numrows = dbBasic::getRowNumber($strSQL);
	
		if ($numrows > 0) {
			return true;
		} 	
		return false;		
	}
	
	function find_email($email) {
		$strSQL = sprintf(" user_email = '%s' ",$email); 		
		$numrows = dbBasic::getRowNumber($strSQL);
	
		if ($numrows > 0) {
			return true;
		} 	
		return false;		
	}
	
	// --- sort item by array
    function sortItem($sort,$id){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set user_sort=".$sort." where user_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }
	
	//Lay mat khau cu de so sanh khi doi tai khoan
	function getpassword($user_id) {
		global $dbconn;

        // ---- Get sql query
        $sql = " SELECT user_pass FROM $this->tablename where user_id=".$user_id;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
	}
	
	//Lay mat khau cu de so sanh khi doi tai khoan
	/*function getUserIDbyLevel($user_level_tnvb) {
		global $dbconn;

        // ---- Get sql query
        $sql = " SELECT user_id FROM $this->tablename where user_level_tnvb=".$user_level_tnvb;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields;
	}*/
	
	//Lay mat khau cu de so sanh khi doi tai khoan
	function getUserIDbyLevel($user_level_tnvb) {
		global $dbconn;

        // ---- Get sql query
        $sql = " SELECT user_id FROM $this->tablename where user_level_tnvb=".$user_level_tnvb;
        // ---- Execute SQL
        $result = mysql_query($sql);	
		return $result;
	}
	
	//Lay mat khau cu de so sanh khi doi tai khoan
	function getModule($id) {
		global $dbconn;

        // ---- Get sql query
        $sql = " SELECT user_module FROM $this->tablename where user_id=".$id;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
	}
	
	//Lay cac module trong quyen han ng dung
	function check_mod($user_id,$mod_id){
		global $dbconn;

        // ---- Get sql query
        $sql = " SELECT user_module FROM $this->tablename where user_module like '%".$mod_id."%' and user_id=".$user_id;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
	}
	
	//Ham kiem tra dieu kien LOGIN 
	//Thuc hien khi dang nhap
	function DoLogin() {
		global $dbconn;
		$query = "SELECT * FROM $this->tablename WHERE user_active = 1 and user_name = '".$this->user_name."'";
		//echo $query;
		$result = $dbconn->Execute($query);
		$DoLogin = 0; //ten khong dung
		if (!$result->EOF) {
			$correctPass = $result->fields("user_pass");
			if ($correctPass == $this->user_pass) {
				$_SESSION["user_id"] 		= $result->fields("user_id");
				$_SESSION["user_name"] 		= $this->user_name;
				$_SESSION["user_fullname"] 	= $result->fields("user_fullname");
				$_SESSION["user_image"] 	= $result->fields("user_image");
				$_SESSION["per_add"] 		= 1;//$result->fields("per_add");
				$_SESSION["per_edit"] 		= 1;//$result->fields("per_edit");
				$_SESSION["per_del"] 		= 1;//$result->fields("per_del");
				$_SESSION["per_act"] 		= 1;//$result->fields("per_act");
				$_SESSION["per_view"] 		= 1;// $result->fields("per_view");
				$_SESSION["user_level_tnvb"] 	= $result->fields("user_level_tnvb");
				$_SESSION["user_level_tnvb"] 	= $result->fields("user_level_tnvb");
				$_SESSION["user_level_tnvb_soft"] 	= $result->fields("user_level_tnvb_soft");
				$_SESSION["user_module"] 	= $result->fields("user_module");
				
				$DoLogin = 1; //OK dung tai khoan
			} else
				$DoLogin = 2; //mat khau khong dung
		}
		return $DoLogin;
	}

	//Thoat dang nhap
	function DoLogout() {
		$_SESSION["user_id"] 		= NULL;
		$_SESSION["user_name"] 		= NULL;
		$_SESSION["user_fullname"] 	= NULL;
		$_SESSION["user_image"] 	= NULL;
		$_SESSION["user_level_tnvb"] 	= NULL;
		$_SESSION["per_add"] 		= NULL;
		$_SESSION["per_edit"] 		= NULL;
		$_SESSION["per_del"] 		= NULL;
		$_SESSION["per_act"] 		= NULL;
		$_SESSION["per_view"] 		= NULL;
		$_SESSION["user_module"] 	= NULL;
		$_SESSION["user_level_tnvb"] 	= NULL;
		$_SESSION["user_level_tnvb"] 	= NULL;
		$_SESSION["user_level_tnvb_soft"] 	= NULL;
		
		unset($_SESSION["user_id"]);
		unset($_SESSION["user_name"]);
		unset($_SESSION["user_fullname"]);
		unset($_SESSION["user_image"]);
		unset($_SESSION["user_level_tnvb"]);
		unset($_SESSION["per_add"]);
		unset($_SESSION["per_edit"]);
		unset($_SESSION["per_del"]);
		unset($_SESSION["per_act"]);
		unset($_SESSION["per_view"]);
		unset($_SESSION["user_module"]);
		unset($_SESSION["user_level_tnvb"]);
		unset($_SESSION["user_level_tnvb"]);
		unset($_SESSION["user_level_tnvb_soft"]);
	}
	
  //Ham Delete AllItem in list $listID
  function removeInList($listID) {
	global $dbconn;
	$query = "DELETE FROM $this->tablename 
				WHERE user_id IN ('". str_replace(",","','",$listID) ."') and user_id != 1";
    $dbconn->Execute($query);
  }	
		
}
?>