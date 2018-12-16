<?php
/*-------------------------------------------
- PHP Frame work Informa
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/

class cv_cat_class extends dbBasic {
  	var  $cv_cat_id;
	var  $cv_cat_name;
	var  $cv_cat_desc;
	var  $cv_cat_priority;
  	var  $cv_cat_date;
	var  $cv_cat_sort;
	var  $cv_cat_active;
    var  $cv_cat_file;
	var  $user_id;
 	
	var $pfields = array (	'cv_cat_id',
							'cv_cat_name',
							'cv_cat_desc',
							'cv_cat_priority',
							'cv_cat_date',
							'cv_cat_sort',
							'cv_cat_active',
                            'cv_cat_file',
							'user_id'); //table private fields
							
  	var $pkeys = array ('cv_cat_id'); //key fields
  
 	function cv_cat_class(){ 
    	$this->dbBasic();  
    	$this->tablename = "tbl_cv_cats";
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
        $sql = " SELECT cv_cat_name FROM $this->tablename where cv_cat_id=".$id;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }
		
	// --- sort item by array
    function sortItem($sort,$id){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set cv_cat_sort=".$sort." where cv_cat_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }
	
	function update_uutien($id){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set cv_cat_priority = 1 where cv_cat_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }

    function update_cvcat_file($id){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set cv_cat_file = 1 where cv_cat_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }
	
	// --- get number of rows
    function getNumresult($where = ""){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT count(cv_cat_id) FROM $this->tablename ".$where;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }	
		
	// --- get top 1 news
	function getTopRows(){
		$where = " 1 = 1 and cv_cat_active = 1";
    	$rows = $this->getDBList($where," cv_cat_id DESC",true," Limit 1");
    	return $rows;
    }
}
?>