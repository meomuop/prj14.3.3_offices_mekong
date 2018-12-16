<div id="body_content_center">
    <div class="box_big">
        <div class="box_big_header" style=" background:url({$http_root}{$obj_owner[0]->site_capcont}) repeat">
            <div style="float:left; width:400px">Sơ đồ trang thông tin</div>
            <div style="float:left; text-align:right; width:175px; margin-top:4px;">&nbsp;</div>
        </div>
        <div class="box_big_content" style=" text-align:justify; border:1px solid {$obj_owner[0]->site_border}">
            <div style="float:left; width:590px; height:10px"></div>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left" width="23%" style="vertical-align:middle;">
                	<div style="float:left; width:120px; border-left:1px dashed #000; border-bottom:1px dashed #000; margin-top:3px; padding-left:5px"><b>Giao diện chính</b></div>
                </td>
                <td align="left">
                	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                      	<td align="left" width="30%" style="vertical-align:bottom">
                        <div style=" float:left; height:90px; border-left:1px dashed #000; width:5px"></div>
                        <div style="float:left; width:120px; border-bottom:1px dashed #000"><b>Thực đơn ngang</b></div></td>
                        <td align="left" style="border-left:1px dashed #000;">
                            <ul style="padding-left:5px; line-height:22px">
                                {section name=bi loop=$obj_block_top}
                                    {section name=mi loop=$obj_mod}
                                        {if $obj_block_top[bi]->module_id eq $obj_mod[mi]->mod_id and $obj_mod[mi]->mod_name eq 'links'}
                                            {php}
                                                $sql="select * from tbl_links where link_id in(".$this->_tpl_vars['obj_block_top'][$this->_sections['bi']['index']]->item_id.")";
                                                $result = mysql_query($sql);
                                                if($result):
                                                while($row=mysql_fetch_array($result)):
                                             {/php}
                                                    <li>
                                                        ----&nbsp;<a class="cont_title" href="{php}echo $this->_tpl_vars['http_root'].$row['link_url']{/php}">
                                                        {php}echo $row['link_name']{/php}</a>
                                                    </li>
                                             {php}
                                                endwhile;
                                                endif;
                                             {/php}
                                        {/if}
                                    {/section}
                                {/section}
                            </ul>
                        </td>
                      </tr>
                      <tr height="10"><td style="border-left:1px dashed {$obj_owner[0]->site_insitebg}" colspan="2"></td></tr>
                      <tr>
                      	<td align="left" style="vertical-align:middle; background-image:url({$http_root}images/sitemap_bg.png)" valign="middle">
                        <div style=" float:left; height:150px; width:5px"></div>
                        <div style="float:left; width:120px; margin-top:50px; border-bottom:1px dashed #000"><b>Thực đơn trái</b></div></td>
                        <td align="left" style="border-left:1px dashed #000;">
                            {literal}
                            <script language="javascript">
                                function showsub(obj){
                                    if(document.getElementById('sub'+obj).style.display=='none')
                                    document.getElementById('sub'+obj).style.display='';
                                    else
                                    document.getElementById('sub'+obj).style.display='none';
                                }
                            </script>
                            
                            <script language="javascript">
                                function showcap(obj){
                                    if(document.getElementById('cap_'+obj).style.display=='none')
                                    document.getElementById('cap_'+obj).style.display='';
                                    else
                                    document.getElementById('cap_'+obj).style.display='none';
                                }
                            </script>
                            {/literal}
                            
                            <div id="body_content_left" style="padding-left:5px">
                                {section name=bi loop=$obj_block_left}
                                <div class="box_small">
                                    <div style="float:left; width:580px; text-align:left;">
                                        ----&nbsp;<a class="cont_title" href="javascript: void(0);" onclick="showcap({$smarty.section.bi.index})">{$obj_block_left[bi]->block_title}</a>
                                    </div>
                                    <div class="box_small_content" id="cap_{$smarty.section.bi.index}" style="display:none; padding-left:40px">
                                    {section name=mi loop=$obj_mod}
                                    {if $obj_block_left[bi]->module_id eq $obj_mod[mi]->mod_id and $obj_mod[mi]->mod_name eq 'cats'}
                                        <ul>
                                            {php}
                                                $sql="select * from tbl_categories where parent_id=0 and cat_id in(".$this->_tpl_vars['obj_block_left'][$this->_sections['bi']['index']]->item_id.")";
                                                $result = mysql_query($sql);
                                                if($result):
                                                while($row=mysql_fetch_array($result)):
                                                if( $row['cat_child'] == 1):
                                            {/php}
                                                    <li style="border-left:1px dashed #000">
                                                        ----&nbsp;<a class="text_other" href="javascript: void(0);" onclick="showsub({php}echo $row['cat_id']{/php})">{php}echo $row['cat_name']{/php}</a>
                                                    </li>
                                                    {php}
                                                        $sql_sub="select * from tbl_categories where parent_id!=0 and cat_id in(".$this->_tpl_vars['obj_block_left'][$this->_sections['bi']['index']]->item_id.")";
                                                        $result_sub = mysql_query($sql_sub);
                                                        if($result_sub):
                                                        while($row_sub=mysql_fetch_array($result_sub)):
                                                        if( $result_sub['parent_id'] == $row['cat_id']):
                                                    {/php}
                                                         <li id="sub{$obj_cat[i]->cat_id}" style="display:none; border-left:1px dashed #000">
                                                            <ul>
                                                                <li style="margin-left:15px">
                                                                    ----&nbsp; <a class="text_other" href="{$http_root}Category/{php}echo $result_sub['cat_id'].'/'.fnsUnUnicode($result_sub['cat_name']).'.html'{/php}">{php}echo $result_sub['cat_name']{/php}</a>
                                                                </li>
                                                            </ul>
                                                        </li>
                                                    {php}
                                                        endif;
                                                        endwhile;
                                                        endif;
                                                    {/php}
                                            {php}
                                                else:
                                            {/php}
                                                <li style="border-left:1px dashed #000">
                                                    ----&nbsp;<a class="text_other" href="{$http_root}Category/{php}echo $row['cat_id'].'/'.fnsUnUnicode($row['cat_name']).'.html'{/php}">{php}echo $row['cat_name']{/php}</a>
                                                </li>
                                            {php}
                                                endif;
                                                endwhile;
                                                endif;
                                            {/php}
                                        </ul>
                                    {elseif $obj_block_left[bi]->module_id eq $obj_mod[mi]->mod_id and $obj_mod[mi]->mod_name eq 'config'}
                                        {section name=pi loop=$obj_owner}
                                            <div style="float:left; width:210px;">
                                            <div style="float:left; border-left:1px dashed #000; width:130px; text-align:left" class="site_para">----&nbsp;Đang trực tuyến:</div>
                                            <div style="float:left; width:70px; text-align:right" class="site_para">{$user}</div>
                                            <div style="float:left; border-left:1px dashed #000; width:130px; text-align:left" class="site_para">----&nbsp;Truy cập trong ngày:</div>
                                            <div style="float:left; width:70px; text-align:right" class="site_para">{$visit_day}</div>
                                            <div style="float:left; border-left:1px dashed #000; width:130px; text-align:left" class="site_para">----&nbsp;Tổng số truy cập:</div>
                                            <div style="float:left; width:70px; text-align:right" class="site_para">{$visit_all|price_format}</div>
                                            </div>
                                        {/section}
                                    {elseif $obj_block_left[bi]->module_id eq $obj_mod[mi]->mod_id and $obj_mod[mi]->mod_name eq 'news'}
                                        <ul class="menu_main_list">
                                            {php}
                                                $sql="select * from tbl_news where news_id in(".$this->_tpl_vars['obj_block_left'][$this->_sections['bi']['index']]->item_id.")";
                                                $result = mysql_query($sql);
                                                if($result):
                                                while($row=mysql_fetch_array($result)):
                                            {/php}
                                            <li class="main">
                                                <span>{php} echo format_date($row['news_date'],2){/php}.</span><a class="text_other" href="{$http_root}News-details/{php} echo $row['cat_id']{/php}/{php} echo $row['news_id'].'/'.fnsUnUnicode($row['news_title']).'.html'{/php}" >{php} echo $row['news_title']{/php}</a>
                                            </li>
                                            {php}
                                                endwhile;
                                                endif;
                                            {/php}
                                        </ul>
                                    {elseif $obj_block_left[bi]->module_id eq $obj_mod[mi]->mod_id and $obj_mod[mi]->mod_name eq 'advs'}
                                        {php}
                                            $sql="select * from tbl_advs where adv_id in(".$this->_tpl_vars['obj_block_left'][$this->_sections['bi']['index']]->item_id.")";
                                            $result = mysql_query($sql);
                                            if($result):
                                            while($row=mysql_fetch_array($result)):
                                        {/php}
                                            <ul>
                                                <li style="border-left:1px dashed #000">
                                                        ----&nbsp;<a href="{php}echo $row['adv_url']{/php}">
                                                    {php}echo $row['adv_name']{/php}</a>
                                                </li>
                                            </ul>
                                        {php}
                                            endwhile;
                                            endif;
                                        {/php}
                                    {elseif $obj_block_left[bi]->module_id eq $obj_mod[mi]->mod_id and $obj_mod[mi]->mod_name eq 'links'}
                                        <ul>
                                             {php}
                                                $sql="select * from tbl_links where link_id in(".$this->_tpl_vars['obj_block_left'][$this->_sections['bi']['index']]->item_id.")";
                                                $result = mysql_query($sql);
                                                if($result):
                                                while($row=mysql_fetch_array($result)):
                                             {/php}
                                                    <li style="border-left:1px dashed #000">
                                                    ----&nbsp;<a class="text_other" href="{php}echo $row['link_url']{/php}">
                                                        {php}echo $row['link_name']{/php}</a>
                                                    </li>
                                             {php}
                                                endwhile;
                                                endif;
                                             {/php}
                                        </ul>
                                    {/if}
                                    {/section}
                                    </div>
                                </div>
                                {/section}
                            </div>
                        </td>
                      </tr>
                      <tr height="10"><td style="border-left:1px dashed {$obj_owner[0]->site_insitebg}" colspan="2"></td></tr>
                      <tr>
                      	<td align="left" style="vertical-align:top">
                        <div style=" float:left; height:65px; border-left:1px dashed #000; width:5px"></div>
                        <div style="float:left; width:120px; margin-top:50px; border-bottom:1px dashed #000"><b>Thực đơn phải</b></div></td>
                        <td align="left" style="border-left:1px dashed #000;">
                            {literal}
                            <script language="javascript">
                                function showsub(obj){
                                    if(document.getElementById('sub'+obj).style.display=='none')
                                    document.getElementById('sub'+obj).style.display='';
                                    else
                                    document.getElementById('sub'+obj).style.display='none';
                                }
                            </script>
                            
                            <script language="javascript">
                                function showcapright(obj){
                                    if(document.getElementById('capright_'+obj).style.display=='none')
                                    document.getElementById('capright_'+obj).style.display='';
                                    else
                                    document.getElementById('capright_'+obj).style.display='none';
                                }
                            </script>
                            {/literal}
                            
                            <div id="body_content_left" style="padding-left:5px">
                                {section name=bi loop=$obj_block_right}
                                <div class="box_small">
                                    <div style="float:left; width:580px; text-align:left;">
                                        ----&nbsp;<a class="cont_title" href="javascript: void(0);" onclick="showcapright({$smarty.section.bi.index})">{$obj_block_right[bi]->block_title}</a>
                                    </div>
                                    <div class="box_small_content" id="capright_{$smarty.section.bi.index}" style="display:none; padding-left:40px">
                                    {section name=mi loop=$obj_mod}
                                    {if $obj_block_right[bi]->module_id eq $obj_mod[mi]->mod_id and $obj_mod[mi]->mod_name eq 'cats'}
                                        <ul>
                                            {php}
                                                $sql="select * from tbl_categories where parent_id=0 and cat_id in(".$this->_tpl_vars['obj_block_right'][$this->_sections['bi']['index']]->item_id.")";
                                                $result = mysql_query($sql);
                                                if($result):
                                                while($row=mysql_fetch_array($result)):
                                                if( $row['cat_child'] == 1):
                                            {/php}
                                                    <li style="border-left:1px dashed #000">
                                                        ----&nbsp;<a class="text_other" href="javascript: void(0);" onclick="showsub({php}echo $row['cat_id']{/php})">{php}echo $row['cat_name']{/php}</a>
                                                    </li>
                                                    {php}
                                                        $sql_sub="select * from tbl_categories where parent_id!=0 and cat_id in(".$this->_tpl_vars['obj_block_left'][$this->_sections['bi']['index']]->item_id.")";
                                                        $result_sub = mysql_query($sql_sub);
                                                        if($result_sub):
                                                        while($row_sub=mysql_fetch_array($result_sub)):
                                                        if( $result_sub['parent_id'] == $row['cat_id']):
                                                    {/php}
                                                         <li id="sub{$obj_cat[i]->cat_id}" style="display:none">
                                                            <ul>
                                                                <li style="margin-left:15px">
                                                                    -&nbsp; <a href="{$http_root}Category/{php}echo $result_sub['cat_id'].'/'.fnsUnUnicode($result_sub['cat_name']).'.html'{/php}">{php}echo $result_sub['cat_name']{/php}</a>
                                                                </li>
                                                            </ul>
                                                        </li>
                                                    {php}
                                                        endif;
                                                        endwhile;
                                                        endif;
                                                    {/php}
                                            {php}
                                                else:
                                            {/php}
                                                <li style="border-left:1px dashed #000">
                                                        ----&nbsp;<a class="text_other"  href="{$http_root}Category/{php}echo $row['cat_id'].'/'.fnsUnUnicode($row['cat_name']).'.html'{/php}">{php}echo $row['cat_name']{/php}</a>
                                                </li>
                                            {php}
                                                endif;
                                                endwhile;
                                                endif;
                                            {/php}
                                        </ul>
                                    {elseif $obj_block_right[bi]->module_id eq $obj_mod[mi]->mod_id and $obj_mod[mi]->mod_name eq 'config'}
                                        {section name=pi loop=$obj_owner}
                                            {$obj_owner[pi]->site_option02_text}
                                        {/section}
                                    {elseif $obj_block_right[bi]->module_id eq $obj_mod[mi]->mod_id and $obj_mod[mi]->mod_name eq 'advs'}
                                        {php}
                                            $sql="select * from tbl_advs where adv_id in(".$this->_tpl_vars['obj_block_right'][$this->_sections['bi']['index']]->item_id.")";
                                            $result = mysql_query($sql);
                                            if($result):
                                            while($row=mysql_fetch_array($result)):
                                        {/php}
                                            <ul>
                                                <li style="border-left:1px dashed #000">
                                                        ----&nbsp;<a href="{php}echo $row['adv_url']{/php}">
                                                    {php}echo $row['adv_name']{/php}</a>
                                                </li>
                                            </ul>
                                        {php}
                                            endwhile;
                                            endif;
                                        {/php}
                                    {elseif $obj_block_right[bi]->module_id eq $obj_mod[mi]->mod_id and $obj_mod[mi]->mod_name eq 'links'}
                                        {literal}
                                        <script language="javascript">
                                            function redirect_url(){
                                                if(document.link_fr.link_se.value!=0)
                                                window.open(document.link_fr.link_se.value);
                                            }
                                        </script>
                                        {/literal}
                                        <div style="height:30px">
                                        <form name="link_fr" action="" method="post">
                                            <select name="link_se" class="site_para" style="width:185px; margin-top:5px" onchange="redirect_url();">
                                                <option value="0">Chọn liên kết</option>
                                                {php}
                                                    $sql="select * from tbl_links where link_id in(".$this->_tpl_vars['obj_block_right'][$this->_sections['bi']['index']]->item_id.")";
                                                    $result = mysql_query($sql);
                                                    if($result):
                                                    while($row=mysql_fetch_array($result)):
                                                 {/php}
                                                 <option value="{php}echo $row['link_url']{/php}">{php}echo "- ".$row['link_name']{/php}</option>
                                                 {php}
                                                    endwhile;
                                                    endif;
                                                 {/php}
                                             </select>
                                         </form>
                                        </div>
                                    {/if}
                                    {/section}
                                    </div>
                                </div>
                                {/section}
                            </div>
                        </td>
                      </tr>
                    </table>
                </td>
              </tr>
            </table>
            <div style="float:left; width:590px; height:10px"></div>
        </div>
    </div>
</div>