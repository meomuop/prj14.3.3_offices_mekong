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
<div id="hdmua_content_insign">
	<form method="post" name="frmList_HdmuaTonkho" action="?listTonkho{$vars.arg}" id="frmList_HdmuaTonkho">
    <!------------------------------------------THEM MOI------------------------------------>
    <fieldset style="width:1012px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
        <legend class="legend_list_search" style="width: 600px">
            Thêm/Chỉnh sửa&nbsp;|&nbsp;Thông báo:&nbsp;
            <span id="mess_doc" class="msg">{$error}{$complete}</span>
            <span id="lblError_HdmuaTonkho" class="error">(*) là các mục bắt buộc!</span>
        </legend>
    	<table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
        	<tr height="10"><td colspan="2"></td></tr>
            <tr height="30">
            	<td align="center" width="27%" valign="top">
                    <div style="float:left; width:30%; line-height:25px; text-align:left">Danh mục <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                        <select name="danhmuc_hang_id" id="danhmuc_hang_id" class="select_middle" tabindex="1">
                            <option value="0">Chọn danh mục</option>
                            {section name=qi loop=$obj_list_danhmuc}
                                <option value="{$obj_list_danhmuc[qi]->danhmuc_id}" {if $obj_list_danhmuc[qi]->danhmuc_id eq $obj_info.danhmuc_id}selected="selected"{/if}>{$obj_list_danhmuc[qi]->danhmuc_name}</option>
                            {/section}
                        </select>
                        {literal}
                            <script type="text/javascript">
                                $("#danhmuc_hang_id").change(function(){
                                    $("#div_hdmua_hanghoa_id").load('index.php?listHanghoaSelect&mod=tthopdong&danhmuc_id='+$("#danhmuc_hang_id").val());
                                });
                            </script>
                        {/literal}
                    </div>

                    <div style="float:left; width:30%; line-height:25px; text-align:left">Đơn vị:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                        <select name="dvtinh_id" id="dvtinh_id" class="select_short" tabindex="1">
                            <option value="0">Đơn vị tính</option>
                            {section name=qi loop=$obj_list_dvtinh}
                                <option value="{$obj_list_dvtinh[qi]->dvtinh_id}" {if $obj_list_dvtinh[qi]->dvtinh_id eq $obj_info.dvtinh_id}selected="selected"{/if}>{$obj_list_dvtinh[qi]->dvtinh_name}</option>
                            {/section}
                        </select>
                    </div>
                </td>

                <td align="center" width="46%" valign="top">
                    <div style="float:left; width:17%; line-height:25px; text-align:left">Mặt hàng <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:83%; line-height:25px; text-align:left" id="div_hdmua_hanghoa_id">
                        <select name="hanghoa_id" id="hanghoa_id" class="select_long" tabindex="1">
                            <option value="0">Chọn mặt hàng</option>
                            {if $obj_info.hanghoa_id}
                                {section name=qi loop=$obj_list_hanghoa}
                                    {if $obj_list_hanghoa[qi]->hanghoa_id eq $obj_info.hanghoa_id}
                                        <option value="{$obj_list_hanghoa[qi]->hanghoa_id}" selected="selected">{$obj_list_hanghoa[qi]->hanghoa_name}</option>
                                    {/if}
                                {/section}
                            {/if}
                        </select>
                    </div>
                    <div style="float:left; width:17%; line-height:25px; text-align:left">Số lượng <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:40%; line-height:25px; text-align:left">
                        <input type="text" name="tonkho_soluong" id="tonkho_soluong" class="text_short" value="{$obj_info.tonkho_soluong}"/>
                    </div>
                    <div style="float:left; width:43%; line-height:25px; text-align:left">
                        <input type="button" name="btnSub_HdmuaTonkho" id="btnSub_HdmuaTonkho" value="Ghi lại" class="button" tabindex="18"/>
                        <input type="hidden" name="tonkho_id" id="tonkho_id" value="{$obj_info.tonkho_id}">
                        <input type="hidden" name="hoadon_id" id="hoadon_id" value="{$hoadon_id}">
                        <input type="hidden" name="hoadon_sohd" id="hoadon_sohd" value="{$hdmuaHD_info.hoadon_sohd}">
                        <input type="reset" name="Reset" value="Hủy bỏ" class="button" tabindex="19"/>
                    </div>
                </td>

                <td align="center" valign="top">
                    <div style="float:left; width:25%; line-height:25px; text-align:left">Hóa đơn:</div>
                    <div style="float:left; width:75%; line-height:25px; text-align:left">{$hdmuaHD_info.hoadon_sohd} ( Ngày: {$hdmuaHD_info.hoadon_ngayhd|date_format:"%d/%m/%Y"})</div>
                    <div style="float:left; width:100%; line-height:25px; text-align:left">
                        <b>(Người nhập: {$access_user_name})</b>
                    </div>
                </td>
                {literal}
                    <script language="javascript">
                        function hide_message_HdmuaTonkho(){
                            $('#lblMessage_HdmuaTonkho').hide();
                            $('#lblError_HdmuaTonkho').hide();
                            $('#mess_doc').hide();
                        }

                        $(function() {
                            $('.error').hide();
                            $('#lblMessage_HdmuaTonkho').hide();

                            $("#btnSub_HdmuaTonkho").click(function() {

                                $('.error').hide();

                                var $form = $("#frmList_HdmuaTonkho");

                                var hoadon_id = $form.find('input#hoadon_id').val();
                                var hoadon_sohd = $form.find('input#hoadon_sohd').val();
                                var dvtinh_id = $form.find('select#dvtinh_id :selected').val();
                                var dvtinh_name = $form.find('select#dvtinh_id :selected').text();
                                var hanghoa_id = $form.find('select#hanghoa_id :selected').val();
                                var hanghoa_name = $form.find('select#hanghoa_id :selected').text();
                                var tonkho_id = $form.find('input#tonkho_id').val();
                                var tonkho_soluong = $form.find('input#tonkho_soluong').val();


                                //begin validate form
                                if (hoadon_id == "" || hoadon_sohd == "" || dvtinh_id == "" || hanghoa_id == "" || tonkho_soluong == "" ){
                                    $('#lblError_HdmuaTonkho').show();
                                }
                                else{
                                    $.post('index.php?listTonkho&mod=hdmua&add_edit=1',
                                        {
                                            hoadon_id:hoadon_id,
                                            hoadon_sohd:hoadon_sohd,
                                            dvtinh_id:dvtinh_id,
                                            dvtinh_name:dvtinh_name,
                                            hanghoa_id:hanghoa_id,
                                            hanghoa_name:hanghoa_name,
                                            tonkho_id:tonkho_id,
                                            tonkho_soluong:tonkho_soluong
                                        },
                                        function(data){
                                            $('#hdmua_content_main').html(data);
                                            $("#hdmua_content_main").show();
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
    <fieldset style="width:1012px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:374px">
        <legend class="legend_list" style="width:890px">
            <div style="width:130px; float:left">Danh sách: {$total_num_result}</div>
            <div style="width:70px; float:left">&nbsp;|&nbsp;Tìm kiếm:&nbsp;</div>
            <div style="width:385px; float:left; font-weight:normal">
                <div style="float:left">
                    <div style="float:left; width:65px">- Tên hàng:</div>
                    <div style="float:left; width:300px">
                    <input type="text" id="hanghoa_name_fs" name="hanghoa_name_fs" class="text_seek_long" value="{$vars.hanghoa_name_fs}"/>
                    </div>
                    <input type="hidden" id="processurl" value="{$processurl}" />
                </div>
                <a href="javascript: void(0);" onClick="show_hide_seek()" style="text-decoration:none; color:#F00">
                <div style="float:left; margin-left:3px"><img src="{$css_path}icon_keo_dai.png" class="img_all"></div></a>
            </div>
            <div style="width:380px; float:left; font-weight:normal; position:absolute; display:none; margin:20px 0 0 200px; background-color:#ccd8e7; border:1px solid #99bbe8; border-top:none; z-index:2012" id="seek_more">
                <div style="float:left; width:100%; height:5px"></div>
                <div style="float:left; width:60px; margin-bottom:5px">- Số HĐ: </div>
                <div style="float:left; width:80px; margin-bottom:5px">
                <input type="text" id="hoadon_sohd_fs" name="hoadon_sohd_fs" class="text_seek_tiny" value="{$vars.hoadon_sohd_fs}" />
                </div>

                <div style="float:left; width:79px; margin-bottom:5px">- Ngày nhập: </div>
                <div style="float:left; width:155px; margin-bottom:5px">
                    <div style="float:left; width:90px; background-color:#FFF; margin-bottom:5px">
                    <input type="text" id="ngaynhap_fs_1" name="ngaynhap_fs_1" class="text_date" value="{$vars.ngaynhap_fs_1}" maxlength="2"/>
                    /<input type="text" id="ngaynhap_fs_2" name="ngaynhap_fs_2" class="text_month" value="{$vars.ngaynhap_fs_2}" maxlength="2" />
                    /<input type="text" id="ngaynhap_fs_3" name="ngaynhap_fs_3" class="text_year" value="{$vars.ngaynhap_fs_3}" maxlength="4" />
                    </div>
                </div>
                
            </div>
            <div style="width:45px; float:left">
                <input type="button" name="btnSeek" id="btnSeek" value="Tìm >>" class="button_seek" onclick="search_me_HdmuaTonkho()" />
            </div>
            <!-----------------------------------------KET XUAT--------------------------------------->
            <div style="width:80px; float:left">&nbsp;|&nbsp;Kết xuất:&nbsp;</div>
            <a href="javascript: void(0);" onClick="show_hide_filter()" style="text-decoration:none">
            <div style="float:left; margin-left:10px; width:78px">Lọc dữ liệu</div></a>
            <div style="width:92px; float:left; height:20px; margin-top:1px">
                <a href="javascript: void(0);" onClick="export_doc(1)" style="text-decoration:none; color:#F00">
                <div style="float:left; margin-left:5px; width:26px">
                <img src="../images/admin/word_icon.png" class="img_all" height="20" title="Kết xuất MS Word"></div>
                </a>
                <a href="javascript: void(0);" onClick="export_doc(2)" style="text-decoration:none; color:#F00">
                <div style="float:left; margin-left:5px; width:26px">
                <img src="../images/admin/excel_icon.png" class="img_all" height="20" title="Kết xuất MS Excel"></div>
                </a>
                <a href="javascript: void(0);" onClick="export_doc(3)" style="text-decoration:none; color:#F00">
                <div style="float:left; margin-left:5px; width:25px">
                <img src="../images/admin/print_pre_icon.png" class="img_all" height="20" title="Xem trước khi in"></div>
                </a>
            </div>
            <div style="width:280px; float:left; font-weight:normal; position:absolute; display:none; margin:20px 0 0 604px; background-color:#ccd8e7; border:1px solid #99bbe8; border-top:none; z-index:2012" id="div_filter">
            	<div style="float:left; width:100%; height:5px"></div>
                <div style="float:left; width:46px; margin-bottom:5px">- Nhập:</div>
                <div style="float:left; width:20px; margin-bottom:5px">Từ&nbsp;</div>
                <div style="float:left; width:90px; background-color:#FFF; margin-bottom:5px">
                <input type="text" id="nhaptontu_1" name="nhaptontu_1" class="text_date" value="{$smarty.now|date_format:'%d'}" maxlength="2"/>
                /<input type="text" id="nhaptontu_2" name="nhaptontu_2" class="text_month" value="{$smarty.now|date_format:'%m'}" maxlength="2" />
                /<input type="text" id="nhaptontu_3" name="nhaptontu_3" class="text_year" value="{$smarty.now|date_format:'%Y'}" maxlength="4" />
                </div>
                <div style="float:left; width:24px; margin-bottom:5px; margin-left:5px">đến&nbsp;</div>
                <div style="float:left; width:90px; margin-bottom:5px; background-color:#FFF">
                <input type="text" id="nhaptonden_1" name="nhaptonden_1" class="text_date" value="{$smarty.now|date_format:'%d'}" maxlength="2" />
                /<input type="text" id="nhaptonden_2" name="nhaptonden_2" class="text_month" value="{$smarty.now|date_format:'%m'}" maxlength="2" />
                /<input type="text" id="nhaptonden_3" name="nhaptonden_3" class="text_year" value="{$smarty.now|date_format:'%Y'}" maxlength="4" />
                </div>

            </div>
        </legend>
    	<div style="float:left; height:5px; width:100%"></div>
        <div style="float:left; height:25px; width:990px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
            <div class="tbl_tit" style="width:40px; text-align:center"><b>STT</b></div>
            <div class="tbl_tit" style="width:498px"><B>&nbsp;Hàng hóa</B></div>
            <div class="tbl_tit" style="width:80px"><B>&nbsp;ĐVT</B></div>
            <div class="tbl_tit" style="width:80px; text-align: right"><B>&nbsp;Số lượng</B></div>
            <div class="tbl_tit" style="width:125px"><B>&nbsp;Chứng từ</B></div>
            <div class="tbl_tit" style="width:70px"><B>&nbsp;Ngày nhập</B></div>
            <div class="tbl_tit" style="width:59px; text-align:center"><B>Chọn</B></div>
            <div class="tbl_tit" style="width:30px; text-align:center">
            <input type="hidden" name="chon" id="chon_HdmuaTonkho">
            <input type="checkbox" name="chkall" value="0" onclick="docheck_HdmuaTonkho(document.frmList_HdmuaTonkho.chkall.checked,0);">
            </div>
        </div>
        <div style="float:left; width:20px; text-align:right">
        <input type="button" name="del_Items" id='del_Items' value="&nbsp;" onClick="delItems_HdmuaTonkho('{$processurl}');" style="width:17px; font-size:12px; background:url(../images/admin/b_drop.png); cursor:pointer" title="Xóa lựa chọn">
        </div>
        <div style="float:left; height:321px; width:1012px; overflow-y:scroll">
            {section name=pi loop=$obj_list}
            {if $smarty.section.pi.index is not div by 2} 
            {assign var="class_td" value="tbl_cont"} 
            {else}
            {assign var="class_td" value="tbl_cont2"} 
            {/if}
            {math x=$vars.curpage-1 y=$vars.numresult z=$smarty.section.pi.index t=1 equation="x*y+z+t" assign=stt}
            <div style="float:left">
                <div class="{$class_td}" style="width:40px; text-align:center">{$stt}</div>
                <div class="{$class_td}" style="width:498px; text-align:left">
                    &nbsp;{$obj_list[pi]->hanghoa_name}&nbsp;
                </div>
                <div class="{$class_td}" style="width:80px">
                    &nbsp;{$obj_list[pi]->dvtinh_name}
                </div>
                <div class="{$class_td}" style="width:80px; text-align: right">
                    &nbsp;{$obj_list[pi]->tonkho_soluong}&nbsp;
                </div>
                <div class="{$class_td}" style="width:125px">
                    &nbsp;{$obj_list[pi]->hoadon_sohd}&nbsp;
                </div>
                <div class="{$class_td}" style="width:70px">
                    &nbsp;{$obj_list[pi]->tonkho_date|date_format:"%d/%m/%Y"}
                </div>

                <div class="{$class_td}" style="width:29px; text-align:center">
                    <a href='javascript: void(0);' onclick="edit_me_HdmuaTonkho({$obj_list[pi]->tonkho_id},{$obj_list[pi]->hoadon_id})">
                    <img src="../images/admin/b_edit.png" width="11" height="11" border="0" title="Sửa"></a>
                </div>
                <div class="{$class_td}" style="width:29px; text-align:center">
                    <a href='javascript: void(0)' onClick="delItems_HdmuaTonkho('{$processurl}', {$obj_list[pi]->tonkho_id});">
                    <img src="../images/admin/b_drop.png" width="11" height="11" border="0" title="Xóa"></a>
                </div>
                <div class="{$class_td}" style="width:30px; text-align:center">
                    <input type="checkbox" name="chkid" value="{$obj_list[pi]->tonkho_id}" onclick="docheckone_HdmuaTonkho();">
                </div>
            </div>
            {/section}
        </div>
        <input type="hidden" id="curpage_HdmuaTonkho" name="curpage" value="{$vars.curpage}" />
        <input type="hidden" name="arg" id="arg" value="{$vars.arg}">
        <input type="hidden" name="arg_doc" id="arg_doc" value="{$vars.arg_doc}">
    </fieldset>
    </form>
</div>
<!------------------------------------------------- Tool bar --------------------------------------------->
<div id="hdmua_clear_txt"></div>
<div id="hdmua_tool_bar">

    <div id="hdmua_search_area">
    <select name="order" id = "order_HdmuaTonkho" style="width:120px; font-size:12px; border:1px solid #99bbe8; margin-left:1px" onchange="reloadPage_HdmuaTonkho('{$processurl}');">
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
    <a href="javascript: void(0)" id="first_page" onclick="gotoPage_HdmuaTonkho('{$processurl}',parseInt(1));" title="Trang đầu">
    	<img src="{$css_path}icon_first_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="pre_page" onclick="gotoPage_HdmuaTonkho('{$processurl}',parseInt(document.getElementById('page_HdmuaTonkho').value)-parseInt(1));" title="Trang trước">
    	<img src="{$css_path}icon_pre_page.png" class="img_all">
    </a>
    {/if}
    </div>
    <div style="float:left; line-height:19px">
        <div style="float:left; width:35px">Trang</div> 
        <div style="float:left; width:35px">
        <input type="text" value="{$vars.curpage}" name="page" id="page_HdmuaTonkho" onblur=" gotoPage_HdmuaTonkho('{$processurl}',this.value);" style="width:30px; font-size:12px; height:15px; border:1px solid #99bbe8">
        </div>
        <div style="float:left; width:42px"> / {$num_page}</div>
    </div>
    <div id="hdmua_page_area">
    {if $vars.curpage eq $num_page}
    	<img src="{$css_path}icon_next_page.png" class="img_all">
        <img src="{$css_path}icon_last_page.png" class="img_all">
    {else}
    <a href="javascript: void(0)" id="next_page" onclick="gotoPage_HdmuaTonkho('{$processurl}',parseInt(document.getElementById('page_HdmuaTonkho').value)+parseInt(1));" title="Trang tiếp">
    	<img src="{$css_path}icon_next_page.png" class="img_all">
    </a>
    <a href="javascript: void(0)" id="last_page" onclick="gotoPage_HdmuaTonkho('{$processurl}',parseInt({$num_page}));" title="Trang cuối">
    	<img src="{$css_path}icon_last_page.png" class="img_all">
    </a>
    {/if}
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:left; width:15px">
    <a href="javascript: void(0)" id="a_ref_HdmuaTonkho" title="Tải lại"><img src="{$css_path}icon_refresh.png" class="img_all"></a>
    </div>
    
    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:right; line-height:19px; margin-right:2px">
        <div style="float:left; width:40px">Xem</div>
        <div style="float:left; width:52px">
            <select name="numresult" id="numresult_HdmuaTonkho" style="width:50px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_HdmuaTonkho('{$processurl}');">
                {section name=sli loop=$nrs_arr}
                <option value="{$nrs_arr[sli]}" {if $nrs_arr[sli] eq $vars.numresult}selected{/if}>{$nrs_arr[sli]} </option>
                {/section}
            </select>
        </div>
        <div style="float:left; margin-right:1px">dòng / trang</div>
    </div>
    
</div>
{literal}
<script language="javascript">	
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
	
	function docheck_HdmuaTonkho(status,from_){
		var alen=document.frmList_HdmuaTonkho.elements.length;
		alen=(alen>5)?document.frmList_HdmuaTonkho.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
			document.frmList_HdmuaTonkho.chkid[i].checked=status;
		}
		else{
			document.frmList_HdmuaTonkho.chkid.checked=status;
		}
		if(from_>0) document.frmList_HdmuaTonkho.chkall.checked=status;
	}
		
	function docheckone_HdmuaTonkho(){
		var alen=document.frmList_HdmuaTonkho.elements.length;
		var isChecked=true;
		alen=(alen>4)?document.frmList_HdmuaTonkho.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_HdmuaTonkho.chkid[i].checked==false)
					isChecked=false;
		}else{
			if(document.frmList_HdmuaTonkho.chkid.checked==false)
				isChecked=false;
		}				
		document.frmList_HdmuaTonkho.chkall.checked=isChecked;
	}
	
	function calculatechon_HdmuaTonkho(){			
		var strchon="";
		var alen=document.frmList_HdmuaTonkho.elements.length;				
		alen=(alen>2)?document.frmList_HdmuaTonkho.chkid.length:0;
		if (alen>0){
			for(var i=0;i<alen;i++)
				if(document.frmList_HdmuaTonkho.chkid[i].checked==true)
					strchon+=document.frmList_HdmuaTonkho.chkid[i].value+",";
		}else{
			if(document.frmList_HdmuaTonkho.chkid.checked==true)
				strchon=document.frmList_HdmuaTonkho.chkid.value;
		}
		document.frmList_HdmuaTonkho.chon_HdmuaTonkho.value=strchon;
	}
	
	function delItems_HdmuaTonkho(processurl,delStr){
		if (delStr == undefined){
			calculatechon_HdmuaTonkho();
			delStr = document.getElementById("chon_HdmuaTonkho").value;
		}
		if (delStr == ""){
			return false;
		}
		if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
			return false;
		}	
		
		var numresult_HdmuaTonkho,order_HdmuaTonkho,curpage_HdmuaTonkho;
		numresult = $("#numresult_HdmuaTonkho").val();
		order = $("#order_HdmuaTonkho").val();
		curpage = $("#curpage_HdmuaTonkho").val();
		
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
				$('#hdmua_content_main').fadeOut('fast').load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+curpage).fadeIn("fast");
			}
		});
	}
	
	function reloadPage_HdmuaTonkho(processurl){
		var numresult_HdmuaTonkho,order_HdmuaTonkho,cur_pos;
		numresult = $("#numresult_HdmuaTonkho").val();
		order = $("#order_HdmuaTonkho").val();
		cur_pos = 0;
		$("#hdmua_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&cur_pos="+cur_pos);
	}

	
	function show_tonkho(tonkho_id){
        change_style_hdmua(3);
		document.getElementById('tonkho_content_main').style.display='block';
		//var arg = document.getElementById('arg').value;
		$("#tonkho_content_main").load("?listTonkho&mod=hdmua&tonkho_id="+tonkho_id);
	}

	function show_hdmua_hopdong(tonkho_id){
		document.getElementById('div_view_doc').style.display='block';
		$("#list_view_tonkho_cont").load("?viewHdmuaTonkho&mod=hdmua&tonkho_id="+tonkho_id);
	}
		
	function gotoPage_HdmuaTonkho(processurl,page){
		var numresult_HdmuaTonkho,order_HdmuaTonkho,cur_pos;
		numresult = $("#numresult_HdmuaTonkho").val();
		order = $("#order_HdmuaTonkho").val();
		//alert(processurl+'-'+page+'-'+numresult+'-'+order);
		$("#hdmua_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
	}

	function search_me_HdmuaTonkho(){
		var hoadon_sohd_fs 	= document.getElementById('hoadon_sohd_fs').value;
		var hanghoa_name_fs 	= document.getElementById('hanghoa_name_fs').value;
		var ngaynhap_fs_1 		= document.getElementById('ngaynhap_fs_1').value;
		var ngaynhap_fs_2 	= document.getElementById('ngaynhap_fs_2').value;
		var ngaynhap_fs_3 	= document.getElementById('ngaynhap_fs_3').value;
		
		if (hanghoa_name_fs == "" && hoadon_sohd_fs == "" && ngaynhap_1 == "" && ngaynhap_2 == "" && ngaynhap_3 == ""){
			return false;
		}
		
		$.post('?listTonkho&mod=hdmua&search_me=1',
			{
                hanghoa_name_fs:hanghoa_name_fs,
                hoadon_sohd_fs:hoadon_sohd_fs,
                ngaynhap_fs_1:ngaynhap_fs_1,
                ngaynhap_fs_2:ngaynhap_fs_2,
                ngaynhap_fs_3:ngaynhap_fs_3
			},
			function(data){
				$('#hdmua_content_main').html(data);
				$("#hdmua_content_main").show();
			}
		);
	}
	
	// ----- ket xuat
	function export_doc(exptype){
		var nhaptontu_1 	= document.getElementById('nhaptontu_1').value;
		var nhaptontu_2 	= document.getElementById('nhaptontu_2').value;
		var nhaptontu_3 	= document.getElementById('nhaptontu_3').value;
		
		var nhaptonden_1 	= document.getElementById('nhaptonden_1').value;
		var nhaptonden_2 	= document.getElementById('nhaptonden_2').value;
		var nhaptonden_3 	= document.getElementById('nhaptonden_3').value;
		
		
		var nhaptontu = nhaptontu_3+'-'+nhaptontu_2+'-'+nhaptontu_1;
		var nhaptonden = nhaptonden_3+'-'+nhaptonden_2+'-'+nhaptonden_1;
				
		if (nhaptontu == "" && nhaptonden == "" ){
			return false;
		}
		
		if(exptype==3){
			document.getElementById('div_hdmua_report').style.display='block';
			$.post('?expTonkhoReport&mod=hdmua&exptype='+exptype,
				{
					nhaptontu:nhaptontu,
					nhaptonden:nhaptonden

				},
				function(data){
					$('#hdmua_report_content_main').html(data);
					$("#hdmua_report_content_main").show();
				}
			);
			
			$('#hdmua_content_main').hide();
			$('#hdmua_content_main').fadeOut('fast').load('index.php?listTonkho&mod=hdmua').fadeIn("fast");
			//$('#hdmua_report_content_main').load("?expTonkhoReport&mod=hdmua&exptype="+exptype+"&nhaptontu="+nhaptontu+"&nhaptonden="+nhaptonden);
		}else{
			window.location="?expTonkhoReport&mod=hdmua&exptype="+exptype+"&nhaptontu="+nhaptontu+"&nhaptonden="+nhaptonden;
		}
	}
	
	function edit_me_HdmuaTonkho(id,hoadon_id){
		$("#hdmua_content_main").load("?listTonkho&mod=hdmua&edit_me=1&hoadon_id="+hoadon_id+"&tonkho_id="+id);
	}
		
	$("#a_ref_HdmuaTonkho").click( function () { 
			$('#hdmua_content_main').hide();
			$('#hdmua_content_main').fadeOut('fast').load('index.php?listTonkho&mod=hdmua').fadeIn("fast");
		});
</script>
{/literal}
