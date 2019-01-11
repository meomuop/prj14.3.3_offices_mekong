<?php
/*-------------------------------------------
- PHP Smarty Template Engine
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/

class hdbandt_class extends dbBasic {
    var $dthdban_id;
    var $dthdban_sohd;
    var $dthdban_hieuluc;
    var $dthdban_noidung;
    var $dthdban_tgth;
    var $dthdban_kieu_tgth;
    var $dvtiente_id;
    var $dthdban_giatri;
    var $dthdban_giatri_quydoi;
    var $dthdban_gttt;
    var $dthdban_gttt_quydoi;
    var $khachhang_id;
    var $khachhang_viettat;
    var $department_id;
    var $user_id;
    var $dthdban_tinhtrang;
    var $dthdban_dieukhoankhac;
    var $dthdban_file;
    var $dthdban_date;

    var $pfields = array (
        'dthdban_id',
        'dthdban_sohd',
        'dthdban_hieuluc',
        'dthdban_noidung',
        'dthdban_tgth',
        'dthdban_kieu_tgth',
        'dvtiente_id',
        'dthdban_giatri',
        'dthdban_giatri_quydoi',
        'dthdban_gttt',
        'dthdban_gttt_quydoi',
        'khachhang_id',
        'khachhang_viettat',
        'department_id',
        'user_id',
        'dthdban_tinhtrang',
        'dthdban_dieukhoankhac',
        'dthdban_file',
        'dthdban_date'
    ); //table private fields

    var $pkeys = array ('dthdban_id'); //key fields

    function hdbandt_class(){
        $this->dbBasic();
        $this->tablename = "tbl_hd_hdban_dt";
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
        $sql = " SELECT dthdban_name FROM $this->tablename where dthdban_id=".$id;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
        return $result->fields[0];
    }

    // --- sort item by array
    function sortItem($sort,$id){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set dthdban_sort=".$sort." where dthdban_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }

    function updateTinhtrang($id,$value){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set dthdban_tinhtrang = ".$value." where dthdban_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }

    function changeHdbandtFile($id,$value){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set dthdban_file = ".$value." where dthdban_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }

    // --- get number of rows
    function getNumresult($where = ""){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT count(dthdban_id) FROM $this->tablename ".$where;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
        return $result->fields[0];
    }

    function checkTrunghop($dthdban_sohd, $dthdban_id = 0){
        global $dbconn;
        // ---- Get sql query
        $where = " AND dthdban_sohd = '".$dthdban_sohd."'";
        if($dthdban_id!=0) $where.=" AND dthdban_id != ".$dthdban_id;
        $sql = " SELECT count(dthdban_id) FROM $this->tablename WHERE 1 = 1".$where;

        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
        return $result->fields[0];
    }

    // --- get top 1 news
    function getTopRows(){
        $where = " 1 = 1 and dthdban_active = 1";
        $rows = $this->getDBList($where," dthdban_id DESC",true," Limit 1");
        return $rows;
    }
}
