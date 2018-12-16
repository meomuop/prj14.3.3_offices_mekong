<?php
/*-------------------------------------------
- PHP Frame work Informa
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/

class receive_class extends dbBasic {
  	var  $receive_id;
	var  $doc_id;
	var  $department_id; 
	var  $receive_per;
	var	 $receive_note;
	var  $receive_time;
	var  $receive_sms;
	var  $doc_status;
	var  $read_status; 
	var  $read_time;
	var  $read_per;
 	
	var $pfields = array (	'receive_id',
						  	'doc_id',
							'department_id',
							'receive_per',
							'receive_note',
							'receive_time',
							'receive_sms',
							'doc_status',
							'read_status',
							'read_time',
							'read_per'); //table private fields
							
  	var $pkeys = array ('receive_id'); //key fields
  
 	function receive_class(){ 
    	$this->dbBasic();  
    	$this->tablename = "tbl_receives";
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
	
	// --- get last rows
    function getLastID($where){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT receive_id FROM $this->tablename where ".$where." order by receive_id DESC limit 1";
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }
	
	// --- Get receive by doc_id and user_id
	function getReceivebyUser($where_receive){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT count(receive_id) as count FROM $this->tablename where ".$where_receive;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }
	
	// --- update read status
    function changeRead($where_receive){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set read_status = 1, read_per = ".$_SESSION['user_id'].", read_time = '".date('Y-m-d H:i:s')."' where ".$where_receive;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }
	
	// --- delete item by doc_id
    function delByDocID($doc_id){
        global $dbconn;
        // ---- Get sql query
        $sql = " DELETE FROM $this->tablename where doc_id=".$doc_id;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }	
	
	// --- update active
    function updateActive($where){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set receive_active = 1 where ".$where;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }
			
	// --- sort item by array
    function sortItem($sort,$id){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set receive_sort=".$sort." where receive_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }
	
	// --- get number of rows
    function getNumresult($where = ""){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT count(receive_id) FROM $this->tablename ".$where;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }	
		
	// --- get top 1 news
	function getTopRows(){
		$where = " 1 = 1 and receive_active = 1";
    	$rows = $this->getDBList($where," receive_id DESC",true," Limit 1");
    	return $rows;
    }
}
?>