<?php
/*-------------------------------------------
- PHP Smarty Template Engine
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/

class addUser_class extends dbBasic {
  	var  $addUser_id;
	var  $doc_id;
	var  $user_sent;
	var  $user_id;
	var  $addUser_desc; 
  	var  $addUser_date;
 	
	var $pfields = array (	'addUser_id',
							'doc_id',
							'user_sent',
							'user_id',
							'addUser_desc',
							'addUser_date'); //table private fields
							
  	var $pkeys = array ('addUser_id'); //key fields
  
 	function addUser_class(){ 
    	$this->dbBasic();  
    	$this->tablename = "tbl_addusers";
  	}
	
  	function readform(){
  		dbBasic::readform();
  	}  	
	
	function writeform(){
		dbBasic::writeForm();
  	}
	
}
?>