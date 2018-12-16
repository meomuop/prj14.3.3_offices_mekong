<?php
/*-------------------------------------------
- PHP Frame work Informa
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/

class docreplyfile_class extends dbBasic {
  	var  $docreplyfile_id;
	var  $docreply_id;
	var  $docreplyfile_name;  
	var  $docreplyfile_path;  
  	var  $docreplyfile_date;
	var  $docreplyfile_sort;
	var  $docreplyfile_active;
 	
	var $pfields = array (	'docreplyfile_id',
						  	'docreply_id',
							'docreplyfile_name',
							'docreplyfile_path',
							'docreplyfile_date',
							'docreplyfile_sort',
							'docreplyfile_active'); //table private fields
							
  	var $pkeys = array ('docreplyfile_id'); //key fields
  
 	function docreplyfile_class(){ 
    	$this->dbBasic();  
    	$this->tablename = "tbl_vbreplyfiles";
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
		
	// --- sort item by array
    function sortItem($sort,$id){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set docreplyfile_sort=".$sort." where docreplyfile_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }
	
	// --- get number of rows
    function getNumresult($where = ""){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT count(docreplyfile_id) FROM $this->tablename ".$where;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }	
		
	// --- get top 1 news
	function getTopRows(){
		$where = " 1 = 1 and docreplyfile_active = 1";
    	$rows = $this->getDBList($where," docreplyfile_id DESC",true," Limit 1");
    	return $rows;
    }
}
?>