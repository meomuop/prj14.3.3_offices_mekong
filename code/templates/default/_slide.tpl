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
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="left">
    	<div class="header_auto">
            <div class="slideshow">
            	{section name=i loop=$obj_img}
                <img src="{$http_root}{$obj_img[i]->img_path}" width="739" height="258" style="border:1px solid #CCF; padding:1px"/>
                {/section}
            </div>
        </div>
    </td>
    <td align="right" width="20%" valign="top" style="border:1px solid #CCF; background-color:#812121">
    	<table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td align="center" valign="top"><img src="{$http_root}images/mainmenu_cap.gif" width="222" height="25" alt=""></td>
          </tr>
          {section name=i loop=$obj_cat}
          	  {if $obj_cat[i]->cat_child eq 1}
              <tr>
                <td align="left" class="main_menu_bg"><a href="javascript: void(0);" onclick="showsub({$obj_cat[i]->cat_id})" class="main_menu">{$obj_cat[i]->cat_name}</a></td>
              </tr>
              {else}
              <tr>
                <td align="left" class="main_menu_bg"><a href="{$http_root}San-pham/{$obj_cat[i]->cat_id}/{$obj_cat[i]->cat_name|format_ununicode:true}.html" class="main_menu">{$obj_cat[i]->cat_name}</a></td>
              </tr>
              {/if}
              <tr id="sub{$obj_cat[i]->cat_id}" style="display:none">
              	<td>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        {section name=si loop=$obj_subcat}
                        {if $obj_subcat[si]->parent_id eq $obj_cat[i]->cat_id}
                        <tr>
                          <td align="left" class="main_submenu_bg"><a href="{$http_root}San-pham/{$obj_subcat[si]->cat_id}/{$obj_subcat[si]->cat_name|format_ununicode:true}.html" class="main_submenu">-{$obj_subcat[si]->cat_name}</a></td>
                        </tr>
                        {/if}
                        {/section}
                    </table>
                </td>
              </tr>
          {/section}
        </table>
    </td>
  </tr>
</table>
