

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center">
    	<table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td align="center"><img src="{$http_root}images/right_cap.gif" width="222" height="27" alt=""></td>
          </tr>
          <tr>
            <td background="{$http_root}images/Index_44.png">
            	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                  	<tr height="10"><td></td></tr>
                    {section name=i loop=$obj_support}
    				<tr>
                        <td style="padding:5px;" align="left" valign="middle">
                        <A href="ymsgr:sendIM?{$obj_support[i]->support_yahoo}">
                        <IMG src="http://opi.yahoo.com/online?u={$obj_support[i]->support_yahoo}&m=g&t=2" border="0"></A>	
                       </td>
     		 		</tr> 
                    <tr height="10"><td></td></tr>
                   	<tr>
                        <td style="padding:5px;" align="left" valign="middle">
                        <A href="skype:{$obj_support[i]->support_skype}">
                        <img src="http://mystatus.skype.com/smallclassic/{$obj_support[i]->support_skype}" width="123" border=0></A>
                        </td>
     		 		</tr>
					{/section}
                    <tr height="2"><td></td></tr>
                </table>
            </td>
          </tr>
        </table>
    </td>
  </tr>
  <tr>
    <td align="center">
    	<table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td align="center"><img src="{$http_root}images/Index_61.png" width="222" height="28" alt=""></td>
          </tr>
          <tr>
            <td align="center">
            	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                  	<tr height="10"><td></td></tr>
                    {section name=i loop=$obj_prd}
    				<tr>
                        <td align="center" valign="middle">
                        <A href="{$http_root}Chi-tiet-san-pham/{$obj_prd[i]->cat_id}/{$obj_prd[i]->prd_id}/{$obj_prd[i]->prd_name|format_ununicode:true}.html">
                        <IMG src="{$http_root}{$obj_prd[i]->prd_image}" width="210" border="0" style="border:1px solid #ccc; padding:1px;"></A><br />
                        <A href="{$http_root}Chi-tiet-san-pham/{$obj_prd[i]->cat_id}/{$obj_prd[i]->prd_id}/{$obj_prd[i]->prd_name|format_ununicode:true}.html" class="text_tintuc_left">{$obj_prd[i]->prd_name}</A>
                       </td>
     		 		</tr> 
                    <tr height="10"><td></td></tr>
					{/section}
                    <tr height="2"><td></td></tr>
                </table>
            </td>
          </tr>
        </table>
    </td>
  </tr>
</table>








<table width="193" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center">
    	<table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td align="center"><img src="{$http_root}images/Index_33.png" width="193" height="27" alt=""></td>
          </tr>
          {section name=i loop=$obj_catDeprj}
          <tr>
            <td align="left">&nbsp;<img src="{$http_root}images/SavedStar.png" border="0" width="10"/>&nbsp;
            	<a href="{$http_root}Tu-van/{$obj_catDeprj[i]->catDeprj_id}/{$obj_catDeprj[i]->catDeprj_name|format_ununicode:true}.html" class="text_menu_left">{$obj_catDeprj[i]->catDeprj_name}</a>
            </td>
          </tr>
          {/section}
        </table>
    </td>
  </tr>
  <tr height="10"><td></td></tr>
  <tr>
    <td align="center">
    	<table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td align="center"><img src="{$http_root}images/Index_56.png" width="193" height="27" alt=""></td>
          </tr>
          {section name=i loop=$obj_news}
          <tr>
            <td align="center">
            	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td align="left">&nbsp;<img src="{$http_root}images/SavedStar.png" border="0" width="10"/>&nbsp;</td>
                    <td align="left"><a href="{$http_root}Tin-tuc/{$obj_news[i]->news_id}/{$obj_news[i]->news_title|format_ununicode:true}.html" class="text_tintuc_left">{$obj_news[i]->news_title}</a>
                    </td>
                  </tr>
                </table>
            </td>
          </tr>
          {/section}
        </table>
    </td>
  </tr>
  <tr height="10"><td></td></tr>
  <tr>
    <td align="center">
    	{literal}
    	<script language='javascript'>  
			function showXosso()
			{
			newWindow = window.open('http://www.thanhnien.com.vn/_layouts/Xoso.aspx','b','width=500,height=540,scrollbars=1,left=262,top=114'); 
			}
			function showgiavang()
			{
			newWindow = window.open('http://www.thanhnien.com.vn/_layouts/giavang.aspx','c','width=600,height=365,scrollbars=1,left=212,top=201');                                                                            
			}
			function showlps()
			{
			newWindow = window.open('http://www.thanhnien.com.vn/_layouts/Lichphatsong.aspx','d','width=586,height=550,scrollbars=1,left=219,top=109');
			}
			function showNgoaiTe()
			{
			newWindow = window.open('http://www.thanhnien.com.vn/_layouts/NgoaiTe.aspx','v','width=600,height=460,scrollbars=1,left=212,top=154');
			}
			function showCKHN()
			{
			newWindow = window.open('http://www.thanhnien.com.vn/News/Services/CKTT.htm','u','width=1024,height=600,scrollbars=1,left=0,top=84');
			}
			function showCKTPHCM()
			{
			newWindow = window.open('http://www.thanhnien.com.vn/News/Services/CKTT.htm','s','width=1024,height=600,scrollbars=1,left=0,top=84');
   			}	
		</script>
        {/literal}
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td align="left"><a href="javascript:void(0)" onClick="showlps();" class="subcat_cap" style='cursor:pointer;'>Lịch phát sóng</a></td>
          </tr>
          <tr><td height="7"></td></tr>
		  <tr>
            <td align="left"><a href="javascript:void(0)" onClick="showCKTPHCM();" class="subcat_cap" style='cursor:pointer;'>Giá chứng khoán</a></td>
          </tr>
          <tr><td height="7"></td></tr>
          <tr>
            <td align="left"><a href="javascript:void(0)" onClick="showgiavang();" class="subcat_cap" style='cursor:pointer;'>Giá vàng</a></td>
          </tr>
          <tr><td height="7"></td></tr>
          <tr>
            <td align="left"><a href="javascript:void(0)" onClick="showNgoaiTe();" class="subcat_cap" style='cursor:pointer;'>Tỷ giá ngoại tệ</a></td>
          </tr>
          <tr><td height="7"></td></tr>
          <tr>
            <td><a href="javascript:window.external.AddFavorite(window.location, document.title);" class="subcat_cap">Add to favourite</a></td>
          </tr>
          <tr><td height="7"></td></tr>
        </table>
    </td>
  </tr>
  <tr>
    <td>
    	<table width="100%" bgcolor="#718488" border="0" cellspacing="0" cellpadding="0">
		  <tr>
            <td align="center"><img src="{$http_root}images/Index_84.png" width="193" height="27"></td>
          </tr>
          <tr>
            <td class="text_thongke" align="center">
            	{literal}
				<!-- Histats.com  START  -->
				<a href="http://www.histats.com" target="_blank" title="website page counter" ><script  type="text/javascript" language="javascript">
				var s_sid = 820222;var st_dominio = 4;
				var cimg = 406;var cwi =165;var che =100;
				</script></a>
				<script  type="text/javascript" language="javascript" src="http://s10.histats.com/js9.js"></script>
				<noscript><a href="http://www.histats.com" target="_blank">
				<img  src="http://s4.histats.com/stats/0.gif?820222&1" alt="website page counter" border="0"></a>
				</noscript>
				<!-- Histats.com  END  -->
                {/literal}
			</td>
          </tr>          
          <tr><td height="7"></td></tr>
        </table>
    </td>
  </tr>
  <tr><td height="20"></td></tr>
  <tr>
  	<td align="center">
    	<table width="100%" border="0" cellspacing="0" cellpadding="0">
          {section name=i loop=$obj_adv}
          <tr>
            <td align="center">
            	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td align="center">
                    {if $obj_adv[i]->adv_types eq 1}
                    <A href="{$obj_adv[i]->adv_url}">
                        <IMG src="{$http_root}{$obj_adv[i]->adv_logo|replace:'../':''}" width="180" height="100" border="0" style="border:1px solid #ccc; padding:1px;"></A>
                    {elseif $obj_adv[i]->adv_types eq 2}
                    <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="180" height="100">
                      <param name="movie" value="{$http_root}{$obj_adv[i]->adv_logo|replace:'../':''}">
                      <param name="quality" value="high">
                      <embed src="{$http_root}{$obj_adv[i]->adv_logo|replace:'../':''}" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="180" height="90"></embed>
                    </object>
                    {else}
                    	<A href="{$obj_adv[i]->adv_url}" class="text_tintuc_left"><div align="justify" style="width:180px; border:1px solid #ccc; padding:1px;">{$obj_adv[i]->adv_desc|truncate:300:"..."}</div></A>
                    {/if}
                    </td>
                  </tr>
                  <tr><td height="10"></td></tr>
                </table>
            </td>
          </tr>
          {/section}
        </table>
    </td>
  </tr>
</table>
