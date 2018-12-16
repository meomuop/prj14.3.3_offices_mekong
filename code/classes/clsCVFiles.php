<?php
/*-------------------------------------------
- PHP Frame work Informa
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/

class cv_file_class extends dbBasic {
  	var  $cv_file_id;
	var  $cv_cat_id;
    var  $cv_file_name;
    var  $cv_file_path;
	var  $cv_file_type;
	var  $department_id;
    var  $department_ph_id;
    var  $user_id;
	var  $cv_file_date;
 	
	var $pfields = array (	'cv_file_id',
						  	'cv_cat_id',
                            'cv_file_name',
                            'cv_file_path',
							'cv_file_type',
							'department_id',
                            'department_ph_id',
							'user_id',
							'cv_file_date'); //table private fields
							
  	var $pkeys = array ('cv_file_id'); //key fields
  
 	function cv_file_class(){ 
    	$this->dbBasic();  
    	$this->tablename = "tbl_cv_files";
  	}
	
  	function readform(){
  		dbBasic::readform();
  	}  	
	
	function writeform(){
		dbBasic::writeForm();
  	}

	// --- sort item by array
    function sortItem($sort,$id){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set cv_file_sort=".$sort." where cv_file_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }
	
	// --- get number of rows
    function getNumresult($where = ""){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT count(cv_file_id) FROM $this->tablename ".$where;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }	
		
	// --- get top 1 news
	function getTopRows(){
		$where = " 1 = 1 and cv_file_active = 1";
    	$rows = $this->getDBList($where," cv_file_id DESC",true," Limit 1");
    	return $rows;
    }
}
?>