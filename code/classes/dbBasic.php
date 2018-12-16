<?php
//PHP Frame work
//Edit 2007.03.08 _ ThuyTT
  
  class dbBasic {
  
  //Write hidden value to a form
  var $hForm = '';
  
  //errors list
  var $errors = array();
  
  var $tablename;
  
 
  //common fields for all tables
  var $cfields = array();
  //private fields for each table
  var $pfields = array();
  var $pnames = array();
  //primary key fields should defined here
  var $pkeys = array(); 
  //all fields = cfields + pfields
  var $tblfields = array();
  
  function dbBasic() {
    $this->tblfields = array_merge($this->pfields,$this->cfields);
  }
  
    
  //Get data from request
  //@param fields want to get
  //if parameter is not specified, get all
  //e.g $plan->readForm('planno','insertdate','updatetimes');
  function readForm() {
  	$arg_list = func_get_args();
  	if (empty($arg_list)) {
  		$arg_list = $this->tblfields;
  	}
  	foreach($arg_list as $id){
      if (isset($_REQUEST[$id])) {
  	    $fname = "this->$id";
  	    $value = trim($_REQUEST[$id]);
  	    if(get_magic_quotes_gpc()) {
          $value = addslashes($value);
		  //$value = stripslashes($value);
		  //$value = str_replace("'","''",$value);
        }
        //$value = htmlspecialchars($value); 
        $this->$id=$value;
        
      }
  	}
  }
  
  //write hidden fields to form
  //@param fields want to get
  //if parameter is not specified, get all
  //e.g $plan->writeForm('planno','insertdate','updatetimes');
  function writeForm() {
  	  $str = '';
  	  $arg_list = func_get_args();
  	  if (empty($arg_list)) {
  		  $arg_list = $this->tblfields;
  	  }
  	  foreach($arg_list as $id) {
          $tmp = $this->$id;
  	  	  $str .= "<input type = 'hidden' name = '".$id."' value = '".$tmp."'>";
  	  }
  	  $this->hForm = $str;
  	  return $str;
  }
  
  //convert string from DB to browser to specified encoding
  //$toDB == true then convert to DB encoding
  function Decode($toDB = false) {
  	  $str = '';
  	  foreach($this->tblfields as $id) {
  	  	  $fname = "this->$id";
          $tmp=$this->$id;
          if ($toDB == true) {
            $value = rsWriteDBStr($tmp);
          }else {
            $value = rsReadDBStr($tmp);
          }
          $this->$id=$value;
  	  }
  }
  
  //prepare for display on html page
  function prepForDisplay(){
  	$arg_list = func_get_args();
  	if (empty($arg_list)) {
  		$arg_list = $this->tblfields;
  	}
  	foreach($arg_list as $id) {
  	  $fname = "this->$id";
      $tmp=$this->$id;
  	  $value = htmlspecialchars($tmp);
  	  $value = nl2br($value);
      $this->$id=$value;
  	}
  }
  
  //getDB by lang_id sent by parameter
  //Created by Le Anh Van on 23-11-2009
  function getDBRandom($where,$limit) {
      global $dbconn;
	  
      $query = "SELECT ";
      foreach($this->tblfields as $id) {
        $query .= $id.",";
      }
      $query = substr($query,0,strlen($query)-1);
      $query .= " FROM $this->tablename " .$where." order by rand() ".$limit;
      
      //echo $query;
      $result=$dbconn->Execute($query);
      if(!$result->EOF) {
          $i = 0;
          foreach($this->tblfields as $id){
            //$fname = "this->$id";
            $value = trim($result->fields[$i++]);
			$value = stripslashes($value);
            $this->$id=$value;
          }
          return true;
      }else {
      	//not found
      	return false;
      }
  }
  
  //getDB by lang_id sent by parameter
  //Created by Le Anh Van on 23-11-2009
  function getDBbylang($lang_id) {
      global $dbconn;
	  
      $where = " WHERE config_lang='".$lang_id."' ";
      $query = "SELECT ";
      foreach($this->tblfields as $id) {
        $query .= $id.",";
      }
      $query = substr($query,0,strlen($query)-1);
      $query .= " FROM $this->tablename " .$where;
      
      //echo $query;
      $result=$dbconn->Execute($query);
      if(!$result->EOF) {
          $i = 0;
          foreach($this->tblfields as $id){
            //$fname = "this->$id";
            $value = trim($result->fields[$i++]);
			$value = stripslashes($value);
            $this->$id=$value;
			//echo "<br>".$result->fields[$i++]."<br>";
          }
          return true;
      }else {
      	//not found
      	return false;
      }
  }
  
  //getDB by specified primary key
  //@param  $ ... is primary key , the order of param must same order of
  //pkeys array
  function getDBbyPkey() {
      global $dbconn;
      //check parameter
      if (func_num_args() == 0) {
      	  return;
      }
      $i = 0;
      foreach (func_get_args() as $ourvar) {
      	// Prepare var
        if (!get_magic_quotes_runtime()) {
            $ourvar = addslashes($ourvar);
        }
      	if ($where == "") {
      	  $where = " WHERE ".$this->pkeys[$i]."='".$ourvar."' ";
      	}else {
      	 	$where .= " AND ". $this->pkeys[$i]."='".$ourvar."' ";
      	}
      	$i++;
      }
      $query = "SELECT ";
      foreach($this->tblfields as $id) {
        $query .= $id.",";
      }
      $query = substr($query,0,strlen($query)-1);
      $query .= " FROM $this->tablename " .$where;
      
      //echo $query;
      $result=$dbconn->Execute($query);
      if(!$result->EOF) {
          $i = 0;
          foreach($this->tblfields as $id){
            //$fname = "this->$id";
            $value = trim($result->fields[$i++]);
			$value = stripslashes($value);
            $this->$id=$value;
          }
          return true;
      }else {
      	//not found
      	return false;
      }
  }
  
  //select record with condition where and order by $order
  //uflag = true if select common fields, default is false  
  function getDBList($where="",$order="",$uflag = false,$limit="") {
      global $dbconn;
      
      $ret = Array();
      
      if ($uflag) {
      	$selectfields = $this->tblfields;
      }else {
      	$selectfields = $this->pfields;
      }
      $query = "SELECT ";
      foreach($selectfields as $id) {
          $query .= $id.",";
      }
      $query = substr($query,0,strlen($query)-1);
      $query .= " FROM $this->tablename ";
      if ($where !="") {
        $query .= " WHERE $where ";
      }
      if ($order !="") {
        $query .= " ORDER BY $order ";
      }
 
      $query.=$limit;
	  
      $result=$dbconn->Execute($query);
	//echo( $query."<BR>");
      if ($result)
      for (; !$result->EOF; $result->MoveNext()){
          $i = 0;
          $temp = $this;
          foreach($selectfields as $id){
            $fname = "temp->$id";
            $value = trim($result->fields[$i++]);
			$value = stripslashes($value);
			//$value = mb_convert_encoding($value, "UTF-8", "auto");
            /*if(get_magic_quotes_gpc()) {
              $value = stripslashes($value);
            }*/
            //eval ("\$$fname = \"$value\";");
            $temp->$id=$value;
          }
          $ret[] = $temp;
          unset($this);
      }
      return $ret;

  }
  
   function getDBListGroupby($where="",$groupby="",$order="",$uflag = false,$limit="") {
      global $dbconn;
      
      $ret = Array();
      
      if ($uflag) {
      	$selectfields = $this->tblfields;
      }else {
      	$selectfields = $this->pfields;
      }
      $query = "SELECT ";
      foreach($selectfields as $id) {
          $query .= $id.",";
      }
      $query = substr($query,0,strlen($query)-1);
      $query .= " FROM $this->tablename ";
      if ($where !="") {
        $query .= " WHERE $where ";
      }
	  if ($groupby !="") {
        $query .= " GROUP BY $groupby ";
      }
      if ($order !="") {
        $query .= " ORDER BY $order ";
      }
 
      $query.=$limit;
	  
      $result=$dbconn->Execute($query);
	//echo( $query."<BR>");
      if ($result)
      for (; !$result->EOF; $result->MoveNext()){
          $i = 0;
          $temp = $this;
          foreach($selectfields as $id){
            $fname = "temp->$id";
            $value = trim($result->fields[$i++]);
			$value = stripslashes($value);
			//$value = mb_convert_encoding($value, "UTF-8", "auto");
            /*if(get_magic_quotes_gpc()) {
              $value = stripslashes($value);
            }*/
            //eval ("\$$fname = \"$value\";");
            $temp->$id=$value;
          }
          $ret[] = $temp;
          unset($this);
      }
      return $ret;

  }
  
  function getDBList_join($where="",$fields="",$tbljoin="",$confield="",$order="",$uflag = false,$limit="") {
      global $dbconn;
      
      $ret = Array();
      
      if ($uflag) {
      	$selectfields = $this->tblfields;
      }else {
      	$selectfields = $this->pfields;
      }
      $query = "SELECT ";
      foreach($selectfields as $id) {
          $query .= "A.".$id.",";
      }
	  if($fields !="" && $tbljoin !=""){
		  $query .= $fields;
	  }
      $query = substr($query,0,strlen($query)-1);
      $query .= " FROM $this->tablename A ";
	  if ($fields !="" && $tbljoin !="") {
        $query .= " JOIN ".$tbljoin." B ON A.".$confield." = B.".$confield."";
      }
      if ($where !="") {
		$query .= " GROUP BY $confield ";  
        $query .= " HAVING $where ";
      }
      if ($order !="") {
        $query .= " ORDER BY $order ";
      }
 
      $query.=$limit;
	  
      $result=$dbconn->Execute($query);
	//echo( $query."<BR>");
      if ($result)
      for (; !$result->EOF; $result->MoveNext()){
          $i = 0;
          $temp = $this;
		  array_push($selectfields,$fields);
          foreach($selectfields as $id){
            $fname = "temp->$id";
            $value = trim($result->fields[$i++]);
			$value = stripslashes($value);
			//$value = mb_convert_encoding($value, "UTF-8", "auto");
            /*if(get_magic_quotes_gpc()) {
              $value = stripslashes($value);
            }*/
            //eval ("\$$fname = \"$value\";");
            $temp->$id=$value;
          }
          $ret[] = $temp;
          unset($this);
      }
      return $ret;

  }
  
  //check if pkey already exists
  function isExist() {
  	global $dbconn;
  	
  	$where = "";
  	$query = "SELECT ";
  	foreach($this->pkeys as $id) {
      
  	  $query .= $id.",";
      $fname = "this->$id";
      
      $tmp = $this->$id;
  	  if (!get_magic_quotes_runtime()) {
         $tmp = addslashes($tmp);
      }
  	  if ($tmp!="") {
  	  	if ($where == "") {
  	  		$where .= $id ." = '".$tmp."'";
  	  	}else {
  	  		$where .= " AND " .$id ." = '".$tmp."'";
  	  	}
  	  	
  	  }else {
  	  	//pkeyvalue should not null
  	  	return -1;
  	  }
  	}
  	$query = substr($query,0,strlen($query)-1);
  	$query .= " FROM $this->tablename ";
    if ($where !="") {
        $query .= " WHERE $where ";
    }

    $result=$dbconn->Execute($query);
    if (!$result->EOF) {
    	return 1;
    }else {
    	return 0;
    }
  }
  
  //storeDB
  //@param overwrite confirm if the record has been modified by some one
  //default is false -> should confirm before update
  function storeDB($overwrite = false){
	   if ($this->isExist()){
	   	   return $this->update($overwrite);
	   } else {
	       return $this->insertnew();
	   }
  }
  
  //insert new record
  //@return true if insert new record successful
  function insertnew() {
    global $dbconn;
    
    if (!$this->checkParam()) return false;
    
    $insertFields = "";
    $insertValues = "";
    foreach($this->tblfields as $id) {
      $fname = "this->$id";
  	  //eval ("\$tmp = \"$$fname\";");
      $tmp = $this->$id;
      if (!get_magic_quotes_runtime()) {
        //$tmp = addslashes($tmp);
      }
  	  if ($tmp!="") {
        if ( $tmp == '_NULL'){
          $insertFields .= $id.",";
  	  	  $insertValues .= "NULL,";
        }else {
  	      $insertFields .= $id.",";
			 $tmp =  str_replace("'","&lsquo;",$tmp);
  	  	  $insertValues .= "'".$tmp."',";
        }
  	  }
    }
    $insertFields = substr($insertFields,0,strlen($insertFields)-1);
	$insertValues = substr($insertValues,0,strlen($insertValues)-1);
   // $insertValues = str_replace("'","&lsquo;",$insertValues);

    if ($this->checkParam()) {
		  $query = " INSERT INTO $this->tablename ($insertFields) 
		             VALUES (".$insertValues.") ";
			///echo $query;
		  $dbconn->Execute($query);
	  }
	  if ($dbconn->ErrorNo()<>0) {
        array_push($this->errors,$dbconn->ErrorMsg);
	  	return false;
	  }
	  return true;
  }
	
	//update database
	//@param overwrite confirm if the record has been modified by some one
	//default is false -> should confirm before update
	//@return false if update is not successfull or some one has overwritten
	
  function update($overwrite = false,$isAll = "") {
	global $dbconn;
    global $reloadURL;
    $updateSt = "";
    $where = "";

    $updatefields = $this->pfields;
    
  	foreach($updatefields as $id) {
      $fname = "this->$id";
  	  //eval ("\$tmp = \"$$fname\";");
      $tmp = $this->$id;
  	  if (!get_magic_quotes_runtime()) {
         //$tmp = addslashes($tmp);
      }
      if (!in_array($id,$this->pkeys)) {
        if ( ($tmp == '_NULL') || ($tmp == '')){
          if (!$isAll) {
		  	$updateSt .= " $id = NULL,";
          }	
		}else{
          $updateSt .= " $id = '$tmp',";
        }
      }else {
        if ($tmp!="") {
          
  	  	  if ($where == "") {
  	  		  $where .= $id ." = '".$tmp."'";
  	  	  }else {
  	  		  $where .= "AND " .$id ." = '".$tmp."'";
  	  	  }
  	    }
      }
    }
    $updateSt = substr($updateSt,0,strlen($updateSt)-1);

	  //if ($this->checkParam()) {
	   $query = " UPDATE  $this->tablename 
		 		        SET $updateSt
		            WHERE $where ";
		//echo $query;
	    $dbconn->Execute($query);			
		
	  //}
	  if ($dbconn->ErrorNo()<>0) {
      array_push($this->errors,$dbconn->ErrorMsg);
	  	return false;
	  }
	  return true;
  }
  
  //remove record
  function remove() {
	  global $dbconn;
    
    $where = "";
  	foreach($this->pkeys as $id) {
      $fname = "this->$id";
  	  //eval ("\$tmp = \"$$fname\";");
      $tmp = $this->$id;
  	  if ($tmp!="") {
  	  	if ($where == "") {
  	  		$where .= $id ." = '".$tmp."'";
  	  	}else {
  	  		$where .= "AND " .$id ." = '".$tmp."'";
  	  	}
  	  	
  	  }else {
  	  	//pkeyvalue should not null
  	  	return false;
  	  }
  	}
  	
    if ($where !="") {
      $query = "DELETE FROM $this->tablename WHERE $where ";
      $dbconn->Execute($query);
    }
	  if ($dbconn->ErrorNo()<>0) {
	  	return false;
	  }
	  return true;
  }
  
  //import data from array
  function getCsv($dat) {
    if (!is_array($dat)) return;
  	for($i=0;$i < count($this->pfields); $i++){
      $value = trim($dat[$i]);
      $id = $this->pfields[$i];
  	  $fname = "this->$id";
  	  //eval ("\$$fname = \"$value\";");
      $this->$id = $value;
  	}
    $encode = rsConfigGetVar('sysencode');
    if ($encode == 1) {
      $this->Decode(true);
    }
  }
  
  //check parameter before insert or update data
  //e.g : check length, or check foreign key..
  function checkParam() {
      return true;
  }
  
  function checkUpdate() {
    return true;
  }
  
  function checkInsert() {
    return true;
  }
  
  //check input form
  function checkForm($vars = "") {
  	  return true;
  }

////////////////////////////////////////////////////////
// by TTH
//update database showing pfields and ufields
//default is false -> should confirm before update
//@return false if update is not successfull or some one has overwritten
	
  function updateByCond($where, $ufields) {
	  global $dbconn;
    $updateSt = "";
   
    if($ufields == "") {
    	$updatefields = $this->pfields;
    } else {
    	$updatefields = $ufields;
    }
  	foreach($updatefields as $id) {
      $fname = "this->$id";
  	  //eval ("\$tmp = \"$$fname\";");
      $tmp = $this->$id;
  	  if (!get_magic_quotes_runtime()) {
	     //$tmp = addslashes($tmp);
	  }
  	  if($tmp == "")
  	  	  $updateSt .= " $id = NULL,";
  	  else {
      	  $updateSt .= " $id = '$tmp',";
      }
      if (in_array($id,$this->pkeys)) {
        if ($tmp!="") {
  	  	  if ($where == "") {
  	  		  $where .= $id ." = '".$tmp."'";
  	  	//  }else {
  	  	//	  $where .= "AND " .$id ." = '".$tmp."'";
  	  	  }
  	    }
      }
    }
    $updateSt = substr($updateSt,0,strlen($updateSt)-1);

	  //if ($this->checkParam()) {
	   $query = " UPDATE  $this->tablename 
		 		        SET $updateSt
		            WHERE $where ";
	    $dbconn->Execute($query);			
	  //}
	  if ($dbconn->ErrorNo()<>0) {
      array_push($this->errors,$dbconn->ErrorMsg);
	  	return false;
	  }
	  return true;
  }
  
  //Update fileds in parameter $uFileds only
  function updateFields($uFields) {
  	global $dbconn;
  	
  	$where = "";
    $updateSt = "";
  	
  	foreach($uFields as $id) {
      	$fname = "this->$id";
  	  	//eval ("\$tmp = \"$$fname\";");
        $tmp = $this->$id;
      	if (!get_magic_quotes_runtime()) {
           //$tmp = addslashes($tmp);
        }
        if($tmp === null)
        	$updateSt .= " $id = null,";
        else
      		$updateSt .= " $id = '$tmp',";
   	}
   	
    $updateSt = substr($updateSt,0,strlen($updateSt)-1);
  	foreach($this->pkeys as $id) {
  	//	$query .= $id.",";
      $fname = "this->$id";
      
  	  //eval ("\$tmp = \"$$fname\";");
      $tmp = $this->$id;
  	  if (!get_magic_quotes_runtime()) {
         //$tmp = addslashes($tmp);
         //$tmp = rsSqlAddslashes($tmp);
      }
  	  if ($tmp!="") {
  	  	if ($where == "") {
  	  		$where .= $id ." = '".$tmp."'";
  	  	}else {
  	  		$where .= " AND " .$id ." = '".$tmp."'";
  	  	}
  	  	
  	  }else {
  	  	//pkeyvalue should not null
  	  	return -1;
  	  }
  	}
  	//$query = substr($query,0,strlen($query)-1);
  	
  	$query = "UPDATE $this->tablename SET $updateSt ";
    if ($where !="") {
        $query .= " WHERE $where ";
        $dbconn->Execute($query);
        
    	  if ($dbconn->ErrorNo()<>0) {
          array_push($this->errors,$dbconn->ErrorMsg);
	  	    return false;
	       }
	     
    }
    return true;
  }
  
  //Add by minh@runsystem.net
  
  //check if this fields is already used in $tablename table
	function is_already_used($tablename,$fkey,$fvalue){
    global $dbconn;
	
		$query="SELECT * 
				FROM $tablename
				WHERE $fkey='$fvalue'";
		//echo $query;
		$ret=$dbconn->Execute($query);

		if ($ret->EOF) return 0;
		else return 1;
	}
  
  function checkNull() {
    $arg_list = func_get_args();
  	if (empty($arg_list)) {
  		$arg_list = $this->tblfields;
  	}
  	foreach($arg_list as $id){
  	    $fname = "this->$id";
        //eval ("\$tmp = \"$$fname\";");
        $tmp = $this->$id;
  	    if ($tmp == '') {
          $value = '_NULL';
          eval ("\$$fname = \"$value\";");
        }
  	}
  }
  
  //Get rownumber with $where condition
  //Added by: Ta Thuy
  //date:21/06/2006
  function getRowNumber($where="") {
  	  global $dbconn;
	  $query = "Select count(*) as count 
				FROM $this->tablename ";
			
	  if ($where !="") {
       	 $query .= " WHERE $where ";
      }		
	//echo $query;	 	
	  $ret=$dbconn->Execute($query);
	  if ($ret->EOF) return 0;
	  else return $ret->fields("count");
  }
  
  //Ham Delete AllItem in list $listID
  //Create by: Ta Thuy
  //date:21/06/2006
  function removeInList($listID) {
	global $dbconn;
	$query = "DELETE FROM $this->tablename 
				WHERE ".$this->pkeys[0]." IN ('". str_replace(",","','",$listID) ."')";
    $dbconn->Execute($query);
  }

  //check and uncheck
  //Edited by: Le Anh Van
  //date: 22-11-2009
  function checkUncheck($ID,$Show,$field) {
	global $dbconn;
	$query = "update $this->tablename set ".$field." = ".$Show."
				WHERE ".$this->pkeys[0]." =  ".$ID."";
	//echo $query;
    $dbconn->Execute($query);
  }
  
  //check and uncheck
  //Created by: Le Anh Van
  //date: 23-11-2009
  function checkOnly($ID,$Show,$field){
	global $dbconn;
	$query = "update $this->tablename set ".$field." = 0 ";
	$dbconn->Execute($query);		
	
	$query = "update $this->tablename set ".$field." = ".$Show."
				WHERE ".$this->pkeys[0]." =  ".$ID."";
    $dbconn->Execute($query);
  }
  
  
  function getTitle($catID)
  {
    	 global $dbconn;

        // ---- Get sql query
        $sql = " SELECT catname
                    FROM $this->tablename where catID = ".$catID;

        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		
		return $result->fields[0];
  }
  
  function getMaxID() {
	global $dbconn;
	$query = "SELECT MAX(".$this->pkeys[0].") AS maxID FROM $this->tablename ";
    $ret=$dbconn->Execute($query);
	return $ret->fields[0];
  }  
  
  function addOrderstt($fieldstt,$where) {
	global $dbconn;
	if($where == "") $where = "";
	else $where = " where 1 = 1 ".$where;
	$query = "SELECT MAX(".$fieldstt.") AS stt FROM $this->tablename $where";
	//echo $query;
    $ret=$dbconn->Execute($query);
	$stt = $ret->fields[0] + 1;
	return $stt;
  } 
  
  function removeFile($listID,$fieldImage){
   		global $dbconn;
		$fieldImages = implode(',',$fieldImage);
		$query = "Select ".$fieldImages." from $this->tablename where ".$this->pkeys[0]." IN ('". str_replace(",","','",$listID) ."')";
		$ret=$dbconn->Execute($query);
		for($i=0;$i < count($fieldImage);$i++)
		{
			if($ret->fields[$i] != ''){
				unlink("../".$ret->fields[$i]); 
			}
		}
	
			$query = "Update $this->tablename set ";
			$spa = "";
			for($j=0;$j < count($fieldImage);$j++){
				if($j != count($fieldImage) - 1) $spa = ",";
				else  $spa = "";
				
					$query .= $fieldImage[$j]." = ''".$spa; 
			}
			$query .= " where  ".$this->pkeys[0]." IN ('". str_replace(",","','",$listID) ."')";
			$ret=$dbconn->Execute($query);
	
  }
   
  function sortList($where = "",$arrfile,$idArray,$sttfield){
	global $dbconn;
	$id = implode(',',$idArray);
	$query = "select $sttfield,".$this->pkeys[0]." from $this->tablename where ".$this->pkeys[0]." in  ($id)";
	$ret=$dbconn->Execute($query);

	while($rs = $ret->FetchRow()){
		$f .= $rs[0].",";
		$f2 .= $rs[1].",";
	}
	$ar = explode(',',$f);
	$ar2 = explode(',',$f2);
	for($i = 0;$i< count($arrfile);$i++){
		if($ar[$i] != $arrfile[$i]) {
			$query = "update $this->tablename set $sttfield = '".$arrfile[$i]."' where ".$this->pkeys[0]." = '".$ar2[$i]."'";
			//echo $query."<br>";
			$ret=$dbconn->Execute($query);
			
		}
	}	
  }
  
 }
?>