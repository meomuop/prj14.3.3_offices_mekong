<?php
/*-------------------------------------------
- PHP Smarty Template Engine
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/

class hdmuaTonkho_class extends dbBasic {
    var  $tonkho_id;
    var  $hoadon_id;
    var  $hoadon_sohd;
    var  $dvtinh_id;
    var  $dvtinh_name;
    var  $hanghoa_id;
    var  $hanghoa_name;
    var  $tonkho_soluong;
    var  $tonkho_nguoinhap;
    var  $tonkho_date;

    var $pfields = array (
        'tonkho_id',
        'hoadon_id',
        'hoadon_sohd',
        'dvtinh_id',
        'dvtinh_name',
        'hanghoa_id',
        'hanghoa_name',
        'tonkho_soluong',
        'tonkho_nguoinhap',
        'tonkho_date'); //table private fields

    var $pkeys = array ('tonkho_id'); //key fields

    function hdmuaTonkho_class(){
        $this->dbBasic();
        $this->tablename = "tbl_hd_hdmua_tonkho";
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
        $sql = " SELECT tonkho_sohd FROM $this->tablename where tonkho_id=".$id;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
        return $result->fields[0];
    }

    function getTonkhoExport($nhaptontu,$nhaptonden){
        global $dbconn;
        // ---- Get sql query
        $selectfields = array (
            'tonkho_id',
            'hanghoa_name',
            'dvtinh_name',
            'tonkho_tong_soluong');
        // --- Condition
        $where = " 1 = 1";
        if ($nhaptontu) $where .= " AND tonkho_date >= '".$nhaptontu."'";
        if ($nhaptonden) $where .= " AND tonkho_date <= '".$nhaptonden."'";

        $sql = " SELECT tonkho_id, hanghoa_name, dvtinh_name, SUM(tonkho_soluong) AS tonkho_tong_soluong FROM $this->tablename WHERE ".$where." GROUP BY hanghoa_id";
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
        $sql = " SELECT count(tonkho_id) FROM $this->tablename ".$where;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
        return $result->fields[0];
    }

    // --- get top 1 news
    function getTopRows(){
        $where = " 1 = 1 and tonkho_active = 1";
        $rows = $this->getDBList($where," tonkho_id DESC",true," Limit 1");
        return $rows;
    }
}
?>