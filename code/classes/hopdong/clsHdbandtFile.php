<?php
/*-------------------------------------------
- PHP Smarty Template Engine
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/

class hdbandtFile_class extends dbBasic {
    var  $hdfile_id;
    var  $dthdban_id;
    var  $dthdban_sohd;
    var  $hdfile_name;
    var  $hdfile_path;
    var  $hdfile_ngayduthao;
    var  $hdfile_nguoiduthao;
    var  $hdfile_phanhoi;
    var  $hdfile_ykien;
    var  $hdfile_ngayykien;
    var  $hdfile_nguoiykien;
    var  $hdfile_status;

    var $pfields = array (
        'hdfile_id',
        'dthdban_id',
        'dthdban_sohd',
        'hdfile_name',
        'hdfile_path',
        'hdfile_ngayduthao',
        'hdfile_nguoiduthao',
        'hdfile_phanhoi',
        'hdfile_ykien',
        'hdfile_ngayykien',
        'hdfile_nguoiykien',
        'hdfile_status'); //table private fields

    var $pkeys = array ('hdfile_id'); //key fields

    function hdbandtFile_class(){
        $this->dbBasic();
        $this->tablename = "tbl_hd_hdban_dt_file";
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