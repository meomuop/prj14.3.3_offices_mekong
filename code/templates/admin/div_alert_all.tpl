<!--*******************************************VUNG DIV CHUC NANG*****************************************-->
<div id="div_thanhcong" style="width:200px; float:left; font-weight:normal; position:absolute; display:none; margin:200px 0 0 540px; background-color:#ffffff; border:1px solid #99bbe8; z-index:1010; padding: 0px 1px 1px 1px">
	<div id="thanhcong_main_cont">
        <div id="thanhcong_tab_bar_tit">Thông báo</div>
        <div id="thanhcong_tab_bar_icon">
            <a href="javascript: void(0);" onClick="javascript: document.getElementById('div_thanhcong').style.display='none'" style="text-decoration:none">
            	<img src="{$css_path}icon_dong.png" class="img_all" title="Đóng lại"></a>
        </div>
        <div id="thanhcong_content_outsign">
        	<div id="list_thanhcong_cont">
            	<div style="width:180px; text-transform:uppercase; color:#00F; line-height:30px; text-align:center; font-weight:bold">
                Thao tác thành công!</div>
                <div style="width:180px; text-transform:uppercase; color:#00F; line-height:30px; text-align:center; font-weight:bold">
                <input type="button" name="xacnhan_btn" id="xacnhan_btn" value="Xong! (3s)" class="button" onClick="javascript: document.getElementById('div_thanhcong').style.display='none'"/></div>
            </div>
        </div>
    </div>
</div>
{literal}
<script language="javascript">
	function tat_thongbao(){
		setTimeout(function() { document.getElementById('div_thanhcong').style.display='none'; }, 3000);
	}
	function diemnguoc(obj){
		document.getElementById('xacnhan_btn').value='Xong! ('+obj+'s)';
		if(obj>0)setTimeout(function() {diemnguoc(obj-1);}, 1000);
	}
</script>
{/literal}
<!--****************************************HET VUNG DIV CHUC NANG****************************************-->