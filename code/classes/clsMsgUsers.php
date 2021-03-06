<?php
/*-------------------------------------------
- PHP Smarty Template Engine
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/

class msgUser_class extends dbBasic {
  	var  $msgUser_id;
	var  $user_id;
	var  $msg_id;
	var  $msgUser_active;
 	
	var $pfields = array (	'msgUser_id',
						  	'user_id',
							'msg_id',
							'msgUser_active'); //table private fields
							
  	var $pkeys = array ('msgUser_id'); //key fields
  
 	function msgUser_class(){ 
    	$this->dbBasic();  
    	$this->tablename = "tbl_msgusers";
  	}
	
  	function readform(){
  		dbBasic::readform();
  	}  	
	
	function writeform(){
		dbBasic::writeForm();
  	}
	
	// get last item
	function removebyFK($msg_id){
        global $dbconn;
        // ---- Get sql query
        $sql = "DELETE FROM $this->tablename where user_id = ".$_SESSION['user_id']." and msg_id=".$msg_id;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		//return $result->fields[0];
    }
	
	// --- updateType
    function updateType($id, $user_id, $value){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set msgUser_type=".$value." where user_id = ".$user_id." and msg_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }
	
	// --- updateStatus
    function updateStatus($id,$user_id){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set msgUser_active=1 where msg_id=".$id." AND user_id=".$user_id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }
}
?>