<?php
/*-------------------------------------------
- PHP Smarty Template Engine
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/

class interdisci_class extends dbBasic {
  	var  $interdisci_id;
	var  $interdisci_name;
	var  $interdisci_ununicode;
	var  $interdisci_desc; 
  	var  $interdisci_date;
	var  $interdisci_sort;
	var  $interdisci_active;
 	
	var $pfields = array (	'interdisci_id',
							'interdisci_name',
							'interdisci_ununicode',
							'interdisci_desc',
							'interdisci_date',
							'interdisci_sort',
							'interdisci_active'); //table private fields
							
  	var $pkeys = array ('interdisci_id'); //key fields
  
 	function interdisci_class(){ 
    	$this->dbBasic();  
    	$this->tablename = "tbl_interdiscis";
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
        $sql = " SELECT interdisci_name FROM $this->tablename where interdisci_id=".$id;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }
		
	// --- sort item by array
    function sortItem($sort,$id){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set interdisci_sort=".$sort." where interdisci_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }
	
	// --- get number of rows
    function getNumresult($where = ""){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT count(interdisci_id) FROM $this->tablename ".$where;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }	
		
	// --- get top 1 news
	function getTopRows(){
		$where = " 1 = 1 and interdisci_active = 1";
    	$rows = $this->getDBList($where," interdisci_id DESC",true," Limit 1");
    	return $rows;
    }
}
?>