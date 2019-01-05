<?php
/*-------------------------------------------
- PHP Smarty Template Engine
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/

class recuser_class extends dbBasic {
  	var  $recUser_id;
	var  $user_id;
	var  $receive_id; 
	var  $read_time;
	var	 $read_status;
	var  $recUser_date;
 	
	var $pfields = array (	'recUser_id',
						  	'user_id',
							'receive_id',
							'read_time',
							'read_status',
							'recUser_date'); //table private fields
							
  	var $pkeys = array ('recuser_id'); //key fields
  
 	function recuser_class(){ 
    	$this->dbBasic();  
    	$this->tablename = "tbl_recusers";
  	}
	
  	function readform(){
  		dbBasic::readform();
  	}  	
	
	function writeform(){
		dbBasic::writeForm();
  	}
	
	/****************************
	 * function getNewsList
	 * return $ret --- array of product list
	 *************************/
    function getNewsList($where = "", $order = "", $limit = ""){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT * FROM $this->tablename ";
        $sql .= $where;
        $sql .= $order;
        $sql .= $limit;
		// ---- Execute SQL
        $result = $dbconn->Execute($sql);
        // ---- Define an array ---> result of function
        $ret = array();
        // --- recordset ---> array() ---
		if ($result) {	
			for (; !$result->EOF; $result->MoveNext()){
				$i = 0;
				$temp = new stdClass();
				foreach ($array_fields as $id) {
					// $temp->$id = $result->fields[$i++];
					$fname = "temp->$id";
					$value = trim($result->fields[$i++]);
					$value = stripslashes($value);
					//$value = mb_convert_encoding($value, "UTF-8", "auto");
					if(get_magic_quotes_gpc()) {
						$value = stripslashes($value);
					}
					$temp->$id=$value;
				}
				$ret[] = $temp;
				unset($temp);
			}
		}	
        // return $ret ---> array of product list
        // print_r($ret);
        return $ret;
    }
	
	// --- delete item by receive_id
    function delByDocID($doc_id){
        global $dbconn;
        // ---- Get sql query
        $sql = " DELETE FROM $this->tablename where receive_id in(select receive_id from tbl_receives where doc_id=".$doc_id.")";
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }	
	
	// --- update read status
    function changeRead($where_recuser){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set read_status = 1, read_time = '".date('Y-m-d H:i:s')."' where ".$where_recuser;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }
	
	// --- get number of rows
    function getNumresult($where = ""){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT count(recuser_id) FROM $this->tablename ".$where;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }	
		
	// --- get top 1 news
	function getTopRows(){
		$where = " 1 = 1 and recuser_active = 1";
    	$rows = $this->getDBList($where," recuser_id DESC",true," Limit 1");
    	return $rows;
    }
}
?>