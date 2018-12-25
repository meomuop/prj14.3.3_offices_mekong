<?php
/*-------------------------------------------
- PHP Frame work Informa
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/

class hdmua_class extends dbBasic {
    var $hdmua_id;
    var $hdmua_sohd;
    var $hdmua_ngayhd;
    var $hdmua_hieuluc;
    var $hdmua_noidung;
    var $hdmua_tgth;
    var $hdmua_kieu_tgth;
    var $dvtiente_id;
    var $hdmua_giatri;
    var $hdmua_giatri_quydoi;
    var $hdmua_gttt;
    var $hdmua_gttt_quydoi;
    var $doitac_id;
    var $doitac_viettat;
    var $department_id;
    var $phongban_name;
    var $user_id;
    var $nguoi_theodoi;
    var $hdmua_tinhtrang;
    var $hdmua_tl_huybo;
    var $hdmua_lydo_huybo;
    var $hdmua_dieukhoankhac;
    var $hdmua_file;
    var $hdmua_nguoinhap;
    var $hdmua_date;

    var $pfields = array (
        'hdmua_id',
        'hdmua_sohd',
        'hdmua_ngayhd',
        'hdmua_hieuluc',
        'hdmua_noidung',
        'hdmua_tgth',
        'hdmua_kieu_tgth',
        'dvtiente_id',
        'hdmua_giatri',
        'hdmua_giatri_quydoi',
        'hdmua_gttt',
        'hdmua_gttt_quydoi',
        'doitac_id',
        'doitac_viettat',
        'department_id',
        'phongban_name',
        'user_id',
        'nguoi_theodoi',
        'hdmua_tinhtrang',
        'hdmua_tl_huybo',
        'hdmua_lydo_huybo',
        'hdmua_dieukhoankhac',
        'hdmua_file',
        'hdmua_nguoinhap',
        'hdmua_date'
    ); //table private fields

    var $pkeys = array ('hdmua_id'); //key fields

    function hdmua_class(){
        $this->dbBasic();
        $this->tablename = "tbl_hd_hdmua";
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
        $sql = " SELECT hdmua_name FROM $this->tablename where hdmua_id=".$id;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
        return $result->fields[0];
    }

    // --- sort item by array
    function sortItem($sort,$id){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set hdmua_sort=".$sort." where hdmua_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }

    function updateTinhtrang($id,$value){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set hdmua_tinhtrang = ".$value." where hdmua_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }

    // --- get number of rows
    function getNumresult($where = ""){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT count(hdmua_id) FROM $this->tablename ".$where;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
        return $result->fields[0];
    }

    function checkTrunghop($hdmua_sohd, $hdmua_id = 0){
        global $dbconn;
        // ---- Get sql query
        $where = " AND hdmua_sohd = '".$hdmua_sohd."'";
        if($hdmua_id!=0) $where.=" AND hdmua_id != ".$hdmua_id;
        $sql = " SELECT count(hdmua_id) FROM $this->tablename WHERE 1 = 1".$where;

        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
        return $result->fields[0];
    }

    // --- get top 1 news
    function getTopRows(){
        $where = " 1 = 1 and hdmua_active = 1";
        $rows = $this->getDBList($where," hdmua_id DESC",true," Limit 1");
        return $rows;
    }
}
