<?php
/*-------------------------------------------
- PHP Smarty Template Engine
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/

class docreceive_class extends dbBasic {
  	var  $doc_id;
	var  $docCat_id;
	var  $docField_id;
	var  $doc_unit; 
	var  $department_id;
	var  $doc_code; 
	var  $doc_desc; 
	var  $doc_direct;
	var  $doc_note;
	var  $doc_signed; 
	var  $signPer_id;
	var  $important_id;
  	var  $doc_date;
	var  $doc_limit_time;
	var  $doc_sort;
	var  $doc_active;
	var  $doc_file;
	var  $user_id;
	var  $receive_id;
	var  $R_doc_id;
	var  $R_department_id; 
	var  $receive_per;
	var	 $receive_note;
	var  $receive_time;
	var  $read_status; 
	var  $read_time;
	var  $read_per;
 	
	var $pfields = array (	'doc_id',
						  	'docCat_id',
							'docField_id',
							'doc_unit',
							'department_id',
							'doc_code',
							'doc_desc',
							'doc_direct',
							'doc_note',
							'doc_signed',
							'signPer_id',
							'important_id',
							'doc_date',
							'doc_sort',
							'doc_limit_time',
							'doc_active',
							'doc_file',
							'user_id',
							'receive_id',
							'R_doc_id',
							'R_department_id',
							'receive_per',
							'receive_note',
							'receive_time',
							'read_status',
							'read_time',
							'read_per'); //table private fields
							
  	var $pkeys = array ('doc_id'); //key fields
  
 	function docreceive_class(){ 
    	$this->dbBasic();  
    	$this->tablename = "doc_receive";
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
        $sql = " SELECT doc_id FROM $this->tablename where 1 = 1 order by doc_id desc limit 1";
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }
	
	// --- get the same number
	function getSameNum($num){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT count(doc_num) FROM $this->tablename where 1 = 1 and doc_num = ".$num." order by doc_id desc limit 1";
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }
	
	// --- Check the Coincidece document by doc_num, doc_signed, unit_name
	function checkCoincidence($doc_code, $doc_id = 0){
        global $dbconn;
        // ---- Get sql query
		$where = " AND doc_code = '".$doc_code."'";
		if($doc_id!=0) $where.=" AND doc_id != ".$doc_id;
        $sql = " SELECT count(doc_id) FROM $this->tablename WHERE 1 = 1".$where;
		
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }
	
	// --- get last document number by user_id
	function getLastNumbyInputPer($user_id){
		global $dbconn;
        // ---- Get sql query
        $sql = " SELECT doc_num FROM $this->tablename where 1 = 1 and input_per = ".$user_id." order by doc_id desc limit 1";
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
	}
		
	// --- sort item by array
    function sortItem($sort,$id){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set doc_sort=".$sort." where doc_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }
	
	// ---change reply status
    function changeDocReplied($id){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set doc_replied=1 where doc_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }
	
	// ---change file status
    function changeDocFile($id,$val){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set doc_file = ".$val." where doc_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }
	
	// --- get number of rows
    function getNumresult($where = ""){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT count(doc_id) FROM $this->tablename ".$where;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }	
	
	// --- get number of rows
    function getCountDistinct($where = ""){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT count(Distinct(doc_id)) AS COUNT FROM $this->tablename where ".$where;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }	
		
	// --- get top 1 news
	function getTopRows(){
		$where = " 1 = 1 and doc_active = 1";
    	$rows = $this->getDBList($where," doc_id DESC",true," Limit 1");
    	return $rows;
    }
}
?>