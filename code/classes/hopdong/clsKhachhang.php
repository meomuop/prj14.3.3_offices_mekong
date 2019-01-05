<?php
/*-------------------------------------------
- PHP Smarty Template Engine
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/

class khachhang_class extends dbBasic {
    var  $khachhang_id;
    var  $khachhang_name;
    var  $khachhang_viettat;
    var  $khachhang_daidien;
    var  $khachhang_mst;
    var  $khachhang_truso;
    var  $khachhang_vpgd;
    var  $khachhang_sdt;
    var  $khachhang_fax;
    var  $khachhang_email;
    var  $khachhang_date;
    var  $khachhang_sort;
    var  $khachhang_active;

    var $pfields = array (
        'khachhang_id',
        'khachhang_name',
        'khachhang_viettat',
        'khachhang_daidien',
        'khachhang_mst',
        'khachhang_truso',
        'khachhang_vpgd',
        'khachhang_sdt',
        'khachhang_fax',
        'khachhang_email',
        'khachhang_date',
        'khachhang_sort',
        'khachhang_active'); //table private fields

    var $pkeys = array ('khachhang_id'); //key fields

    function khachhang_class(){
        $this->dbBasic();
        $this->tablename = "tbl_hd_khachhang";
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
        $sql = " SELECT khachhang_name FROM $this->tablename where khachhang_id=".$id;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
        return $result->fields[0];
    }

    function getViettat($id){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT khachhang_viettat FROM $this->tablename where khachhang_id=".$id;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
        return $result->fields[0];
    }

    // --- sort item by array
    function sortItem($sort,$id){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set khachhang_sort=".$sort." where khachhang_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }

    function update_uutien($id){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set khachhang_priority = 1 where khachhang_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }

    // --- get number of rows
    function getNumresult($where = ""){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT count(khachhang_id) FROM $this->tablename ".$where;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
        return $result->fields[0];
    }

    // --- get top 1 news
    function getTopRows(){
        $where = " 1 = 1 and khachhang_active = 1";
        $rows = $this->getDBList($where," khachhang_id DESC",true," Limit 1");
        return $rows;
    }
}
?>