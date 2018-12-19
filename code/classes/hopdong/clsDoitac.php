<?php
/*-------------------------------------------
- PHP Frame work Informa
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/

class doitac_class extends dbBasic {
    var  $doitac_id;
    var  $doitac_name;
    var  $doitac_viettat;
    var  $doctac_daidien;
    var  $doctac_mst;
    var  $doctac_truso;
    var  $doctac_vpgd;
    var  $doctac_sdt;
    var  $doctac_fax;
    var  $doctac_email;
    var  $doitac_date;
    var  $doitac_sort;
    var  $doitac_active;

    var $pfields = array (
        'doitac_id',
        'doitac_name',
        'doitac_viettat',
        'doctac_daidien',
        'doctac_mst',
        'doctac_truso',
        'doctac_vpgd',
        'doctac_sdt',
        'doctac_fax',
        'doctac_email',
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