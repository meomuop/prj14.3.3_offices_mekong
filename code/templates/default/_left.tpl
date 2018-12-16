{literal}
<script language="javascript">
	function showsub(obj){
		if(document.getElementById('sub'+obj).style.display=='none')
		document.getElementById('sub'+obj).style.display='';
		else
		document.getElementById('sub'+obj).style.display='none';
	}
</script>
{/literal}

<div id="body_content_left">
	<div class="box_small">
		<div class="box_small_header" style=" background:url({$http_root}{$obj_owner[0]->site_capmenu}) repeat">
			Tìm kiếm
		</div>
        <div class="box_small_content" style="border:1px solid {$obj_owner[0]->site_border}">
        <form name="search_form" action="{$http_root}Search.html" method="post">
        	<div style="float:left; margin-top:4px; width:140px; text-align:center">				
                <input type="text" name="search_key" id="search_key"value="Search..." onfocus="this.value=''" onblur="javascript: if(this.value=='')this.value='Search...'" style="width:130px; height:15px; margin-left:5px; border:1px solid {$obj_owner[0]->site_border}; font-size:12px;" />				
            </div>
            <div style="float:left; margin-top:4px; margin-bottom:6px; width:40px; text-align:center"><img src="{$http_root}images/index_08.png" style="cursor:pointer; height:17px;; border:1px solid {$obj_owner[0]->site_border}" onClick="javascript: document.search_form.submit()"></div>
        </form>
        </div>
    </div>
	{section name=bi loop=$obj_block_left}
	<div class="box_small">
		<div class="box_small_header" style=" background:url({$http_root}{$obj_owner[0]->site_capmenu}) repeat">
			{$obj_block_left[bi]->block_title}
		</div>
        <div class="box_small_content" style="border:1px solid {$obj_owner[0]->site_border}">
		{section name=mi loop=$obj_mod}
		{if $obj_block_left[bi]->module_id eq $obj_mod[mi]->mod_id and $obj_mod[mi]->mod_name eq 'cats'}
			<ul class="menu_main_list">
            	{php}
                    $sql="select * from tbl_categories where cat_active = 1 and parent_id=0 and cat_id in(".$this->_tpl_vars['obj_block_left'][$this->_sections['bi']['index']]->item_id.")";
                    $result = mysql_query($sql);
                    if($result):
                    while($row=mysql_fetch_array($result)):
                    if( $row['cat_child'] == 1):
                {/php}
                        <li class="main">
                            <a href="javascript: void(0);" onclick="showsub({php}echo $row['cat_id']{/php})">{php}echo $row['cat_name']{/php}</a>
                        </li>
                        {php}
                            $sql_sub="select * from tbl_categories where cat_active = 1 and parent_id!=0 and cat_id in(".$this->_tpl_vars['obj_block_left'][$this->_sections['bi']['index']]->item_id.")";
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
                	<li class="main">
                        <a href="{$http_root}Category/{php}echo $row['cat_id'].'/'.fnsUnUnicode($row['cat_name']).'.html'{/php}">{php}echo $row['cat_name']{/php}</a>
                    </li>
                {php}
                 	endif;
                    endwhile;
                    endif;
                {/php}
			</ul>
		{elseif $obj_block_left[bi]->module_id eq $obj_mod[mi]->mod_id and $obj_mod[mi]->mod_name eq 'config'}
			{section name=pi loop=$obj_owner}
            	<div style="float:left; width:110px" class="site_para">Đang trực tuyến:</div>
                <div style="float:left; width:70px; text-align:right" class="site_para">{$user}</div>
                <div style="float:left; width:110px" class="site_para">Truy cập trong ngày:</div>
                <div style="float:left; width:70px; text-align:right" class="site_para">{$visit_day}</div>
                <div style="float:left; width:110px" class="site_para">Tổng số truy cập:</div>
                <div style="float:left; width:70px; text-align:right" class="site_para">{$visit_all|price_format}</div>
			{/section}
        {elseif $obj_block_left[bi]->module_id eq $obj_mod[mi]->mod_id and $obj_mod[mi]->mod_name eq 'imgs'}
            <div class="slideshow" style="height:162px;">
                {section name=i loop=$obj_img}
                <a href="{$obj_img[i]->img_url}" target="_blank"><img border="0" src="{$http_root}{$obj_img[i]->img_path}" width="182" height="160" style="padding-left:2px; padding-top:2px;"/></a>
                {/section}
            </div>
		{elseif $obj_block_left[bi]->module_id eq $obj_mod[mi]->mod_id and $obj_mod[mi]->mod_name eq 'advs'}
			{php}
                $sql="select * from tbl_advs where adv_active = 1 and adv_id in(".$this->_tpl_vars['obj_block_left'][$this->_sections['bi']['index']]->item_id.")";
                $result = mysql_query($sql);
                if($result):
                while($row=mysql_fetch_array($result)):
            {/php}
            	<table width="100%" border="0" cellspacing="0" cellpadding="0">
				  <tr>
					<td align="center">
					{php}if($row['adv_types'] == 1):{/php}
					<a href="{php}echo $row['adv_url']{/php}">
						<IMG src="{$http_root}{php}echo str_replace('../','',$row['adv_logo']){/php}" width="180" border="0" style="border:1px solid #ccc; padding:1px;"></a>
                    {php}elseif($row['adv_types'] == 2):{/php}
					<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="180" height="100">
					  <param name="movie" value="{$http_root}{php}echo str_replace('../','',$row['adv_logo']){/php}">
					  <param name="quality" value="high">
					  <embed src="{$http_root}{php}echo str_replace('../','',$row['adv_logo']){/php}" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="180" height="90"></embed>
					</object>
					{php}else:{/php}
						<a href="{php}echo $row['adv_url']{/php}" class="text_tintuc_left"><div align="justify" style="width:180px; border:1px solid #ccc; padding:1px;">{php}echo fnsSubstr($row['adv_desc'],300,1){/php}</div></a>
					{php}endif;{/php}
					</td>
				  </tr>
				  <tr><td height="10"></td></tr>
				</table>
            {php}
                endwhile;
                endif;
            {/php}
		{elseif $obj_block_left[bi]->module_id eq $obj_mod[mi]->mod_id and $obj_mod[mi]->mod_name eq 'news'}
			<ul class="menu_main_list">
            	{php}
                    $sql="select * from tbl_news where news_active = 1 and news_id in(".$this->_tpl_vars['obj_block_left'][$this->_sections['bi']['index']]->item_id.")";
                    $result = mysql_query($sql);
                    if($result):
                    while($row=mysql_fetch_array($result)):
                {/php}
				<li class="main">
					<span>{php} echo format_date($row['news_date'],2){/php}.</span><a href="{$http_root}News-details/{php} echo $row['cat_id']{/php}/{php} echo $row['news_id'].'/'.fnsUnUnicode($row['news_title']).'.html'{/php}" >{php} echo $row['news_title']{/php}</a>
				</li>
                {php}
                    endwhile;
                    endif;
                {/php}
			</ul>
		{elseif $obj_block_left[bi]->module_id eq $obj_mod[mi]->mod_id and $obj_mod[mi]->mod_name eq 'links'}
			{if $obj_block_left[bi]->block_showType eq 1}
            <ul class="menu_main_list">
                 {php}
                    $sql="select * from tbl_links where link_active = 1 and link_id in(".$this->_tpl_vars['obj_block_left'][$this->_sections['bi']['index']]->item_id.")";
                    $result = mysql_query($sql);
                    if($result):
                    while($row=mysql_fetch_array($result)):
                 {/php}
                        <li class="main">
                            <a href="{php}echo $row['link_url']{/php}">
                            {php}echo $row['link_name']{/php}</a>
                        </li>
                 {php}
                    endwhile;
                    endif;
                 {/php}
			</ul>
            {else}
            {literal}
            <script language="javascript">
            	function redirect_url(obj){
					//alert ( eval("document."+obj+".link_se.value;") );
					if(eval("document."+obj+".link_se.value")!=0)
					window.open(eval("document."+obj+".link_se.value" ));
				}
            </script>
            {/literal}
			<div style="height:30px">
            <form name="link_fr_l{$smarty.section.bi.index}" action="" method="post">
                <select name="link_se" class="site_para" style="width:180px; margin-top:5px" onchange="redirect_url('link_fr{$smarty.section.bi.index}');">
                    <option value="0">Chọn liên kết</option>
                    {php}
                        $sql="select * from tbl_links where link_active = 1 and link_id in(".$this->_tpl_vars['obj_block_left'][$this->_sections['bi']['index']]->item_id.")";
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
		{/if}
		{/section}
        </div>
	</div>
	{/section}
</div>
