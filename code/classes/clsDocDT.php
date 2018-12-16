<?php
/*-------------------------------------------
- PHP Frame work Informa
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/

class docDT_class extends dbBasic {
  	var  $docDT_id;
	var  $docCat_id;
	var  $department_id;
	var  $docDT_num;
	var  $docDT_desc;
  	var  $docDT_date;
	var  $docDT_status;
    var  $docDT_file;
	var  $input_per;
 	
	var $pfields = array (	'docDT_id',
						  	'docCat_id',
							'department_id',
							'docDT_num',
							'docDT_desc',
							'docDT_date',
							'docDT_status',
                            'docDT_file',
							'input_per'); //table private fields
							
  	var $pkeys = array ('docDT_id'); //key fields
  
 	function docDT_class(){ 
    	$this->dbBasic();  
    	$this->tablename = "tbl_docdt";
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
		$sql = " SELECT docDT_num_typical FROM $this->tablename where 1 = 1 and docDT_num_typical != 0 order by docDT_id desc limit 1";
		else:
        $sql = " SELECT docDT_num FROM $this->tablename where 1 = 1 and docDT_num != 0 order by docDT_id desc limit 1";
		endif;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }
	
	// --- get the same number
	function getSameNum($num,$docCat_typical,$id=0){
        global $dbconn;
        // ---- Get sql query
		$where = "1 = 1";
		if($id != 0) $where .=" and docDT_id != ".$id;
		if($docCat_typical==1):
		$sql = " SELECT count(docDT_num_typical) FROM $this->tablename where ".$where." and docDT_num_typical = ".$num;
		else:
        $sql = " SELECT count(docDT_num) FROM $this->tablename where ".$where." and docDT_num = ".$num;
		endif;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }
	
	function getLastNumbyInputPer($user_id,$docCat_typical){
		global $dbconn;
        // ---- Get sql query
		if($docCat_typical==1):
		$sql = " SELECT docDT_num_typical FROM $this->tablename where input_per = ".$user_id." order by docDT_id desc limit 1";
		else:
        $sql = " SELECT docDT_num FROM $this->tablename where input_per = ".$user_id." order by docDT_id desc limit 1";
		endif;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
	}
		
	// ---change file status
    function changedocDTFile($id,$val){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set docDT_file = ".$val." where docDT_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }

    // ---change file status
    function updateStatus($id,$val){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set docDT_status = ".$val." where docDT_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }
	
	// --- get number of rows
    function getNumresult($where = ""){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT count(docDT_id) FROM $this->tablename ".$where;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }	
	
	// --- get top 1 news
	function getTopRows(){
		$where = " 1 = 1 and docDT_active = 1";
    	$rows = $this->getDBList($where," docDT_id DESC",true," Limit 1");
    	return $rows;
    }
}
?>