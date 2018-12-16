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
<div id="add_edit_dl_content_insign">
	<form method="post" name="frmList_Dl" action="?addEditDL{$vars.arg}" id="frmList_Dl">
    <!------------------------------------------THEM MOI------------------------------------>
    <fieldset style="width:380px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
        <legend class="legend_middle">Chi tiết tin nhắn:</legend>
    	<table width="95%" class="adminlist">
        	<tr height="30">
                <td align="center" valign="top">
                    <div style="float:left; width:380px">
                        <div style="float:left; width:65px; line-height:25px; text-align:left">Người gửi:</div>
                        <div style="float:left; width:120px; line-height:25px; text-align:left">
                            {section name=ui loop=$obj_list_user_sent}
                            	{$obj_list_user_sent[ui]->user_fullname}
                            {/section}
                        </div>
                        <div style="float:left; width:65px; line-height:25px; text-align:left">Ngày gửi:</div>
                        <div style="float:left; width:120px; line-height:25px; text-align:left">
                            {$vars.msg_date|date_format:"%d/%m/%Y"}
                        </div>
                    </div>
                </td>
            </tr>
            <tr height="30">
                <td align="center">
                    <div style="float:left; width:380px">
                        <div style="float:left; width:65px; line-height:25px; text-align:left">Nội dung:</div>
                        <div style="float:left; width:310px; line-height:25px; text-align:left; height:60px; overflow-y:scroll">
                            {$vars.msg_cont}
                        </div>
                    </div>
                </td>
            </tr>
            <tr height="30">
                <td align="center">
                    <div style="float:left; width:380px">
                        <div style="float:left; width:65px; line-height:25px; text-align:left">Người nhận:</div>
                        <div style="float:left; width:310px; line-height:25px; text-align:left; height:60px; overflow-y:scroll">
                            {section name=ui loop=$obj_list_user}
                                <div style="float:left; width:140px">
                                -&nbsp;{$obj_list_user[ui]->user_fullname}
                                </div>
                            {/section}
                        </div>
                    </div>
                </td>
            </tr>
         </table>
    </fieldset>
    </form>
</div>