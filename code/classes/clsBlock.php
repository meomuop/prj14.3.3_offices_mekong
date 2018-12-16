<?php
/*-------------------------------------------
- PHP Frame work Informa
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/

class block_class extends dbBasic {
  	var  $block_id;  
	var  $module_id; 
	var  $item_id; 
	var  $block_title;  
  	var  $block_url; 
	var  $block_icon;
	var  $block_panel;
	var  $block_orderType;
	var  $block_showType;
	var  $block_sort;
	var  $block_data;
	var  $block_typical;
	var  $block_active;
	
	var $pfields = array (	'block_id',
							'module_id',
							'item_id',
							'block_title',
							'block_url',
							'block_icon',
							'block_panel',
							'block_orderType',
							'block_showType',
							'block_sort',
							'block_data',
							'block_typical',
							'block_active'); //table private fields
							
  	var $pkeys = array ('block_id'); //key fields
  
 	function block_class(){ 
    	$this->dbBasic();  
    	$this->tablename = "".TBL."blocks";
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
	
	
	// --- get title name block
	function getTitle($where){
        global $dbconn;

        // ---- Get sql query
        $sql = " SELECT block_name 
                    FROM $this->tablename where ".$where;

        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		
		return $result->fields[0];
    }
		
	// --- sort item by array
    function sortItem($sort,$id){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set block_sort=".$sort." where block_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }
	
	// --- block update
    function update_bl($item_id,$id,$act){
        global $dbconn;
        // ---- Get sql query
		if($item_id == 0):
		$sql = " UPDATE $this->tablename set item_id='0' where block_id=".$id;
		else:
			if($act == 1):
			$sql = " UPDATE $this->tablename set item_id='".$item_id."' where block_id=".$id;
			else:
			$sql = " SELECT item_id FROM $this->tablename where block_id=".$id;
			$result = $dbconn->Execute($sql);
				if($result->fields[0]!=0):
				$item_id = $result->fields[0].','.$item_id;
				endif;
			$sql = " UPDATE $this->tablename set item_id='".$item_id."' where block_id=".$id;
			endif;
		endif;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }
	
	// --- get number of rows
    function getNumresult($where = ""){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT count(block_id) FROM $this->tablename ".$where;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }	
		
	// --- get top 1 news
	function getTopRows(){
		$where = " 1 = 1 and block_active = 1";
    	$rows = $this->getDBList($where," block_id DESC",true," Limit 1");
    	return $rows;
    }
}
?>