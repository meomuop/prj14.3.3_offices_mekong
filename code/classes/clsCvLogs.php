<?php
/*-------------------------------------------
- PHP Smarty Template Engine
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/

class cv_log_class extends dbBasic {
  	var  $cv_log_id;
    var  $cv_sub_id;
	var  $cv_index_id;
	var  $cv_log_num_day;
	var  $cv_log_desc;
	var  $cv_log_note;
  	var  $cv_log_date;
	var  $cv_log_sort;
	var  $cv_log_active;
	var  $user_id;
 	
	var $pfields = array (	'cv_log_id',
							'cv_sub_id',
                            'cv_index_id',
							'cv_log_num_day',
							'cv_log_desc',
							'cv_log_note',
							'cv_log_date',
							'cv_log_sort',
							'cv_log_active',
							'user_id'); //table private fields
							
  	var $pkeys = array ('cv_log_id'); //key fields
  
 	function cv_log_class(){ 
    	$this->dbBasic();  
    	$this->tablename = "tbl_cv_logs";
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
        $sql = " SELECT cv_log_name FROM $this->tablename where cv_log_id=".$id;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }

    function getLastID(){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT cv_log_id FROM $this->tablename order by cv_log_id desc limit 1";
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
        return $result->fields[0];
    }
		
	// --- sort item by array
    function sortItem($sort,$id){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set cv_log_sort=".$sort." where cv_log_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }
	
	// --- get number of rows
    function getNumresult($where = ""){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT count(cv_log_id) FROM $this->tablename ".$where;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }	
		
	// --- get top 1 news
	function getTopRows(){
		$where = " 1 = 1 and cv_log_active = 1";
    	$rows = $this->getDBList($where," cv_log_id DESC",true," Limit 1");
    	return $rows;
    }
}
?>