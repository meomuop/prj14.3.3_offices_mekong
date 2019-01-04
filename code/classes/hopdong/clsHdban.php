<?php
/*-------------------------------------------
- PHP Frame work Informa
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/

class hdban_class extends dbBasic {
    var $hdban_id;
    var $hdban_sohd;
    var $hdban_ngayhd;
    var $hdban_hieuluc;
    var $hdban_noidung;
    var $hdban_tgth;
    var $hdban_kieu_tgth;
    var $dvtiente_id;
    var $hdban_giatri;
    var $hdban_giatri_quydoi;
    var $hdban_gttt;
    var $hdban_gttt_quydoi;
    var $doitac_id;
    var $doitac_viettat;
    var $department_id;
    var $phongban_name;
    var $user_id;
    var $nguoi_theodoi;
    var $hdban_tinhtrang;
    var $hdban_tl_huybo;
    var $hdban_lydo_huybo;
    var $hdban_dieukhoankhac;
    var $hdban_file;
    var $hdban_nguoinhap;
    var $hdban_date;

    var $pfields = array (
        'hdban_id',
        'hdban_sohd',
        'hdban_ngayhd',
        'hdban_hieuluc',
        'hdban_noidung',
        'hdban_tgth',
        'hdban_kieu_tgth',
        'dvtiente_id',
        'hdban_giatri',
        'hdban_giatri_quydoi',
        'hdban_gttt',
        'hdban_gttt_quydoi',
        'doitac_id',
        'doitac_viettat',
        'department_id',
        'phongban_name',
        'user_id',
        'nguoi_theodoi',
        'hdban_tinhtrang',
        'hdban_tl_huybo',
        'hdban_lydo_huybo',
        'hdban_dieukhoankhac',
        'hdban_file',
        'hdban_nguoinhap',
        'hdban_date'
    ); //table private fields

    var $pkeys = array ('hdban_id'); //key fields

    function hdban_class(){
        $this->dbBasic();
        $this->tablename = "tbl_hd_hdban";
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
        $sql = " SELECT hdban_name FROM $this->tablename where hdban_id=".$id;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
        return $result->fields[0];
    }

    // --- sort item by array
    function sortItem($sort,$id){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set hdban_sort=".$sort." where hdban_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }

    function updateTinhtrang($id,$value){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set hdban_tinhtrang = ".$value." where hdban_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }

    function changeHdmuaFile($id,$value){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set hdban_file = ".$value." where hdban_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }

    // --- get number of rows
    function getNumresult($where = ""){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT count(hdban_id) FROM $this->tablename ".$where;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
        return $result->fields[0];
    }

    function checkTrunghop($hdban_sohd, $hdban_id = 0){
        global $dbconn;
        // ---- Get sql query
        $where = " AND hdban_sohd = '".$hdban_sohd."'";
        if($hdban_id!=0) $where.=" AND hdban_id != ".$hdban_id;
        $sql = " SELECT count(hdban_id) FROM $this->tablename WHERE 1 = 1".$where;

        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
        return $result->fields[0];
    }

    // --- get top 1 news
    function getTopRows(){
        $where = " 1 = 1 and hdban_active = 1";
        $rows = $this->getDBList($where," hdban_id DESC",true," Limit 1");
        return $rows;
    }
}
