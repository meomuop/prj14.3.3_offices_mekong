<?php
/*-------------------------------------------
- PHP Smarty Template Engine
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/

class plan_class extends dbBasic {
  	var  $plan_id;
	var  $plan_subject;
	var  $plan_start; 
  	var  $plan_end;
    var  $plan_address;
    var  $plan_chairman;
    var  $plan_prepare;
	var  $plan_cont;
	var  $plan_date;
	var  $user_id;
 	
	var $pfields = array (	'plan_id',
							'plan_subject',
							'plan_start', 
							'plan_end',
                            'plan_address',
                            'plan_chairman',
                            'plan_prepare',
							'plan_cont',
							'plan_date',
							'user_id'); //table private fields
							
  	var $pkeys = array ('plan_id'); //key fields
  
 	function plan_class(){ 
    	$this->dbBasic();  
    	$this->tablename = "tbl_plan_details";
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
        $sql = " UPDATE $this->tablename set plan_active=1 where plan_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }
	
	
	function getTitle($id){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT plan_name FROM $this->tablename where plan_id=".$id;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }
	
	// get last item
	function getLastID(){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT plan_id FROM $this->tablename order by plan_id desc limit 1";
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }
		
	// --- sort item by array
    function sortItem($sort,$id){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set plan_sort=".$sort." where plan_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }
	
	// --- get number of rows
    function getNumresult($where = ""){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT count(plan_id) FROM $this->tablename ".$where;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }	
		
	// --- get top 1 news
	function getTopRows(){
		$where = " 1 = 1 and plan_active = 1";
    	$rows = $this->getDBList($where," plan_id DESC",true," Limit 1");
    	return $rows;
    }
}
?>