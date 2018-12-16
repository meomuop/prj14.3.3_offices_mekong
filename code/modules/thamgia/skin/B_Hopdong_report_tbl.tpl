{literal}
<script type="text/javascript" language="javascript">
function ClickHereToPrint(){
	try{
		var oIframe = document.getElementById('ifrmPrint');
		var oContent = document.getElementById('divToPrint').innerHTML;
		var oDoc = (oIframe.contentWindow || oIframe.contentDocument);
		if (oDoc.document) oDoc = oDoc.document;
		oDoc.write("<head><title>Trang in</title>");
		oDoc.write("</head><body onload='this.focus(); this.print();'>");
		oDoc.write(oContent + "</body>");
		oDoc.close();
	}catch(e){
		self.print();
	}
}
</script>
{/literal}
<div id="divToPrint">
<form method="post" name="frmList" action="?expHopdongReport{$vars.arg}" id="frmList" target="_blank">
<div style="padding-bottom: 3px; ">
<table class="adminlist" width="1500" border="0" cellpadding="0" cellspacing="0">
	<tbody>
	<tr>
		<td style="font-family: Arial; color:#930; font-size: 16px; font-weight: bold;">
        	<div align="left">
            <img src="../images/admin/module.png" align="absmiddle" height="30">
            &nbsp;Báo cáo thông kê tình hình xử lý hợp đồng
            </div>
        </td>
     </tr>
     <tr>	
        <td>
        	<div style="text-align: left; padding-bottom: 3px;">
                <div style="padding-bottom: 3px; ">
                    <div style="float:left; width:800px; height:10px"></div>
                    <div style="float:left; width:850px">
                    	{if $user_level eq 6}   
                    	Cán bộ:
                        <select name="user_id" style="width:150px">
                            <option value="0">Chọn cán bộ</option>
                            {section name=di loop=$obj_list_user}
                            <option value="{$obj_list_user[di]->user_id}" {if $obj_list_user[di]->user_id eq $vars.user_id} selected="selected"{/if}>{$obj_list_user[di]->user_fullname}</option>
                            {/section}
                        </select>&nbsp;|&nbsp;
                        {/if}
                    	Từ
                        <input type="text" name="tu_ngay" id="tu_ngay" value="{$vars.tu_ngay}" maxlength="250" class="text" style="width:90px"/>&nbsp;
                        <img src="../images/admin/img.gif"  align="absmiddle" id="icon_date01" style="cursor: pointer; border: 0" title="Chọn ngày trên lịch"/>
                        {literal}
						<script type="text/javascript">
                            Calendar.setup({
                                inputField   :   "tu_ngay",
                                ifFormat     :   "%d-%m-%Y",
                                button       :   "icon_date01",
                                align        :   "Br",  
                                timeFormat   :   "24",
                                showsTime    :   true,
                                singleClick  :   true
                            });
                        </script>
                        {/literal}&nbsp;  
                    	Đến
                        <input type="text" name="den_ngay" id="den_ngay" value="{$vars.den_ngay}" maxlength="250" class="text" style="width:90px"/>&nbsp;
                        <img src="../images/admin/img.gif"  align="absmiddle" id="icon_date02" style="cursor: pointer; border: 0" title="Chọn ngày trên lịch"/>
                        {literal}
						<script type="text/javascript">
                            Calendar.setup({
                                inputField   :   "den_ngay",
                                ifFormat     :   "%d-%m-%Y",
                                button       :   "icon_date02",
                                align        :   "Br",  
                                timeFormat   :   "24",
                                showsTime    :   true,
                                singleClick  :   true
                            });
                        </script>
                        {/literal}&nbsp;|&nbsp;
                        <select name="tinhtrang" style="width:150px">
                            <option value="0">Đang thực hiện</option>
                            <option value="1">Chưa ký/Tạm dừng/Đã hủy</option>
                            <option value="2">Đã hoàn thành</option>
                        </select>&nbsp;|&nbsp;
                        <select name="loai_hp" style="width:110px">
                            <option value="1">Thẩm định giá</option>
                            <option value="2">Bán đấu giá</option>
                        </select>&nbsp;|&nbsp;
                        <input type="submit" name="cmdSearch" value="Lọc" />
                    </div>
                    <div style="float:left; width:550px; height:10px"></div>
                    <div style="float:left; width:450px; padding-top:4px">
                    <a href="?expHopdongReport{$vars.arg}&exptype=1">Kết xuất Microsoft Excel (.xls)</a> | 
                    <a href="?expHopdongReport{$vars.arg}&exptype=3">Kết xuất Microsoft Word (.doc)</a> | 
                    <a href="?expHopdongReport{$vars.arg}&exptype=2" target="_blank">Xem - in trực tiếp</a>
                    </div>
                </div>
            </div>
        </td>		
	</tr>
	</tbody>
</table>
</div>
</form>
</div>