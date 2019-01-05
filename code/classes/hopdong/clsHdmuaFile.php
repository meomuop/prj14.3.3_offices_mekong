<?php
/*-------------------------------------------
- PHP Smarty Template Engine
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/

class hdmuaFile_class extends dbBasic {
    var  $hdfile_id;
    var  $hdmua_id;
    var  $hdmua_sohd;
    var  $hdfile_name;
    var  $hdfile_path;
    var  $user_id;
    var  $hdfile_date;
    var  $hdfile_active;

    var $pfields = array (
        'hdfile_id',
        'hdmua_id',
        'hdmua_sohd',
        'hdfile_name',
        'hdfile_path',
        'user_id',
        'hdfile_date',
        'hdfile_active'); //table private fields

    var $pkeys = array ('hdfile_id'); //key fields

    function hdmuaFile_class(){
        $this->dbBasic();
        $this->tablename = "tbl_hd_hdmua_file";
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
        $sql = " SELECT hdfile_name FROM $this->tablename where hdfile_id=".$id;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
        return $result->fields[0];
    }

    // --- get number of rows
    function getNumresult($where = ""){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT count(hdfile_id) FROM $this->tablename ".$where;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
        return $result->fields[0];
    }

    // --- get top 1 news
    function getTopRows(){
        $where = " 1 = 1 and hdfile_active = 1";
        $rows = $this->getDBList($where," hdfile_id DESC",true," Limit 1");
        return $rows;
    }
}
?>