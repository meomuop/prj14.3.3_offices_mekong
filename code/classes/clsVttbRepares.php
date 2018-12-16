<?php
/*-------------------------------------------
- PHP Frame work Informa
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/

class vttb_repare_class extends dbBasic {
  	var  $vttb_repare_id;
	var  $vttb_id;
	var  $vttb_repare_name;
	var  $vttb_repare_cost;
	var  $vttb_repare_paid_type;
  	var  $vttb_repare_date;
	var  $vttb_repare_code;
	var  $vttb_repare_unit;
	var  $user_id;
 	
	var $pfields = array (	'vttb_repare_id',
							'vttb_id',
							'vttb_repare_name',
							'vttb_repare_cost',
							'vttb_repare_paid_type',
							'vttb_repare_date',
							'vttb_repare_code',
							'vttb_repare_unit',
							'user_id'); //table private fields
							
  	var $pkeys = array ('vttb_repare_id'); //key fields
  
 	function vttb_repare_class(){ 
    	$this->dbBasic();  
    	$this->tablename = "tbl_vttb_repares";
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
        $sql = " SELECT vttb_repare_name FROM $this->tablename where vttb_repare_id=".$id;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }
		
	// --- sort item by array
    function sortItem($sort,$id){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set vttb_repare_sort=".$sort." where vttb_repare_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }
	
	// --- get number of rows
    function getNumresult($where = ""){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT count(vttb_repare_id) FROM $this->tablename ".$where;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }	
		
	// --- get top 1 news
	function getTopRows(){
		$where = " 1 = 1 and vttb_repare_active = 1";
    	$rows = $this->getDBList($where," vttb_repare_id DESC",true," Limit 1");
    	return $rows;
    }
}
?>