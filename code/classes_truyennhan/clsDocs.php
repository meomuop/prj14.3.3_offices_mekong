<?php
/*-------------------------------------------
- PHP Frame work Informa
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/

class doc_class extends dbBasic {
  	var  $doc_id;
	var  $docCat_id;
	var  $docField_id;
	var  $docLevel_id;
	var  $unit_name;
	var  $doc_code; 
	var  $doc_num; 
	var  $doc_desc; 
	var  $doc_note;
	var  $doc_note_code;
	var  $doc_note_sign_date;
	var  $doc_note_sign_per;
	var  $doc_note_date;
	var  $doc_recevied; 
	var  $doc_limit_time; 
	var  $doc_signed; 
	var  $doc_moved; 
	var  $signPer_id;
	var  $signObj_id; 
	var  $secret_id; 
	var  $important_id;
  	var  $doc_date;
	var  $doc_sort;
	var  $doc_traned;
	var  $doc_replied;
	var  $doc_active;
	var  $doc_file;
	var  $user_id;
	var  $input_per;
	var  $doc_theodoi;
 	
	var $pfields = array (	'doc_id',
						  	'docCat_id',
							'docField_id',
							'docLevel_id',
							'unit_name',
							'doc_code',
							'doc_num',
							'doc_desc',
							'doc_note',
							'doc_note_code',
							'doc_note_sign_date',
							'doc_note_sign_per',
							'doc_note_date',
							'doc_recevied',
							'doc_limit_time',
							'doc_signed',
							'doc_moved',
							'signPer_id',
							'signObj_id',
							'secret_id',
							'important_id',
							'doc_date',
							'doc_sort',
							'doc_traned',
							'doc_replied',
							'doc_active',
							'doc_file',
							'user_id',
							'input_per',
							'doc_theodoi'); //table private fields
							
  	var $pkeys = array ('doc_id'); //key fields
  
 	function doc_class(){ 
    	$this->dbBasic();  
    	$this->tablename = "tbl_docs";
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
	
	// --- get last number
	function getLastNum(){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT doc_num FROM $this->tablename where 1 = 1 order by doc_id desc limit 1";
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }
	
	// --- get the same number
	function getSameNum($num, $id=0){
        global $dbconn;
        // ---- Get sql query
		if($id == 0):
        $sql = " SELECT count(doc_num) FROM $this->tablename where 1 = 1 and doc_num = ".$num." order by doc_id desc limit 1";
		else:
		$sql = " SELECT count(doc_num) FROM $this->tablename where 1 = 1 and doc_num = ".$num." and doc_id != ".$id." order by doc_id desc limit 1";
		endif;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }
	
	// --- get theo doi
	function getTheodoi($doc_id){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT count(docReply_id) as count_docreply_id FROM tbl_docreplys where 1 = 1 and doc_id = ".$doc_id." and docReply_limit_time != '0000-00-00' and docReply_limit_time != '1970-01-01' and docReply_limit_time != '".date('Y',strtotime('+ 1 year'))."-01-01' and not null  and docReply_limit_time";
        //echo $sql;
		// ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }
	
	// --- get theo doi
	function updateTheodoi($doc_id,$doc_theodoi){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE tbl_docs set doc_theodoi = ".$doc_theodoi." where doc_id = ".$doc_id."";
        //echo $sql;
		// ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }
	
	// --- get theo doi
	function updatePhanloai($doc_note,$doc_moved,$user_id,$doc_id){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE tbl_docs set doc_note = '".$doc_note."', doc_moved = '".date('Y-m-d',strtotime(str_replace('/','-',$doc_moved)))."', user_id = ".$user_id.", doc_traned = 1 where doc_id = ".$doc_id."";
        //echo $sql;
		// ---- Execute SQL
        $result = $dbconn->Execute($sql);
    }
	
	// --- get giai quyet
	function updateGiaiquyet($doc_note_code = '',$doc_note_sign_date = '',$doc_note_sign_per = '',$doc_note_date = '',$doc_id){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE tbl_docs set doc_note_code = '".$doc_note_code."', doc_note_sign_date = '".date('Y-m-d',strtotime(str_replace('/','-',$doc_note_sign_date)))."', doc_note_sign_per = '".$doc_note_sign_per."', doc_note_date = '".date('Y-m-d',strtotime(str_replace('/','-',$doc_note_date)))."', doc_active = 1 where doc_id = ".$doc_id."";
        //echo $sql;
		// ---- Execute SQL
        $result = $dbconn->Execute($sql);
    }
	
	// --- Check the Coincidece document by doc_num, doc_signed, unit_name
	function checkCoincidence($doc_code, $doc_signed, $unit_name, $docCat_id, $doc_id = 0){
        global $dbconn;
        // ---- Get sql query
		$where = " AND doc_code = '".$doc_code."' AND doc_signed = '".$doc_signed."' AND unit_name = '".$unit_name."' and docCat_id = '" .$docCat_id."'";
		if($doc_id!=0) $where.=" AND doc_id != ".$doc_id;
        $sql = " SELECT count(doc_id) FROM $this->tablename WHERE 1 = 1".$where;
		
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }
	
	// --- get last document number by user_id
	function getLastNumbyInputPer($user_id){
		global $dbconn;
        // ---- Get sql query
        $sql = " SELECT doc_num FROM $this->tablename where 1 = 1 and input_per = ".$user_id." order by doc_id desc limit 1";
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
	}
		
	// --- sort item by array
    function sortItem($sort,$id){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set doc_sort=".$sort." where doc_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }
	
	// ---change reply status
    function changeDocReplied($id){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set doc_replied=1 where doc_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }
	
	// ---change file status
    function changeDocFile($id,$val){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set doc_file = ".$val." where doc_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }
	
	// --- get number of rows
    function getNumresult($where = ""){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT count(doc_id) FROM $this->tablename ".$where;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }	
		
	// --- get top 1 news
	function getTopRows(){
		$where = " 1 = 1 and doc_active = 1";
    	$rows = $this->getDBList($where," doc_id DESC",true," Limit 1");
    	return $rows;
    }
}
?>