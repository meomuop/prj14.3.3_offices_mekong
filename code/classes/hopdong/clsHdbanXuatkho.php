<?php
/*-------------------------------------------
- PHP Smarty Template Engine
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/

class hdbanXuatkho_class extends dbBasic {
    var  $xuatkho_id;
    var  $hoadon_id;
    var  $hoadon_sohd;
    var  $dvtinh_id;
    var  $dvtinh_name;
    var  $hanghoa_id;
    var  $hanghoa_name;
    var  $xuatkho_soluong;
    var  $xuatkho_nguoinhap;
    var  $xuatkho_date;

    var $pfields = array (
        'xuatkho_id',
        'hoadon_id',
        'hoadon_sohd',
        'dvtinh_id',
        'dvtinh_name',
        'hanghoa_id',
        'hanghoa_name',
        'xuatkho_soluong',
        'xuatkho_nguoinhap',
        'xuatkho_date'); //table private fields

    var $pkeys = array ('xuatkho_id'); //key fields

    function hdbanXuatkho_class(){
        $this->dbBasic();
        $this->tablename = "tbl_hd_hdban_xuatkho";
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
        $sql = " SELECT xuatkho_sohd FROM $this->tablename where xuatkho_id=".$id;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
        return $result->fields[0];
    }

    function getTonkhoExport($nhaptontu,$nhaptonden){
        global $dbconn;
        // ---- Get sql query
        $selectfields = array (
            'xuatkho_id',
            'hanghoa_name',
            'dvtinh_name',
            'xuatkho_tong_soluong');
        // --- Condition
        $where = " 1 = 1";
        if ($nhaptontu) $where .= " AND xuatkho_date >= '".$nhaptontu."'";
        if ($nhaptonden) $where .= " AND xuatkho_date <= '".$nhaptonden."'";

        $sql = " SELECT xuatkho_id, hanghoa_name, dvtinh_name, SUM(xuatkho_soluong) AS xuatkho_tong_soluong FROM $this->tablename WHERE ".$where." GROUP BY hanghoa_id";
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);

        $ret = array();
        if ($result){
            for (; !$result->EOF; $result->MoveNext()){
                $i = 0;
                $temp = $this;
                foreach($selectfields as $id){
                    $fname = "temp->$id";
                    $value = trim($result->fields[$i++]);
                    $value = stripslashes($value);
                    $temp->$id=$value;
                }
                $ret[] = $temp;
                unset($this);
            }
        }

        return $ret;
    }

    // --- get number of rows
    function getNumresult($where = ""){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT count(xuatkho_id) FROM $this->tablename ".$where;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
        return $result->fields[0];
    }

    // --- get top 1 news
    function getTopRows(){
        $where = " 1 = 1 and xuatkho_active = 1";
        $rows = $this->getDBList($where," xuatkho_id DESC",true," Limit 1");
        return $rows;
    }
}
?>