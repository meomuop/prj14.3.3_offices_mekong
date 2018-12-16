<?php
/*-------------------------------------------
- PHP Frame work Informa
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/

class docfile_trans_class extends dbBasic {
  	var  $docFile_id;
	var  $doc_id;
	var  $docFile_name;  
	var  $docFile_path;  
  	var  $docFile_date;
	var  $docFile_sort;
	var  $docFile_active;
	var  $user_id;
 	
	var $pfields = array (	'docFile_id',
						  	'doc_id',
							'docFile_name',
							'docFile_path',
							'docFile_date',
							'docFile_sort',
							'docFile_active',
							'user_id'); //table private fields
							
  	var $pkeys = array ('docFile_id'); //key fields
  
 	function docfile_trans_class(){ 
    	$this->dbBasic();  
    	$this->tablename = "tbl_vbfiles";
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
        $sql = " UPDATE $this->tablename set docfile_sort=".$sort." where docfile_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }
	
	// --- sort item by array
    function addfile($id,$name,$path,$user){
        global $dbconn;
        // ---- Get sql query
        $sql = " INSERT INTO $this->tablename(doc_id,docFile_name,docFile_path,docFile_date,user_id) VALUES($id,'".$name."','".$path."','".date('Y-m-d')."',$user)";
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }
	
	// --- get number of rows
    function getNumresult($where = ""){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT count(docfile_id) FROM $this->tablename ".$where;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }	
		
	// --- get top 1 news
	function getTopRows(){
		$where = " 1 = 1 and docfile_active = 1";
    	$rows = $this->getDBList($where," docfile_id DESC",true," Limit 1");
    	return $rows;
    }
}
?>