<?php
/*-------------------------------------------
- PHP Smarty Template Engine
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/

class hdbanHoadon_class extends dbBasic {
    var  $hoadon_id;
    var  $hdban_id;
    var  $hdban_sohd;
    var  $hoadon_sohd;
    var  $hoadon_giatri;
    var  $hoadon_pttt;
    var  $hoadon_ngayhd;
    var  $hoadon_nguoinhap;
    var  $hoadon_file;
    var  $hoadon_date;
    var  $hoadon_active;

    var $pfields = array (
        'hoadon_id',
        'hdban_id',
        'hdban_sohd',
        'hoadon_sohd',
        'hoadon_noidung',
        'hoadon_giatri',
        'hoadon_pttt',
        'hoadon_ngayhd',
        'hoadon_nguoinhap',
        'hoadon_file',
        'hoadon_date',
        'hoadon_active'); //table private fields

    var $pkeys = array ('hoadon_id'); //key fields

    function hdbanHoadon_class(){
        $this->dbBasic();
        $this->tablename = "tbl_hd_hdban_hoadon";
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
        $sql = " SELECT hoadon_sohd FROM $this->tablename where hoadon_id=".$id;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
        return $result->fields[0];
    }

    // --- get number of rows
    function getNumresult($where = ""){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT count(hoadon_id) FROM $this->tablename ".$where;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
        return $result->fields[0];
    }

    function checkTrunghop($hoadon_sohd, $hoadon_id = 0){
        global $dbconn;
        // ---- Get sql query
        $where = " AND hoadon_sohd = '".$hoadon_sohd."'";
        if($hoadon_id!=0) $where.=" AND hoadon_id != ".$hoadon_id;
        $sql = " SELECT count(hoadon_id) FROM $this->tablename WHERE 1 = 1".$where;

        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
        return $result->fields[0];
    }

    // --- get top 1 news
    function getTopRows(){
        $where = " 1 = 1 and hoadon_active = 1";
        $rows = $this->getDBList($where," hoadon_id DESC",true," Limit 1");
        return $rows;
    }
}
?>