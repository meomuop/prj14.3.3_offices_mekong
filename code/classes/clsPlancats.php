<?php
/*-------------------------------------------
- PHP Smarty Template Engine
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/

class plancat_class extends dbBasic {
  	var  $plancat_id;
	var  $plancat_name;
  	var  $plancat_date;
	var  $plancat_sort;
	var  $plancat_active;
	var  $user_id;
 	
	var $pfields = array (	'plancat_id',
							'plancat_name',
							'plancat_date',
							'plancat_sort',
							'plancat_active',
							'user_id'); //table private fields
							
  	var $pkeys = array ('plancat_id'); //key fields
  
 	function plancat_class(){ 
    	$this->dbBasic();  
    	$this->tablename = "tbl_plancats";
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
	
	// --- updateStatus
    function updateStatus($id){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set plancat_active=1 where plancat_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }
	
	
	function getTitle($id){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT plancat_name FROM $this->tablename where plancat_id=".$id;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }
	
	// get last item
	function getLastID(){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT plancat_id FROM $this->tablename order by plancat_id desc limit 1";
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }
		
	// --- sort item by array
    function sortItem($sort,$id){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set plancat_sort=".$sort." where plancat_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }
	
	// --- get number of rows
    function getNumresult($where = ""){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT count(plancat_id) FROM $this->tablename ".$where;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }	
		
	// --- get top 1 news
	function getTopRows(){
		$where = " 1 = 1 and plancat_active = 1";
    	$rows = $this->getDBList($where," plancat_id DESC",true," Limit 1");
    	return $rows;
    }
}
?>