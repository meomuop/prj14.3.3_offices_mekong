{literal}
    <style type="text/css">
        .error { color:#FF0000;font-weight:bold; margin-left:5px; height:20px; line-height:20px}
        .msg{ color:#00F; font-weight:bold; margin-left:5px; height:20px; line-height:20px}
        .tbl_tit{
            float:left; line-height:25px; border-right:1px solid #99bbe8;
        }
        .tbl_cont{
            float:left; line-height:25px; border-right:1px solid #99bbe8; border-bottom:1px solid #99bbe8; background:#F2FFEC
        }
        .tbl_cont2{
            float:left; line-height:25px; border-right:1px solid #99bbe8; border-bottom:1px solid #99bbe8; background:#FFF
        }
    </style>
{/literal}
<div id="cv_cat_content_insign">
    <form method="post" name="frmList_CvCat" action="?listCvCat{$vars.arg}" id="frmList_CvCat">
        <!------------------------------------DAU MUC CONG VIEC---------------------------------------------->
        <div style="float:left">
            <fieldset style="width:250px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:482px">
                <legend class="legend_list" style="width:200px">
                    <div style="width:90px; float:left">Đầu việc: {$total_num_result}</div>
                    <div style="width:90px; float:left">
                        Lọc với: <select name="cv_cat_name_fs" id="cv_cat_name_fs" class="select_tiny" style="width:35px" onchange="loc_dl({$cv_cat_type});">
                            {section name=sli loop=$char_arr}
                                <option value="{$char_arr[sli]}" {if $char_arr[sli] eq $cv_cat_name_fs}selected{/if}>{$char_arr[sli]} </option>
                            {/section}
                        </select>
                    </div>
                    <div style="width:20px; float:left; margin-top:2px; height:14px;">
                        {if $user_level eq 4 or $user_level eq 5}
                            <a href="javascript: void(0)" onclick="javascript: show_add_form()">
                                <img src="{$css_path}icon_add.png" class="img_all" title="Thêm mới"></a>
                        {else}-{/if}
                    </div>
                </legend>
                <div style="float:left; height:5px; width:100%"></div>
                <div style="float:left; height:455px; width:250px; overflow-y:scroll">
                    {section name=pi loop=$obj_list}
                        {math z=$smarty.section.pi.index t=1 equation="z+t" assign=count}
                        <div style="float:left; line-height:30px">
                            <div style="float:left; width:20px; text-align:center">&diams;</div>
                            <div style="float:left; width:212px; white-space:nowrap" title="{$obj_list[pi]->cv_cat_name}">
                                <div style="float:left; width:190px; white-space:nowrap">
                                    <a href="javascript:void(0);" onclick="javascript: show_cv_luong_xl({$obj_list[pi]->cv_cat_id})" style="{if $cv_cat_id eq $obj_list[pi]->cv_cat_id}color:#F00{/if}{if $obj_list[pi]->cv_cat_priority eq 1}; font-weight:bold{/if}" >{$obj_list[pi]->cv_cat_name|str_string_cut:"45":"1"}</a>
                                </div>
                                <div style="float:right; margin:2px; height:18px; width:16px; text-align:center; background-color:#dfe8f6" title="Chức năng mở rộng" id="extra_icon_cv_cat_{$count}">
                                    {if $user_level eq 4 or $user_level eq 5}
                                        <a href='javascript: void(0);' onclick="show_list_cv_cat_options({$count},{$total_num_result})">
                                            <img src="{$css_path}extra_icon.png" width="14" height="14" border="0" class="img_all" style="margin:1px"></a>
                                    {else}&nbsp;-{/if}
                                </div>
                                <div id="extra_cv_cat_{$count}" style="position:absolute; display:none; height:auto; width:60px; margin:2px 131px; border:1px solid #8ea4c1; border-right:1px solid #8ea4c1; background-color:#dfe8f6">
                                    <div style="float:left; width:60px; height:18px; border-right:1px solid #dfe8f6"><b>&nbsp;Thao tác:</b></div>
                                    <div style="float:left; width:60px; height:20px; padding:2px">
                                        - <a href="javascript: void(0)" onclick="javascript: show_edit_form({$obj_list[pi]->cv_cat_id})">Sửa</a>
                                    </div>
                                    <div style="float:left; width:60px; height:20px; padding:2px">
                                        - <a href="javascript: void(0)" onclick="javascript: delete_cv_cat({$obj_list[pi]->cv_cat_id})">Xóa</a>
                                    </div>
                                    <div style="float:left; width:60px; height:20px; padding:2px">
                                        - <a href="javascript: void(0)" onclick="javascript: uutien_cv_cat({$obj_list[pi]->cv_cat_id})">Ưu tiên</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    {/section}
                </div>
            </fieldset>
        </div>
        <!------------------------------------LUONG XU LY-------------------------------------------->
        <div style="float:left">
            <fieldset style="width:525px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:482px">
                <legend class="legend_list" style="width:362px">
                    <div style="width:100px; float:left">Luồng xử lý:</div>
                    <div style="float:left; width:112px; margin-bottom:5px">Lọc theo tình trạng:</div>
                    <div style="float:left; width:150px; margin-bottom:5px">
                        <select name="tinhtrangcv_fil" id="tinhtrangcv_fil" class="select_seek" onchange="javascript: loctinhtrang({$obj_info.cv_cat_id})">
                            <option value="0" {if $tinhtrangcv_fil eq 0}selected="selected" {/if}>- Tất cả</option>
                            <option value="1" {if $tinhtrangcv_fil eq 1}selected="selected" {/if}>- Trong hạn</option>
                            <option value="2" {if $tinhtrangcv_fil eq 2}selected="selected" {/if}>- Quá hạn</option>
                        </select>
                    </div>
                </legend>
                <div style="float:left; height:5px; width:100%"></div>
                <div style="float:left; height:452px; width:520px; padding:2px; overflow-y:scroll">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr><td colspan="3" style="line-height: 25px">&nbsp;<b>{$obj_info.cv_cat_name|str_string_cut:"200":"1"}</b></td></tr>
                        <tr>
                            <td align="left" valign="middle" width="5%" style="width:30px; padding-bottom: 10px">
                                <div style="float:left; width:30px;">
                                    {php}
                                        if($this->_tpl_vars['obj_info']['cv_cat_id'] != ''):
                                        $sql="select count(cv_index_id) as count_idex from tbl_cv_indexs where cv_sub_id in(select cv_sub_id from tbl_cv_subs where cv_cat_id = ".$this->_tpl_vars['obj_info']['cv_cat_id'].")";
                                        $result = mysql_query($sql) or die($sql);
                                        if($result) $row = mysql_fetch_array($result);
                                        $padding_top_cat = ((80*$row['count_idex'])/2);
                                        $padding_bot_cat = ((80*$row['count_idex'])/2)-120;
                                        endif;
                                    {/php}
                                    <div style="float:left; width:30px; padding-top:{php}echo $padding_bot_cat;{/php}px">
                                        <div style="width:30px; float:left; margin-top:2px; margin-left:2px; height:20px;">
                                            {if $user_level eq 4 or $user_level eq 5}
                                                <a href="javascript: void(0)" onclick="javascript: show_add_sub_form({$obj_info.cv_cat_id})">
                                                    <img src="{$css_path}icon_add.png" class="img_all" title="Chỉ đạo thực hiện"></a>
                                            {else}&nbsp;---{/if}
                                        </div>
                                        <div style="width:30px; float:left; margin-top:2px; margin-left:2px; height:20px;">
                                            <a href="javascript: void(0)" onclick="javascript: export_congviec({$obj_info.cv_cat_id},3)">
                                                <img src="../images/admin/print_pre_icon.png" class="img_all" width="16" title="Xem trước khi in"></a>
                                        </div>
                                        <div style="width:30px; float:left; margin-top:2px; margin-left:2px; height:20px;">
                                            <a href="javascript: void(0)" onclick="javascript: show_list_cv_file({$obj_info.cv_cat_id},3)">
                                                <img src="../images/admin/{if $obj_info.cv_cat_file eq 1}folder_icon.png{else}empty_icon.png{/if}" class="img_all" width="16" title="Quản lý tệp tin"></a>
                                        </div>
                                    </div>
                                </div>
                            </td>
                            <td align="left" valign="top" style="padding-bottom: 10px">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    {php}
                                        if($this->_tpl_vars['obj_info']['cv_cat_id'] != ''):
                                        $sql="select cvsub.*,D.department_name from tbl_cv_subs as cvsub join tbl_departments as D on cvsub.department_id = D.department_id where cvsub.cv_cat_id = ".$this->_tpl_vars['obj_info']['cv_cat_id'];
                                        $result = mysql_query($sql) or die($sql);
                                        if($result && mysql_num_rows($result)>0):
                                        $phantram = round(100/mysql_num_rows($result),2);
                                        $i=0;
                                        while($row=mysql_fetch_array($result)):
                                        $sql_index_count="select count(cv_log_id) as count_log_in from tbl_cv_logs where cv_index_id in(select cv_index_id from tbl_cv_indexs where cv_sub_id=".$row['cv_sub_id'].")";
                                        $result_index_count = mysql_query($sql_index_count) or die($sql_index_count);
                                        if($result_index_count):
                                        $row_index_count = mysql_fetch_array($result_index_count);
                                        if($row_index_count['count_log_in']>1):
                                        $height_index = 50*($row_index_count['count_log_in']/2)+5;
                                        $padding_top = 50*($row_index_count['count_log_in']/2) - 25;
                                        else:
                                        $sql_index = "select count(cv_index_id) as count_index from tbl_cv_indexs where cv_sub_id=".$row['cv_sub_id'];
                                        $result_count = mysql_query($sql_index) or die($sql_index);
                                        if($result_count):
                                        $row_count = mysql_fetch_array($result_count);
                                        $height_index = 65*($row_count['count_index']/2)+60;
                                        $padding_top = 65*($row_count['count_index']/2)-20;
                                        endif;
                                        endif;
                                        endif;
                                    {/php}
                                    <tr>
                                        <td align="left" valign="top" width="30%" style="{php}if($i<mysql_num_rows($result)-1):{/php}border-left:1px solid #99bbe8{php}endif;{/php}">
                                            <div style="float:left; height:{php}echo $padding_top.'px';{/php}">&nbsp;</div>
                                            <div style="float:left">
                                                <div style="float:left; width:175px; height:20px; ">
                                                    <div style="float:left; width:18px; border-top:1px solid #99bbe8"></div>
                                                    <div style="float:left; width:155px">
                                                        <div style="float:left; width:130px; height:20px; line-height:20px; white-space:nowrap; border:1px solid #99bbe8; white-space:nowrap; background-color:#FFF" title="{php}echo $row['cv_sub_name'].'&#13;'.$row['cv_sub_desc']{/php}">
                                                            &nbsp;{php}echo fnsSubstr(str_replace(array('Phòng','Ban'),array('P.','B.'),$row['department_name']),32,1){/php}
                                                        </div>
                                                        {php}if($row['department_id']==$this->_tpl_vars['access_unit_id'] && $this->_tpl_vars['user_level'] == 6):{/php}
                                                        <div style="width:20px; float:left; margin-top:2px; height:20px;">
                                                            <a href="javascript: void(0)" onclick="javascript: show_add_index_form({php}echo $row['cv_sub_id']{/php},{php}echo $row['cv_cat_id']{/php})">
                                                                <img src="{$css_path}icon_add.png" class="img_all" title="Chia về nhân viên"></a>
                                                        </div>
                                                        {php}endif;{/php}
                                                        {php}if($this->_tpl_vars['user_level'] == 4):{/php}
                                                        <div style="width:20px; float:left; margin-top:2px; height:20px;">
                                                            <a href="javascript: void(0)" onclick="javascript: show_add_log_form_ld({php}echo $row['cv_sub_id']{/php},{php}echo $row['cv_cat_id']{/php})">
                                                                <img src="{$css_path}icon_add.png" class="img_all" title="Tạo việc"></a>
                                                        </div>
                                                        {php}endif;{/php}
                                                    </div>
                                                </div>
                                                <div style="float:left; width:140px; height:auto;">
                                                    <div style="float:left; width:140px; padding-left:20px; font-style:italic">
                                                        <div style="width:22px; float:left; margin-top:3px; height:20px">
                                                            {if $user_level eq 4 or $user_level eq 5}
                                                                &nbsp;<a href="javascript: void(0)" onclick="javascript: delete_cv_sub({php}echo $row['cv_sub_id']{/php},{php}echo $row['cv_cat_id']{/php})">
                                                                <img src="{$css_path}icon_delete.png" class="img_all" title="Xóa"></a>
                                                            {else}&nbsp;-{/if}
                                                        </div>
                                                        <div style="width:22px; float:left; margin-top:3px; height:20px">
                                                          {if $user_level eq 4}
                                                          &nbsp;<a href="javascript: void(0)" onclick="javascript: show_edit_sub_form({php}echo $row['cv_sub_id']{/php},{php}echo $row['cv_cat_id']{/php})">
                                                          <img src="{$css_path}icon_edit.png" class="img_all" title="Sửa"></a>
                                                          {else}&nbsp;-{/if}
                                                        </div>
                                                        {php} if($row['cv_sub_time_limit'] <= date('Y-m-d')):{/php}
                                                        <div style="width:122px; float:left; margin-top:3px; height:20px">
                                                            <img src="{$css_path}warning_danger.png" class="img_all" title="Đã hết hạn"> (Quá: {php} echo floor((strtotime(date('Y-m-d')) - strtotime($row['cv_sub_time_limit']))/(24*60*60)){/php} ngày)
                                                        </div>
                                                        {php} elseif(strtotime($row['cv_sub_time_limit']) - strtotime(date('Y-m-d')) <= (2*24*60*60)):{/php}
                                                        <div style="width:22px; float:left; margin-top:3px; height:20px">
                                                            <img src="{$css_path}warning_icon.png" class="img_all" title="Sắp hết hạn">
                                                        </div>
                                                        {php} else:{/php}
                                                        <div style="width:22px; float:left; margin-top:3px; height:20px">
                                                            <img src="{$css_path}warning_safe.png" class="img_all" title="Chưa hết hạn">
                                                        </div>
                                                        {php} endif;{/php}
                                                    </div>
                                                    <div style="float:left; width:140px; line-height:20px; padding-left:20px; font-style:italic">
                                                        &nbsp;- Hạn: {php}echo date('d/m/Y',strtotime($row['cv_sub_time_limit'])){/php}
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td align="left" valign="top">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                {php}
                                                    if($row['cv_sub_id']):
                                                        $tong_tile_log = 0;
                                                        $sql_index="select cvi.*,u.user_fullname from tbl_cv_indexs as cvi join tbl_users as u on cvi.process_user = u.user_id where cvi.cv_sub_id=".$row['cv_sub_id'];
                                                        $result_index = mysql_query($sql_index) or die($sql_index);
                                                        if($result_index && mysql_num_rows($result_index)>0):
                                                            $phantram_index = round($phantram/mysql_num_rows($result_index),2);
                                                            $j=0;
                                                            while($row_index=mysql_fetch_array($result_index)):

                                                            $sql_log_count="select count(cv_log_id) as count_log from tbl_cv_logs where cv_index_id=".$row_index['cv_index_id'];
                                                            $result_log_count = mysql_query($sql_log_count) or die($sql_log_count);
                                                            if($result_log_count):
                                                                $row_log_count = mysql_fetch_array($result_log_count);
                                                                if($row_log_count['count_log']>1):
                                                                    $height_bot_log = 45*($row_log_count['count_log']/2)+5;
                                                                    $top_height = 45*($row_log_count['count_log']/2) - 25;
                                                                else:
                                                                    $height_bot_log = 60;
                                                                    $top_height = 0;
                                                                endif;
                                                            endif;
                                                {/php}
                                                <!----------------------trong truong hop tu truong phong giao viec xuong nhan vien---------------------->
                                                <tr>
                                                    <td align="left" width="30%" valign="top">
                                                        <div style="float:left;{php}if($j>0):{/php}border-left:1px solid #99bbe8;{php}endif;{/php} height:{php}echo $top_height.'px';{/php}">&nbsp;</div>
                                                        <div style="float:left; width:140px; height:20px">
                                                            <div style="float:left; width:18px; height:20px; {php}if($j<mysql_num_rows($result_index)-1):{/php}border-left:1px solid #99bbe8{php}endif;{/php}; border-top:1px solid #99bbe8"></div>
                                                            <div style="float:left; width:135px">
                                                                <div style="float:left; width:110px; height:20px; line-height:20px; white-space:nowrap; border:1px solid #99bbe8; white-space:nowrap; background-color:#FFF" title="{php}echo $row_index['cv_index_name'].'&#13;'.$row_index['cv_index_desc']{/php}">
                                                                    &nbsp;{php}echo fnsSubstr($row_index['user_fullname'],35,1){/php}
                                                                </div>
                                                                <div style="width:20px; float:left; margin-top:2px; height:20px;">
                                                                    {php}if(($row_index['user_id']==$this->_tpl_vars['access_user_id'] &&  $this->_tpl_vars['user_level']==6) || $this->_tpl_vars['user_level'] == 4):{/php}
                                                                    <a href="javascript: void(0)" onclick="javascript: show_add_log_form({php}echo $row_index['cv_index_id']{/php},{php}echo $row['cv_cat_id']{/php})">
                                                                        <img src="{$css_path}icon_add.png" class="img_all" title="Tạo việc"></a>
                                                                    {php}else: echo '&nbsp;---'; endif;{/php}
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div style="float:left; width:140px; height:{php} echo $height_bot_log.'px'{/php}; {php}if($j<mysql_num_rows($result_index)-1):{/php}border-left:1px solid #99bbe8{php}endif;{/php}">
                                                            <div style="float:left; width:140px; padding-left:20px; font-style:italic">
                                                                <div style="width:22px; float:left; margin-top:3px; height:20px">
                                                                    {php}if($row['department_id']==$this->_tpl_vars['access_unit_id'] && $this->_tpl_vars['user_level'] == 6):{/php}
                                                                    &nbsp;<a href="javascript: void(0)" onclick="javascript: delete_cv_index({php}echo $row_index['cv_index_id']{/php},{php}echo $row['cv_cat_id']{/php})">
                                                                        <img src="{$css_path}icon_delete.png" class="img_all" title="Xóa"></a>
                                                                    {php}else: echo '&nbsp;-'; endif;{/php}
                                                                </div>
                                                                {php} if($row['cv_sub_time_limit'] <= date('Y-m-d')):{/php}<br>
                                                                <div style="width:122px; float:left; margin-top:3px; height:20px">
                                                                    <img src="{$css_path}warning_danger.png" class="img_all" title="Đã hết hạn"> (Quá: {php} echo floor((strtotime(date('Y-m-d')) - strtotime($row['cv_sub_time_limit']))/(24*60*60)){/php} ngày)
                                                                </div>
                                                                {php} elseif(strtotime($row['cv_sub_time_limit']) - strtotime(date('Y-m-d')) <= (2*24*60*60)):{/php}
                                                                <div style="width:22px; float:left; margin-top:3px; height:20px">
                                                                    <img src="{$css_path}warning_icon.png" class="img_all" title="Sắp hết hạn">
                                                                </div>
                                                                {php} else:{/php}
                                                                <div style="width:22px; float:left; margin-top:3px; height:20px">
                                                                    <img src="{$css_path}warning_safe.png" class="img_all" title="Chưa hết hạn">
                                                                </div>
                                                                {php} endif;{/php}
                                                            </div>
                                                            {php}
                                                                $sql_log_tl = "select count(cv_log_id) as log_count from tbl_cv_logs where cv_index_id = ".$row_index['cv_index_id'];
                                                                $result_log_tl = mysql_query($sql_log_tl) or die($sql_log_tl);
                                                                $row_log_tl=mysql_fetch_array($result_log_tl);

                                                                $sql_log_tl_done = "select count(cv_log_id) as log_count from tbl_cv_logs where cv_log_active = 1 and cv_index_id = ".$row_index['cv_index_id'];
                                                                $result_log_tl_done = mysql_query($sql_log_tl_done) or die($sql_log_tl_done);
                                                                $row_log_tl_done=mysql_fetch_array($result_log_tl_done);

                                                                if($row_log_tl['log_count']>0):
                                                                    $tile_log_datduoc = round($phantram_index/$row_log_tl['log_count'],2)*$row_log_tl_done['log_count'];
                                                                else:
                                                                    $tile_log_datduoc = 0;
                                                                endif;
                                                                $tong_tile_log += $tile_log_datduoc;
                                                            {/php}
                                                            <div style="float:left; width:140px; line-height:20px; padding-left:20px; font-style:italic">
                                                            </div>

                                                        </div>
                                                    </td>
                                                    <td align="left" valign="top">
                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                            {php}
                                                                if($row_index['cv_index_id']):
                                                                $sql_log = "select * from tbl_cv_logs where cv_index_id = ".$row_index['cv_index_id'];
                                                                $result_log = mysql_query($sql_log) or die($sql_log);
                                                                if($result_log && mysql_num_rows($result_log)>0):
                                                                $phantram_log = round($phantram_index/mysql_num_rows($result_log),2);
                                                                $k=0;
                                                                while($row_log=mysql_fetch_array($result_log)):
                                                            {/php}
                                                            <tr>
                                                                <td align="left" width="30%" valign="top">
                                                                    <div style="float:left; width:120px; height:20px;">
                                                                        <div style="float:left; width:18px; height:20px; {php}if($k<mysql_num_rows($result_log)-1):{/php}border-left:1px solid #99bbe8{php}endif;{/php}; border-top:1px solid #99bbe8"></div>
                                                                        <div style="float:left; width:100px">
                                                                            <div style="float:left; width:100px; height:20px; line-height:20px; white-space:nowrap; border:1px solid #99bbe8; white-space:nowrap; background-color:#FFF" title="{php}echo $row_log['cv_log_desc'].'&#13;'.$row_log['cv_log_note']{/php}">
                                                                                <div style="float:left; width:78px">
                                                                                    {php}if(($row['department_id']==$this->_tpl_vars['access_unit_id'] && $this->_tpl_vars['user_level'] == 6) || $this->_tpl_vars['user_level'] == 4):{/php}
                                                                                    <a href="javascript:void(0)" onclick="javascript: edit_log({php}echo $row_log['cv_log_id']{/php},{php}echo $row_log['cv_index_id']{/php},{php}echo $row['cv_cat_id']{/php})">
                                                                                        &nbsp;{php}echo 'Việc  '.($k+1){/php}
                                                                                        <i>({php}echo $phantram_log;{/php} %)</i></a>
                                                                                    {php}else:{/php}
                                                                                    {php}if($row_log['cv_log_active']==1):{/php}
                                                                                    <font color="#0000FF">
                                                                                        &nbsp;{php}echo 'Việc  '.($k+1){/php}
                                                                                        <i>({php}echo $phantram_log;{/php} %)</i>
                                                                                    </font>
                                                                                    {php}else:{/php}
                                                                                    {php}if(($row_index['process_user']==$this->_tpl_vars['access_user_id']) || ($row['department_id']==$this->_tpl_vars['access_unit_id'] && $this->_tpl_vars['user_level'] == 10)):{/php}
                                                                                    <a href="javascript:void(0)" onclick="javascript: update_log({php}echo $row_log['cv_log_id']{/php},{php}echo $row_log['cv_index_id']{/php},{php}echo $row['cv_sub_id']{/php},{php}echo $row['cv_cat_id']{/php})">
                                                                                        <font color="#FF0000">
                                                                                            &nbsp;{php}echo 'Việc  '.($k+1){/php}
                                                                                            <i>({php}echo $phantram_log;{/php} %)</i>
                                                                                        </font>
                                                                                    </a>
                                                                                    {php}else:{/php}
                                                                                    <font color="#FF0000">
                                                                                        &nbsp;{php}echo 'Việc  '.($k+1){/php}
                                                                                        <i>({php}echo $phantram_log;{/php} %)</i>
                                                                                    </font>
                                                                                    {php}endif;{/php}
                                                                                    {php}endif;{/php}
                                                                                    {php}endif;{/php}
                                                                                </div>
                                                                                <div style="width:20px; float:left; margin-top:3px; height:20px">
                                                                                    {php}if($row['department_id']==$this->_tpl_vars['access_unit_id'] && $this->_tpl_vars['user_level'] == 6):{/php}
                                                                                    &nbsp;<a href="javascript: void(0)" onclick="javascript: delete_cv_log({php}echo $row_log['cv_log_id']{/php},{php}echo $row['cv_cat_id']{/php})">
                                                                                        <img src="{$css_path}icon_delete.png" class="img_all" title="Xóa"></a>
                                                                                    {php}else:{/php}
                                                                                    {php}if($row_log['cv_log_active']==1):{/php}
                                                                                    &nbsp;<img src="{$css_path}icon_finish.png" class="img_all" title="Đã xong">
                                                                                    {php}else:{/php}
                                                                                    &nbsp;<img src="{$css_path}icon_bom.png" class="img_all" title="Chưa xong">
                                                                                    {php}endif;{/php}
                                                                                    {php}endif;{/php}
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div style="float:left; width:120px; height:25px;">
                                                                        <div style="float:left; width:100px; height:25px; {php}if($k<mysql_num_rows($result_log)-1):{/php}border-left:1px solid #99bbe8{php}endif;{/php}; line-height:25px; padding-left:20px">&nbsp;</div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            {php}
                                                                $k++;
                                                                endwhile;
                                                                endif;
                                                                endif;
                                                            {/php}
                                                        </table>
                                                    </td>
                                                </tr>
                                                {php}
                                                    $j++;
                                                    endwhile;
                                                    else:
                                                {/php}
                                                <!----------------------trong truong hop giam doc giao viec xuong phong---------------------->
                                                <tr>
                                                    <td align="left" valign="top">
                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                            {php}
                                                                if($row['cv_sub_id']):
                                                                $sql_log = "select * from tbl_cv_logs where cv_sub_id = ".$row['cv_sub_id'];
                                                                $result_log = mysql_query($sql_log) or die($sql_log);
                                                                if($result_log && mysql_num_rows($result_log)>0):
                                                                $phantram_log = round($phantram_index/mysql_num_rows($result_log),2);
                                                                $k=0;
                                                                while($row_log=mysql_fetch_array($result_log)):
                                                                if($k%2==0){
                                                                    $bg="none";
                                                                }else{
                                                                    $bg="none";
                                                                }

                                                                if($this->_tpl_vars['tinhtrangcv_fil'] == 1){
                                                                    if((strtotime(date('Y-m-d')) - strtotime($row_log['cv_log_date']))/(24*60*60) > 0){
                                                                        $displaycv="none";
                                                                    }else{
                                                                        $displaycv="block";
                                                                    }
                                                                }elseif($this->_tpl_vars['tinhtrangcv_fil'] == 2){
                                                                    if((strtotime(date('Y-m-d')) - strtotime($row_log['cv_log_date']))/(24*60*60) > 0){
                                                                        $displaycv="block";
                                                                    }else{
                                                                        $displaycv="none";
                                                                    }
                                                                }else{
                                                                    $displaycv="block";
                                                                }
                                                            {/php}
                                                            <tr>
                                                                <td align="left" width="30%" valign="top" style="background-color: {php}echo $bg;{/php}; display: {php}echo $displaycv;{/php}">
                                                                    <div style="float:left; width:282px; height:auto;{php}if($k<mysql_num_rows($result_log)-1):{/php}border-left:1px solid #99bbe8{php}endif;{/php}">
                                                                        <div style="float:left; width:18px; height:auto; {php}if($k<mysql_num_rows($result_log)-1):{/php}border-left:1px solid #99bbe8{php}endif;{/php}; border-top:1px solid #99bbe8"></div>
                                                                        <div style="float:left; width:262px">
                                                                            <div style="float:left; width:262px; height:auto; line-height:20px; white-space:normal; border:1px solid #99bbe8; background-color: #fff; white-space:nowrap" title="{php}echo $row_log['cv_log_desc'].'&#13;'.$row_log['cv_log_note']{/php}">
                                                                                <div style="float:left; width:238px; line-height:18px; white-space:normal; margin-left: 2px">
                                                                                    {php}if(($row['department_id']==$this->_tpl_vars['access_unit_id'] && $this->_tpl_vars['user_level'] == 6) || $this->_tpl_vars['user_level'] == 4):{/php}
                                                                                    <a href="javascript:void(0)" onclick="javascript: edit_log_ld({php}echo $row_log['cv_log_id']{/php},{php}echo $row['cv_sub_id']{/php},{php}echo $row['cv_cat_id']{/php})">
                                                                                        {php}echo '- Nội dung: '.$row_log['cv_log_desc']{/php}
                                                                                    </a>
                                                                                    {php}else:{/php}
                                                                                        {php}if($row_log['cv_log_active']==1):{/php}
                                                                                        {php}else:{/php}
                                                                                            {php}if(($row_index['process_user']==$this->_tpl_vars['access_user_id']) || ($row['department_id']==$this->_tpl_vars['access_unit_id'] && $this->_tpl_vars['user_level'] == 10)):{/php}
                                                                                                <a href="javascript:void(0)" onclick="javascript: update_log({php}echo $row_log['cv_log_id']{/php},{php}echo $row_log['cv_index_id']{/php},{php}echo $row['cv_sub_id']{/php},{php}echo $row['cv_cat_id']{/php})">
                                                                                                    <font color="#FF0000">
                                                                                                        {php}echo '- Nội dung: '.$row_log['cv_log_desc']{/php}
                                                                                                    </font>
                                                                                                </a>
                                                                                            {php}else:{/php}
                                                                                                <font color="#FF0000">
                                                                                                    {php}echo '- Nội dung: '.$row_log['cv_log_desc']{/php}
                                                                                                </font>
                                                                                            {php}endif;{/php}
                                                                                        {php}endif;{/php}
                                                                                    {php}endif;{/php}
                                                                                </div>
                                                                                <div style="width:20px; float:left; margin-top:3px; height:20px">
                                                                                    {php}if(($row['department_id']==$this->_tpl_vars['access_unit_id'] && $this->_tpl_vars['user_level'] == 6) || $this->_tpl_vars['user_level'] == 4):{/php}
                                                                                    &nbsp;<a href="javascript: void(0)" onclick="javascript: delete_cv_log({php}echo $row_log['cv_log_id']{/php},{php}echo $row['cv_cat_id']{/php})">
                                                                                        <img src="{$css_path}icon_delete.png" class="img_all" title="Xóa"></a>
                                                                                    {php}else:{/php}
                                                                                    {php}if($row_log['cv_log_active']==1):{/php}
                                                                                    &nbsp;<img src="{$css_path}icon_finish.png" class="img_all" title="Đã xong">
                                                                                    {php}else:{/php}
                                                                                    &nbsp;<img src="{$css_path}icon_bom.png" class="img_all" title="Chưa xong">
                                                                                    {php}endif;{/php}
                                                                                    {php}endif;{/php}
                                                                                </div>
                                                                                <div style="float:left; width:270px">
                                                                                    &nbsp;<i>{php}
                                                                                            echo '- Thời hạn: '.date('d/m/Y',strtotime($row_log['cv_log_date']));
                                                                                            if((strtotime(date('Y-m-d')) - strtotime($row_log['cv_log_date']))/(24*60*60) > 0){
                                                                                            echo ' (<span style="text-decoration: blink; color: #FF0000; -moz-text-blink: blink;">Quá hạn '.((strtotime(date('Y-m-d')) - strtotime($row_log['cv_log_date']))/(24*60*60)).' ngày</span>)';
                                                                                            }

                                                                                        {/php}</i>
                                                                                </div>
                                                                                <div style="float:left; width:270px">
                                                                                    {php}
                                                                                    if($row_log['cv_log_id'] != ''):
                                                                                    $sql_ldpt="select cvgs.*,U.user_fullname from tbl_cv_giamsat as cvgs join tbl_users as U on cvgs.user_id = U.user_id where cvgs.cv_log_id = ".$row_log['cv_log_id'];
                                                                                    $result_ldpt = mysql_query($sql_ldpt) or die($sql_ldpt);
                                                                                    if($result_ldpt && mysql_num_rows($result_ldpt)>0):
                                                                                    echo '<div style="float:left"><div style="float:left; width: 100%">&nbsp;- Lãnh đạo phụ trách:</div>';
                                                                                        $i=0;
                                                                                        while($row_ldpt=mysql_fetch_array($result_ldpt)):
                                                                                        {/php}
                                                                                        <div style="float:left; width:135px">
                                                                                            <div style="float:left; width:110px; height:20px; line-height:20px; white-space:nowrap; border:1px solid #99bbe8; white-space:nowrap; background-color: #fff" title="{php}echo $row['cv_sub_name'].'&#13;'.$row['cv_sub_desc']{/php}">
                                                                                                &nbsp;{php}echo $row_ldpt['user_fullname']{/php}
                                                                                            </div>
                                                                                            <div style="width:22px; float:left; margin-top:3px; height:20px">
                                                                                                {if $user_level eq 4 or $user_level eq 5}
                                                                                                    &nbsp;<a href="javascript: void(0)" onclick="javascript: delete_cv_gs({php}echo $row_ldpt['cv_giamsat_id']{/php},{php}echo $row_ldpt['cv_cat_id']{/php})">
                                                                                                    <img src="{$css_path}icon_delete.png" class="img_all" title="Xóa"></a>
                                                                                                {else}&nbsp;-{/if}
                                                                                            </div>
                                                                                        </div>
                                                                                        {php}
                                                                                        $i++;
                                                                                        endwhile;
                                                                                        echo '</div>';
                                                                                    endif;
                                                                                    endif;
                                                                                    {/php}
                                                                                </div>
                                                                                <div style="float:left; width:270px">
                                                                                    {php}
                                                                                    if($row_log['cv_log_id'] != ''):
                                                                                    $sql_dvph="select cvph.*,D.department_name,D.department_standfor from tbl_cv_phoihop as cvph join tbl_departments as D on cvph.department_id = D.department_id where cvph.cv_log_id = ".$row_log['cv_log_id'];
                                                                                    $result_dvph = mysql_query($sql_dvph) or die($sql_dvph);
                                                                                    if($result_dvph && mysql_num_rows($result_dvph)>0):
                                                                                    echo '<div style="float:left"><div style="float:left; width: 100%">&nbsp;- Đơn vị phối hợp:</div>';
                                                                                        $i=0;
                                                                                        while($row_dvph=mysql_fetch_array($result_dvph)):
                                                                                        {/php}
                                                                                        <div style="float:left; width:135px">
                                                                                            <div style="float:left; width:110px; height:20px; line-height:20px; white-space:nowrap; border:1px solid #99bbe8; white-space:nowrap; background-color:#FFF" title="{php}echo $row['cv_sub_name'].'&#13;'.$row['cv_sub_desc']{/php}">
                                                                                                &nbsp;{php}echo fnsSubstr(str_replace(array('Phòng','Ban'),array('P.','B.'),$row_dvph['department_standfor']),32,1){/php}
                                                                                            </div>
                                                                                            <div style="width:22px; float:left; margin-top:3px; height:20px">
                                                                                                {if $user_level eq 4 or $user_level eq 5}
                                                                                                    &nbsp;<a href="javascript: void(0)" onclick="javascript: delete_cv_ph({php}echo $row_dvph['cv_phoihop_id']{/php},{php}echo $row_dvph['cv_cat_id']{/php})">
                                                                                                    <img src="{$css_path}icon_delete.png" class="img_all" title="Xóa"></a>
                                                                                                {else}&nbsp;-{/if}
                                                                                            </div>
                                                                                        </div>
                                                                                        {php}
                                                                                            $i++;
                                                                                            endwhile;
                                                                                            endif;
                                                                                            endif;
                                                                                        {/php}
                                                                                    </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div style="float:left; width:262px; height:10px;">
                                                                        <div style="float:left; width:262px; height:10px; {php}if($k<mysql_num_rows($result_log)-1):{/php}border-left:1px solid #99bbe8{php}endif;{/php}; line-height:25px; padding-left:20px">

                                                                        </div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            {php}
                                                                $k++;
                                                                endwhile;
                                                                endif;
                                                                endif;
                                                            {/php}
                                                        </table>
                                                    </td>
                                                </tr>
                                                {php}
                                                    endif;
                                                    endif;
                                                {/php}
                                                <input type="hidden" name="tile_log_datduoc" id="tile_log_datduoc" value="{php}echo $tong_tile_log{/php}" />
                                                {literal}
                                                    <script language="javascript">
                                                        document.getElementById('tile_index').innerHTML=document.getElementById('tile_log_datduoc').value;
                                                    </script>
                                                {/literal}
                                            </table>
                                        </td>
                                    </tr>
                                    {php}if($i<mysql_num_rows($result)-1):{/php}
                                    <tr><td style="border-left: 1px solid #99bbe8; height: 20px" colspan="3">&nbsp;</td></tr>
                                    {php}endif;{/php}
                                    {php}
                                        $i++;
                                        endwhile;
                                        endif;
                                        endif;
                                    {/php}
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
            </fieldset>
        </div>
    </form>
</div>
{literal}
    <script language="javascript">

        function show_list_cv_cat_options(count,total){
            for(i=1;i<=total;i++){
                if(i==count){
                    if(document.getElementById('extra_cv_cat_'+i).style.display=='none'){
                        document.getElementById('extra_cv_cat_'+i).style.display='block';
                        $('#extra_icon_cv_cat_'+i).css({'border':'1px solid #8ea4c1'});
                    }else{
                        document.getElementById('extra_cv_cat_'+i).style.display='none';
                        $('#extra_icon_cv_cat_'+i).css({'border':'none'});
                    }
                }
                else{
                    document.getElementById('extra_cv_cat_'+i).style.display='none';
                    $('#extra_icon_cv_cat_'+i).css({'border':'none'});
                }
            }
        }

        function delete_cv_cat(delStr){
            if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
                return false;
            }

            var dataString = "dlStr=" + delStr +"";
            //alert (dataString);
            $.ajax({
                type: "POST",
                url: 'index.php?listCvCat&mod=congviecs&del_cv_cat=1',
                data: dataString,
                success: function(data) {
                    $('#cv_cat_content_main').fadeOut('fast').load('index.php?listCvCat&mod=congviecs').fadeIn("fast");
                }
            });
        }

        function delete_cv_sub(delStr,cv_cat_id){
            if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
                return false;
            }

            var dataString = "dlStr=" + delStr +"";
            //alert (dataString);
            $.ajax({
                type: "POST",
                url: 'index.php?listCvCat&mod=congviecs&delete_cv_sub=1',
                data: dataString,
                success: function(data) {
                    $('#cv_cat_content_main').fadeOut('fast').load('index.php?listCvCat&mod=congviecs&show_luong=1&cv_cat_id='+cv_cat_id).fadeIn("fast");
                }
            });
        }

        function delete_cv_ph(delStr,cv_cat_id){
            if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
                return false;
            }

            var dataString = "dlStr=" + delStr +"";
            //alert (dataString);
            $.ajax({
                type: "POST",
                url: 'index.php?listCvCat&mod=congviecs&delete_cv_ph=1',
                data: dataString,
                success: function(data) {
                    $('#cv_cat_content_main').fadeOut('fast').load('index.php?listCvCat&mod=congviecs&show_luong=1&cv_cat_id='+cv_cat_id).fadeIn("fast");
                }
            });
        }

        function delete_cv_gs(delStr,cv_cat_id){
            if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
                return false;
            }

            var dataString = "dlStr=" + delStr +"";
            //alert (dataString);
            $.ajax({
                type: "POST",
                url: 'index.php?listCvCat&mod=congviecs&delete_cv_gs=1',
                data: dataString,
                success: function(data) {
                    $('#cv_cat_content_main').fadeOut('fast').load('index.php?listCvCat&mod=congviecs&show_luong=1&cv_cat_id='+cv_cat_id).fadeIn("fast");
                }
            });
        }

        function delete_cv_index(delStr,cv_cat_id){
            if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
                return false;
            }

            var dataString = "dlStr=" + delStr +"";
            //alert (dataString);
            $.ajax({
                type: "POST",
                url: 'index.php?listCvCat&mod=congviecs&delete_cv_index=1',
                data: dataString,
                success: function(data) {
                    $('#cv_cat_content_main').fadeOut('fast').load('index.php?listCvCat&mod=congviecs&show_luong=1&cv_cat_id='+cv_cat_id).fadeIn("fast");
                }
            });
        }

        function delete_cv_log(delStr,cv_cat_id){
            if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
                return false;
            }

            var dataString = "dlStr=" + delStr +"";
            //alert (dataString);
            $.ajax({
                type: "POST",
                url: 'index.php?listCvCat&mod=congviecs&delete_cv_log=1',
                data: dataString,
                success: function(data) {
                    $('#cv_cat_content_main').fadeOut('fast').load('index.php?listCvCat&mod=congviecs&show_luong=1&cv_cat_id='+cv_cat_id).fadeIn("fast");
                }
            });
        }

        function uutien_cv_cat(cv_cat_id){
            $('#cv_cat_content_main').load('index.php?listCvCat&mod=congviecs&update_uutien=1&cv_cat_id='+cv_cat_id).fadeIn("fast");
        }

        function show_cv_luong_xl(cv_cat_id){
            $("#cv_cat_content_main").load("?listCvCat&mod=congviecs&show_luong=1&cv_cat_id="+cv_cat_id);
        }


        function search_me_Dl(cv_cat_id,cv_cat_type){
            var keyword 			= document.getElementById('keyword').value;
            if (keyword == ""){
                return false;
            }

            $.post('?listCvCat&mod=congviecs&cv_cat_id='+cv_cat_id+'&cv_cat_type='+cv_cat_type,
                    {keyword:keyword},
                    function(data){
                        $('#cv_cat_content_main').html(data);
                        $("#cv_cat_content_main").show();
                    }
            );
        }

        function show_list_cv_file(cv_cat_id){
            $('#dl_file').css({'display':'block','z-index':'2010'});
            $("#dl_file_cont").load("?listCVFile&mod=congviecs&cv_cat_id="+cv_cat_id);
        }

        function show_add_form(){
            $('#add_edit_cv_cat').css({'display':'block','z-index':'2010'});
            $('#list_add_edit_cv_cat_cont').load('index.php?addEditCvCat&mod=congviecs').fadeIn("fast");
        }

        function show_edit_form(cv_cat_id){
            $('#add_edit_cv_cat').css({'display':'block','z-index':'2010'});
            $('#list_add_edit_cv_cat_cont').load('index.php?addEditCvCat&mod=congviecs&edit_me=1&cv_cat_id='+cv_cat_id).fadeIn("fast");
        }

        function show_add_sub_form(cv_cat_id){
            $('#add_edit_cv_sub').css({'display':'block','z-index':'2010'});
            $('#list_add_edit_cv_sub_cont').load('index.php?addEditCvSub&mod=congviecs&cv_cat_id='+cv_cat_id).fadeIn("fast");
        }

        function show_edit_sub_form(cv_sub_id,cv_cat_id){
         $('#add_edit_cv_sub').css({'display':'block','z-index':'2010'});
         $('#list_add_edit_cv_sub_cont').load('index.php?addEditCvSub&mod=congviecs&edit_me=1&cv_sub_id='+cv_sub_id+'&cv_cat_id='+cv_cat_id).fadeIn("fast");
         }

        function show_add_index_form(cv_sub_id,cv_cat_id){
            $('#add_edit_cv_cat').css({'display':'block','z-index':'2010'});
            $('#list_add_edit_cv_cat_cont').load('index.php?addEditCvIndex&mod=congviecs&cv_sub_id='+cv_sub_id+'&cv_cat_id='+cv_cat_id).fadeIn("fast");
        }

        function show_add_log_form(cv_index_id,cv_cat_id){
            $('#add_edit_cv_cat').css({'display':'block','z-index':'2010'});
            $('#list_add_edit_cv_cat_cont').load('index.php?addEditCvLog&mod=congviecs&cv_index_id='+cv_index_id+'&cv_cat_id='+cv_cat_id).fadeIn("fast");
        }

        function show_add_log_form_ld(cv_sub_id,cv_cat_id){
            $('#add_edit_cv_sub').css({'display':'block','z-index':'2010'});
            $('#list_add_edit_cv_sub_cont').load('index.php?addEditCvLogLd&mod=congviecs&cv_sub_id='+cv_sub_id+'&cv_cat_id='+cv_cat_id).fadeIn("fast");
        }

        function edit_log(cv_log_id,cv_index_id,cv_cat_id){
            $('#add_edit_cv_cat').css({'display':'block','z-index':'2010'});
            $('#list_add_edit_cv_cat_cont').load('index.php?addEditCvLog&mod=congviecs&edit_me=1&cv_index_id='+cv_index_id+'&cv_log_id='+cv_log_id+'&cv_cat_id='+cv_cat_id).fadeIn("fast");
        }

        function edit_log_ld(cv_log_id,cv_sub_id,cv_cat_id){
            $('#add_edit_cv_sub').css({'display':'block','z-index':'2010'});
            $('#list_add_edit_cv_sub_cont').load('index.php?addEditCvLogLd&mod=congviecs&edit_me=1&cv_sub_id='+cv_sub_id+'&cv_log_id='+cv_log_id+'&cv_cat_id='+cv_cat_id).fadeIn("fast");
        }

        function update_log(cv_log_id,cv_index_id,cv_sub_id,cv_cat_id){
            if(!confirm("THÔNG BÁO: \n\tBẠN ĐÃ HOÀN THÀNH CÔNG VIỆC?")){
                return false;
            }

            var dataString = "cv_log_id=" + cv_log_id +"";
            dataString += "&cv_index_id=" + cv_index_id +"";
            dataString += "&cv_sub_id=" + cv_sub_id +"";
            dataString += "&cv_cat_id=" + cv_cat_id +"";
            //alert (dataString);return false;
            $.ajax({
                type: "POST",
                url: 'index.php?listCvCat&mod=congviecs&update_all_status=1',
                data: dataString,
                success: function(data) {
                    $('#cv_cat_content_main').fadeOut('fast').load('index.php?listCvCat&mod=congviecs&show_luong=1&cv_cat_id='+cv_cat_id).fadeIn("fast");
                }
            });
        }

        function loctinhtrang(cv_cat_id){
            var tinhtrangcv_fil = document.getElementById('tinhtrangcv_fil').value;
            $('#cv_cat_content_main').hide();
            $('#cv_cat_content_main').fadeOut('fast').load('index.php?listCvCat&mod=congviecs&show_luong=1&cv_cat_id='+cv_cat_id+'&tinhtrangcv_fil='+tinhtrangcv_fil).fadeIn("fast");
        }

        $("#a_ref_CvCat").click( function () {
            var cv_cat_id = document.getElementById('cv_cat_id').value;
            $('#cv_cat_content_main').hide();
            $('#cv_cat_content_main').fadeOut('fast').load('index.php?listCvCat&mod=congviecs&cv_cat_id='+cv_cat_id).fadeIn("fast");
        });
    </script>
{/literal}