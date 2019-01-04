<?php
/*-------------------------------------------
- PHP Frame work Informa
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/

class duan_class extends dbBasic {
    var  $duan_id;
    var  $duan_name;
    var  $duan_thuongmai;
    var  $duan_maduan;
    var  $duan_chudautu;
    var  $duan_mota;
    var  $duan_date;
    var  $duan_sort;
    var  $duan_active;

    var $pfields = array (
        'duan_id',
        'duan_name',
        'duan_thuongmai',
        'duan_maduan',
        'duan_chudautu',
        'duan_mota',
        'duan_date',
        'duan_sort',
        'duan_active'); //table private fields

    var $pkeys = array ('duan_id'); //key fields

    function duan_class(){
        $this->dbBasic();
        $this->tablename = "tbl_hd_duan";
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
        $sql = " SELECT duan_name FROM $this->tablename where duan_id=".$id;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
        return $result->fields[0];
    }

    function getViettat($id){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT duan_viettat FROM $this->tablename where duan_id=".$id;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
        return $result->fields[0];
    }

    // --- sort item by array
    function sortItem($sort,$id){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set duan_sort=".$sort." where duan_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }

    function update_uutien($id){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set duan_priority = 1 where duan_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }

    // --- get number of rows
    function getNumresult($where = ""){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT count(duan_id) FROM $this->tablename ".$where;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
        return $result->fields[0];
    }

    // --- get top 1 news
    function getTopRows(){
        $where = " 1 = 1 and duan_active = 1";
        $rows = $this->getDBList($where," duan_id DESC",true," Limit 1");
        return $rows;
    }
}
?>