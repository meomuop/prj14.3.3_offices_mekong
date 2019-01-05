<?php
/*-------------------------------------------
- PHP Smarty Template Engine
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/

class doitac_class extends dbBasic {
    var  $doitac_id;
    var  $doitac_name;
    var  $doitac_viettat;
    var  $doitac_daidien;
    var  $doitac_mst;
    var  $doitac_truso;
    var  $doitac_vpgd;
    var  $doitac_sdt;
    var  $doitac_fax;
    var  $doitac_email;
    var  $doitac_date;
    var  $doitac_sort;
    var  $doitac_active;

    var $pfields = array (
        'doitac_id',
        'doitac_name',
        'doitac_viettat',
        'doitac_daidien',
        'doitac_mst',
        'doitac_truso',
        'doitac_vpgd',
        'doitac_sdt',
        'doitac_fax',
        'doitac_email',
        'doitac_date',
        'doitac_sort',
        'doitac_active'); //table private fields

    var $pkeys = array ('doitac_id'); //key fields

    function doitac_class(){
        $this->dbBasic();
        $this->tablename = "tbl_hd_doitac";
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
        $sql = " SELECT doitac_name FROM $this->tablename where doitac_id=".$id;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
        return $result->fields[0];
    }

    function getViettat($id){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT doitac_viettat FROM $this->tablename where doitac_id=".$id;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
        return $result->fields[0];
    }

    // --- sort item by array
    function sortItem($sort,$id){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set doitac_sort=".$sort." where doitac_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }

    function update_uutien($id){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set doitac_priority = 1 where doitac_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }

    // --- get number of rows
    function getNumresult($where = ""){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT count(doitac_id) FROM $this->tablename ".$where;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
        return $result->fields[0];
    }

    // --- get top 1 news
    function getTopRows(){
        $where = " 1 = 1 and doitac_active = 1";
        $rows = $this->getDBList($where," doitac_id DESC",true," Limit 1");
        return $rows;
    }
}
?>