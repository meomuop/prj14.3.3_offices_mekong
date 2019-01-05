<?php
/*-------------------------------------------
- PHP Smarty Template Engine
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/

class cv_index_class extends dbBasic {
  	var  $cv_index_id;
	var  $cv_sub_id;
	var  $process_user;
  	var  $cv_index_date;
	var  $cv_index_sort;
	var  $cv_index_active;
	var  $user_id;
 	
	var $pfields = array (	'cv_index_id',
							'cv_sub_id',
							'process_user',
							'cv_index_date',
							'cv_index_sort',
							'cv_index_active',
							'user_id'); //table private fields
							
  	var $pkeys = array ('cv_index_id'); //key fields
  
 	function cv_index_class(){ 
    	$this->dbBasic();  
    	$this->tablename = "tbl_cv_indexs";
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
        $sql = " SELECT cv_index_name FROM $this->tablename where cv_index_id=".$id;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }
		
	// --- sort item by array
    function sortItem($sort,$id){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set cv_index_sort=".$sort." where cv_index_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }
	
	// --- get number of rows
    function getNumresult($where = ""){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT count(cv_index_id) FROM $this->tablename ".$where;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }	
		
	// --- get top 1 news
	function getTopRows(){
		$where = " 1 = 1 and cv_index_active = 1";
    	$rows = $this->getDBList($where," cv_index_id DESC",true," Limit 1");
    	return $rows;
    }
}
?>