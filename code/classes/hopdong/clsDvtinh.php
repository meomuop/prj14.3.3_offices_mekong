<?php
/*-------------------------------------------
- PHP Frame work Informa
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/

class dvtinh_class extends dbBasic {
    var  $dvtinh_id;
    var  $dvtinh_name;
    var  $dvtinh_date;
    var  $dvtinh_sort;
    var  $dvtinh_active;

    var $pfields = array (
        'dvtinh_id',
        'dvtinh_name',
        'dvtinh_date',
        'dvtinh_sort',
        'dvtinh_active'); //table private fields

    var $pkeys = array ('dvtinh_id'); //key fields

    function dvtinh_class(){
        $this->dbBasic();
        $this->tablename = "tbl_hd_dvtinh";
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
        $sql = " SELECT dvtinh_name FROM $this->tablename where dvtinh_id=".$id;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
        return $result->fields[0];
    }

    // --- sort item by array
    function sortItem($sort,$id){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set dvtinh_sort=".$sort." where dvtinh_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }

    function update_uutien($id){
        global $dbconn;
        // ---- Get sql query
        $sql = " UPDATE $this->tablename set dvtinh_priority = 1 where dvtinh_id=".$id;
        // ---- Execute SQL
        $dbconn->Execute($sql);
    }

    // --- get number of rows
    function getNumresult($where = ""){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT count(dvtinh_id) FROM $this->tablename ".$where;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
        return $result->fields[0];
    }

    // --- get top 1 news
    function getTopRows(){
        $where = " 1 = 1 and dvtinh_active = 1";
        $rows = $this->getDBList($where," dvtinh_id DESC",true," Limit 1");
        return $rows;
    }
}
?>