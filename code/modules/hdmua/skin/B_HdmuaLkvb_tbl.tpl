{literal}
    <style type="text/css">
    .error { color:#FF0000;font-weight:bold; margin-left:5px; height:20px; line-height:20px}
    .msg{ color:#00F; font-weight:bold; margin-left:5px; height:20px; line-height:20px}
    .tbl_tit{
    float:left; line-height:25px; border-right:1px solid #99bbe8;
    }
    .tbl_cont{
    float:left; line-height:25px; border-right:1px solid #99bbe8; border-bottom:1px solid #99bbe8; background:#F2FFEC; font-size:12px
    }
    .tbl_cont2{
    float:left; line-height:25px; border-right:1px solid #99bbe8; border-bottom:1px solid #99bbe8; background:#FFF; font-size:12px
    }
    </style>

{/literal}
<div id="thuchien_content_insign">
	<form method="post" name="frmList_HdmuaLkvb" action="?listHdmuaLkvb{$vars.arg}" id="frmList_HdmuaLkvb">
    <!------------------------------------------THEM MOI------------------------------------>
    <fieldset style="width:520px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
        <legend class="legend_list_search" style="width: 350px">
            Thêm/Chỉnh sửa&nbsp;|&nbsp;Thông báo:&nbsp;
            <span id="mess_doc" class="msg">{$error}{$complete}</span>
            <span id="lblError_HdmuaLkvb" class="error">(*) là các mục bắt buộc!</span>
        </legend>
    	<table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
        	<tr height="10"><td colspan="2"></td></tr>
            <tr height="30">
            	<td align="center" width="30%" valign="top">
                    <div style="float:left; width:15%; line-height:25px; text-align:left">Hợp đồng:</div>
                    <div style="float:left; width:45%; line-height:25px; text-align:left">{$hdmua_info.hdmua_sohd} (Ngày ký: {$hdmua_info.hdmua_ngayhd|date_format:"%d/%m/%Y"})</div>
                    <div style="float:left; width:15%; line-height:25px; text-align:left">Kiểu văn bản:</div>
                    <div style="float:left; width:25%; line-height:25px; text-align:left">
                        <select name="lkvb_type" id="lkvb_type" class="select_short" tabindex="1">
                            <option value="0">Chọn kiểu</option>
                            <option value="1" {if $obj_info.lkvb_type eq 1}selected="selected"{/if}>Văn bản đến</option>
                            <option value="2" {if $obj_info.lkvb_type eq 2}selected="selected"{/if}>Văn bản đi</option>
                        </select>
                        {literal}
                            <script type="text/javascript">
                                $("#lkvb_type").change(function(){
                                    if($("#lkvb_type").val() == 1){
                                        $("#vanban_skh").autocomplete("B_skhVbden_auto.php", {
                                            width: 100,
                                            matchContains: true,
                                            selectFirst: true
                                        });

                                        $("#vanban_skh").blur(function(){
                                            $("#div_hdmua_klvb_file").load("getVbdenFile.php?doc_code="+$("#vanban_skh").val());
                                        });
                                        $("#vanban_skh").blur(function(){
                                            $("#div_hdmua_klvb_trichyeu").load("getVbdenTrichyeu.php?doc_code="+$("#vanban_skh").val());
                                        });

                                    }else{
                                        $("#vanban_skh").autocomplete("B_skhVbdi_auto.php", {
                                            width: 100,
                                            matchContains: true,
                                            selectFirst: true
                                        });

                                        $("#vanban_skh").blur(function(){
                                            $("#div_hdmua_klvb_file").load("getVbdiFile.php?doc_code="+$("#vanban_skh").val());
                                        });
                                        $("#vanban_skh").blur(function(){
                                            $("#div_hdmua_klvb_trichyeu").load("getVbdiTrichyeu.php?doc_code="+$("#vanban_skh").val());
                                        });
                                    }
                                });
                            </script>
                        {/literal}
                    </div>
                    <div style="float:left; width:15%; line-height:25px; text-align:left">Số ký hiệu:</div>
                    <div style="float:left; width:45%; line-height:25px; text-align:left">
                        <input type="text" class="text_short" name="vanban_skh" id="vanban_skh" value="{$obj_info.vanban_skh}" onfocus="hide_message_HdmuaLkvb();" tabindex="2">
                    </div>
                    <div style="float:left; width:15%; line-height:25px; text-align:left">Tệp tin:</div>
                    <div style="float:left; width:25%; line-height:25px; text-align:left" id="div_hdmua_klvb_file">
                        <input type="text" class="text_short" name="vanban_file" id="vanban_file" value="{$obj_info.vanban_file}" onfocus="hide_message_HdmuaLkvb();" tabindex="4">
                    </div>
                    <div style="float:left; width:15%; line-height:25px; text-align:left">Trích yếu <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:85%; line-height:25px; text-align:left; height:50px" id="div_hdmua_klvb_trichyeu">
                        <textarea spellcheck="false" name="vanban_trichyeu" id="vanban_trichyeu" cols="30" rows="5" class="text_area_small" onfocus="hide_message_Hdmua()" style="width:406px" tabindex="3">{$obj_info.vanban_trichyeu}</textarea>
                    </div>
                    <div style="float:left; width:15%; line-height:25px; text-align:left">&nbsp;</div>
                    <div style="float:left; width:45%; line-height:25px; text-align:left">
                        <input type="button" name="btnSub_HdmuaLkvb" id="btnSub_HdmuaLkvb" value="Ghi lại" class="button" tabindex="18"/>
                        <input type="hidden" name="lkvb_id" id="lkvb_id" value="{$obj_info.lkvb_id}">
                        <input type="hidden" name="vanban_id" id="vanban_id" value="{$obj_info.vanban_id}">
                        <input type="hidden" name="hdmua_id" id="hdmua_id" value="{$hdmua_id}">
                        <input type="hidden" name="hdmua_sohd" id="hdmua_sohd" value="{$hdmua_info.hdmua_sohd}">
                        <input type="reset" name="Reset" value="Hủy bỏ" class="button" tabindex="19"/>
                    </div>
                    <div style="float:left; width:40%; line-height:25px; text-align:left">
                        &nbsp;<b>(Người nhập: {$access_user_name})</b>
                    </div>
                </td>
                {literal}
                    <script language="javascript">
                        function hide_message_HdmuaLkvb(){
                            $('#lblMessage_HdmuaLkvb').hide();
                            $('#lblError_HdmuaLkvb').hide();
                            $('#mess_doc').hide();
                        }

                        $(function() {
                            $('.error').hide();
                            $('#lblMessage_HdmuaLkvb').hide();

                            $("#btnSub_HdmuaLkvb").click(function() {

                                $('.error').hide();

                                var $form = $("#frmList_HdmuaLkvb");


                                var lkvb_id = $form.find('input#lkvb_id').val();
                                var hdmua_id = $form.find('input#hdmua_id').val();
                                var hdmua_sohd = $form.find('input#hdmua_sohd').val();
                                var vanban_id = $form.find('input#vanban_id').val();
                                var vanban_skh = $form.find('input#vanban_skh').val();
                                var vanban_file = $form.find('input#vanban_file').val();
                                var vanban_trichyeu = $form.find('textarea#vanban_trichyeu').val();
                                var lkvb_type = $form.find('select#lkvb_type :selected').val();

                                //begin validate form
                                if (vanban_skh == "" || hdmua_id == "" || hdmua_sohd == "" ){
                                    $('#lblError_HdmuaLkvb').show();
                                }
                                else{
                                    $.post('index.php?listHdmuaLkvb&mod=hdmua&add_edit=1',
                                        {

                                            lkvb_id:lkvb_id,
                                            hdmua_id:hdmua_id,
                                            hdmua_sohd:hdmua_sohd,
                                            vanban_id:vanban_id,
                                            vanban_skh:vanban_skh,
                                            vanban_file:vanban_file,
                                            vanban_trichyeu:vanban_trichyeu,
                                            lkvb_type:lkvb_type
                                        },
                                        function(data){
                                            $('#list_hdmua_lkvb_cont').html(data);
                                            $("#list_hdmua_lkvb_cont").show();
                                        }
                                    );
                                    return false;
                                }
                                //end form
                            });
                        });
                    </script>
                {/literal}
            </tr>
        </table>
    </fieldset>
    <!------------------------------------DANH SACH---------------------------------------------->
    <fieldset style="width:520px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:175px">
        <legend class="legend_list" style="width:410px">
            <div style="width:100px; float:left">Danh sách: {$total_num_result}</div>
            <div style="width:70px; float:left">&nbsp;|&nbsp;Tìm kiếm:&nbsp;</div>
            <div style="width:180px; float:left; font-weight:normal">
                <div style="float:left">
                    <div style="float:left; width:60px">- Nội dung: </div>
                    <div style="float:left; width:100px">
                    <input type="text" id="lkvb_ghichu_fs" name="lkvb_ghichu_fs" class="text_seek_middle" value="{$vars.lkvb_ghichu_fs}"/>
                    </div>
                    <input type="hidden" id="processurl" value="{$processurl}" />
                </div>
            </div>

            <div style="width:45px; float:left">
                <input type="button" name="btnSeek" id="btnSeek" value="Tìm >>" class="button_seek" onclick="search_me_HdmuaLkvb()" />
            </div>
        </legend>
    	<div style="float:left; height:5px; width:100%"></div>
        <div style="float:left; height:25px; width:500px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
            <div class="tbl_tit" style="width:40px; text-align:center"><b>STT</b></div>
            <div class="tbl_tit" style="width:255px"><B>&nbsp;Nội dung</B></div>
            <div class="tbl_tit" style="width:70px"><B>&nbsp;Ngày nhập</B></div>
            <div class="tbl_tit" style="width:40px; text-align:center"><B>File</B></div>
            <div class="tbl_tit" style="width:59px; text-align:center"><B>Chọn</B></div>
            <div class="tbl_tit" style="width:30px; text-align:center">
            <input type="hidden" name="chon" id="chon_HdmuaLkvb">
            <input type="checkbox" name="chkall" value="0" onclick="docheck_HdmuaLkvb(document.frmList_HdmuaLkvb.chkall.checked,0);">
            </div>
        </div>
        <div style="float:left; width:20px; text-align:right">
        <input type="button" name="del_Items" id='del_Items' value="&nbsp;" onClick="delItems_HdmuaLkvb('{$processurl}');" style="width:17px; font-size:12px; background:url(../images/admin/b_drop.png); cursor:pointer" title="Xóa lựa chọn">
        </div>
        <div style="float:left; height:122px; width:520px; overflow-y:scroll">
            {section name=pi loop=$obj_list}
            {if $smarty.section.pi.index is not div by 2} 
            {assign var="class_td" value="tbl_cont"} 
            {else}
            {assign var="class_td" value="tbl_cont2"} 
            {/if}
            {math x=$vars.curpage-1 y=$vars.numresult z=$smarty.section.pi.index t=1 equation="x*y+z+t" assign=stt}
            <div style="float:left">
                <div class="{$class_td}" style="width:40px; text-align:center">{$stt}</div>
                <div class="{$class_td}" style="width:255px; white-space:nowrap; text-align:left" title="{$obj_list[pi]->vanban_trichyeu}">
                    &nbsp;{$obj_list[pi]->vanban_skh} - {$obj_list[pi]->vanban_trichyeu|str_string_cut:"35":"1"}
                </div>
                <div class="{$class_td}" style="width:70px">
                    &nbsp;{$obj_list[pi]->lkvb_date|date_format:"%d/%m/%Y"}
                </div>
                <div class="{$class_td}" style="width:40px; text-align:center">
                    <a href='{$obj_list[pi]->vanban_file}' target="new">
                        <img src="../images/admin/download_icon.png" width="16" height="16" border="0" title="Tải về"></a>
                </div>
                <div class="{$class_td}" style="width:29px; text-align:center">
                    <a href='javascript: void(0);' onclick="edit_me_HdmuaLkvb({$obj_list[pi]->lkvb_id},{$obj_list[pi]->hdmua_id})">
                    <img src="../images/admin/b_edit.png" width="11" height="11" border="0" title="Sửa"></a>
                </div>
                <div class="{$class_td}" style="width:29px; text-align:center">
                    <a href='javascript: void(0)' onClick="delItems_HdmuaLkvb('{$processurl}', {$obj_list[pi]->lkvb_id});">
                    <img src="../images/admin/b_drop.png" width="11" height="11" border="0" title="Xóa"></a>
                </div>
                <div class="{$class_td}" style="width:30px; text-align:center">
                    <input type="checkbox" name="chkid" value="{$obj_list[pi]->lkvb_id}" onclick="docheckone_HdmuaLkvb();">
                </div>
            </div>
            {/section}
        </div>
        <input type="hidden" id="curpage_HdmuaLkvb" name="curpage" value="{$vars.curpage}" />
        <input type="hidden" name="arg" id="arg" value="{$vars.arg}">
        <input type="hidden" name="hdmua_HdmuaLkvb" id="hdmua_HdmuaLkvb" value="{$hdmua_id}">
    </fieldset>
    </form>
</div>
<!------------------------------------------------- Tool bar --------------------------------------------->
<div id="hdmua_clear_txt"></div>
<div id="hdmua_tool_bar">

    <div id="hdmua_search_area">
    <select name="order" id = "order_HdmuaLkvb" style="width:120px; font-size:12px; border:1px solid #99bbe8; margin-left:1px" onchange="reloadPage_HdmuaLkvb('{$processurl}');">
    {section name=sli loop=$order_arr}
        <option value="{$smarty.section.sli.index}" {if $smarty.section.sli.index eq $vars.order}selected{/if} >
        {$order_arr[sli]}
        </option>
    {/section}
    </select>
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div id="hdmua_page_area">
    {if $vars.curpage eq 1}
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="first_page" onclick="gotoPage_HdmuaLkvb('{$processurl}',parseInt(1));" title="Trang đầu">
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="pre_page" onclick="gotoPage_HdmuaLkvb('{$processurl}',parseInt(document.getElementById('page_HdmuaLkvb').value)-parseInt(1));" title="Trang trước">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    </a>
    {/if}
    </div>
    <div style="float:left; line-height:19px">
        <div style="float:left; width:35px">Trang</div> 
        <div style="float:left; width:35px">
        <input type="text" value="{$vars.curpage}" name="page" id="page_HdmuaLkvb" onblur=" gotoPage_HdmuaLkvb('{$processurl}',this.value);" style="width:30px; font-size:12px; height:15px; border:1px solid #99bbe8">
        </div>
        <div style="float:left; width:32px"> / {$num_page}</div>
    </div>
    <div id="hdmua_page_area">
    {if $vars.curpage eq $num_page}
    	<img src="{$css_path}icon_next_page.png" class="img_all">
        <img src="{$css_path}icon_last_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="next_page" onclick="gotoPage_HdmuaLkvb('{$processurl}',parseInt(document.getElementById('page_HdmuaLkvb').value)+parseInt(1));" title="Trang tiếp">
    	<img src="{$css_path}icon_next_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="last_page" onclick="gotoPage_HdmuaLkvb('{$processurl}',parseInt({$num_page}));" title="Trang cuối">
    	<img src="{$css_path}icon_last_page.png" class="img_all">
    </a>
    {/if}
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:left; width:15px">
    <a href="javascript: void(0)" id="a_ref_HdmuaLkvb" title="Tải lại"><img src="{$css_path}icon_refresh.png" class="img_all"></a>
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:right; line-height:19px; margin-right:2px">
        <div style="float:left; width:40px">Xem</div>
        <div style="float:left; width:52px">
            <select name="numresult" id="numresult_HdmuaLkvb" style="width:50px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_HdmuaLkvb('{$processurl}');">
                {section name=sli loop=$nrs_arr}
                <option value="{$nrs_arr[sli]}" {if $nrs_arr[sli] eq $vars.numresult}selected{/if}>{$nrs_arr[sli]} </option>
                {/section}
            </select>
        </div>
        <div style="float:left; margin-right:1px">dòng / trang</div>
    </div>
    
</div>
{literal}
<script type="text/javascript">
	function show_list_options(count,total){
		for(i=1;i<=total;i++){
			if(i==count){
				if(document.getElementById('extra_'+i).style.display=='none')
					document.getElementById('extra_'+i).style.display='block';
				else
					document.getElementById('extra_'+i).style.display='none';
			}
			else
				document.getElementById('extra_'+i).style.display='none';
		}
	}
	function show_hide_seek(){
		if(document.getElementById('seek_more').style.display=='none')
			document.getElementById('seek_more').style.display='';
		else document.getElementById('seek_more').style.display='none';
	}

	function show_hide_filter(){
		if(document.getElementById('div_filter').style.display=='none')
			document.getElementById('div_filter').style.display='';
		else document.getElementById('div_filter').style.display='none';
	}

	function docheck_HdmuaLkvb(status,from_){
		var alen=document.frmList_HdmuaLkvb.elements.length;
		alen=(alen>5)?document.frmList_HdmuaLkvb.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
			document.frmList_HdmuaLkvb.chkid[i].checked=status;
		}
		else{
			document.frmList_HdmuaLkvb.chkid.checked=status;
		}
		if(from_>0) document.frmList_HdmuaLkvb.chkall.checked=status;
	}

	function docheckone_HdmuaLkvb(){
		var alen=document.frmList_HdmuaLkvb.elements.length;
		var isChecked=true;
		alen=(alen>4)?document.frmList_HdmuaLkvb.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_HdmuaLkvb.chkid[i].checked==false)
					isChecked=false;
		}else{
			if(document.frmList_HdmuaLkvb.chkid.checked==false)
				isChecked=false;
		}
		document.frmList_HdmuaLkvb.chkall.checked=isChecked;
	}

	function calculatechon_HdmuaLkvb(){
		var strchon="";
		var alen=document.frmList_HdmuaLkvb.elements.length;
		alen=(alen>2)?document.frmList_HdmuaLkvb.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_HdmuaLkvb.chkid[i].checked==true)
					strchon+=document.frmList_HdmuaLkvb.chkid[i].value+",";
		}else{
			if(document.frmList_HdmuaLkvb.chkid.checked==true)
				strchon=document.frmList_HdmuaLkvb.chkid.value;
		}
		document.frmList_HdmuaLkvb.chon_HdmuaLkvb.value=strchon;
	}

	function delItems_HdmuaLkvb(processurl,delStr){
		if (delStr == undefined){
			calculatechon_HdmuaLkvb();
			delStr = document.getElementById("chon_HdmuaLkvb").value;
		}
		if (delStr == ""){
			return false;
		}
		if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
			return false;
		}

		var numresult_HdmuaLkvb,order_HdmuaLkvb,curpage_HdmuaLkvb;
		numresult = $("#numresult_HdmuaLkvb").val();
		order = $("#order_HdmuaLkvb").val();
		curpage = $("#curpage_HdmuaLkvb").val();

		var dataString  = "numresult=" + numresult;
			dataString += "&order=" + order;
			dataString += "&curpage=" + curpage;
			dataString += "&dlStr=" + delStr +"";
			//alert (processurl+'--'+dataString);
		$.ajax({
			type: "POST",
			url: processurl,
			data: dataString,
			success: function(data) {
				$('#list_hdmua_lkvb_cont').fadeOut('fast').load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+curpage).fadeIn("fast");
			}
		});
	}

	function reloadPage_HdmuaLkvb(processurl){
		var numresult_HdmuaLkvb,order_HdmuaLkvb,cur_pos;
		numresult = $("#numresult_HdmuaLkvb").val();
		order = $("#order_HdmuaLkvb").val();
		cur_pos = 0;
		//alert(processurl);
		$("#list_hdmua_lkvb_cont").load(processurl+"&numresult="+numresult+"&order="+order+"&cur_pos="+cur_pos);
	}

	function gotoPage_HdmuaLkvb(processurl,page){
		var numresult_HdmuaLkvb,order_HdmuaLkvb,cur_pos;
		numresult = $("#numresult_HdmuaLkvb").val();
		order = $("#order_HdmuaLkvb").val();
		//alert(processurl+'-'+page+'-'+numresult+'-'+order);
		$("#list_hdmua_lkvb_cont").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
	}

	function search_me_HdmuaLkvb(){
		var lkvb_ghichu_fs 	= document.getElementById('lkvb_ghichu_fs').value;
		var lkvb_sohd_fs 	= document.getElementById('lkvb_sohd_fs').value;
		var ngayxuat_1 		= document.getElementById('ngayxuat_1').value;
		var ngayxuat_2 	= document.getElementById('ngayxuat_2').value;
		var ngayxuat_3 	= document.getElementById('ngayxuat_3').value;

		if (lkvb_ghichu_fs == "" && lkvb_sohd_fs == "" && ngayxuat_1 == "" && ngayxuat_2 == "" && ngayxuat_3 == ""){
			return false;
		}

		$.post('?listHdmuaLkvb&mod=hdmua&search_me=1',
			{
				lkvb_ghichu_fs:lkvb_ghichu_fs,
                lkvb_sohd_fs:lkvb_sohd_fs,
                ngayxuat_1:ngayxuat_1,
                ngayxuat_2:ngayxuat_2,
                ngayxuat_3:ngayxuat_3
			},
			function(data){
				$('#list_hdmua_lkvb_cont').html(data);
				$("#list_hdmua_lkvb_cont").show();
			}
		);
	}

	function edit_me_HdmuaLkvb(id,hdmua_id){
		$("#list_hdmua_lkvb_cont").load("?listHdmuaLkvb&mod=hdmua&edit_me=1&lkvb_id="+id+"&hdmua_id="+hdmua_id);
	}

	$("#a_ref_HdmuaLkvb").click( function () {
			$('#list_hdmua_lkvb_cont').hide();
			$('#list_hdmua_lkvb_cont').fadeOut('fast').load('index.php?listHdmuaLkvb'+$("#arg").val()+"&hdmua_id="+$("#hdmua_HdmuaLkvb").val()).fadeIn("fast");
		});
</script>
{/literal}
