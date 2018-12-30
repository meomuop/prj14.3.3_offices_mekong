<?php
/*-------------------------------------------
- PHP Frame work Informa
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/

class cc_class extends dbBasic {
  	var  $cc_id;
	var  $user_id;
	var  $cc_thang;
	var  $cc_nam;
	var  $cc_luong;
	var  $cc_1,$cc_2,$cc_3,$cc_4,$cc_5,$cc_6,$cc_7,$cc_8,$cc_9,$cc_10;
    var  $cc_11,$cc_12,$cc_13,$cc_14,$cc_15,$cc_16,$cc_17,$cc_18,$cc_19,$cc_20;
    var  $cc_21,$cc_22,$cc_23,$cc_24,$cc_25,$cc_26,$cc_27,$cc_28,$cc_29,$cc_30,$cc_31;
 	
	var $pfields = array (	'cc_id',
							'user_id',
							'cc_thang',
							'cc_nam',
							'cc_luong',
							'cc_1','cc_2','cc_3','cc_4','cc_5','cc_6','cc_7','cc_8','cc_9','cc_10',
                            'cc_11','cc_12','cc_13','cc_14','cc_15','cc_16','cc_17','cc_18','cc_19','cc_20',
                            'cc_21','cc_22','cc_23','cc_24','cc_25','cc_26','cc_27','cc_28','cc_29','cc_30',
                            'cc_31'
    ); //table private fields
							
  	var $pkeys = array ('cc_id'); //key fields
  
 	function cc_class(){ 
    	$this->dbBasic();  
    	$this->tablename = "tbl_luong_chamcong";
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

	// --- get number of rows
    function getNumresult($where = ""){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT count(cc_id) FROM $this->tablename ".$where;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }	
		
	// --- get top 1 news
	function getTopRows(){
		$where = " 1 = 1";
    	$rows = $this->getDBList($where," cc_id DESC",true," Limit 1");
    	return $rows;
    }
}
?>