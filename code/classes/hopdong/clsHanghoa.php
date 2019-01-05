<?php
/*-------------------------------------------
- PHP Smarty Template Engine
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/

class hanghoa_class extends dbBasic {
    var  $hanghoa_id;
    var  $danhmuc_id;
    var  $hanghoa_name;
    var  $hanghoa_mahang;
    var  $hanghoa_mota;
    var  $hanghoa_date;
    var  $hanghoa_sort;
    var  $hanghoa_active;

    var $pfields = array (
        'hanghoa_id',
        'danhmuc_id',
        'hanghoa_name',
        'hanghoa_mahang',
        'hanghoa_mota',
        'hanghoa_date',
        'hanghoa_sort',
        'hanghoa_active'); //table private fields

    var $pkeys = array ('hanghoa_id'); //key fields

    function hanghoa_class(){
        $this->dbBasic();
        $this->tablename = "tbl_hdmua_hanghoa";
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
        $sql = " SELECT hanghoa_name FROM $this->tablename where hanghoa_id=".$id;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
        return $result->fields[0];
    }

    // --- sort item by array
    function sortItem($sort,$id){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set hanghoa_sort=".$sort." where hanghoa_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }

    function update_uutien($id){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set hanghoa_priority = 1 where hanghoa_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }

    // --- get number of rows
    function getNumresult($where = ""){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT count(hanghoa_id) FROM $this->tablename ".$where;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
        return $result->fields[0];
    }

    // --- get top 1 news
    function getTopRows(){
        $where = " 1 = 1 and hanghoa_active = 1";
        $rows = $this->getDBList($where," hanghoa_id DESC",true," Limit 1");
        return $rows;
    }
}
?>