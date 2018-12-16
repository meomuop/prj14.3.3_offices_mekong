<?php
/*-------------------------------------------
- PHP Frame work Informa
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/

class cv_sub_class extends dbBasic {
  	var  $cv_sub_id;
	var  $cv_cat_id;
	var  $department_id;
	var  $cv_sub_name;
	var  $cv_sub_desc;
	var  $cv_sub_time_limit;
  	var  $cv_sub_date;
	var  $cv_sub_sort;
	var  $cv_sub_active;
	var  $user_id;
 	
	var $pfields = array (	'cv_sub_id',
							'cv_cat_id',
							'department_id',
							'cv_sub_name',
							'cv_sub_desc',
							'cv_sub_time_limit',
							'cv_sub_date',
							'cv_sub_sort',
							'cv_sub_active',
							'user_id'); //table private fields
							
  	var $pkeys = array ('cv_sub_id'); //key fields
  
 	function cv_sub_class(){ 
    	$this->dbBasic();  
    	$this->tablename = "tbl_cv_subs";
  	}
	
  	function readform(){
  		dbBasic::readform();
  	}  	
	
	function writeform(){
		dbBasic::writeForm();
  	}

	function getTitle($id){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT cv_sub_name FROM $this->tablename where cv_sub_id=".$id;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }

    function getLastID(){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT cv_sub_id FROM $this->tablename order by cv_sub_id desc limit 1";
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
        return $result->fields[0];
    }
		
	// --- sort item by array
    function sortItem($sort,$id){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set cv_sub_sort=".$sort." where cv_sub_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }
	
	// --- get number of rows
    function getNumresult($where = ""){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT count(cv_sub_id) FROM $this->tablename ".$where;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }	
		
	// --- get top 1 news
	function getTopRows(){
		$where = " 1 = 1 and cv_sub_active = 1";
    	$rows = $this->getDBList($where," cv_sub_id DESC",true," Limit 1");
    	return $rows;
    }
}
?>