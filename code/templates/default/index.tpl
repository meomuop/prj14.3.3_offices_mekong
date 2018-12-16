{include file='default/_headercomon.tpl'}
<body style=" background-color:{$obj_owner[0]->site_outsitebg}" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	<center>
    	{if $obj_owner[0]->site_active eq 0}
        	{$obj_owner[0]->site_inactive_info}
        {else}
        <div id="wrapper" style="background-color:{$obj_owner[0]->site_insitebg}">
            	{include file='default/_headerpage.tpl'}
                <div class="clear"></div>
                <div id="body_content">
                    {include file='default/_left.tpl'}
                    {if $act eq 1}
                    {include file='default/sitemap.tpl'}
                    {else}
                    {include file='default/_content.tpl'}
                    {/if}
                    {include file='default/_right.tpl'}
                </div>
                <div class="clear"></div>
				{include file='default/_footerpage.tpl'}
            </div>
        </div>
        {/if}
    </center>
</body>
</html>