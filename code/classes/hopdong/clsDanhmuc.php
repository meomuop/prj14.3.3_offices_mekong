<?php
/*-------------------------------------------
- PHP Smarty Template Engine
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/

class danhmuc_class extends dbBasic {
    var  $danhmuc_id;
    var  $danhmuc_name;
    var  $danhmuc_viettat;
    var  $danhmuc_mota;
    var  $danhmuc_date;
    var  $danhmuc_sort;
    var  $danhmuc_active;

    var $pfields = array (
        'danhmuc_id',
        'danhmuc_name',
        'danhmuc_viettat',
        'danhmuc_mota',
        'danhmuc_date',
        'danhmuc_sort',
        'danhmuc_active'); //table private fields

    var $pkeys = array ('danhmuc_id'); //key fields

    function danhmuc_class(){
        $this->dbBasic();
        $this->tablename = "tbl_hdmua_danhmuc";
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
        $sql = " SELECT danhmuc_name FROM $this->tablename where danhmuc_id=".$id;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
        return $result->fields[0];
    }

    // --- sort item by array
    function sortItem($sort,$id){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set danhmuc_sort=".$sort." where danhmuc_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }

    function update_uutien($id){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set danhmuc_priority = 1 where danhmuc_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }

    // --- get number of rows
    function getNumresult($where = ""){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT count(danhmuc_id) FROM $this->tablename ".$where;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
        return $result->fields[0];
    }

    // --- get top 1 news
    function getTopRows(){
        $where = " 1 = 1 and danhmuc_active = 1";
        $rows = $this->getDBList($where," danhmuc_id DESC",true," Limit 1");
        return $rows;
    }
}
?>