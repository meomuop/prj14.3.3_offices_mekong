<div id="body_content_right">
	{section name=bi loop=$obj_block_right}
	<div class="box_small">
		<div class="box_small_header" style=" background:url({$http_root}{$obj_owner[0]->site_capmenu}) repeat">
			{$obj_block_right[bi]->block_title}
		</div>
        <div class="box_small_content" style="border:1px solid {$obj_owner[0]->site_border}">
		{section name=mi loop=$obj_mod}
		{if $obj_block_right[bi]->module_id eq $obj_mod[mi]->mod_id and $obj_mod[mi]->mod_name eq 'cats'}
            <ul class="menu_main_list">
				{php}
                    $sql="select * from tbl_categories where cat_active = 1 and parent_id=0 and cat_id in(".$this->_tpl_vars['obj_block_right'][$this->_sections['bi']['index']]->item_id.")";
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
        {elseif $obj_block_right[bi]->module_id eq $obj_mod[mi]->mod_id and $obj_mod[mi]->mod_name eq 'config'}
			{section name=pi loop=$obj_owner}
				{$obj_owner[pi]->site_option02_text}
			{/section}
		{elseif $obj_block_right[bi]->module_id eq $obj_mod[mi]->mod_id and $obj_mod[mi]->mod_name eq 'advs'}
            <div style="width: 240px; height: 10px"></div>
            {php}
                $sql="select * from tbl_advs where adv_active = 1 and adv_id in(".$this->_tpl_vars['obj_block_right'][$this->_sections['bi']['index']]->item_id.")";
                if($this->_tpl_vars['obj_block_right'][$this->_sections['bi']['index']]->block_orderType == 1):
                	$sql .= "order by RAND(),adv_sort";
                elseif($this->_tpl_vars['obj_block_right'][$this->_sections['bi']['index']]->block_orderType == 2):
                	$sql .= "order by adv_sort";
                else:
                	$sql .= "order by adv_id desc";
                endif;
                $result = mysql_query($sql);
                if($result):
                while($row=mysql_fetch_array($result)):
            {/php}
            	<table width="100%" border="0" cellspacing="0" cellpadding="0">
				  <tr>
					<td align="center">
					{php}
                    	if($row['adv_types'] == 1):
                        if($row['adv_position'] == 1):
                    {/php}
                    <div id="ifm_lightbox" style="margin-left:0px">
					<a href="{$http_root}{php}echo str_replace('../','',$row['adv_logo']){/php}">
						<IMG src="{$http_root}{php}echo str_replace('../','',$row['adv_logo']){/php}" width="240" border="0" style="border:1px solid #ccc; padding:1px;"></a>
                    </div>
                    {php}else:{/php}
                    {php} if($row['adv_urlType'] == 1):{/php}
						<a href="{php}echo $this->_tpl_vars['http_root'].$row['adv_url']{/php}">
						<IMG src="{$http_root}{php}echo str_replace('../','',$row['adv_logo']){/php}" width="240" border="0" style="border:1px solid #ccc; padding:1px;"></a>
                    {php}else:{/php}
                        <a href="{php}echo $row['adv_url']{/php}">
						<IMG src="{$http_root}{php}echo str_replace('../','',$row['adv_logo']){/php}" width="240" border="0" style="border:1px solid #ccc; padding:1px;"></a>
                    {php}endif;{/php}
                        
                    {php}endif;{/php}
                    {php}elseif($row['adv_types'] == 2):{/php}
					<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="240" height="100">
					  <param name="movie" value="{$http_root}{php}echo str_replace('../','',$row['adv_logo']){/php}">
					  <param name="quality" value="high">
					  <embed src="{$http_root}{php}echo str_replace('../','',$row['adv_logo']){/php}" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="240" height="100"></embed>
					</object>
					{php}else:{/php}
                    	{php} if($row['adv_urlType'] == 1):{/php}
						<a href="{php}echo $this->_tpl_vars['http_root'].$row['adv_url']{/php}" class="text_tintuc_left"><div align="justify" style="width:180px; border:1px solid #ccc; padding:1px;">{php}echo fnsSubstr($row['adv_desc'],300,1){/php}</div></a>
                        {php}else:{/php}
                        <a href="{php}echo $row['adv_url']{/php}" class="text_tintuc_left"><div align="justify" style="width:180px; border:1px solid #ccc; padding:1px;">{php}echo fnsSubstr($row['adv_desc'],300,1){/php}</div></a>
                        {php}endif;{/php}
					{php}endif;{/php}
					</td>
				  </tr>
				  <tr><td height="10"></td></tr>
				</table>
            {php}
                endwhile;
                endif;
            {/php}
		{elseif $obj_block_right[bi]->module_id eq $obj_mod[mi]->mod_id and $obj_mod[mi]->mod_name eq 'news'}
        	{if $smarty.section.bi.index eq 0}
            {literal}
			<script type="text/javascript">
			$(function(){
				$('#news-container0').vTicker({ 
					speed: 500,
					pause: 5000,
					animation: 'fade',
					mousePause: false,
					showItems: 3
				});
			});
			</script>
            {/literal}
            {elseif $smarty.section.bi.index eq 2}
            {literal}
			<script type="text/javascript">
			$(function(){
				$('#news-container2').vTicker({ 
					speed: 500,
					pause: 5000,
					animation: 'fade',
					mousePause: false,
					showItems: 3
				});
			});
			</script>
            {/literal}
            {/if}
			<div id="news-container{$smarty.section.bi.index}" style="height:100px">
            <ul class="news">
				{php}
                    $sql="select * from tbl_news where news_active = 1 and news_id in(".$this->_tpl_vars['obj_block_right'][$this->_sections['bi']['index']]->item_id.")";
                    $result = mysql_query($sql);
                    if($result):
                    while($row=mysql_fetch_array($result)):
                    if( strlen($row['news_title']) < 100 ) 
                {/php}
				<li style="height:65px;">
					<div style="float:left; width:42px; text-align:left"><img src="{$http_root}{$obj_block_right[bi]->block_icon}" width="40px" /></div>&nbsp;<a href="{$http_root}News-details/{php} echo $row['cat_id']{/php}/{php} echo $row['news_id'].'/'.fnsUnUnicode(fnsSubstr($row['news_title'],100,0)).'.html'{/php}" >{php} echo fnsSubstr($row['news_title'],120,1){/php}</a>
				</li>
                {php}
                    endwhile;
                    endif;
                {/php}
			</ul>
            </div>
        {elseif $obj_block_right[bi]->module_id eq $obj_mod[mi]->mod_id and $obj_mod[mi]->mod_name eq 'docs'}
        	{literal}
			<script type="text/javascript">
			$(function(){
				$('#docs-container').vTicker({ 
					speed: 500,
					pause: 5000,
					animation: 'fade',
					mousePause: false,
					showItems: 3
				});
			});
			</script>
            {/literal}
			<div id="docs-container" style="height:100px">
            <ul class="news">
				{php}
                    $sql="select * from tbl_docs where doc_active = 1 and doc_id in(".$this->_tpl_vars['obj_block_right'][$this->_sections['bi']['index']]->item_id.")";
                    $result = mysql_query($sql);
                    if($result):
                    while($row=mysql_fetch_array($result)):
                    if( strlen($row['doc_code']) < 100 ) 
                {/php}
				<li style="height:80px;">
					<div style="float:left; width:42px; text-align:left"><img src="{$http_root}images/van_ban.png" width="40px" /></div>&nbsp;<a href="{$http_root}Document-details/{php} echo $row['doc_id'].'/'.fnsUnUnicode(fnsSubstr($row['doc_code'],100,0)).'.html'{/php}" ><b>{php} echo fnsSubstr($row['doc_code'],120,1){/php}</b></a><br />{php} echo fnsSubstr($row['doc_desc'],120,1){/php}
				</li>
                {php}
                    endwhile;
                    endif;
                {/php}
			</ul>
            </div>
        {elseif $obj_block_right[bi]->module_id eq $obj_mod[mi]->mod_id and $obj_mod[mi]->mod_name eq 'imgs'}
            <div class="slideshow" style="height:162px;">
                {section name=i loop=$obj_img}
                <a href="{$obj_img[i]->img_url}" target="_blank"><img border="0" src="{$http_root}{$obj_img[i]->img_path}" width="240" height="200" style="padding-left:2px; padding-top:2px;"/></a>
                {/section}
            </div>
		{elseif $obj_block_right[bi]->module_id eq $obj_mod[mi]->mod_id and $obj_mod[mi]->mod_name eq 'links'}
        	{if $obj_block_right[bi]->block_showType eq 1}
            <ul class="menu_main_list">
                 {php}
                    $sql="select * from tbl_links where link_active = 1 and link_id in(".$this->_tpl_vars['obj_block_right'][$this->_sections['bi']['index']]->item_id.")";
                    $result = mysql_query($sql);
                    if($result):
                    while($row=mysql_fetch_array($result)):
                 {/php}
                        <li class="main">
                            {php} if($row['link_urlType'] == 1):{/php}
                                <a href="{php}echo $this->_tpl_vars['http_root'].$row['link_url']{/php}">
                                {php}echo $row['link_name']{/php}</a>
                            {php}else:{/php}
                                <a href="{php}echo $row['link_url']{/php}">
                                {php}echo $row['link_name']{/php}</a>
                            {php}endif;{/php}
                        </li>
                 {php}
                    endwhile;
                    endif;
                 {/php}
			</ul>
            {else}
            {literal}
            <script language="javascript">
            	//function redirect_url(obj){
					//alert ( eval("document."+obj+".link_se.value;") );
					//if(eval("document."+obj+".link_se.value")!=0)
				//	window.open(eval("document."+obj+".link_se.value" ));
				//}
            </script>
            {/literal}
			<div style="height:30px">
            <form name="link_fr_r{$smarty.section.bi.index}" action="" method="post">
                <select name="link_se" class="site_para" style="width:240px; margin-top:5px" onchange="javascript: window.open(eval('this.value'));;">
                    <option value="0">Chọn liên kết</option>
                    {php}
                        $sql="select * from tbl_links where link_active = 1 and link_id in(".$this->_tpl_vars['obj_block_right'][$this->_sections['bi']['index']]->item_id.")";
                        $result = mysql_query($sql);
                        if($result):
                        while($row=mysql_fetch_array($result)):
                     {/php}
                     {php} if($row['link_urlType'] == 1):{/php}
                     	<option value="{php}echo $this->_tpl_vars['http_root'].$row['link_url']{/php}">{php}echo "- ".$row['link_name']{/php}</option>
                     {php}else:{/php}
                        <option value="{php}echo $row['link_url']{/php}">{php}echo "- ".$row['link_name']{/php}</option>
                     {php}endif;{/php}
                     {php}
                        endwhile;
                        endif;
                     {/php}
                 </select>
             </form>
             </div>
             {/if}
        {elseif $obj_block_right[bi]->module_id eq $obj_mod[mi]->mod_id and $obj_mod[mi]->mod_name eq 'vbcdcats'}
            {if $obj_block_right[bi]->block_typical eq 0}
			<ul class="menu_main_list">
                 {php}
                    $sql="select * from tbl_vbcdcat where vbcdcat_active = 1 and vbcdcat_id in(".$this->_tpl_vars['obj_block_right'][$this->_sections['bi']['index']]->item_id.") order by vbcdcat_sort";
                    $result = mysql_query($sql);
                    if($result):
                    while($row=mysql_fetch_array($result)):
                 {/php}
                        <li class="main">
                            <a href="{php}echo $this->_tpl_vars['http_root'].'VBCD/'.$row['vbcdcat_id'].'/'.fnsUnUnicode($row['vbcdcat_name']){/php}.html">
                            {php}echo $row['vbcdcat_name']{/php}</a>
                        </li>
                 {php}
                    endwhile;
                    endif;
                 {/php}
			</ul>
			{elseif $obj_block_right[bi]->block_typical eq 2}
			{literal}
			<script type="text/javascript">
			$(function(){
				$('#news-container').vTicker({ 
					speed: 500,
					pause: 5000,
					animation: 'fade',
					mousePause: false,
					showItems: 3
				});
			});
			</script>
            {/literal}
			<div id="news-container" style="height:100px">
            <ul class="news">
				{php}
					$sql1="select * from tbl_vbcdcat where vbcdcat_active = 1 and vbcdcat_id in(".$this->_tpl_vars['obj_block_right'][$this->_sections['bi']['index']]->item_id.") order by vbcdcat_sort";
                    $result1 = mysql_query($sql1);
                    if($result1):
                    $row1=mysql_fetch_array($result1);
					
                    $sql="select * from tbl_vbcds where vbcdcat_id = ".$row1['vbcdcat_id']." order by vbcd_id desc limit 10";
                    $result = mysql_query($sql);
                    if($result):
                    while($row=mysql_fetch_array($result)):
                {/php}
				<li style="height:80px;">
					<div style="float:left; width:42px; text-align:left">
					<img src="{$http_root}images/van_ban.png" width="40px" /></div>&nbsp;
					<a href="{php}echo $this->_tpl_vars['http_root'].'VBCD-details/'.$row['vbcdcat_id'].'/'.$row['vbcd_id'].'/'.fnsUnUnicode($row['vbcd_name']){/php}.html">
                            {php}echo $row['vbcd_name']{/php}<br>{php}echo fnsSubstr($row['vbcd_cont'],100,0){/php}</a>
				</li>
                {php}
                    endwhile;
                    endif;
					endif;
                {/php}
			</ul>
            </div>
			{/if}
        {elseif $obj_block_right[bi]->module_id eq $obj_mod[mi]->mod_id and $obj_mod[mi]->mod_name eq 'votes'}
        	{literal}
            <script language="javascript">
				function show_div(obj){
					if(obj==1){
						document.getElementById('securi_div').style.display='';
						document.getElementById('result_div').style.display='none';
					}else if(obj==3){
						document.getElementById('securi_div').style.display='none';
						document.getElementById('result_div').style.display='';
					}else{
						document.getElementById('securi_div').style.display='none';
						document.getElementById('result_div').style.display='none';
					}
				}
			</script>
            {/literal}
			<div id="news-container" style="height:155px" class="site_para">
            <form name="vote_fr" action="" method="post">
                <div id="securi_div" style="position:absolute; width:240px; height:120px; background-color:{$obj_owner[0]->site_insitebg}; display:none">
                	<div style="width: 240px; float: left; height: 60px; margin-left:20px; margin-top:5px">
                        <img id="siimage" align="left" style="padding-right: 5px; border: 0" src="{$http_root}security/securimage_show.php?sid=<?php echo md5(time()) ?>" />
                        <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0" width="19" height="19" id="SecurImage_as3" align="middle">
                            <param name="allowScriptAccess" value="sameDomain" />
                            <param name="allowFullScreen" value="false" />
                            <param name="movie" value="{$http_root}security/securimage_play.swf?audio=securimage_play.php&bgColor1=#777&bgColor2=#fff&iconColor=#000&roundedCorner=5" />
                            <param name="quality" value="high" />
                            <param name="bgcolor" value="#ffffff" />
                            <embed src="{$http_root}security/securimage_play.swf?audio=securimage_play.php&bgColor1=#777&bgColor2=#fff&iconColor=#000&roundedCorner=5" quality="high" bgcolor="#ffffff" width="19" height="19" name="SecurImage_as3" align="middle" allowScriptAccess="sameDomain" allowFullScreen="false" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
                        </object>
                        <br />
                        <a tabindex="-1" style="border-style: none" href="#" title="Refresh Image" onClick="document.getElementById('siimage').src = '{$http_root}security/securimage_show.php?sid=' + Math.random(); return false"><img src="{$http_root}security/images/refresh.gif" alt="Reload Image" border="0" onClick="this.blur()" align="bottom" width="20" height="19" /></a>
                    </div>
                    <div style="float:left; margin-left:20px">
                    Nhập mã bảo mật để bình chọn:<br />
                    <input type="text" name="security_code" size="8" />
                    <input type="submit" value="Tiếp >>" style="width:50px" />
                    </div>
                </div>
                <div id="result_div" style="position:absolute; width:240px; height:120px; background-color:{$obj_owner[0]->site_insitebg}; display:none">
                	{php}
                    $sql="select * from tbl_votecats where voteCat_active = 1 and voteCat_id in(".$this->_tpl_vars['obj_block_right'][$this->_sections['bi']['index']]->item_id.")";
                    $result = mysql_query($sql);
                    if($result):
                    while($row=mysql_fetch_array($result)):
                        
                        $sql_sum="select SUM(vote_count) as total_count from tbl_votes where voteCat_id = ".$row['voteCat_id']." and vote_active=1";
                        $result_sum = mysql_query($sql_sum);
                        $row_sum=mysql_fetch_array($result_sum);
                        
                    	$sql_vote="select * from tbl_votes where voteCat_id = ".$row['voteCat_id']." and vote_active=1";
                        $result_vote = mysql_query($sql_vote);
                        if($result_vote):
                 {/php}
                 		<table width="100%" border="0" cellspacing="0" cellpadding="0">
                         {php}
                         while($row_vote=mysql_fetch_array($result_vote)):
                         $item_percen = round(($row_vote['vote_count']*100)/$row_sum['total_count']);
                         {/php}
                          <tr>
                            <td align="left">
                            <div style="float:left; width:80px; height:30px; font-weight:bold">{php}echo $row_vote['vote_title']{/php}</div>
                            <div style="float:left; width:160px; height:30px"><hr style="float:left" size="10" width="{php}echo (($item_percen*5*100)/160){/php}" color="#0000FF" /></div>
                            </td>
                          </tr>
                          {php}
                          endwhile;
                          {/php}
                        </table>
                 {php}
                        endif;
                    endwhile;
                    endif;
                 {/php}
                </div>
                <div id="vote_div" style="width:240px">
                {php}
                    $sql="select * from tbl_votecats where voteCat_active = 1 and voteCat_id in(".$this->_tpl_vars['obj_block_right'][$this->_sections['bi']['index']]->item_id.")";
                    $result = mysql_query($sql);
                    if($result):
                    while($row=mysql_fetch_array($result)):
                    	echo "<div style='float:left; width:100%; height:40px'><b>".$row['voteCat_name']."</b></div>";
                        
                    	$sql_vote="select * from tbl_votes where voteCat_id = ".$row['voteCat_id']." and vote_active=1";
                        $result_vote = mysql_query($sql_vote);
                        if($result_vote):
                        $i=1;
                    	while($row_vote=mysql_fetch_array($result_vote)):
                        if($i==1):
                 {/php}
                       	<input type="radio" name="vote_id" value="{php}echo $row_vote['vote_id']{/php}" checked>&nbsp;
                       	{php}echo $row_vote['vote_title']{/php}<br />
                 {php}else:{/php}
                 	    <input type="radio" name="vote_id" value="{php}echo $row_vote['vote_id']{/php}">&nbsp;
                        {php}echo $row_vote['vote_title']{/php}<br />
                 {php}
                 		endif;
                 		$i++;
                        endwhile;
                        endif;
                 {/php}
                 		<div style=" float:left; color:#F00; height:8px; width:100%"></div>
                 		<input type="button" value="Bình chọn" onclick="show_div(1);" style="width:75px" />
                        <input type="reset" value="Kết quả" onclick="show_div(3);" style="width:75px" />
                        <input type="reset" value="Hủy" onclick="show_div(2);" style="width:75px" />
                        <br />
                        {if $msg neq ''}
                            <div style=" float:left; color:#F00; margin-top:5px">{$msg}</div>
                        {/if}
                 {php}
                    endwhile;
                    endif;
                 {/php}
                </div>
             </form>
            </div>
		{/if}
		{/section}
        </div>
	</div>
	{/section}
</div>