<?php
/*-------------------------------------------
- PHP Frame work Informa
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/

class vttb_sub_class extends dbBasic {
  	var  $vttb_sub_id;
	var  $vttb_cat_id;
	var  $vttb_sub_name;
	var  $vttb_sub_ununicode;
	var  $vttb_sub_type;
  	var  $vttb_sub_date;
	var  $vttb_sub_sort;
	var  $vttb_sub_active;
	var  $user_id;
 	
	var $pfields = array (	'vttb_sub_id',
							'vttb_cat_id',
							'vttb_sub_name',
							'vttb_sub_ununicode',
							'vttb_sub_type',
							'vttb_sub_date',
							'vttb_sub_sort',
							'vttb_sub_active',
							'user_id'); //table private fields
							
  	var $pkeys = array ('vttb_sub_id'); //key fields
  
 	function vttb_sub_class(){ 
    	$this->dbBasic();  
    	$this->tablename = "tbl_vttb_subs";
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
        $sql = " SELECT vttb_sub_name FROM $this->tablename where vttb_sub_id=".$id;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }
		
	// --- sort item by array
    function sortItem($sort,$id){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set vttb_sub_sort=".$sort." where vttb_sub_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }
	
	// --- get number of rows
    function getNumresult($where = ""){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT count(vttb_sub_id) FROM $this->tablename ".$where;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }	
		
	// --- get top 1 news
	function getTopRows(){
		$where = " 1 = 1 and vttb_sub_active = 1";
    	$rows = $this->getDBList($where," vttb_sub_id DESC",true," Limit 1");
    	return $rows;
    }
}
?>