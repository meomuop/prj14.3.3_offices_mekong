<?php
/*-------------------------------------------
- PHP Smarty Template Engine
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/

class feedback_class extends dbBasic {
  	var  $feedback_id;
	var  $doc_id;
	var  $feedback_cont; 
  	var  $feedback_date;
	var  $user_id;
	var  $read_status;
	var  $read_time;
 	
	var $pfields = array (	'feedback_id',
						  	'doc_id',
							'feedback_cont',
							'feedback_date',
							'user_id',
							'read_status',
							'read_time'); //table private fields
							
  	var $pkeys = array ('feedback_id'); //key fields
  
 	function feedback_class(){ 
    	$this->dbBasic();  
    	$this->tablename = "tbl_feedbacks";
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
	
	// --- get last document
	function getLastOne(){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT feedback_id FROM $this->tablename where 1 = 1 order by feedback_id desc limit 1";
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }
	
	// --- get the same number
	function getSameNum($num){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT count(feedback_num) FROM $this->tablename where 1 = 1 and feedback_num = ".$num." order by feedback_id desc limit 1";
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }
	
	// --- Check the Coincidece document by feedback_num, feedback_signed, unit_name
	function checkCoincidence($feedback_code, $feedback_id = 0){
        global $dbconn;
        // ---- Get sql query
		$where = " AND feedback_code = '".$feedback_code."'";
		if($feedback_id!=0) $where.=" AND feedback_id != ".$feedback_id;
        $sql = " SELECT count(feedback_id) FROM $this->tablename WHERE 1 = 1".$where;
		
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }
	
	// --- get last document number by user_id
	function getLastNumbyInputPer($user_id){
		global $dbconn;
        // ---- Get sql query
        $sql = " SELECT feedback_num FROM $this->tablename where 1 = 1 and input_per = ".$user_id." order by feedback_id desc limit 1";
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
	}
		
	// --- sort item by array
    function sortItem($sort,$id){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set feedback_sort=".$sort." where feedback_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }
	
	// ---change reply status
    function changeDocReplied($id){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set feedback_replied=1 where feedback_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }
	
	// ---change file status
    function changeDocFile($id,$val){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set feedback_file = ".$val." where feedback_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }
	
	// --- get number of rows
    function getNumresult($where = ""){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT count(feedback_id) FROM $this->tablename ".$where;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }	
		
	// --- get top 1 news
	function getTopRows(){
		$where = " 1 = 1 and feedback_active = 1";
    	$rows = $this->getDBList($where," feedback_id DESC",true," Limit 1");
    	return $rows;
    }
}
?>