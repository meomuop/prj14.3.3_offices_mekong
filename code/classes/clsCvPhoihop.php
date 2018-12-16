<?php
/*-------------------------------------------
- PHP Frame work Informa
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/

class cv_phoihop_class extends dbBasic {
  	var  $cv_phoihop_id;
	var  $cv_cat_id;
    var  $cv_sub_id;
    var  $cv_log_id;
	var  $department_id;
	var  $cv_phoihop_date;
 	
	var $pfields = array (	'cv_phoihop_id',
							'cv_cat_id',
                            'cv_sub_id',
                            'cv_log_id',
							'department_id',
							'cv_phoihop_date'); //table private fields
							
  	var $pkeys = array ('cv_phoihop_id'); //key fields
  
 	function cv_phoihop_class(){ 
    	$this->dbBasic();  
    	$this->tablename = "tbl_cv_phoihop";
  	}
	
  	function readform(){
  		dbBasic::readform();
  	}  	
	
	function writeform(){
		dbBasic::writeForm();
  	}

	// --- get number of rows
    function getNumresult($where = ""){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT count(cv_phoihop_id) FROM $this->tablename ".$where;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }	
		
	// --- get top 1 news
	function getTopRows(){
		$where = " 1 = 1";
    	$rows = $this->getDBList($where," cv_phoihop_id DESC",true," Limit 1");
    	return $rows;
    }
}
?>