<?php
/*-------------------------------------------
- PHP Smarty Template Engine
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/

class docreply_class extends dbBasic {
  	var  $docreply_id;
	var  $doc_id;
	var  $docCat_id;
	var  $docField_id;
	var  $docreply_unit;
	var  $docreply_code; 
	var  $docreply_desc; 
	var  $docreply_direct;
	var  $docreply_note;
	var  $docreply_signed; 
	var  $signPer_id;
	var  $important_id;
  	var  $docreply_date;
	var  $docreply_limit_time;
	var  $user_id;
	var  $docreply_file;
 	
	var $pfields = array (	'docreply_id',
						  	'doc_id',
						  	'docCat_id',
							'docField_id',
							'docreply_unit',
							'docreply_code',
							'docreply_desc',
							'docreply_direct',
							'docreply_note',
							'docreply_signed',
							'signPer_id',
							'important_id',
							'docreply_date',
							'docreply_limit_time',
							'user_id',
							'docreply_file'); //table private fields
							
  	var $pkeys = array ('docreply_id'); //key fields
  
 	function docreply_class(){ 
    	$this->dbBasic();  
    	$this->tablename = "tbl_vbreplys";
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
        $sql = " SELECT docreply_id FROM $this->tablename where 1 = 1 order by docreply_id desc limit 1";
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }
	
	// --- get the same number
	function getSameNum($num){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT count(docreply_num) FROM $this->tablename where 1 = 1 and docreply_num = ".$num." order by docreply_id desc limit 1";
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }
	
	// --- Check the Coincidece document by docreply_num, docreply_signed, unit_name
	function checkCoincidence($docreply_code, $docreply_id = 0){
        global $dbconn;
        // ---- Get sql query
		$where = " AND docreply_code = '".$docreply_code."'";
		if($docreply_id!=0) $where.=" AND docreply_id != ".$docreply_id;
        $sql = " SELECT count(docreply_id) FROM $this->tablename WHERE 1 = 1".$where;
		
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }
	
	// --- get last document number by user_id
	function getLastNumbyInputPer($user_id){
		global $dbconn;
        // ---- Get sql query
        $sql = " SELECT docreply_num FROM $this->tablename where 1 = 1 and input_per = ".$user_id." order by docreply_id desc limit 1";
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
	}
		
	// --- sort item by array
    function sortItem($sort,$id){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set docreply_sort=".$sort." where docreply_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }
		
	// ---change file status
    function changeTNVBReplyFile($id,$val){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set docreply_file = ".$val." where docreply_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }
	
	// --- get number of rows
    function getNumresult($where = ""){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT count(docreply_id) FROM $this->tablename ".$where;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }	
		
	// --- get top 1 news
	function getTopRows(){
		$where = " 1 = 1 and docreply_active = 1";
    	$rows = $this->getDBList($where," docreply_id DESC",true," Limit 1");
    	return $rows;
    }
}
?>