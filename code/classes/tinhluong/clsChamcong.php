<?php
/*-------------------------------------------
- PHP Frame work Informa
- Created by Le Anh Van - anhvan3103@gmail.com
--------------------------------------------*/

class cc_class extends dbBasic {
  	var  $cc_id;
	var  $user_id;
	var  $user_fullname;
	var  $user_name;
	var  $cc_thang;
	var  $cc_nam;
	var  $cc_luong;
	var  $cc_phucap;
	var  $cc_luongngay;
	var  $cc_luongthang;
	var  $cc_songaycong;
	var  $cc_songaydilam;
	var  $cc_1,$cc_2,$cc_3,$cc_4,$cc_5,$cc_6,$cc_7,$cc_8,$cc_9,$cc_10;
    var  $cc_11,$cc_12,$cc_13,$cc_14,$cc_15,$cc_16,$cc_17,$cc_18,$cc_19,$cc_20;
    var  $cc_21,$cc_22,$cc_23,$cc_24,$cc_25,$cc_26,$cc_27,$cc_28,$cc_29,$cc_30,$cc_31;
 	
	var $pfields = array (	'cc_id',
							'user_id',
							'user_fullname',
							'user_name',
							'cc_thang',
							'cc_nam',
							'cc_luong',
							'cc_phucap',
							'cc_luongngay',
							'cc_luongthang',
							'cc_songaycong',
							'cc_songaydilam',
							'cc_1','cc_2','cc_3','cc_4','cc_5','cc_6','cc_7','cc_8','cc_9','cc_10',
                            'cc_11','cc_12','cc_13','cc_14','cc_15','cc_16','cc_17','cc_18','cc_19','cc_20',
                            'cc_21','cc_22','cc_23','cc_24','cc_25','cc_26','cc_27','cc_28','cc_29','cc_30',
                            'cc_31'
    ); //table private fields
							
  	var $pkeys = array ('cc_id'); //key fields
  
 	function cc_class(){ 
    	$this->dbBasic();  
    	$this->tablename = "tbl_luong_chamcong";
  	}
	
  	function readform(){
  		dbBasic::readform();
  	}  	
	
	function writeform(){
		dbBasic::writeForm();
  	}

  	function getBangluongByNamThang($userId, $nam, $thang){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT cc_id FROM $this->tablename WHERE user_id = ".$userId." and cc_nam = ".$nam." and cc_thang = ".$thang;
        //echo $sql.'<br>';
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
        return $result->fields[0];
    }
	

  	function insertChamcong($userId,$user_fullname,$user_name, $arrNgaycong, $thang, $nam, $luong, $phucap){
        if(count($arrNgaycong) > 0){
            global $dbconn;
            $isBangluong = $this->getBangluongByNamThang($userId,$nam,$thang);
            //echo $isBangluong."<br>";
            if(!$isBangluong || $isBangluong < 1){
                $totalInsert = 0;
                $sql = "INSERT INTO $this->tablename ";
                $sql .= "(user_id,user_fullname,user_name,cc_thang,cc_nam,cc_luong,cc_phucap,cc_luongngay,cc_luongthang,cc_songaycong,cc_songaydilam,cc_1,cc_2,cc_3,cc_4,cc_5,cc_6,cc_7,cc_8,cc_9,cc_10,cc_11,cc_12,cc_13,cc_14,cc_15,cc_16,cc_17,cc_18,cc_19,cc_20,cc_21,cc_22,cc_23,cc_24,cc_25,cc_26,cc_27,cc_28,cc_29,cc_30,cc_31) VALUES(";
                $sql .= $userId.",";
                $sql .= "'".$user_fullname."',";
                $sql .= "'".$user_name."',";
                $sql .= $thang.",";
                $sql .= $nam.",";
                $sql .= $luong.",";
                $sql .= $phucap.",";

                $songaycong = 0;
                $songaydilam = 0;
                $sql_ngay = "";

                for($i = 1; $i <= count($arrNgaycong); $i++){
                    // tinh luong ngay
                    if($arrNgaycong[$i] != 5){
                        $songaycong += 1;
                    }

                    // tinh luong thang
                    if($arrNgaycong[$i] == 1){
                        $songaydilam += 1;
                    }elseif ($arrNgaycong[$i] == 2){
                        $songaydilam += 0.5;
                    }elseif ($arrNgaycong[$i] == 3){
                        $songaydilam += 1;
                    }

                    //----------------------------
                    $sql_ngay .= $arrNgaycong[$i];
                    if($i < count($arrNgaycong)){
                        $sql_ngay .= ",";
                    }
                }

                $luongngay = $luong / $songaycong;
                $luongthang = $luongngay * $songaydilam;

                $sql .= $luongngay.",";
                $sql .= $luongthang.",";
                $sql .= $songaycong.",";
                $sql .= $songaydilam.",";
                $sql .= $sql_ngay;
                $sql .= ")";
                //echo $sql.'<br>';
                if($dbconn->Execute($sql)){
                    $totalInsert ++;
                }
                return $totalInsert;
            }else{
                $totalInsert = 0;
                $sql = "UPDATE $this->tablename SET ";
                $sql .= "user_fullname = '".$user_fullname."',";
                $sql .= "user_name = '".$user_name."',";
                $sql .= "cc_luong = ".$luong.",";
                $sql .= "cc_phucap = ".$phucap.",";

                $songaycong = 0;
                $songaydilam = 0;
                $sql_ngay = "";

                for($i = 1; $i <= count($arrNgaycong); $i++){
                    // tinh luong ngay
                    if($arrNgaycong[$i] != 5){
                        $songaycong += 1;
                    }

                    // tinh luong thang
                    if($arrNgaycong[$i] == 1){
                        $songaydilam += 1;
                    }elseif ($arrNgaycong[$i] == 2){
                        $songaydilam += 0.5;
                    }elseif ($arrNgaycong[$i] == 3){
                        $songaydilam += 1;
                    }

                    //----------------------------
                    $sql_ngay .= "cc_".$i." = ".$arrNgaycong[$i];
                    if($i < count($arrNgaycong)){
                        $sql_ngay .= ",";
                    }
                }

                $luongngay = $luong / $songaycong;
                $luongthang = $luongngay * $songaydilam;

                $sql .= "cc_luongngay = ".$luongngay.",";
                $sql .= "cc_luongthang = ".$luongthang.",";
                $sql .= "cc_songaycong = ".$songaycong.",";
                $sql .= "cc_songaydilam = ".$songaydilam.",";
                $sql .= $sql_ngay;
                $sql .= " WHERE cc_id = ".$isBangluong;
                //echo $sql.'<br>';
                if($dbconn->Execute($sql)){
                    $totalInsert ++;
                }
                return $totalInsert;
            }
        }
        return 0;
    }

	// --- get number of rows
    function getNumresult($where = ""){
        global $dbconn;
        // ---- Get sql query
        $sql = " SELECT count(cc_id) FROM $this->tablename ".$where;
        // ---- Execute SQL
        $result = $dbconn->Execute($sql);
		return $result->fields[0];
    }	
		
	// --- get top 1 news
	function getTopRows(){
		$where = " 1 = 1";
    	$rows = $this->getDBList($where," cc_id DESC",true," Limit 1");
    	return $rows;
    }
}
?>