<title>S-OFFICES</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
{literal}
<style type="text/css">
.error { color:#FF0000;font-weight:bold; margin-left:5px; height:20px; line-height:20px}
.msg{ color:#00F; font-weight:bold; margin-left:5px; height:20px; line-height:20px}
.tbl_tit_view{
float:left; line-height:20px; border-right:1px solid #99bbe8; 	
}
.text_all{
	font-size:12px; line-height:20px; text-align:left; padding:0 5px 0 5px
}
.tbl_cont_view{
float:left; line-height:20px; border-right:1px solid #99bbe8; border-bottom:1px solid #99bbe8; background:#F2FFEC
}
.tbl_cont_view2{
float:left; line-height:20px; border-right:1px solid #99bbe8; border-bottom:1px solid #99bbe8; background:#FFF
}
</style>
{/literal}
<div id="phanloai_content_insign">

    <div style="float:left; width:650px; line-height: 22px">
        <div style="float:left; width:650px">
            <div style="float:left; width:325px; text-align: center">
                <font color=#000000 style="font-size:14px; font-weight:bold; text-transform: uppercase">
                    {$obj_owner[0]->owner_name}<br>
                    <u>{$access_department_name}</u>
                </font><br>Số đến: {$vars.doc_num}

            </div>
            <div style="float:left; width:325px; text-align: center">
                <font color=#000000 style="font-size:14px; font-weight:bold; text-transform: uppercase">
                    CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM<br>
                    <u>Độc lập - Tự do - Hạnh phúc</u>
                </font><br>Hà Nội, {$smarty.now|date_format:"ngày %d tháng %m năm %Y"}
            </div>
        </div>
        <div style="float:left; width:650px; line-height: 50px; text-align: center"><B>PHIẾU XỬ LÝ VĂN BẢN</B></div>
        <div style="float:left; width:650px; font-size:14px; border-bottom: 1px dotted #000">
            <div style="float:left; width:315px; text-align: left">
                <div style="float:left; width:140px; text-align: left; font-style: italic"><b>Đơn vị phát hành VB</b></div>
                <div style="float:left; width:175px; text-align: left">: {$vars.unit_name|str_string_cut:"120":"1"}</div>
                <div style="float:left; width:140px; text-align: left; font-style: italic"><b>Số, ký hiệu VB</b></div>
                <div style="float:left; width:175px; text-align: left">: {$vars.doc_code}</div>
                <div style="float:left; width:140px; text-align: left; font-style: italic"><b>Ngày</b></div>
                <div style="float:left; width:175px; text-align: left">: {$vars.doc_signed|date_format:"%d/%m/%Y"}</div>
                <div style="float:left; width:140px; text-align: left; font-style: italic"><b>Trích yếu nội dung VB</b></div>
                <div style="float:left; width:175px; text-align: left">: {$vars.doc_desc}</div>
                <div style="float:left; width:310px; text-align: left"><em><b>Đề xuất xử lý của Bộ phận tiếp nhận:</b></em> {$vars.doc_note}</div>
            </div>

            <div style="float:left; width:315px; text-align: left; margin-left: 20px">
                <b>2. Ý kiến xử lý của Trưởng Phòng {$access_department_name}:</b><br>
                {$obj_list_reply[0]->docReply_desc}
            </div>
        </div>
        <div style="float:left; width:650px; font-size:14px; border-bottom: 1px dotted #000">
            <div style="float:left; width:315px; text-align: left">
                <div style="float:left; width:315px; text-align: center"><b>Ý KIẾN CHỈ ĐẠO</b></div>
                <div style="float:left; width:315px; text-align: left">
                    <b>Chuyên viên chính:</b> {section name=di loop=$obj_list_reply_user}
                        {if $obj_list_reply_user[di]->user_id eq $obj_list_reply[0]->process_per}{$obj_list_reply_user[di]->user_fullname|str_string_cut:"25":"1"}{/if}
                    {/section}
                </div>
                <div style="float:left; width:315px; text-align: left">
                    <b>Chuyên viên phối hợp:</b><br>
                    {php}
                        $sql = "select user_fullname from tbl_users where user_id in(select user_id from tbl_cvph where doc_id = ".$this->_tpl_vars[vars][doc_id].")";
                        $result = mysql_query($sql) or die($sql);
                        if($result){
                            while($row = mysql_fetch_array($result)){
                                echo '- '.$row['user_fullname'].'<br>';
                            }
                        }
                    {/php}
                </div>
            </div>

            <div style="float:left; width:315px; text-align: left; margin-left: 20px">
                <em>Ngày chuyển VB cho Chuyên viên để thực hiện theo ý kiến chỉ đạo: {$obj_list_reply[0]->docReply_date|date_format:"%d/%m/%Y"}
                </em><br>
                <b>3. Ý kiến xử lý của CV giao thực hiện :</b><br>
                <div style="float:left; width:315px; text-align: left; border-bottom: 1px dotted #000">&nbsp;</div>
                <div style="float:left; width:315px; text-align: left; border-bottom: 1px dotted #000">&nbsp;</div>
                <div style="float:left; width:315px; text-align: left; border-bottom: 1px dotted #000">&nbsp;</div>
                <div style="float:left; width:315px; text-align: left; border-bottom: 1px dotted #000">&nbsp;</div>
                <div style="float:left; width:315px; text-align: left; border-bottom: 1px dotted #000">&nbsp;</div>
                <div style="float:left; width:315px; text-align: left">&nbsp;</div>
            </div>
        </div>
    </div>
    <div style="float:left; width:650px; line-height: 16px">&nbsp;</div>
    <div style="float:left; width:650px; line-height: 22px">
        <div style="float:left; width:650px">
            <div style="float:left; width:325px; text-align: center">
                <font color=#000000 style="font-size:14px; font-weight:bold; text-transform: uppercase">
                    {$obj_owner[0]->owner_name}<br>
                    <u>{$access_department_name}</u>
                </font><br>Số đến: {$vars.doc_num}

            </div>
            <div style="float:left; width:325px; text-align: center">
                <font color=#000000 style="font-size:14px; font-weight:bold; text-transform: uppercase">
                    CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM<br>
                    <u>Độc lập - Tự do - Hạnh phúc</u>
                </font><br>Hà Nội, {$smarty.now|date_format:"ngày %d tháng %m năm %Y"}
            </div>
        </div>
        <div style="float:left; width:650px; line-height: 50px; text-align: center"><B>PHIẾU XỬ LÝ VĂN BẢN</B></div>
        <div style="float:left; width:650px; font-size:14px; border-bottom: 1px dotted #000">
            <div style="float:left; width:315px; text-align: left">
                <div style="float:left; width:140px; text-align: left; font-style: italic"><b>Đơn vị phát hành VB</b></div>
                <div style="float:left; width:175px; text-align: left">: {$vars.unit_name|str_string_cut:"120":"1"}</div>
                <div style="float:left; width:140px; text-align: left; font-style: italic"><b>Số, ký hiệu VB</b></div>
                <div style="float:left; width:175px; text-align: left">: {$vars.doc_code}</div>
                <div style="float:left; width:140px; text-align: left; font-style: italic"><b>Ngày</b></div>
                <div style="float:left; width:175px; text-align: left">: {$vars.doc_signed|date_format:"%d/%m/%Y"}</div>
                <div style="float:left; width:140px; text-align: left; font-style: italic"><b>Trích yếu nội dung VB</b></div>
                <div style="float:left; width:175px; text-align: left">: {$vars.doc_desc}</div>
                <div style="float:left; width:310px; text-align: left"><em><b>Đề xuất xử lý của Bộ phận tiếp nhận:</b></em> {$vars.doc_note}</div>
            </div>

            <div style="float:left; width:315px; text-align: left; margin-left: 20px">
                <b>2. Ý kiến xử lý của Trưởng Phòng {$access_department_name}:</b><br>
                {$obj_list_reply[0]->docReply_desc}
            </div>
        </div>
        <div style="float:left; width:650px; font-size:14px; border-bottom: 1px dotted #000">
            <div style="float:left; width:315px; text-align: left">
                <div style="float:left; width:315px; text-align: center"><b>Ý KIẾN CHỈ ĐẠO</b></div>
                <div style="float:left; width:315px; text-align: left">
                    <b>Chuyên viên chính:</b> {section name=di loop=$obj_list_reply_user}
                        {if $obj_list_reply_user[di]->user_id eq $obj_list_reply[0]->process_per}{$obj_list_reply_user[di]->user_fullname|str_string_cut:"25":"1"}{/if}
                    {/section}
                </div>
                <div style="float:left; width:315px; text-align: left">
                    <b>Chuyên viên phối hợp:</b><br>
                    {php}
                        $sql = "select user_fullname from tbl_users where user_id in(select user_id from tbl_cvph where doc_id = ".$this->_tpl_vars[vars][doc_id].")";
                        $result = mysql_query($sql) or die($sql);
                        if($result){
                        while($row = mysql_fetch_array($result)){
                        echo '- '.$row['user_fullname'].'<br>';
                        }
                        }
                    {/php}
                </div>
            </div>

            <div style="float:left; width:315px; text-align: left; margin-left: 20px">
                <em>Ngày chuyển VB cho Chuyên viên để thực hiện theo ý kiến chỉ đạo: {$obj_list_reply[0]->docReply_date|date_format:"%d/%m/%Y"}
                </em><br>
                <b>3. Ý kiến xử lý của CV giao thực hiện :</b><br>
                <div style="float:left; width:315px; text-align: left; border-bottom: 1px dotted #000">&nbsp;</div>
                <div style="float:left; width:315px; text-align: left; border-bottom: 1px dotted #000">&nbsp;</div>
                <div style="float:left; width:315px; text-align: left; border-bottom: 1px dotted #000">&nbsp;</div>
                <div style="float:left; width:315px; text-align: left; border-bottom: 1px dotted #000">&nbsp;</div>
                <div style="float:left; width:315px; text-align: left; border-bottom: 1px dotted #000">&nbsp;</div>
                <div style="float:left; width:315px; text-align: left">&nbsp;</div>
            </div>
        </div>
    </div>
</div>
