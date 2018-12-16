<div id="menu_bottom" style=" background:url({$http_root}{$obj_owner[0]->site_footer}) repeat">
	<div class="menu_bottom_left">
		<ul class="menu_bottom_left_main">
			{section name=bi loop=$obj_block_top}
				{section name=mi loop=$obj_mod}
					{if $obj_block_top[bi]->module_id eq $obj_mod[mi]->mod_id and $obj_mod[mi]->mod_name eq 'links'}
						{php}
							$sql="select * from tbl_links where link_active = 1 and link_id in(".$this->_tpl_vars['obj_block_top'][$this->_sections['bi']['index']]->item_id.")";
                            $result = mysql_query($sql);
                            if($result):
                            while($row=mysql_fetch_array($result)):
                         {/php}
								<li>
									<a href="{php}echo $this->_tpl_vars['http_root'].$row['link_url']{/php}">
                                    {php}echo $row['link_name']{/php}</a>
								</li>
                                <li>&nbsp;</li>
                         {php}
                            endwhile;
                            endif;
						 {/php}
					{/if}
				{/section}
			{/section}
		</ul>
	</div>
    <div style="float:left; width:900px; text-align:left">{$obj_owner[0]->owner_name}<br />{$obj_owner[0]->site_option_text}</div>
</div>
