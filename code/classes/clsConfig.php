<?php
/*-------------------------------------------
- PHP Frame work Informa
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/

class config_class extends dbBasic {
  	var  $config_id;    
	var  $owner_name;  
  	var  $owner_add; 
  	var  $owner_phone;
	var  $owner_fax;
	var  $owner_email;
	var  $owner_reemail;
	var  $owner_url;
	var  $luong_coban;
	var  $luong_apdung;
	var  $ngay_macdinh;
	var  $sat_ra;
	var  $sun_ra;
	var  $site_port;
	var  $site_active;
	var  $site_inactive_info;
	
	var  $pfields = array (	'config_id',
							'owner_name',
							'owner_add',
							'owner_phone',
							'owner_fax',
							'owner_email',
							'owner_reemail',
							'owner_url',
							'luong_coban',
							'luong_apdung',
							'ngay_macdinh',
							'sat_ra',
							'sun_ra',
							'site_port',
							'site_active',
							'site_inactive_info'); 
	//table private fields
							
  	var $pkeys = array ('config_id'); //key fields
  
 	function config_class() { 
    	$this->dbBasic();  
    	$this->tablename = "tbl_config";
  	}
	
  	function readform()
  	{
  		dbBasic::readform();
  	}  	
	
	function writeform()
  	{
		dbBasic::writeForm();
  	}
	
	// --- get config email
	function getEmail()
    {
		 global $dbconn;

        // ---- Get sql query
        $sql = " SELECT owner_email FROM $this->tablename ";

        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		
		return $result->fields[0];
    }

    function updateLuong($id, $luong, $apdung){
        global $dbconn;
 	    $sql = "UPDATE $this->tablename SET luong_coban = ".$luong.", luong_apdung = ".$apdung." WHERE config_id = ".$id;
        if($dbconn->Execute($sql)){
            return true;
        }
        return false;
    }
	
/***********************
 * function checkForm
 *
 ********************/
 	function checkForm($isupdate = false)
	{
		return true;
		// empty
	}
}