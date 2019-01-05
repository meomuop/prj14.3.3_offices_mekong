<?php
/*-------------------------------------------
- PHP Smarty Template Engine
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/

class dvtiente_class extends dbBasic {
    var  $dvtiente_id;
    var  $dvtiente_name;
    var  $dvtiente_name_e;
    var  $dvtiente_unit;
    var  $dvtiente_date;
    var  $dvtiente_sort;
    var  $dvtiente_active;

    var $pfields = array (
        'dvtiente_id',
        'dvtiente_name',
        'dvtiente_name_e',
        'dvtiente_unit',
        'dvtiente_date',
        'dvtiente_sort',
        'dvtiente_active'); //table private fields

    var $pkeys = array ('dvtiente_id'); //key fields

    function dvtiente_class(){
        $this->dbBasic();
        $this->tablename = "tbl_hd_dvtiente";
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
        $sql = " SELECT dvtiente_name FROM $this->tablename where dvtiente_id=".$id;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
        return $result->fields[0];
    }

    // --- sort item by array
    function sortItem($sort,$id){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set dvtiente_sort=".$sort." where dvtiente_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }

    function update_uutien($id){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set dvtiente_priority = 1 where dvtiente_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }

    // --- get number of rows
    function getNumresult($where = ""){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT count(dvtiente_id) FROM $this->tablename ".$where;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
        return $result->fields[0];
    }

    // --- get top 1 news
    function getTopRows(){
        $where = " 1 = 1 and dvtiente_active = 1";
        $rows = $this->getDBList($where," dvtiente_id DESC",true," Limit 1");
        return $rows;
    }
}
?>