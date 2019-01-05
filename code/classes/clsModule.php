<?php
/*-------------------------------------------
- PHP Smarty Template Engine
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/

class module_class extends dbBasic {
  	var  $mod_id;    
	var  $mod_name; 
	var  $mod_desc;
	var  $mod_date;
	var  $mod_sort;
  	var  $mod_active;
 	
	var $pfields = array (	'mod_id',
							'mod_name',
							'mod_desc',
							'mod_date',
							'mod_sort',
							'mod_active'); //table modules fields
							
  	var $pkeys = array ('mod_id'); //key fields
  
 	function module_class(){ 
    	$this->dbBasic();  
    	$this->tablename = "tbl_modules";
  	}
	
  	function readform(){
  		dbBasic::readform();
  	}  	
	
	function writeform(){
		dbBasic::writeForm();
  	}
	
	//Ham lay module qua id
	function getdataby($id){
		global $dbconn;
		$query = "Select mod_name FROM $this->tablename where mod_id=".$id;
		$result = $dbconn->Execute($query);
		return $result->fields[0];
	}
	
	//Ham kiem tra modules duoc trieu goi
	function checkmodname($module_name){
		global $dbconn;
		$query = "Select mod_id FROM $this->tablename where mod_name='".$module_name."'";
		$result = $dbconn->Execute($query);
		return $result->fields[0];
	}
	
  	//Ham Delete AllItem in list $listID
  	function removeInList($listID) {
		global $dbconn;
		$query = "DELETE FROM $this->tablename 
					WHERE mod_id IN ('". str_replace(",","','",$listID) ."')";
		$dbconn->Execute($query);
  	}
	
	// --- sort item by array
    function sortItem($sort,$id){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set mod_sort=".$sort." where mod_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }
	
	
	/**
	 * Kiem tra modules
	 */
	 function checkmodules(){
		
		//get mod list in folder
		$testmodhandle = @opendir( '../modules' );
		$modlist = array();
		while ( $file = @readdir($testmodhandle) )
		{
			if ( (! ereg("[.]", $file)) ) $modlist[] = $file;
		}
		closedir( $testmodhandle );
		sort( $modlist );
		
		$query = "select * from $this->tablename";
		$result = mysql_query($query);
	
		if(mysql_num_rows($result)<1):
			foreach($modlist as $mod_name){
				$query = "insert into $this->tablename(mod_name) values('".$mod_name."')";
				mysql_query($query);
			}
		endif;
		
		if(mysql_num_rows($result)>0):
			while($row=mysql_fetch_array($result)):
				$equar = 0;
				foreach($modlist as $mod_name){
					if($row['mod_name']==$mod_name)
					$equar +=1;
				}
				if($equar==0){
					$query = "delete from $this->tablename where mod_name='".$row['mod_name']."'";
					mysql_query($query);
				}
			endwhile;
		endif;
		
		foreach($modlist as $mod_name){
			$query = "select * from $this->tablename where mod_name='".$mod_name."'";
			$result = mysql_query($query);
			if(mysql_num_rows($result)<1):
				$query = "insert into $this->tablename(mod_name) values('".$mod_name."')";
				mysql_query($query);
			endif;
		}
	}
		
}
?>