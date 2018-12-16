<?php
/*-------------------------------------------
- PHP Frame work
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/

class imgs_class extends dbBasic {
  	var  $img_id;    
  	var  $pro_id;
	var  $img_name;
	var  $img_sort;
	var  $img_active;
 	
	var $pfields = array (	'img_id',
							'pro_id',
							'img_name',
							'img_sort',
							'img_active'); //table private fields
							
  	var $pkeys = array ('img_id'); //key fields
  
 	function imgs_class() { 
    	$this->dbBasic();  
    	$this->tablename = "".TBL."imgs";
  	}
	
  	function readform()
  	{
  		dbBasic::readform();
  	}  	
	
	function writeform()
  	{
		dbBasic::writeForm();
  	}
	
	// --- get number of rows
    function getNumresult($where = ""){
        global $dbconn;

        // ---- Get sql query
        $sql = " SELECT count(img_id)
                    FROM $this->tablename ".$where;

        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		
		return $result->fields[0];
    }	
	
	// --- sort item by array
    function sortItem($sort,$id){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set img_sort=".$sort." where img_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }
	
	// --- get top 1 video
	function getTopNews()
    {
		$where = " 1 = 1 and img_active = 1";
    	$rows = $this->getDBList($where," img_id DESC",true," Limit 1");
    	return $rows;
    }
}
?>