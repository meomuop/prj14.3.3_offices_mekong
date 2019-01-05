<?php
/*-------------------------------------------
- PHP Smarty Template Engine
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/

class docReply_class extends dbBasic {
  	var  $docReply_id;
	var  $doc_id;
	var  $user_id;
	var	 $coordinate_per;
	var  $coordinate_depart;
	var  $recevie_per; 
	var  $department_id; 
	var  $main_department; 
	var  $process_per; 
	var  $process_level;
	var  $docReply_date;
	var  $docReply_desc; 
	var  $docReply_numday;
	var  $docReply_limit_time; 
	var  $docReply_sort;
	var  $docReply_active;
	var  $input_per;
 	
	var $pfields = array (	'docReply_id',
						  	'doc_id',
							'user_id',
							'coordinate_per',
							'coordinate_depart',
							'recevie_per',
							'department_id',
							'main_department',
							'process_per',
							'process_level',
							'docReply_date',
							'docReply_desc',
							'docReply_numday',
							'docReply_limit_time',
							'docReply_sort',
							'docReply_active',
							'input_per'); //table private fields
							
  	var $pkeys = array ('docReply_id'); //key fields
  
 	function docReply_class(){ 
    	$this->dbBasic();  
    	$this->tablename = "tbl_docreplys";
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
        $sql = " SELECT docReply_id FROM $this->tablename where ".$where;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }	
	
	// --- update active
    function updateActive($where){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set docReply_active = 1 where ".$where;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }
	
	// --- update traned
    function updateTraned($where){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set docReply_traned = 1 where ".$where;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }
	// --- update traned
    function resetTraned($doc_id){
        global $dbconn;
		echo $doc_id;
		$sql = "select docReply_id from $this->tablename where doc_id = ".$doc_id." order by docReply_id desc limit 1";
		$result = mysql_query($sql) or die($sql);
		if($result):
			$row = mysql_fetch_array($result);
			// ---- Get sql query
			$sql = " UPDATE $this->tablename set docReply_traned = 0 where docReply_id = ".$row['docReply_id'];
			// ---- Execute SQL
			$dbconn->Execute($sql);
		endif;
    }
		
	// --- sort item by array
    function sortItem($sort,$id){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set docReply_sort=".$sort." where docReply_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }
	
	// --- get number of rows
    function getNumresult($where = ""){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT count(docReply_id) FROM $this->tablename ".$where;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }	
		
	// --- get top 1 news
	function getTopRows(){
		$where = " 1 = 1 and docReply_active = 1";
    	$rows = $this->getDBList($where," docReply_id DESC",true," Limit 1");
    	return $rows;
    }
}
?>