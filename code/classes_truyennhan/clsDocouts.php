<?php
/*-------------------------------------------
- PHP Frame work Informa
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/

class docOut_class extends dbBasic {
  	var  $docOut_id;
	var  $docCat_id;
	var  $docField_id;
	var  $department_id;
	var  $unit_name;
	var  $docOut_code; 
	var  $docOut_num;
	var  $docOut_num_typical;
	var  $docOut_desc; 
	var  $docOut_note;
	var  $docOut_process;
	var  $docOut_status;
	var  $docOut_process_date;
	var  $docOut_signed; 
  	var  $docOut_date;
	var  $docOut_file;
	var  $input_per;
 	
	var $pfields = array (	'docOut_id',
						  	'docCat_id',
							'docField_id',
							'department_id',
							'unit_name',
							'docOut_code',
							'docOut_num',
							'docOut_num_typical',
							'docOut_desc',
							'docOut_note',
							'docOut_process',
							'docOut_status',
							'docOut_process_date',
							'docOut_signed',
							'docOut_date',
							'docOut_file',
							'input_per'); //table private fields
							
  	var $pkeys = array ('docOut_id'); //key fields
  
 	function docOut_class(){ 
    	$this->dbBasic();  
    	$this->tablename = "tbl_docouts";
  	}
	
  	function readform(){
  		dbBasic::readform();
  	}  	
	
	function writeform(){
		dbBasic::writeForm();
  	}
	
	// --- get last number
	function getLastNum($docCat_typical){
        global $dbconn;
        // ---- Get sql query
		if($docCat_typical==1):
		$sql = " SELECT docOut_num_typical FROM $this->tablename where 1 = 1 and docOut_num_typical != 0 order by docOut_id desc limit 1";
		else:
        $sql = " SELECT docOut_num FROM $this->tablename where 1 = 1 and docOut_num != 0 order by docOut_id desc limit 1";
		endif;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }
	
	// --- get the same number
	function getSameNum($num){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT count(docOut_num) FROM $this->tablename where 1 = 1 and docOut_num = ".$num;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }
	
	function getLastNumbyInputPer($user_id){
		global $dbconn;
        // ---- Get sql query
        $sql = " SELECT docOut_num FROM $this->tablename where input_per = ".$user_id." order by docOut_id desc limit 1";
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
	}
	
	function getLastID($user_id){
		global $dbconn;
        // ---- Get sql query
        $sql = " SELECT docOut_id FROM $this->tablename where input_per = ".$user_id." order by docOut_id desc limit 1";
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
	}
		
	// ---change file status
    function changeDocOutFile($id,$val){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set docOut_file = ".$val." where docOut_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }
	
	// --- get number of rows
    function getNumresult($where = ""){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT count(docOut_id) FROM $this->tablename ".$where;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }	
	
	// --- get top 1 news
	function getTopRows(){
		$where = " 1 = 1 and docOut_active = 1";
    	$rows = $this->getDBList($where," docOut_id DESC",true," Limit 1");
    	return $rows;
    }
}
?>