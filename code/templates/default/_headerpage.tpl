<div id="header">
	<img src="{$http_root}{$obj_owner[0]->site_banner}" style="width:1000px" border="0" />
</div>
<div id="body">
	<div id="menu_top" style=" background:url({$http_root}{$obj_owner[0]->site_tabmenu}) repeat">
		<div style="float:left; width:80%">
        <ul class="menu_top_main">
			{section name=bi loop=$obj_block_top}
				{section name=mi loop=$obj_mod}
					{if $obj_block_top[bi]->module_id eq $obj_mod[mi]->mod_id and $obj_mod[mi]->mod_name eq 'links'}
						{php}
							$sql="select * from tbl_links where link_active = 1 and link_id in(".$this->_tpl_vars['obj_block_top'][$this->_sections['bi']['index']]->item_id.")";
                            $result = mysql_query($sql);
                            if($result):
                            while($row=mysql_fetch_array($result)):
                         {/php}
								<li class="menu_top_main_i">
									<a href="{php}echo $this->_tpl_vars['http_root'].$row['link_url']{/php}">
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
        </div>
        <div style="float:left; width:20%; padding-top:3px" class="site_para"><b>Ngày&nbsp;{php}echo date('d-m-Y'){/php}</b></div>
	</div>
    <div style="width:1000px; float:left; background:url({$http_root}images/i_17.jpg) repeat; height:16px"></div>
