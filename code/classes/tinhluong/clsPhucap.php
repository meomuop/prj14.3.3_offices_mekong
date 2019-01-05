<?php
/*-------------------------------------------
- PHP Smarty Template Engine
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/

class phucap_class extends dbBasic {
  	var  $phucap_id;
	var  $phucap_ten;
	var  $phucap_giatri;
	var  $phucap_diengiai;
  	var  $phucap_date;
	var  $phucap_sort;
	var  $phucap_active;
 	
	var $pfields = array (	'phucap_id',
							'phucap_ten',
							'phucap_giatri',
							'phucap_diengiai',
							'phucap_date',
							'phucap_sort',
							'phucap_active'); //table private fields
							
  	var $pkeys = array ('phucap_id'); //key fields
  
 	function phucap_class(){ 
    	$this->dbBasic();  
    	$this->tablename = "tbl_luong_phucap";
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
        $sql = " SELECT phucap_trinhdo FROM $this->tablename where phucap_id=".$id;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }
		
	// --- sort item by array
    function sortItem($sort,$id){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set phucap_sort=".$sort." where phucap_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }
	
	// --- get number of rows
    function getNumresult($where = ""){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT count(phucap_id) FROM $this->tablename ".$where;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }	
		
	// --- get top 1 news
	function getTopRows(){
		$where = " 1 = 1 and phucap_active = 1";
    	$rows = $this->getDBList($where," phucap_id DESC",true," Limit 1");
    	return $rows;
    }
}
?>