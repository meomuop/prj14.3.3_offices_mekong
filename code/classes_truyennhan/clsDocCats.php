<?php
/*-------------------------------------------
- PHP Frame work Informa
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/

class docCat_class extends dbBasic {
  	var  $docCat_id;
	var  $docCat_name; 
	var  $docCat_ununicode;
	var  $docCat_standfor; 
	var  $docCat_type;
  	var  $docCat_date;
	var  $docCat_sort;
	var  $docCat_active;
 	
	var $pfields = array (	'docCat_id',
							'docCat_name',
							'docCat_ununicode',
							'docCat_standfor',
							'docCat_type',
							'docCat_date',
							'docCat_sort',
							'docCat_active'); //table private fields
							
  	var $pkeys = array ('docCat_id'); //key fields
  
 	function docCat_class(){ 
    	$this->dbBasic();  
    	$this->tablename = "tbl_doccats";
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
	
	// --- getType
    function getType($id){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT docCat_type FROM $this->tablename where docCat_id=".$id;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }
	
	// --- getTypebyName
    function getTypebyName($name){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT docCat_type FROM $this->tablename where docCat_name = '".$name."'";
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }	
		
	// --- sort item by array
    function sortItem($sort,$id){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set docCat_sort=".$sort." where docCat_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }
	
	// --- get number of rows
    function getNumresult($where = ""){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT count(docCat_id) FROM $this->tablename ".$where;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }	
		
	// --- get top 1 news
	function getTopRows(){
		$where = " 1 = 1 and docCat_active = 1";
    	$rows = $this->getDBList($where," docCat_id DESC",true," Limit 1");
    	return $rows;
    }
}
?>