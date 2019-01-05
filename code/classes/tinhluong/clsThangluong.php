<?php
/*-------------------------------------------
- PHP Smarty Template Engine
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/

class thangluong_class extends dbBasic {
  	var  $thangluong_id;
	var  $chucvu_id;
	var  $thangluong_bac;
	var  $thangluong_heso;
	var  $thangluong_hetbac;
	var  $thangluong_sonam;
  	var  $thangluong_date;
	var  $thangluong_sort;
	var  $thangluong_active;
 	
	var $pfields = array (	'thangluong_id',
							'chucvu_id',
							'thangluong_bac',
							'thangluong_heso',
							'thangluong_hetbac',
							'thangluong_sonam',
							'thangluong_date',
							'thangluong_sort',
							'thangluong_active'); //table private fields
							
  	var $pkeys = array ('thangluong_id'); //key fields
  
 	function thangluong_class(){ 
    	$this->dbBasic();  
    	$this->tablename = "tbl_luong_tlnn";
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
        $sql = " SELECT thangluong_trinhdo FROM $this->tablename where thangluong_id=".$id;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }
		
	// --- sort item by array
    function sortItem($sort,$id){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set thangluong_sort=".$sort." where thangluong_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }
	
	// --- get number of rows
    function getNumresult($where = ""){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT count(thangluong_id) FROM $this->tablename ".$where;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }	
		
	// --- get top 1 news
	function getTopRows(){
		$where = " 1 = 1 and thangluong_active = 1";
    	$rows = $this->getDBList($where," thangluong_id DESC",true," Limit 1");
    	return $rows;
    }
}
?>