<?php
/*-------------------------------------------
- PHP Smarty Template Engine
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/

class hdbanLkvb_class extends dbBasic {
    var  $lkvb_id;
    var  $hdban_id;
    var  $hdban_sohd;
    var  $vanban_id;
    var  $vanban_skh;
    var  $vanban_trichyeu;
    var  $vanban_file;
    var  $lkvb_type;
    var  $user_id;
    var  $lkvb_date;
    var  $lkvb_active;

    var $pfields = array (
        'lkvb_id',
        'hdban_id',
        'hdban_sohd',
        'vanban_skh',
        'vanban_trichyeu',
        'vanban_file',
        'lkvb_type',
        'user_id',
        'lkvb_date',
        'lkvb_active'); //table private fields

    var $pkeys = array ('lkvb_id'); //key fields

    function hdbanLkvb_class(){
        $this->dbBasic();
        $this->tablename = "tbl_hd_hdban_lkvb";
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
        $sql = " SELECT lkvb_sohd FROM $this->tablename where lkvb_id=".$id;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
        return $result->fields[0];
    }

    // --- get number of rows
    function getNumresult($where = ""){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT count(lkvb_id) FROM $this->tablename ".$where;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
        return $result->fields[0];
    }

    // --- get top 1 news
    function getTopRows(){
        $where = " 1 = 1 and lkvb_active = 1";
        $rows = $this->getDBList($where," lkvb_id DESC",true," Limit 1");
        return $rows;
    }
}
?>