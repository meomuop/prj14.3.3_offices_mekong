<div id="body_content_center">
	{section name=bi loop=$obj_block_cont}
    {$obj_block_cont[bi]->typical}
	<div class="box_big">
		{section name=mi loop=$obj_mod}
        	{if $obj_block_cont[bi]->module_id eq $obj_mod[mi]->mod_id and $obj_mod[mi]->mod_name eq 'news'}
            	{if $obj_block_cont[bi]->block_typical eq 2}
                <div style="float:left; position:absolute; z-index:1; width:80px; height:18px; font-weight:bold; color:#930; text-transform:uppercase; padding-top:2px; background-color:{$obj_owner[0]->site_border}">
                    {$obj_block_cont[bi]->block_title}
                </div>
                {else}
                <div class="box_big_header" style=" background:url({$http_root}{$obj_owner[0]->site_capcont}) repeat">
                    {$obj_block_cont[bi]->block_title}
                </div>
                {/if}
                {if $obj_block_cont[bi]->block_data eq 1}
                {if $obj_block_cont[bi]->block_typical eq 1}
                <div class="box_big_content" style="border:1px solid {$obj_owner[0]->site_border}">
                	<div class="center_slide">
                        <div  style="float:left; width:280px; margin-left:6px;_margin-left:3px; cursor:pointer;"  id="show_link" >
                            <div class="slide_title" id="show_title" style=" height:30px"></div>
                            <div class="slide_img"><img id="show_img" src="" width="280" height="190" border="0" /></div>	
                            <div class="slide_summarise" id="show_summarise"> </div>
                        </div>
                        <div style="float:right; width:290px;">
                            <div class="slide_wait">
                                {php}
                                    $sql="select * from tbl_news where news_active = 1 and news_id in(".$this->_tpl_vars['obj_block_cont'][$this->_sections['bi']['index']]->item_id.")";
                                    $result = mysql_query($sql);
                                    if($result):
                                    $i=0;
                                    while($row=mysql_fetch_array($result)):
                                    if($i==0):
                                {/php}
                                <div class="one_slide"  onmouseover="click_tab({php}echo $i{/php})">
                                    <div style="float:left; padding-top:4px; padding-bottom:4px;">
                                    <input type="hidden" id="show_img{php}echo $i{/php}" value="{$http_root}{php} echo $row['news_image']{/php}">
                                    <img src="{$http_root}{php} echo str_replace('large_images','thumb_images',$row['news_image']){/php}" width="80" height="55" border="0"  style="float:left; margin:3px; border:#ddd 1PX solid;"/>
                                    <input type="hidden" id="show_title{php}echo $i{/php}" value="{php} echo $row['news_title']{/php}">
                                    <input type="hidden" id="show_link{php}echo $i{/php}" value="{$http_root}News-details/{php} echo $row['cat_id']{/php}/{php} echo $row['news_id'].'/'.fnsUnUnicode($row['news_title']).'.html'{/php}">
                                    <input type="hidden" id="show_summarise{php}echo $i{/php}" value="{php} echo str_replace('<p>','',fnsSubstr($row['news_des'],200,1)){/php}"></div><br />
                                    <a id="show_new0" class="site_para" style="cursor:pointer;"><span>{php} echo $row['news_title']{/php}</span></a>
                                    &nbsp; <em>({php} echo format_date($row['news_date'],2){/php})</em>
                                </div>   
                                {php}else:{/php}
                                <div style="" class="one_slide"  onmouseover="click_tab({php}echo $i{/php})">
                                    <div style="float:left; width:100%; height:1px; background:url(http:/socson.gov.vn/view/images/hr.jpg) repeat-x; _margin-bottom:-12px;"></div>
                                    <div style="float:left; padding-top:4px; padding-bottom:4px;">
                                    <input type="hidden" id="show_img{php}echo $i{/php}" value="{$http_root}{php} echo $row['news_image']{/php}">
                                    <img src="{$http_root}{php} echo str_replace('large_images','thumb_images',$row['news_image']){/php}" width="80" height="55" border="0"  style="float:left; margin:3px; border:#ddd 1PX solid;"/>
                                    <input type="hidden" id="show_title{php}echo $i{/php}" value="{php} echo $row['news_title']{/php}">
                                    <input type="hidden" id="show_link{php}echo $i{/php}" value="{$http_root}News-details/{php} echo $row['cat_id']{/php}/{php} echo $row['news_id'].'/'.fnsUnUnicode($row['news_title']).'.html'{/php}">
                                    <input type="hidden" id="show_summarise{php}echo $i{/php}" value="{php} echo str_replace('<p>','',fnsSubstr($row['news_des'],200,1)){/php}"></div><br />
                                    <a id="show_new{php}echo $i{/php}" class="site_para" style="cursor:pointer;"><span>{php} echo $row['news_title']{/php}</span></a>
                                    &nbsp; <em>({php} echo format_date($row['news_date'],2){/php})</em>
                                </div>    
                                {php}
                                	endif;
                                	$i++;
                                    endwhile;
                                    endif;
                                {/php}
                            </div>
                        </div>
                        <div class="bottom_slide"></div>
                        {literal}
                        <script language="javascript">
                            var index=0;
                            function remove_class()
                                {
                                    for(i=0;i<4;i++)
                                    $("#show_new"+i).removeClass("active");
                                }
                            function click_tab(id){
                                index=id;	
                                show_news(false);
                                }
                                
                            function show_news(kt)
                                {
                                    photo= $("#show_img"+index).val();
                                    title= $("#show_title"+index).val();
                                    url= $("#show_link"+index).val();
                                    summarise= $("#show_summarise"+index).val();
                                    $("#show_img").attr("src",photo);
                                    $("#show_title").html(title);
                                    $("#show_summarise").html(summarise);
                                    remove_class();	
                                    $("#show_new"+index).addClass("active");
                                    $("#show_link").click(function () {  
                                        document.location.href=url; 
                                    }); 
                                    if(kt==true)
                                    {
                                    index++;
                                    if(index==4)
                                        index=0;
                                    setTimeout("show_news(true)", 10000 );
                                    }
                                }
                                show_news(true);
                        </script>
                        {/literal}
                    </div>
                </div>
                {else}
                <div class="box_big_content" style="border:1px solid {$obj_owner[0]->site_border}">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        {php}
                            $sql="select * from tbl_news where news_active = 1 and news_id in(".$this->_tpl_vars['obj_block_cont'][$this->_sections['bi']['index']]->item_id.")";
                            $result = mysql_query($sql);
                            if($result):
                            while($row=mysql_fetch_array($result)):
                        {/php}
                        <tr>
                          {php}if ($row['news_image'] != ''):{/php}
                          <td align="left" width="25%" valign="top">
                          <a href="{$http_root}News-details/{php} echo $row['cat_id']{/php}/{php} echo $row['news_id'].'/'.fnsUnUnicode($row['news_title']).'.html'{/php}">
                          <img src="{$http_root}{php} echo str_replace('large_images','thumb_images',$row['news_image']){/php}" width="130" height="100" style="border:1px solid #ccc; padding:1px;" /></a>
                          </td>
                          <td align="left" valign="top" style="vertical-align:top">
                              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><a href="{$http_root}News-details/{php} echo $row['cat_id']{/php}/{php} echo $row['news_id'].'/'.fnsUnUnicode($row['news_title']).'.html'{/php}" class="cont_title">{php} echo $row['news_title']{/php}</a></td>
                                </tr>
                                <tr>
                                  <td class="site_para">{php} echo str_replace('<p>','',fnsSubstr($row['news_des'],400,1)){/php}</td>
                                </tr>
                              </table>
                          </td>
                          {php}else:{/php}
                          <td align="left" colspan="2" valign="top">
                              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><a href="{$http_root}details/{php} echo $row['cat_id']{/php}/{php} echo $row['news_id'].'/'.fnsUnUnicode($row['news_title']).'.html'{/php}" class="cont_title">{php} echo $row['news_title']{/php}</a></td>
                                </tr>
                                <tr>
                                  <td class="site_para"><div align="justify">{php} echo str_replace('<p>','',fnsSubstr($row['news_des'],400,1)){/php}</div></td>
                                </tr>
                              </table>
                          </td>
                          {php}endif;{/php}
                        </tr>
                        <tr height="10"><td></td></tr>
                        {php}
                            endwhile;
                            endif;
                        {/php}
                    </table>  
                </div>
                {/if}
                {else}
                {if $obj_block_cont[bi]->block_typical eq 2}
                <div class="box_big_content" style="border:1px solid {$obj_owner[0]->site_border}">
                    <marquee behavior="scroll"; direction="left"; scrollamount="3"; onmouseout="this.start();" onmouseover="this.stop()">
                    {section name=ni loop=$obj_news_home}
                    {if $smarty.section.ni.index neq $count_news_home}
                    <a href="{$http_root}News-details/{$obj_news_home[ni]->cat_id}/{$obj_news_home[ni]->news_id}/{$obj_news_home[ni]->news_title|format_ununicode:true}.html" class="cont_title">{$obj_news_home[ni]->news_title}</a>&nbsp;|&nbsp;
                    {else}
                    <a href="{$http_root}News-details/{$obj_news_home[ni]->cat_id}/{$obj_news_home[ni]->news_id}/{$obj_news_home[ni]->news_title|format_ununicode:true}.html" class="cont_title">{$obj_news_home[ni]->news_title}</a>
                    {/if}
                    {/section}
                    </marquee>
                </div>
                {/if}
                {/if} 
            {elseif $obj_block_cont[bi]->module_id eq $obj_mod[mi]->mod_id and $obj_mod[mi]->mod_name eq 'cats'}
            <div class="box_big_header" style=" background:url({$http_root}{$obj_owner[0]->site_capcont}) repeat">
                {$obj_block_cont[bi]->block_title}
            </div>
            <div class="box_big_content" style="border:1px solid {$obj_owner[0]->site_border}">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr height="5"><td></td></tr>
                        {php}
                        	if($this->_tpl_vars['obj_block_cont'][$this->_sections['bi']['index']]->block_type == 3):
                            $condi_str="order by news_id desc";
                            elseif($this->_tpl_vars['obj_block_cont'][$this->_sections['bi']['index']]->block_type == 2):
                            $condi_str=" and news_typical=1 order by news_sort asc";
                            else:
                            $condi_str="order by news_sort asc";
                            endif;
                            $sql="select * from tbl_news where news_active = 1 and cat_id in(".$this->_tpl_vars['obj_block_cont'][$this->_sections['bi']['index']]->item_id.") ".$condi_str." limit 4";
                            $result = mysql_query($sql);
                            if($result):
                            $row=mysql_fetch_array($result);
                        {/php}
                        <tr>
                          {php}
                          	if ($row['news_image'] != ''):
                          {/php}
                          <td align="left" valign="top" style="vertical-align:top" width="60%">
                              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td align="left" colspan="2">
                                    	<a href="{$http_root}News-details/{php} echo $row['cat_id']{/php}/{php} echo $row['news_id'].'/'.fnsUnUnicode($row['news_title']).'.html'{/php}" class="cont_title">{php} echo $row['news_title']{/php}</a>
                                    </td>
                                </tr>
                                <tr>
                                  <td align="left" width="25%" valign="top">
                                  <a href="{$http_root}News-details/{php} echo $row['cat_id']{/php}/{php} echo $row['news_id'].'/'.fnsUnUnicode($row['news_title']).'.html'{/php}">
                                  <img src="{$http_root}{php} echo str_replace('large_images','thumb_images',$row['news_image']){/php}" width="130" style="border:1px solid #ccc; padding:1px;" /></a>
                                  </td>
                                  <td class="site_para" style="vertical-align:top; text-align:justify; padding-left:2px">
                                  {php} echo str_replace('<p>','',fnsSubstr($row['news_des'],340,1)){/php}
                                  </td>
                                </tr>
                              </table>
                          </td>
                          {php}else:{/php}
                          <td align="left" valign="top" width="60%">
                              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><a href="{$http_root}News-details/{php} echo $row['cat_id']{/php}/{php} echo $row['news_id'].'/'.fnsUnUnicode($row['news_title']).'.html'{/php}" class="cont_title">{php} echo $row['news_title']{/php}</a></td>
                                </tr>
                                <tr>
                                  <td class="site_para"><div align="justify">{php} echo str_replace('<p>','',fnsSubstr($row['news_des'],400,1)){/php}</div></td>
                                </tr>
                              </table>
                          </td>
                          {php}endif;{/php}
                          <td>&nbsp;&nbsp;</td>
                          <td align="left" valign="top">
                              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                              	{php}while($row=mysql_fetch_array($result)):{/php}
                                <tr>
                                  <td>&nbsp;-&nbsp;</td>
                                  <td><a href="{$http_root}News-details/{php} echo $row['cat_id']{/php}/{php} echo $row['news_id'].'/'.fnsUnUnicode($row['news_title']).'.html'{/php}" class="text_other">{php} echo $row['news_title']{/php}</a>&nbsp;<em>{php} echo '('.date('d-m-Y',strtotime($row['news_date'])).')'{/php}</em>
                                  </td>
                                </tr>
                                {php}endwhile;{/php}
                              </table>
                          </td>
                        </tr>
                        <tr height="10" class="2"><td></td></tr>
                        {php}
                            endif;
                        {/php}
                    </table>  
                </div>
            {elseif $obj_block_cont[bi]->module_id eq $obj_mod[mi]->mod_id and $obj_mod[mi]->mod_name eq 'advs'}
                <div style="float:left; width:592px; text-align:left;">
                    {php}
                        $sql="select * from tbl_advs where adv_active = 1 and adv_id in(".$this->_tpl_vars['obj_block_cont'][$this->_sections['bi']['index']]->item_id.")";
                        $result = mysql_query($sql);
                        if($result):
                        while($row=mysql_fetch_array($result)):
                    {/php}
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td align="center">
                            {php}if($row['adv_types'] == 1):{/php}
                            <a href="{php}echo $row['adv_url']{/php}">
                                <img src="{$http_root}{php}echo str_replace('../','',$row['adv_logo']){/php}" width="594" border="0"></a>
                            {php}elseif($row['adv_types'] == 2):{/php}
                            <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http:/download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="594" height="90">
                              <param name="movie" value="{$http_root}{php}echo str_replace('../','',$row['adv_logo']){/php}">
                              <param name="quality" value="high">
                              <embed src="{$http_root}{php}echo str_replace('../','',$row['adv_logo']){/php}" quality="high" pluginspage="http:/www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="180" height="90"></embed>
                            </object>
                            {php}else:{/php}
                                <a href="{php}echo $row['adv_url']{/php}" class="text_tintuc_left"><div align="justify" style="width:580px; border:1px solid #ccc; padding:1px;">{php}echo fnsSubstr($row['adv_desc'],300,1){/php}</div></a>
                            {php}endif;{/php}
                            </td>
                          </tr>
                        </table>
                    {php}
                        endwhile;
                        endif;
                    {/php}    	
                </div>
            {/if}
        {/section}
	</div>
	{/section}
</div>