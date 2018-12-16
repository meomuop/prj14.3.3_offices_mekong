<?php
/*
 * Created on Mar 28, 2007
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
ini_set('display_errors',0);
session_start();
require_once("../includes/ad_requires.php");

$user_id = $_SESSION["user_id"];
$user_level = $_SESSION["user_level"];
$main_department = $_SESSION['access_unit_id'];

if($user_level == 1){ // admin
    // van ban
    //$sql = "select * from tbl_docreplys where ";
    // cong viec
    $sql_cv = "select count(process_user) as count_cv from tbl_cv_indexs where process_user = '".$user_id."' and cv_index_id in(select cv_index_id from tbl_cv_logs where cv_log_active = 0) limit 1";
    $result_cv = mysql_query($sql_cv) or die('Problem loading data...');
    if(mysql_num_rows($result_cv) > 0){
        $row_cv = mysql_fetch_array($result_cv);
    }
    // truyen nhan
    $sql_tnvb = "select count(user_id) as count_vb from tbl_recusers where user_id = '".$user_id."' and read_status = 0 limit 1";
    $result_tnvb = mysql_query($sql_tnvb) or die('Problem loading data...');
    if(mysql_num_rows($result_tnvb) > 0){
        $row_tnvb = mysql_fetch_array($result_tnvb);
    }
    // tin nhan
    $sql_tn = "select count(user_id) as count_msg from tbl_msgusers where user_id = '".$user_id."' and msgUser_active = 0 limit 1";
    $result_tn = mysql_query($sql_tn) or die('Problem loading data...');
    if(mysql_num_rows($result_tn) > 0){
        $row_tn = mysql_fetch_array($result_tn);
    }
    // lich bieu
    $sql_lb = "select count(user_id) as count_lb from tbl_plan_details where user_id = ".$user_id." and plan_start like '".date('Y-m-d')."%' limit 1";
    $result_lb = mysql_query($sql_lb) or die('Problem loading data...');
    if(mysql_num_rows($result_lb) > 0){
        $row_lb = mysql_fetch_array($result_lb);
    }
}elseif($user_level == 2){ // van thu
    // van ban
    //$sql = "select * from tbl_docreplys where ";
    // cong viec
    $sql_cv = "select count(process_user) as count_cv from tbl_cv_indexs where process_user = '".$user_id."' and cv_index_id in(select cv_index_id from tbl_cv_logs where cv_log_active = 0) limit 1";
    $result_cv = mysql_query($sql_cv) or die('Problem loading data...');
    if(mysql_num_rows($result_cv) > 0){
        $row_cv = mysql_fetch_array($result_cv);
    }
    // truyen nhan
    $sql_tnvb = "select count(user_id) as count_vb from tbl_recusers where user_id = '".$user_id."' and read_status = 0 limit 1";
    $result_tnvb = mysql_query($sql_tnvb) or die('Problem loading data...');
    if(mysql_num_rows($result_tnvb) > 0){
        $row_tnvb = mysql_fetch_array($result_tnvb);
    }
    // tin nhan
    $sql_tn = "select count(user_id) as count_msg from tbl_msgusers where user_id = '".$user_id."' and msgUser_active = 0 limit 1";
    $result_tn = mysql_query($sql_tn) or die('Problem loading data...');
    if(mysql_num_rows($result_tn) > 0){
        $row_tn = mysql_fetch_array($result_tn);
    }
    // lich bieu
    $sql_lb = "select count(user_id) as count_lb from tbl_plan_details where user_id = ".$user_id." and plan_start like '".date('Y-m-d')."%' limit 1";
    $result_lb = mysql_query($sql_lb) or die('Problem loading data...');
    if(mysql_num_rows($result_lb) > 0){
        $row_lb = mysql_fetch_array($result_lb);
    }
}elseif($user_level == 3){ // tro ly
    // van ban
    $sql = "select * from tbl_docs where doc_traned = 2 limit 1";
    $result = mysql_query($sql) or die('Problem loading data...');
    if(mysql_num_rows($result) > 0){
        $row = mysql_fetch_array($result);
    }
    // cong viec
    $sql_cv = "select count(process_user) as count_cv from tbl_cv_indexs where process_user = '".$user_id."' and cv_index_id in(select cv_index_id from tbl_cv_logs where cv_log_active = 0) limit 1";
    $result_cv = mysql_query($sql_cv) or die('Problem loading data...');
    if(mysql_num_rows($result_cv) > 0){
        $row_cv = mysql_fetch_array($result_cv);
    }
    // truyen nhan
    $sql_tnvb = "select count(user_id) as count_vb from tbl_recusers where user_id = '".$user_id."' and read_status = 0 limit 1";
    $result_tnvb = mysql_query($sql_tnvb) or die('Problem loading data...');
    if(mysql_num_rows($result_tnvb) > 0){
        $row_tnvb = mysql_fetch_array($result_tnvb);
    }
    // tin nhan
    $sql_tn = "select count(user_id) as count_msg from tbl_msgusers where user_id = '".$user_id."' and msgUser_active = 0 limit 1";
    $result_tn = mysql_query($sql_tn) or die('Problem loading data...');
    if(mysql_num_rows($result_tn) > 0){
        $row_tn = mysql_fetch_array($result_tn);
    }
    // lich bieu
    $sql_lb = "select count(user_id) as count_lb from tbl_plan_details where user_id = ".$user_id." and plan_start like '".date('Y-m-d')."%' limit 1";
    $result_lb = mysql_query($sql_lb) or die('Problem loading data...');
    if(mysql_num_rows($result_lb) > 0){
        $row_lb = mysql_fetch_array($result_lb);
    }

}elseif($user_level == 4){ // giam doc
    // van ban
    $sql = "select * from tbl_docs where doc_traned = 1 and doc_id not in (select doc_id from tbl_docreplys) limit 1";
    $result = mysql_query($sql) or die('Problem loading data...');
    if(mysql_num_rows($result) > 0){
        $row = mysql_fetch_array($result);
    }
    // cong viec
    $sql_cv = "select count(process_user) as count_cv from tbl_cv_indexs where process_user = '".$user_id."' and cv_index_id in(select cv_index_id from tbl_cv_logs where cv_log_active = 0) limit 1";
    $result_cv = mysql_query($sql_cv) or die('Problem loading data...');
    if(mysql_num_rows($result_cv) > 0){
        $row_cv = mysql_fetch_array($result_cv);
    }
    // truyen nhan
    $sql_tnvb = "select count(user_id) as count_vb from tbl_recusers where user_id = '".$user_id."' and read_status = 0 limit 1";
    $result_tnvb = mysql_query($sql_tnvb) or die('Problem loading data...');
    if(mysql_num_rows($result_tnvb) > 0){
        $row_tnvb = mysql_fetch_array($result_tnvb);
    }
    // tin nhan
    $sql_tn = "select count(user_id) as count_msg from tbl_msgusers where user_id = '".$user_id."' and msgUser_active = 0 limit 1";
    $result_tn = mysql_query($sql_tn) or die('Problem loading data...');
    if(mysql_num_rows($result_tn) > 0){
        $row_tn = mysql_fetch_array($result_tn);
    }
    // lich bieu
    $sql_lb = "select count(user_id) as count_lb from tbl_plan_details where user_id = ".$user_id." and plan_start like '".date('Y-m-d')."%' limit 1";
    $result_lb = mysql_query($sql_lb) or die('Problem loading data...');
    if(mysql_num_rows($result_lb) > 0){
        $row_lb = mysql_fetch_array($result_lb);
    }

}elseif($user_level == 5){ // pho giam doc
    // van ban
    $sql = "select * from doc_docreplys where recevie_per = ".$user_id." and docReply_active = 0 limit 1";
    $result = mysql_query($sql) or die('Problem loading data...');
    if(mysql_num_rows($result) > 0){
        $row = mysql_fetch_array($result);
    }
    /// cong viec
    $sql_cv = "select count(process_user) as count_cv from tbl_cv_indexs where process_user = '".$user_id."' and cv_index_id in(select cv_index_id from tbl_cv_logs where cv_log_active = 0) limit 1";
    $result_cv = mysql_query($sql_cv) or die('Problem loading data...');
    if(mysql_num_rows($result_cv) > 0){
        $row_cv = mysql_fetch_array($result_cv);
    }
    // truyen nhan
    $sql_tnvb = "select count(user_id) as count_vb from tbl_recusers where user_id = '".$user_id."' and read_status = 0 limit 1";
    $result_tnvb = mysql_query($sql_tnvb) or die('Problem loading data...');
    if(mysql_num_rows($result_tnvb) > 0){
        $row_tnvb = mysql_fetch_array($result_tnvb);
    }
    // tin nhan
    $sql_tn = "select count(user_id) as count_msg from tbl_msgusers where user_id = '".$user_id."' and msgUser_active = 0 limit 1";
    $result_tn = mysql_query($sql_tn) or die('Problem loading data...');
    if(mysql_num_rows($result_tn) > 0){
        $row_tn = mysql_fetch_array($result_tn);
    }
    // lich bieu
    $sql_lb = "select count(user_id) as count_lb from tbl_plan_details where user_id = ".$user_id." and plan_start like '".date('Y-m-d')."%' limit 1";
    $result_lb = mysql_query($sql_lb) or die('Problem loading data...');
    if(mysql_num_rows($result_lb) > 0){
        $row_lb = mysql_fetch_array($result_lb);
    }

}elseif($user_level == 6){ // truong phong
    // van ban
    $sql = "select * from doc_docreplys where DR_main_department = ".$main_department." and docReply_traned = 0 limit 1";
    $result = mysql_query($sql) or die('Problem loading data...');
    if(mysql_num_rows($result) > 0){
        $row = mysql_fetch_array($result);
    }
    // cong viec
    $sql_cv = "select count(process_user) as count_cv from tbl_cv_indexs where process_user = '".$user_id."' and cv_index_id in(select cv_index_id from tbl_cv_logs where cv_log_active = 0) limit 1";
    $result_cv = mysql_query($sql_cv) or die('Problem loading data...');
    if(mysql_num_rows($result_cv) > 0){
        $row_cv = mysql_fetch_array($result_cv);
    }
    // truyen nhan
    $sql_tnvb = "select count(user_id) as count_vb from tbl_recusers where user_id = '".$user_id."' and read_status = 0 limit 1";
    $result_tnvb = mysql_query($sql_tnvb) or die('Problem loading data...');
    if(mysql_num_rows($result_tnvb) > 0){
        $row_tnvb = mysql_fetch_array($result_tnvb);
    }
    // tin nhan
    $sql_tn = "select count(user_id) as count_msg from tbl_msgusers where user_id = '".$user_id."' and msgUser_active = 0 limit 1";
    $result_tn = mysql_query($sql_tn) or die('Problem loading data...');
    if(mysql_num_rows($result_tn) > 0){
        $row_tn = mysql_fetch_array($result_tn);
    }
    // lich bieu
    $sql_lb = "select count(user_id) as count_lb from tbl_plan_details where user_id = ".$user_id." and plan_start like '".date('Y-m-d')."%' limit 1";
    $result_lb = mysql_query($sql_lb) or die('Problem loading data...');
    if(mysql_num_rows($result_lb) > 0){
        $row_lb = mysql_fetch_array($result_lb);
    }

}elseif($user_level == 7){ // pho truong phong
    // van ban
    //$sql = "select * from doc_docreplys where ";
    // cong viec
    $sql_cv = "select count(process_user) as count_cv from tbl_cv_indexs where process_user = '".$user_id."' and cv_index_id in(select cv_index_id from tbl_cv_logs where cv_log_active = 0) limit 1";
    $result_cv = mysql_query($sql_cv) or die('Problem loading data...');
    if(mysql_num_rows($result_cv) > 0){
        $row_cv = mysql_fetch_array($result_cv);
    }
    // truyen nhan
    $sql_tnvb = "select count(user_id) as count_vb from tbl_recusers where user_id = '".$user_id."' and read_status = 0 limit 1";
    $result_tnvb = mysql_query($sql_tnvb) or die('Problem loading data...');
    if(mysql_num_rows($result_tnvb) > 0){
        $row_tnvb = mysql_fetch_array($result_tnvb);
    }
    // tin nhan
    $sql_tn = "select count(user_id) as count_msg from tbl_msgusers where user_id = '".$user_id."' and msgUser_active = 0 limit 1";
    $result_tn = mysql_query($sql_tn) or die('Problem loading data...');
    if(mysql_num_rows($result_tn) > 0){
        $row_tn = mysql_fetch_array($result_tn);
    }
    // lich bieu
    $sql_lb = "select count(user_id) as count_lb from tbl_plan_details where user_id = ".$user_id." and plan_start like '".date('Y-m-d')."%' limit 1";
    $result_lb = mysql_query($sql_lb) or die('Problem loading data...');
    if(mysql_num_rows($result_lb) > 0){
        $row_lb = mysql_fetch_array($result_lb);
    }

}elseif($user_level == 8){ // chuyen vien
    // van ban
    $sql = "select count(doc_id) as count_doc from doc_docreplys where process_per = ".$user_id." limit 1";
    $result = mysql_query($sql) or die('Problem loading data...');
    if(mysql_num_rows($result) > 0){
        $row = mysql_fetch_array($result);
    }
    // cong viec
    $sql_cv = "select count(process_user) as count_cv from tbl_cv_indexs where process_user = '".$user_id."' and cv_index_id in(select cv_index_id from tbl_cv_logs where cv_log_active = 0) limit 1";
    $result_cv = mysql_query($sql_cv) or die('Problem loading data...');
    if(mysql_num_rows($result_cv) > 0){
        $row_cv = mysql_fetch_array($result_cv);
    }
    // truyen nhan
    $sql_tnvb = "select count(user_id) as count_vb from tbl_recusers where user_id = '".$user_id."' and read_status = 0 limit 1";
    $result_tnvb = mysql_query($sql_tnvb) or die('Problem loading data...');
    if(mysql_num_rows($result_tnvb) > 0){
        $row_tnvb = mysql_fetch_array($result_tnvb);
    }
    // tin nhan
    $sql_tn = "select count(user_id) as count_msg from tbl_msgusers where user_id = '".$user_id."' and msgUser_active = 0 limit 1";
    $result_tn = mysql_query($sql_tn) or die('Problem loading data...');
    if(mysql_num_rows($result_tn) > 0){
        $row_tn = mysql_fetch_array($result_tn);
    }
    // lich bieu
    $sql_lb = "select count(user_id) as count_lb from tbl_plan_details where user_id = ".$user_id." and plan_start like '".date('Y-m-d')."%' limit 1";
    $result_lb = mysql_query($sql_lb) or die('Problem loading data...');
    if(mysql_num_rows($result_lb) > 0){
        $row_lb = mysql_fetch_array($result_lb);
    }

}elseif($user_level == 10){ // van thu phong
    // van ban
    $sql = "select * from doc_docreplys where DR_main_department = ".$main_department." and process_per > 0 limit 1";
    $result = mysql_query($sql) or die('Problem loading data...');
    if(mysql_num_rows($result) > 0){
        $row = mysql_fetch_array($result);
    }
    // cong viec
    $sql_cv = "select count(process_user) as count_cv from tbl_cv_indexs where process_user = '".$user_id."' and cv_index_id in(select cv_index_id from tbl_cv_logs where cv_log_active = 0) limit 1";
    $result_cv = mysql_query($sql_cv) or die('Problem loading data...');
    if(mysql_num_rows($result_cv) > 0){
        $row_cv = mysql_fetch_array($result_cv);
    }
    // truyen nhan
    $sql_tnvb = "select count(user_id) as count_vb from tbl_recusers where user_id = '".$user_id."' and read_status = 0 limit 1";
    $result_tnvb = mysql_query($sql_tnvb) or die('Problem loading data...');
    if(mysql_num_rows($result_tnvb) > 0){
        $row_tnvb = mysql_fetch_array($result_tnvb);
    }
    // tin nhan
    $sql_tn = "select count(user_id) as count_msg from tbl_msgusers where user_id = '".$user_id."' and msgUser_active = 0 limit 1";
    $result_tn = mysql_query($sql_tn) or die('Problem loading data...');
    if(mysql_num_rows($result_tn) > 0){
        $row_tn = mysql_fetch_array($result_tn);
    }
    // lich bieu
    $sql_lb = "select count(user_id) as count_lb from tbl_plan_details where user_id = ".$user_id." and plan_start like '".date('Y-m-d')."%' limit 1";
    $result_lb = mysql_query($sql_lb) or die('Problem loading data...');
    if(mysql_num_rows($result_lb) > 0){
        $row_lb = mysql_fetch_array($result_lb);
    }
}
?>
<input type="hidden" name="systray_user_level" id="systray_user_level" value="<?php echo $user_level?>">
<script language="JavaScript">
    $('#dieuhanh').click(
        function(){
            var user_level_txt 	= $('#systray_user_level').val();
            document.getElementById('div_doc').style.display='block';
            document.getElementById('doc_content_main').style.display='block';

            if(user_level_txt==1 || user_level_txt==2 || user_level_txt==9)
                $("#doc_content_main").load("index.php?listDoc&mod=docs");
            else if(user_level_txt==4 || user_level_txt==5)
                $("#doc_content_main").load("index.php?replyDoc&mod=docs");
            else if(user_level_txt==3)
                $("#doc_content_main").load("index.php?tranDoc&mod=docs");
            else if(user_level_txt==6 || user_level_txt==7)
                $("#doc_content_main").load("index.php?processDoc&mod=docs");
            else if(user_level_txt==8)
                $("#doc_content_main").load("index.php?finishDoc&mod=docs");
            else if(user_level_txt==10)
                $("#doc_content_main").load("index.php?finishDocAll&mod=docs");
        }
    );

    $("#truyennhan").click( function () {

        var user_level_tnvb 	= $('#systray_user_level').val();
        document.getElementById('div_transport').style.display='block';
        document.getElementById('transport_content_main').style.display='block';

        if(user_level_tnvb==1 || user_level_tnvb==2)
            $("#transport_content_main").load("index.php?listDocinQLVB&mod=truyennhans");
        else
            $("#transport_content_main").load("index.php?ND_Truyennhan&mod=truyennhans");
    });

    $("#congviec").click( function () {
        document.getElementById('div_cv_cat').style.display='block';
        document.getElementById('cv_cat_content_main').style.display='block';
        $("#cv_cat_content_main").load("index.php?listCvCat&mod=congviecs");
    });

    $("#tinnhan").click( function () {
        document.getElementById('div_msg').style.display='block';
        document.getElementById('msg_content_main').style.display='block';
        $("#msg_content_main").load("index.php?listMsgUser&mod=msgs&inbox=1");
    });

    $("#lichbieu").click( function () {
        document.getElementById('div_plan').style.display='block';
        document.getElementById('plan_content_main').style.display='block';
        $("#plan_content_main").load("index.php?mainPlan&mod=plans");
    });
    //alert($('#systray_user_level').val());
</script>
<?php
    $msg = (int)1;
    // văn ban
    if($row['count_doc'] > 0){
        $msg = '
        <div style="float: left; height: 27px; line-height: 27px; background-color: #f00; padding: 0 7px 0 5px; color: #fff;">
            <div style="float:left;  margin: 2px;  padding: 2px;  width: 20px; height: 20px; border-radius: 8px; background-color: #fff;"><img src="'.$http_root.'images/systray/notificion_icon.png" width="18"></div>
            <div style="float:left; font-size:13px; font-weight:bold">Thông báo</div>
        </div>
        <div style="float: left; margin-left: 5px; padding-right: 5px; height: 27px; line-height: 27px; border-right: 1px solid #F00">
            <div style="float:left;  margin: 2px;  padding: 2px;  width: 20px; height: 20px; border-radius: 8px; background-color: #82cfec;"><img src="'.$http_root.'images/systray/document_icon.png" width="18"></div>
            <div style="float:left; font-size:13px; font-weight:bold">Điều hành: <a href="javascript: void(0)" id="dieuhanh">('.$row['count_doc'].' văn bản)</a></div>
        </div>
        ';
    }
    // truyen nhan
    if($row_tnvb['count_vb'] > 0){
        if($msg == 1){
            $msg = '
            <div style="float: left; height: 27px; line-height: 27px; background-color: #f00; padding: 0 5px 0 5px; color: #fff;">
                <div style="float:left;  margin: 2px;  padding: 2px;  width: 20px; height: 20px; border-radius: 8px; background-color: #fff;"><img src="'.$http_root.'images/systray/notificion_icon.png" width="18"></div>
                <div style="float:left; font-size:13px; font-weight:bold">Thông báo</div>
            </div>
            <div style="float: left; margin-left: 5px; padding-right: 5px; height: 27px; line-height: 27px; border-right: 1px solid #F00">
                <div style="float:left;  margin: 2px;  padding: 2px;  width: 20px; height: 20px; border-radius: 8px; background-color: #82cfec;"><img src="'.$http_root.'images/systray/document_icon.png" width="18"></div>
                <div style="float:left; font-size:13px; font-weight:bold">Truyền nhận: <a href="javascript: void(0)" id="truyennhan">('.$row_tnvb['count_vb'].' văn bản)</a></div>
            </div>
            ';
        }else{
            $msg .= '
            <div style="float: left; margin-left: 5px; padding-right: 5px; height: 27px; line-height: 27px; border-right: 1px solid #F00">
                <div style="float:left;  margin: 2px;  padding: 2px;  width: 20px; height: 20px; border-radius: 8px; background-color: #82cfec;"><img src="'.$http_root.'images/systray/document_icon.png" width="18"></div>
                <div style="float:left; font-size:13px; font-weight:bold">Truyền nhận: <a href="javascript: void(0)" id="truyennhan">('.$row_tnvb['count_vb'].' văn bản)</a></div>
            </div>
            ';
        }
    }
    // lich bieu
    if($row_lb['count_lb'] > 0){
        if($msg == 1){
            $msg = '
            <div style="float: left; height: 27px; line-height: 27px; background-color: #f00; padding: 0 5px 0 5px; color: #fff;">
                <div style="float:left;  margin: 2px;  padding: 2px;  width: 20px; height: 20px; border-radius: 8px; background-color: #fff;"><img src="'.$http_root.'images/systray/notificion_icon.png" width="18"></div>
                <div style="float:left; font-size:13px; font-weight:bold">Thông báo</div>
            </div>
            <div style="float: left; margin-left: 5px; padding-right: 5px; height: 27px; line-height: 27px; border-right: 1px solid #F00">
                <div style="float:left;  margin: 2px;  padding: 2px;  width: 20px; height: 20px; border-radius: 8px; background-color: #82cfec;"><img src="'.$http_root.'images/systray/calender_icon.png" width="18"></div>
                <div style="float:left; font-size:13px; font-weight:bold">Lịch biểu: <a href="javascript: void(0)" id="lichbieu">('.$row_lb['count_lb'].' lịch)</a></div>
            </div>
            ';
        }else{
            $msg .= '
            <div style="float: left; margin-left: 5px; padding-right: 5px; height: 27px; line-height: 27px; border-right: 1px solid #F00">
                <div style="float:left;  margin: 2px;  padding: 2px;  width: 20px; height: 20px; border-radius: 8px; background-color: #82cfec;"><img src="'.$http_root.'images/systray/calender_icon.png" width="18"></div>
                <div style="float:left; font-size:13px; font-weight:bold">Lịch biểu: <a href="javascript: void(0)" id="lichbieu">('.$row_lb['count_lb'].' lịch)</a></div>
            </div>
            ';
        }
    }
    // tin nhan
    if($row_tn['count_msg'] > 0){
        if($msg == 1){
            $msg = '
            <div style="float: left; height: 27px; line-height: 27px; background-color: #f00; padding: 0 5px 0 5px; color: #fff;">
                <div style="float:left;  margin: 2px;  padding: 2px;  width: 20px; height: 20px; border-radius: 8px; background-color: #fff;"><img src="'.$http_root.'images/systray/notificion_icon.png" width="18"></div>
                <div style="float:left; font-size:13px; font-weight:bold">Thông báo</div>
            </div>
            <div style="float: left; margin-left: 5px; padding-right: 5px; height: 27px; line-height: 27px; border-right: 1px solid #F00">
                <div style="float:left;  margin: 2px;  padding: 2px;  width: 20px; height: 20px; border-radius: 8px; background-color: #82cfec;"><img src="'.$http_root.'images/systray/message_icon.png" width="18"></div>
                <div style="float:left; font-size:13px; font-weight:bold">Tin nhắn: <a href="javascript: void(0)" id="tinnhan">('.$row_tn['count_msg'].' tin mới)</a></div>
            </div>';
        }else{
            $msg .= '
            <div style="float: left; margin-left: 5px; padding-right: 5px; height: 27px; line-height: 27px; border-right: 1px solid #F00">
                <div style="float:left;  margin: 2px;  padding: 2px;  width: 20px; height: 20px; border-radius: 8px; background-color: #82cfec;"><img src="'.$http_root.'images/systray/message_icon.png" width="18"></div>
                <div style="float:left; font-size:13px; font-weight:bold">Tin nhắn: <a href="javascript: void(0)" id="tinnhan">('.$row_tn['count_msg'].' tin mới)</a></div>
            </div>
            ';
        }
    }

    // cong viec
    if($row_cv['count_cv'] > 0){
        if($msg == 1){
            $msg = '
                <div style="float: left; height: 27px; line-height: 27px; background-color: #f00; padding: 0 5px 0 5px; color: #fff;">
                    <div style="float:left;  margin: 2px;  padding: 2px;  width: 20px; height: 20px; border-radius: 8px; background-color: #fff;"><img src="'.$http_root.'images/systray/notificion_icon.png" width="18"></div>
                    <div style="float:left; font-size:13px; font-weight:bold">Thông báo</div>
                </div>
                <div style="float: left; margin-left: 5px; padding-right: 5px; height: 27px; line-height: 27px">
                    <div style="float:left;  margin: 2px;  padding: 2px;  width: 20px; height: 20px; border-radius: 8px; background-color: #82cfec;"><img src="'.$http_root.'images/systray/job_icon.png" width="18"></div>
                    <div style="float:left; font-size:13px; font-weight:bold">Công việc: <a href="javascript: void(0)" id="congviec">('.$row_cv['count_cv'].' việc tồn)</a></div>
                </div>';
        }else{
            $msg .= '
                <div style="float: left; margin-left: 5px; padding-right: 5px; height: 27px; line-height: 27px">
                    <div style="float:left;  margin: 2px;  padding: 2px;  width: 20px; height: 20px; border-radius: 8px; background-color: #82cfec;"><img src="'.$http_root.'images/systray/job_icon.png" width="18"></div>
                    <div style="float:left; font-size:13px; font-weight:bold">Công việc: <a href="javascript: void(0)" id="congviec">('.$row_cv['count_cv'].' việc tồn)</a></div>
                </div>
                ';
        }
    }
    echo $msg;
?>