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
<div id="file_hdban_content_insign">
	<form method="post" name="frmList_HdbanFile" action="?listHdbanFile{$vars.arg}" id="frmList_HdbanFile">
    <!------------------------------------------THEM MOI------------------------------------>
    <fieldset style="width:288px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
        <legend class="legend">Thêm/Chỉnh sửa</legend>
        <table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
            <tr height="20">
                <td colspan="2">
                    {if $error or $complete}
                        <span class="msg">Thông báo: <font color="#FF0000">{$error}</font>{$complete}</span>{/if}
                    <span id="lblError_HdbanFile" class="error">Thông báo: (*) là các mục bắt buộc!</span>
                </td>
            </tr>
            <tr height="20"><td colspan="2">Hợp đồng: {$hdban_info.hdban_sohd}</td></tr>
            <tr>
                <td align="center" valign="top">
                    <div style="float:left; width:30%; line-height:25px; text-align:left">Tên tệp tin <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                        <input type="text" id="hdfile_name" name="hdfile_name" class="text_short" value="{if $obj_info.hdfile_name neq ''}{$obj_info.hdfile_name}{else}{$hdban_info.hdban_sohd}{/if}" onfocus="hide_message_HdbanFile();"/>
                    </div>
                    <div style="float:left; width:30%; line-height:25px; text-align:left">Đường dẫn <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                        <input type="text" class="text_short" name="hdfile_path" id="hdfile_path" value="{$obj_info.hdfile_path}" onfocus="hide_message_HdbanFile();">&nbsp;<a href="javascript:void(0)" onclick="javascript:window.open('upload1.php?form_file=frmList_HdbanFile&field_file=hdfile_path','new_page','width=410,height=225')" >[ Tải lên ]</a>
                    </div>
                    <div style="float:left; width:100%; line-height:25px; text-align:left">
                        <input type="button" name="btnSub_HdbanFile" id="btnSub_HdbanFile" value="Ghi lại" class="button" tabindex="14"/>
                        <input type="hidden" name="hdfile_id" id="hdfile_id" value="{$obj_info.hdfile_id}">
                        <input type="hidden" name="hdban_sohd" id="hdban_sohd" value="{$hdban_info.hdban_sohd}">
                        <input type="hidden" name="hdban_id" id="hdban_id" value="{if $hdban_id neq ''}{$hdban_id}{else}{$hdban_info.hdban_id}{/if}">
                        <input type="reset" name="Reset" value="Hủy bỏ" class="button" tabindex="15"/>
                        {literal}
                            <script language="javascript">
                                function hide_message_HdbanFile(){
                                    $('#lblMessage_HdbanFile').hide();
                                    $('#lblError_HdbanFile').hide();
                                }

                                $(function() {
                                    $('.error').hide();
                                    $('#lblMessage_HdbanFile').hide();

                                    $("#btnSub_HdbanFile").click(function() {

                                        $('.error').hide();

                                        var $form 			= $("#frmList_HdbanFile");
                                        var hdfile_name 	= $form.find('input#hdfile_name').val();
                                        var hdfile_path 	= $form.find('input#hdfile_path').val();
                                        var hdban_id 		= $form.find('input#hdban_id').val();
                                        var hdban_sohd 		= $form.find('input#hdban_sohd').val();
                                        var hdfile_id 		= $form.find('input#hdfile_id').val();

                                        //begin validate form
                                        if (hdfile_name == "" || hdfile_path == "" || hdban_id == ""){
                                            $('#lblError_HdbanFile').show();
                                        }
                                        else{
                                            $.post('index.php?listHdbanFile&mod=hdban&add_edit=1',
                                                {
                                                    hdfile_name:hdfile_name,
                                                    hdfile_path:hdfile_path,
                                                    hdban_id:hdban_id,
                                                    hdban_sohd:hdban_sohd,
                                                    hdfile_id:hdfile_id,
                                                },
                                                function(data){
                                                    $('#list_hdban_file_cont').html(data);
                                                    $("#list_hdban_file_cont").show();
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
                            &nbsp;<a href='javascript: void(0);' onclick="edit_me_HdbanFile({$obj_list[pi]->hdfile_id})">{$obj_list[pi]->hdfile_name|str_string_cut:"25":"1"}</a>
                        {else}{$obj_list[pi]->hdfile_name}{/if}
                    </div>
                    <div class="{$class_td}" style="width:30px; text-align:center">
                        <a href='{$obj_list[pi]->hdfile_path}' target="new">
                            <img src="../images/admin/download_icon.png" width="16" height="16" border="0" title="Tải về"></a>
                    </div>
                    <div class="{$class_td}" style="width:29px; text-align:center">
                        {if $obj_list[pi]->user_id eq $access_user_id}
                            <a href='javascript: void(0);' onclick="edit_me_HdbanFile({$obj_list[pi]->hdfile_id})">
                                <img src="../images/admin/b_edit.png" width="11" height="11" border="0" title="Sửa"></a>
                        {else}-{/if}
                    </div>
                    <div class="{$class_td}" style="width:29px; text-align:center">
                        {if $obj_list[pi]->user_id eq $access_user_id}
                            <a href='javascript: void(0)' onClick="delItems_HdbanFile('{$processurl}', {$obj_list[pi]->hdfile_id});">
                                <img src="../images/admin/b_drop.png" width="11" height="11" border="0" title="Xóa"></a>
                        {else}-{/if}
                    </div>
                </div>
            {/section}
        </div>
        <input type="hidden" id="curpage_HdbanFile" name="curpage" value="{$vars.curpage}" />
    </fieldset>
    </form>
</div>
<!------------------------------------------------- Tool bar --------------------------------------------->
<div id="file_hdban_tool_bar">
    <div id="file_hdban_page_area">
        {if $vars.curpage eq 1}
            <img src="{$css_path}icon_first_page.png" class="img_all">
            <img src="{$css_path}icon_pre_page.png" class="img_all">
        {else}
            <a href="javascript: void(0)" id="first_page" onclick="gotoPage_HdbanFile('{$processurl}',parseInt(1));" title="Trang đầu">
                <img src="{$css_path}icon_first_page.png" class="img_all">
            </a>
            <a href="javascript: void(0)" id="pre_page" onclick="gotoPage_HdbanFile('{$processurl}',parseInt(document.getElementById('page_HdbanFile').value)-parseInt(1));" title="Trang trước">
                <img src="{$css_path}icon_pre_page.png" class="img_all">
            </a>
        {/if}
    </div>
    <div style="float:left; line-height:19px">
        <div style="float:left; width:35px">Trang</div>
        <div style="float:left; width:35px">
            <input type="text" value="{$vars.curpage}" name="page" id="page_HdbanFile" onblur=" gotoPage_HdbanFile('{$processurl}',this.value);" style="width:30px; font-size:12px; height:15px; border:1px solid #99bbe8">
        </div>
        <div style="float:left; width:22px"> / {$num_page}</div>
    </div>
    <div id="file_page_area">
        {if $vars.curpage eq $num_page}
            <img src="{$css_path}icon_next_page.png" class="img_all">
            <img src="{$css_path}icon_last_page.png" class="img_all">
        {else}
            <a href="javascript: void(0)" id="next_page" onclick="gotoPage_HdbanFile('{$processurl}',parseInt(document.getElementById('page_HdbanFile').value)+parseInt(1));" title="Trang tiếp">
                <img src="{$css_path}icon_next_page.png" class="img_all">
            </a>
            <a href="javascript: void(0)" id="last_page" onclick="gotoPage_HdbanFile('{$processurl}',parseInt({$num_page}));" title="Trang cuối">
                <img src="{$css_path}icon_last_page.png" class="img_all">
            </a>
        {/if}
    </div>

    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:left; width:15px">
        <a href="javascript: void(0)" id="a_ref_HdbanFile" title="Tải lại"><img src="{$css_path}icon_refresh.png" class="img_all"></a>
    </div>
</div>
{literal}
    <script language="javascript">
        function docheck_HdbanFile(status,from_){
            var alen=document.frmList_HdbanFile.elements.length;
            alen=(alen>5)?document.frmList_HdbanFile.chkid.length:0;
            if (alen>0){
                for(var i=0;i<alen;i++)
                    document.frmList_HdbanFile.chkid[i].checked=status;
            }
            else{
                document.frmList_HdbanFile.chkid.checked=status;
            }
            if(from_>0) document.frmList_HdbanFile.chkall.checked=status;
        }

        function docheckone_HdbanFile(){
            var alen=document.frmList_HdbanFile.elements.length;
            var isChecked=true;
            alen=(alen>4)?document.frmList_HdbanFile.chkid.length:0;
            if (alen>0){
                for(var i=0;i<alen;i++)
                    if(document.frmList_HdbanFile.chkid[i].checked==false)
                        isChecked=false;
            }else{
                if(document.frmList_HdbanFile.chkid.checked==false)
                    isChecked=false;
            }
            document.frmList_HdbanFile.chkall.checked=isChecked;
        }

        function calculatechon_HdbanFile(){
            var strchon="";
            var alen=document.frmList_HdbanFile.elements.length;
            alen=(alen>2)?document.frmList_HdbanFile.chkid.length:0;
            if (alen>0){
                for(var i=0;i<alen;i++)
                    if(document.frmList_HdbanFile.chkid[i].checked==true)
                        strchon+=document.frmList_HdbanFile.chkid[i].value+",";
            }else{
                if(document.frmList_HdbanFile.chkid.checked==true)
                    strchon=document.frmList_HdbanFile.chkid.value;
            }
            document.frmList_HdbanFile.chon_HdbanFile.value=strchon;
        }

        function delItems_HdbanFile(processurl,delStr){
            if (delStr == undefined){
                calculatechon_HdbanFile();
                delStr = document.getElementById("chon_HdbanFile").value;
            }
            if (delStr == ""){
                return false;
            }
            if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
                return false;
            }

            var numresult_HdbanFile,order_HdbanFile,curpage_HdbanFile;
            numresult = $("#numresult_HdbanFile").val();
            order = $("#order_HdbanFile").val();
            curpage = $("#curpage_HdbanFile").val();

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
                    $('#list_hdban_file_cont').fadeOut('fast').load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+curpage).fadeIn("fast");
                }
            });
        }

        function reloadPage_HdbanFile(processurl){
            var numresult_HdbanFile,order_HdbanFile,cur_pos;
            numresult = $("#numresult_HdbanFile").val();
            order = $("#order_HdbanFile").val();
            cur_pos = 0;
            $("#list_hdban_file_cont").load(processurl+"&numresult="+numresult+"&order="+order+"&cur_pos="+cur_pos);
        }

        function gotoPage_HdbanFile(processurl,page){
            var numresult_HdbanFile,order_HdbanFile,cur_pos;
            numresult = $("#numresult_HdbanFile").val();
            order = $("#order_HdbanFile").val();
            //alert(processurl+'-'+page+'-'+numresult+'-'+order);
            $("#list_hdban_file_cont").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
        }

        function edit_me_HdbanFile(id){
            var hdban_id = document.frmList_HdbanFile.hdban_id.value;
            $("#list_hdban_file_cont").load("?listHdbanFile&mod=hdban&edit_me=1&hdfile_id="+id+"&hdban_id="+hdban_id);
        }

        $("#a_ref_HdbanFile").click( function () {
            var id = document.frmList_HdbanFile.hdban_id.value;
            $('#list_hdban_file_cont').hide();
            $('#list_hdban_file_cont').fadeOut('fast').load('index.php?listHdbanFile&mod=hdban&hdban_id='+id).fadeIn("fast");
        });
    </script>
{/literal}