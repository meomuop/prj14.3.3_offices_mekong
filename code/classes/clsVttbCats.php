<?php
/*-------------------------------------------
- PHP Smarty Template Engine
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/

class vttb_cat_class extends dbBasic {
  	var  $vttb_cat_id;
	var  $vttb_cat_name;
	var  $vttb_cat_ununicode;
  	var  $vttb_cat_date;
	var  $vttb_cat_sort;
	var  $vttb_cat_active;
	var  $user_id;
 	
	var $pfields = array (	'vttb_cat_id',
							'vttb_cat_name',
							'vttb_cat_ununicode',
							'vttb_cat_date',
							'vttb_cat_sort',
							'vttb_cat_active',
							'user_id'); //table private fields
							
  	var $pkeys = array ('vttb_cat_id'); //key fields
  
 	function vttb_cat_class(){ 
    	$this->dbBasic();  
    	$this->tablename = "tbl_vttb_cats";
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
        $sql = " SELECT vttb_cat_name FROM $this->tablename where vttb_cat_id=".$id;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }
		
	// --- sort item by array
    function sortItem($sort,$id){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set vttb_cat_sort=".$sort." where vttb_cat_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }
	
	// --- get number of rows
    function getNumresult($where = ""){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT count(vttb_cat_id) FROM $this->tablename ".$where;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }	
		
	// --- get top 1 news
	function getTopRows(){
		$where = " 1 = 1 and vttb_cat_active = 1";
    	$rows = $this->getDBList($where," vttb_cat_id DESC",true," Limit 1");
    	return $rows;
    }
}
?>