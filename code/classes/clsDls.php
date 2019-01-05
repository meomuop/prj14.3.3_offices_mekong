<?php
/*-------------------------------------------
- PHP Smarty Template Engine
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/

class dl_class extends dbBasic {
  	var  $dl_id;
	var  $kdl_id;
	var  $dl_name;
	var  $dl_note;
  	var  $dl_date;
	var  $dl_sort;
	var  $dl_active;
	var  $dl_file;
	var  $user_id;
 	
	var $pfields = array (	'dl_id',
							'kdl_id',
							'dl_name',
							'dl_note',
							'dl_date',
							'dl_sort',
							'dl_active',
							'dl_file',
							'user_id'); //table private fields
							
  	var $pkeys = array ('dl_id'); //key fields
  
 	function dl_class(){ 
    	$this->dbBasic();  
    	$this->tablename = "tbl_dls";
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
	
	function getTitle($id){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT dl_name FROM $this->tablename where dl_id=".$id;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }
		
	// --- sort item by array
    function sortItem($sort,$id){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set dl_sort=".$sort." where dl_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }
	
	// ---change file status
    function changeDlFile($id,$val){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set dl_file = ".$val." where dl_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }
	
	// --- get number of rows
    function getNumresult($where = ""){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT count(dl_id) FROM $this->tablename ".$where;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }	
		
	// --- get top 1 news
	function getTopRows(){
		$where = " 1 = 1 and dl_active = 1";
    	$rows = $this->getDBList($where," dl_id DESC",true," Limit 1");
    	return $rows;
    }
}
?>