<?php
/*-------------------------------------------
- PHP Frame work Informa
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/

class hdbanTientrinh_class extends dbBasic {
    var  $tientrinh_id;
    var  $hdban_id;
    var  $hdban_sohd;
    var  $tientrinh_ghichu;
    var  $tientrinh_file;
    var  $user_id;
    var  $tientrinh_date;
    var  $tientrinh_active;

    var $pfields = array (
        'tientrinh_id',
        'hdban_id',
        'hdban_sohd',
        'tientrinh_ghichu',
        'tientrinh_file',
        'user_id',
        'tientrinh_date',
        'tientrinh_active'); //table private fields

    var $pkeys = array ('tientrinh_id'); //key fields

    function hdbanTientrinh_class(){
        $this->dbBasic();
        $this->tablename = "tbl_hd_hdban_tientrinh";
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
        $sql = " SELECT tientrinh_sohd FROM $this->tablename where tientrinh_id=".$id;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
        return $result->fields[0];
    }

    // --- get number of rows
    function getNumresult($where = ""){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT count(tientrinh_id) FROM $this->tablename ".$where;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
        return $result->fields[0];
    }

    function checkTrunghop($tientrinh_sohd, $tientrinh_id = 0){
        global $dbconn;
        // ---- Get sql query
        $where = " AND tientrinh_sohd = '".$tientrinh_sohd."'";
        if($tientrinh_id!=0) $where.=" AND tientrinh_id != ".$tientrinh_id;
        $sql = " SELECT count(tientrinh_id) FROM $this->tablename WHERE 1 = 1".$where;

        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
        return $result->fields[0];
    }

    // --- get top 1 news
    function getTopRows(){
        $where = " 1 = 1 and tientrinh_active = 1";
        $rows = $this->getDBList($where," tientrinh_id DESC",true," Limit 1");
        return $rows;
    }
}
?>