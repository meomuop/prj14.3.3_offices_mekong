<?php
/*-------------------------------------------
- PHP Frame work Informa
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/

class vttb_datlich_class extends dbBasic {
  	var  $vttb_datlich_id;
	var  $vttb_id;
	var  $vttb_datlich_name;
	var  $vttb_datlich_start;
	var  $vttb_datlich_end;
  	var  $vttb_datlich_date;
	var  $vttb_datlich_cost;
	var  $user_id;
 	
	var $pfields = array (	'vttb_datlich_id',
							'vttb_id',
							'vttb_datlich_name',
							'vttb_datlich_start',
							'vttb_datlich_end',
							'vttb_datlich_date',
							'vttb_datlich_cost',
							'user_id'); //table private fields
							
  	var $pkeys = array ('vttb_datlich_id'); //key fields
  
 	function vttb_datlich_class(){ 
    	$this->dbBasic();  
    	$this->tablename = "tbl_vttb_datlichs";
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
        $sql = " SELECT vttb_datlich_name FROM $this->tablename where vttb_datlich_id=".$id;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }
	
	function getCheckTime($vttb_id,$vttb_dl_start,$vttb_dl_end){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT count(vttb_datlich_id) FROM $this->tablename where 1=1 and vttb_id=".$vttb_id." and (";
		$sql .= "(vttb_datlich_start >= '".$vttb_dl_start."' and vttb_datlich_start <= '".$vttb_dl_end."') or ";
		$sql .= "(vttb_datlich_end >= '".$vttb_dl_start."' and vttb_datlich_end <= '".$vttb_dl_end."') or ";
		$sql .= "(vttb_datlich_start <= '".$vttb_dl_start."' and vttb_datlich_end >= '".$vttb_dl_end."')";
		$sql .= ")";
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }
		
	// --- sort item by array
    function sortItem($sort,$id){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set vttb_datlich_sort=".$sort." where vttb_datlich_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }
	
	// --- get number of rows
    function getNumresult($where = ""){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT count(vttb_datlich_id) FROM $this->tablename ".$where;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }	
		
	// --- get top 1 news
	function getTopRows(){
		$where = " 1 = 1 and vttb_datlich_active = 1";
    	$rows = $this->getDBList($where," vttb_datlich_id DESC",true," Limit 1");
    	return $rows;
    }
}
?>