<div id="report_congviec_content_insign">
    <form method="post" name="frmList_CvCat" action="?listCvCat{$vars.arg}" id="frmList_CvCat">
        <!------------------------------------LUONG XU LY-------------------------------------------->
        <div style="float:left">
            <div style="float:left; height:5px; width:100%"></div>
            <div style="float:left; height:410px; width:733px; padding:2px; overflow-y:auto">
                <div style="float:left; width:718px; height:auto" id="div_cont_print">
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
                    <input type="hidden" id="cv_cat_id" value="{$obj_info.cv_cat_id}">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr><td colspan="3" style="line-height: 35px">&nbsp;<b>{$obj_info.cv_cat_name|str_string_cut:"200":"1"}</b></td></tr>
                        <tr>
                            <td align="left" valign="middle" width="5%" style="width:30px; padding-bottom: 10px">
                                <div style="float:left; width:50px;">
                                    {php}
                                        if($this->_tpl_vars['obj_info']['cv_cat_id'] != ''):
                                        $sql="select count(cv_index_id) as count_idex from tbl_cv_indexs where cv_sub_id in(select cv_sub_id from tbl_cv_subs where cv_cat_id = ".$this->_tpl_vars['obj_info']['cv_cat_id'].")";
                                        $result = mysql_query($sql) or die($sql);
                                        if($result) $row = mysql_fetch_array($result);
                                        $padding_top_cat = ((80*$row['count_idex'])/2);
                                        $padding_bot_cat = ((80*$row['count_idex'])/2)-120;
                                        endif;
                                    {/php}
                                    <div style="float:left; width:50px; padding-top:{php}echo $padding_bot_cat;{/php}px">
                                        <div style="width:50px; float:left; margin-top:2px; margin-left:2px; height:auto; line-height: 20px">
                                            {php}
                                                $sql_user = "select * from tbl_users where user_id = ".$this->_tpl_vars['obj_info']['user_id'];
                                                $result_user = mysql_query($sql_user) or die($sql_user);
                                                if(mysql_num_rows($result_user)>0){
                                                    $row_user = mysql_fetch_array($result_user);
                                                    if($row_user['user_level']==4){
                                                        echo 'Giám đốc<br>';
                                                    }else{
                                                        echo 'Phó Giám đốc<br>';
                                                    }
                                                    echo $row_user['user_fullname'];
                                                }
                                            {/php}
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
                                                <div style="float:left; width:200px; height:20px; ">
                                                    <div style="float:left; width:18px; border-top:1px solid #99bbe8"></div>
                                                    <div style="float:left; width:182px">
                                                        <div style="float:left; width:156px; height:20px; line-height:20px; white-space:nowrap; border:1px solid #99bbe8; white-space:nowrap; background-color:#FFF" title="{php}echo $row['cv_sub_name'].'&#13;'.$row['cv_sub_desc']{/php}">
                                                            &nbsp;{php}echo fnsSubstr(str_replace(array('Phòng','Ban'),array('P.','B.'),$row['department_name']),32,1){/php}
                                                        </div>
                                                        <div style="width:23px; float:left; margin-top:2px; height:20px; border-top:1px solid #99bbe8"></div>
                                                    </div>
                                                </div>
                                                <div style="float:left; width:200px; height:auto;">
                                                    <div style="float:left; width:200px; line-height:20px; padding-left:20px; font-style:italic">
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
                                                                                        {php}echo '- Nội dung: '.$row_log['cv_log_desc']{/php}
                                                                                    {php}endif;{/php}
                                                                                </div>
                                                                                <div style="width:20px; float:left; margin-top:3px; height:20px">
                                                                                    {php}if($row_log['cv_log_active']==1):{/php}
                                                                                    &nbsp;<img src="{$css_path}icon_finish.png" class="img_all" title="Đã xong">
                                                                                    {php}else:{/php}
                                                                                    &nbsp;<img src="{$css_path}icon_bom.png" class="img_all" title="Chưa xong">
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
                                                                                            <div style="width:22px; float:left; margin-top:3px; height:20px"></div>
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
                                                                                            <div style="width:22px; float:left; margin-top:3px; height:20px"></div>
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
            </div>
        </div>
    </form>
</div>