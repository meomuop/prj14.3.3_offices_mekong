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
<div id="file_hdmua_content_insign">
	<form method="post" name="frmList_HdmuaFile" action="?listHdmuaFile{$vars.arg}" id="frmList_HdmuaFile">
    <!------------------------------------------THEM MOI------------------------------------>
    <fieldset style="width:288px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
        <legend class="legend">Thêm/Chỉnh sửa</legend>
        <table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
            <tr height="20">
                <td colspan="2">
                    {if $error or $complete}
                        <span class="msg">Thông báo: <font color="#FF0000">{$error}</font>{$complete}</span>{/if}
                    <span id="lblError_HdmuaFile" class="error">Thông báo: (*) là các mục bắt buộc!</span>
                </td>
            </tr>
            <tr height="20"><td colspan="2">Hợp đồng: {$hdmua_info.hdmua_sohd}</td></tr>
            <tr>
                <td align="center" valign="top">
                    <div style="float:left; width:30%; line-height:25px; text-align:left">Tên tệp tin <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                        <input type="text" id="hdfile_name" name="hdfile_name" class="text_short" value="{if $obj_info.hdfile_name neq ''}{$obj_info.hdfile_name}{else}{$hdmua_info.hdmua_sohd}{/if}" onfocus="hide_message_HdmuaFile();"/>
                    </div>
                    <div style="float:left; width:30%; line-height:25px; text-align:left">Đường dẫn <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                        <input type="text" class="text_short" name="hdfile_path" id="hdfile_path" value="{$obj_info.hdfile_path}" onfocus="hide_message_HdmuaFile();">&nbsp;<a href="javascript:void(0)" onclick="javascript:window.open('upload1.php?form_file=frmList_HdmuaFile&field_file=hdfile_path','new_page','width=410,height=225')" >[ Tải lên ]</a>
                    </div>
                    <div style="float:left; width:100%; line-height:25px; text-align:left">
                        <input type="button" name="btnSub_HdmuaFile" id="btnSub_HdmuaFile" value="Ghi lại" class="button" tabindex="14"/>
                        <input type="hidden" name="hdfile_id" id="hdfile_id" value="{$obj_info.hdfile_id}">
                        <input type="hidden" name="hdmua_sohd" id="hdmua_sohd" value="{$hdmua_info.hdmua_sohd}">
                        <input type="hidden" name="hdmua_id" id="hdmua_id" value="{if $hdmua_id neq ''}{$hdmua_id}{else}{$hdmua_info.hdmua_id}{/if}">
                        <input type="reset" name="Reset" value="Hủy bỏ" class="button" tabindex="15"/>
                        {literal}
                            <script language="javascript">
                                function hide_message_HdmuaFile(){
                                    $('#lblMessage_HdmuaFile').hide();
                                    $('#lblError_HdmuaFile').hide();
                                }

                                $(function() {
                                    $('.error').hide();
                                    $('#lblMessage_HdmuaFile').hide();

                                    $("#btnSub_HdmuaFile").click(function() {

                                        $('.error').hide();

                                        var $form 			= $("#frmList_HdmuaFile");
                                        var hdfile_name 	= $form.find('input#hdfile_name').val();
                                        var hdfile_path 	= $form.find('input#hdfile_path').val();
                                        var hdmua_id 		= $form.find('input#hdmua_id').val();
                                        var hdmua_sohd 		= $form.find('input#hdmua_sohd').val();
                                        var hdfile_id 		= $form.find('input#hdfile_id').val();

                                        //begin validate form
                                        if (hdfile_name == "" || hdfile_path == "" || hdmua_id == ""){
                                            $('#lblError_HdmuaFile').show();
                                        }
                                        else{
                                            $.post('index.php?listHdmuaFile&mod=hdmua&add_edit=1',
                                                {
                                                    hdfile_name:hdfile_name,
                                                    hdfile_path:hdfile_path,
                                                    hdmua_id:hdmua_id,
                                                    hdmua_sohd:hdmua_sohd,
                                                    hdfile_id:hdfile_id,
                                                },
                                                function(data){
                                                    $('#list_hdmua_file_cont').html(data);
                                                    $("#list_hdmua_file_cont").show();
                                                }
                                            );
                                            return false;
                                        }
                                        //end form
                                    });
                                });
                            </script>
                        {/literal}
                    </div>
                </td>
            </tr>
        </table>
    </fieldset>
    <!------------------------------------DANH SACH---------------------------------------------->
    <fieldset style="width:288px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:144px">
        <legend class="legend"><div style="width:130px; float:left">Danh sách: {$total_num_result}</div></legend>
        <div style="float:left; height:5px; width:100%"></div>
        <div style="float:left; height:25px; width:273px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
            <div class="tbl_tit" style="width:30px; text-align:center"><b>STT</b></div>
            <div class="tbl_tit" style="width:150px"><B>&nbsp;Tên tệp tin</B></div>
            <div class="tbl_tit" style="width:90px; text-align:center"><B>Chọn</B></div>
        </div>
        <div style="float:left; width:18px; height:25px">&nbsp;</div>
        <div style="float:left; height:90px; width:291px; overflow-y:scroll">
            {section name=pi loop=$obj_list}
                {if $smarty.section.pi.index is not div by 2}
                    {assign var="class_td" value="tbl_cont"}
                {else}
                    {assign var="class_td" value="tbl_cont2"}
                {/if}
                {math x=$vars.curpage-1 y=$vars.numresult z=$smarty.section.pi.index t=1 equation="x*y+z+t" assign=stt}
                <div style="float:left">
                    <div class="{$class_td}" style="width:30px; text-align:center">{$stt}</div>
                    <div class="{$class_td}" style="width:150px; white-space:nowrap" title="{$obj_list[pi]->hdfile_name}">
                        {if $obj_list[pi]->user_id eq $access_user_id}
                            &nbsp;<a href='javascript: void(0);' onclick="edit_me_HdmuaFile({$obj_list[pi]->hdfile_id})">{$obj_list[pi]->hdfile_name|str_string_cut:"25":"1"}</a>
                        {else}{$obj_list[pi]->hdfile_name}{/if}
                    </div>
                    <div class="{$class_td}" style="width:30px; text-align:center">
                        <a href='{$obj_list[pi]->hdfile_path}' target="new">
                            <img src="../images/admin/download_icon.png" width="16" height="16" border="0" title="Tải về"></a>
                    </div>
                    <div class="{$class_td}" style="width:29px; text-align:center">
                        {if $obj_list[pi]->user_id eq $access_user_id}
                            <a href='javascript: void(0);' onclick="edit_me_HdmuaFile({$obj_list[pi]->hdfile_id})">
                                <img src="../images/admin/b_edit.png" width="11" height="11" border="0" title="Sửa"></a>
                        {else}-{/if}
                    </div>
                    <div class="{$class_td}" style="width:29px; text-align:center">
                        {if $obj_list[pi]->user_id eq $access_user_id}
                            <a href='javascript: void(0)' onClick="delItems_HdmuaFile('{$processurl}', {$obj_list[pi]->hdfile_id});">
                                <img src="../images/admin/b_drop.png" width="11" height="11" border="0" title="Xóa"></a>
                        {else}-{/if}
                    </div>
                </div>
            {/section}
        </div>
        <input type="hidden" id="curpage_HdmuaFile" name="curpage" value="{$vars.curpage}" />
    </fieldset>
    </form>
</div>
<!------------------------------------------------- Tool bar --------------------------------------------->
<div id="file_hdmua_tool_bar">
    <div id="file_hdmua_page_area">
        {if $vars.curpage eq 1}
            <img src="{$css_path}icon_first_page.png" class="img_all">
            <img src="{$css_path}icon_pre_page.png" class="img_all">
        {else}
            <a href="javascript: void(0)" id="first_page" onclick="gotoPage_HdmuaFile('{$processurl}',parseInt(1));" title="Trang đầu">
                <img src="{$css_path}icon_first_page.png" class="img_all">
            </a>
            <a href="javascript: void(0)" id="pre_page" onclick="gotoPage_HdmuaFile('{$processurl}',parseInt(document.getElementById('page_HdmuaFile').value)-parseInt(1));" title="Trang trước">
                <img src="{$css_path}icon_pre_page.png" class="img_all">
            </a>
        {/if}
    </div>
    <div style="float:left; line-height:19px">
        <div style="float:left; width:35px">Trang</div>
        <div style="float:left; width:35px">
            <input type="text" value="{$vars.curpage}" name="page" id="page_HdmuaFile" onblur=" gotoPage_HdmuaFile('{$processurl}',this.value);" style="width:30px; font-size:12px; height:15px; border:1px solid #99bbe8">
        </div>
        <div style="float:left; width:22px"> / {$num_page}</div>
    </div>
    <div id="file_page_area">
        {if $vars.curpage eq $num_page}
            <img src="{$css_path}icon_next_page.png" class="img_all">
            <img src="{$css_path}icon_last_page.png" class="img_all">
        {else}
            <a href="javascript: void(0)" id="next_page" onclick="gotoPage_HdmuaFile('{$processurl}',parseInt(document.getElementById('page_HdmuaFile').value)+parseInt(1));" title="Trang tiếp">
                <img src="{$css_path}icon_next_page.png" class="img_all">
            </a>
            <a href="javascript: void(0)" id="last_page" onclick="gotoPage_HdmuaFile('{$processurl}',parseInt({$num_page}));" title="Trang cuối">
                <img src="{$css_path}icon_last_page.png" class="img_all">
            </a>
        {/if}
    </div>

    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:left; width:15px">
        <a href="javascript: void(0)" id="a_ref_HdmuaFile" title="Tải lại"><img src="{$css_path}icon_refresh.png" class="img_all"></a>
    </div>
</div>
{literal}
    <script language="javascript">
        function docheck_HdmuaFile(status,from_){
            var alen=document.frmList_HdmuaFile.elements.length;
            alen=(alen>5)?document.frmList_HdmuaFile.chkid.length:0;
            if (alen>0){
                for(var i=0;i<alen;i++)
                    document.frmList_HdmuaFile.chkid[i].checked=status;
            }
            else{
                document.frmList_HdmuaFile.chkid.checked=status;
            }
            if(from_>0) document.frmList_HdmuaFile.chkall.checked=status;
        }

        function docheckone_HdmuaFile(){
            var alen=document.frmList_HdmuaFile.elements.length;
            var isChecked=true;
            alen=(alen>4)?document.frmList_HdmuaFile.chkid.length:0;
            if (alen>0){
                for(var i=0;i<alen;i++)
                    if(document.frmList_HdmuaFile.chkid[i].checked==false)
                        isChecked=false;
            }else{
                if(document.frmList_HdmuaFile.chkid.checked==false)
                    isChecked=false;
            }
            document.frmList_HdmuaFile.chkall.checked=isChecked;
        }

        function calculatechon_HdmuaFile(){
            var strchon="";
            var alen=document.frmList_HdmuaFile.elements.length;
            alen=(alen>2)?document.frmList_HdmuaFile.chkid.length:0;
            if (alen>0){
                for(var i=0;i<alen;i++)
                    if(document.frmList_HdmuaFile.chkid[i].checked==true)
                        strchon+=document.frmList_HdmuaFile.chkid[i].value+",";
            }else{
                if(document.frmList_HdmuaFile.chkid.checked==true)
                    strchon=document.frmList_HdmuaFile.chkid.value;
            }
            document.frmList_HdmuaFile.chon_HdmuaFile.value=strchon;
        }

        function delItems_HdmuaFile(processurl,delStr){
            if (delStr == undefined){
                calculatechon_HdmuaFile();
                delStr = document.getElementById("chon_HdmuaFile").value;
            }
            if (delStr == ""){
                return false;
            }
            if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
                return false;
            }

            var numresult_HdmuaFile,order_HdmuaFile,curpage_HdmuaFile;
            numresult = $("#numresult_HdmuaFile").val();
            order = $("#order_HdmuaFile").val();
            curpage = $("#curpage_HdmuaFile").val();

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
                    $('#list_hdmua_file_cont').fadeOut('fast').load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+curpage).fadeIn("fast");
                }
            });
        }

        function reloadPage_HdmuaFile(processurl){
            var numresult_HdmuaFile,order_HdmuaFile,cur_pos;
            numresult = $("#numresult_HdmuaFile").val();
            order = $("#order_HdmuaFile").val();
            cur_pos = 0;
            $("#list_hdmua_file_cont").load(processurl+"&numresult="+numresult+"&order="+order+"&cur_pos="+cur_pos);
        }

        function gotoPage_HdmuaFile(processurl,page){
            var numresult_HdmuaFile,order_HdmuaFile,cur_pos;
            numresult = $("#numresult_HdmuaFile").val();
            order = $("#order_HdmuaFile").val();
            //alert(processurl+'-'+page+'-'+numresult+'-'+order);
            $("#list_hdmua_file_cont").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
        }

        function edit_me_HdmuaFile(id){
            var hdmua_id = document.frmList_HdmuaFile.hdmua_id.value;
            $("#list_hdmua_file_cont").load("?listHdmuaFile&mod=hdmua&edit_me=1&hdfile_id="+id+"&hdmua_id="+hdmua_id);
        }

        $("#a_ref_HdmuaFile").click( function () {
            var id = document.frmList_HdmuaFile.hdmua_id.value;
            $('#list_hdmua_file_cont').hide();
            $('#list_hdmua_file_cont').fadeOut('fast').load('index.php?listHdmuaFile&mod=hdmua&hdmua_id='+id).fadeIn("fast");
        });
    </script>
{/literal}