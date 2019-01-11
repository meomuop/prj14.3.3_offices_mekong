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
<div id="file_dthdban_content_insign">
	<form method="post" name="frmList_HdbandtFile" action="?listHdbandtFile{$vars.arg}" id="frmList_HdbandtFile">
    <!------------------------------------------THEM MOI------------------------------------>
    <fieldset style="width:588px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
        <legend class="legend">Thêm/Chỉnh sửa</legend>
        <table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
            <tr height="20">
                <td colspan="2">
                    {if $error or $complete}
                        <span class="msg">Thông báo: <font color="#FF0000">{$error}</font>{$complete}</span>{/if}
                    <span id="lblError_HdbandtFile" class="error">Thông báo: (*) là các mục bắt buộc!</span>
                </td>
            </tr>
            <tr height="20"><td colspan="2">Hợp đồng: {$dthdban_info.dthdban_sohd}</td></tr>
            <tr>
                <td align="center" valign="top" width="50%">
                    <div style="float:left; width:30%; line-height:25px; text-align:left">Tên tệp tin <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                        <input type="text" id="hdfile_name" name="hdfile_name" class="text_short" value="{if $obj_info.hdfile_name neq ''}{$obj_info.hdfile_name}{else}{$dthdban_info.dthdban_sohd} (Lần {$solan}){/if}" onfocus="hide_message_HdbandtFile();"/>
                    </div>
                    <div style="float:left; width:30%; line-height:25px; text-align:left">File dự thảo <font color="#FF0000">*</font>:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                        <input type="text" class="text_short" name="hdfile_path" id="hdfile_path" value="{$obj_info.hdfile_path}" onfocus="hide_message_HdbandtFile();">&nbsp;<a href="javascript:void(0)" onclick="javascript:window.open('upload_hdbandt_file.php?form_file=frmList_HdbandtFile&field_file=hdfile_path','new_page','width=410,height=225')" >[ Tải lên ]</a>
                    </div>
                </td>
                <td align="center" valign="top">
                    <div style="float:left; width:30%; line-height:25px; text-align:left">Ghi chú:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                        <input type="text" id="hdfile_ykien" name="hdfile_ykien" class="text_middle" value="{$obj_info.hdfile_ykien}"/>
                    </div>
                    <div style="float:left; width:30%; line-height:25px; text-align:left">File phản hồi:</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                        <input type="text" class="text_short" name="hdfile_phanhoi" id="hdfile_phanhoi" value="{$obj_info.hdfile_phanhoi}" onfocus="hide_message_HdbandtFile();">&nbsp;<a href="javascript:void(0)" onclick="javascript:window.open('upload_hdbandt_file.php?form_file=frmList_HdbandtFile&field_file=hdfile_phanhoi','new_page','width=410,height=225')" >[ Tải lên ]</a>
                    </div>
                    <div style="float:left; width:30%; line-height:25px; text-align:left">&nbsp;</div>
                    <div style="float:left; width:70%; line-height:25px; text-align:left">
                        <input type="button" name="btnSub_HdbandtFile" id="btnSub_HdbandtFile" value="Ghi lại" class="button" tabindex="14"/>
                        <input type="hidden" name="hdfile_id" id="hdfile_id" value="{$obj_info.hdfile_id}">
                        <input type="hidden" name="dthdban_sohd" id="dthdban_sohd" value="{$dthdban_info.dthdban_sohd}">
                        <input type="hidden" name="dthdban_id" id="dthdban_id" value="{if $dthdban_id neq ''}{$dthdban_id}{else}{$dthdban_info.dthdban_id}{/if}">
                        <input type="reset" name="Reset" value="Hủy bỏ" class="button" tabindex="15"/>
                        {literal}
                            <script language="javascript">
                                function hide_message_HdbandtFile(){
                                    $('#lblMessage_HdbandtFile').hide();
                                    $('#lblError_HdbandtFile').hide();
                                }

                                $(function() {
                                    $('.error').hide();
                                    $('#lblMessage_HdbandtFile').hide();

                                    $("#btnSub_HdbandtFile").click(function() {

                                        $('.error').hide();

                                        var $form 			= $("#frmList_HdbandtFile");
                                        var hdfile_name 	= $form.find('input#hdfile_name').val();
                                        var hdfile_path 	= $form.find('input#hdfile_path').val();
                                        var hdfile_phanhoi 	= $form.find('input#hdfile_phanhoi').val();
                                        var hdfile_ykien 	= $form.find('input#hdfile_ykien').val();
                                        var dthdban_id 		= $form.find('input#dthdban_id').val();
                                        var dthdban_sohd 	= $form.find('input#dthdban_sohd').val();
                                        var hdfile_id 		= $form.find('input#hdfile_id').val();

                                        //begin validate form
                                        if (hdfile_name == "" || hdfile_path == "" || dthdban_id == ""){
                                            $('#lblError_HdbandtFile').show();
                                        }
                                        else{
                                            $.post('index.php?listHdbandtFile&mod=hdban&add_edit=1',
                                                {
                                                    hdfile_name:hdfile_name,
                                                    hdfile_path:hdfile_path,
                                                    hdfile_phanhoi:hdfile_phanhoi,
                                                    hdfile_ykien:hdfile_ykien,
                                                    dthdban_id:dthdban_id,
                                                    dthdban_sohd:dthdban_sohd,
                                                    hdfile_id:hdfile_id,
                                                },
                                                function(data){
                                                    $('#list_dthdban_file_cont').html(data);
                                                    $("#list_dthdban_file_cont").show();
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
    <fieldset style="width:588px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:204px">
        <legend class="legend"><div style="width:130px; float:left">Danh sách: {$total_num_result}</div></legend>
        <div style="float:left; height:5px; width:100%"></div>
        <div style="float:left; height:25px; width:570px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
            <div class="tbl_tit" style="width:30px; text-align:center"><b>STT</b></div>
            <div class="tbl_tit" style="width:150px"><B>&nbsp;Tên tệp tin</B></div>
            <div class="tbl_tit" style="width:60px"><B>&nbsp;Dự thảo</B></div>
            <div class="tbl_tit" style="width:60px"><B>&nbsp;Phản hồi</B></div>
            <div class="tbl_tit" style="width:205px"><B>&nbsp;Ghi chú</B></div>
            <div class="tbl_tit" style="width:90px; text-align:center"><B>Chọn</B></div>
        </div>
        <div style="float:left; height:150px; width:588px; overflow-y:scroll">
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
                            &nbsp;<a href='javascript: void(0);' onclick="edit_me_HdbandtFile({$obj_list[pi]->hdfile_id})">{$obj_list[pi]->hdfile_name|str_string_cut:"25":"1"}</a>
                        {else}{$obj_list[pi]->hdfile_name}{/if}
                    </div>
                    <div class="{$class_td}" style="width:60px; text-align:center">
                        <a href='{$obj_list[pi]->hdfile_path}' target="new">[Xem file]</a>
                    </div>
                    <div class="{$class_td}" style="width:60px; text-align:center">
                        {if $obj_list[pi]->hdfile_phanhoi neq ''}
                        <a href='{$obj_list[pi]->hdfile_phanhoi}' target="new">[Xem file]</a>
                        {else}
                            Chưa có
                        {/if}
                    </div>
                    <div class="{$class_td}" style="width:205px; white-space:nowrap" title="{$obj_list[pi]->hdfile_ykien}">
                        {if $obj_list[pi]->hdfile_ykien}
                            {$obj_list[pi]->hdfile_ykien|str_string_cut:"45":"1"}
                        {else}&nbsp;{/if}
                    </div>
                    <div class="{$class_td}" style="width:29px; text-align:center">
                        {if $obj_list[pi]->user_id eq $access_user_id}
                            <a href='javascript: void(0);' onclick="edit_me_HdbandtFile({$obj_list[pi]->hdfile_id})">
                                <img src="../images/admin/b_edit.png" width="11" height="11" border="0" title="Sửa"></a>
                        {else}-{/if}
                    </div>
                    <div class="{$class_td}" style="width:29px; text-align:center">
                        {if $obj_list[pi]->user_id eq $access_user_id}
                            <a href='javascript: void(0)' onClick="delItems_HdbandtFile('{$processurl}', {$obj_list[pi]->hdfile_id});">
                                <img src="../images/admin/b_drop.png" width="11" height="11" border="0" title="Xóa"></a>
                        {else}-{/if}
                    </div>
                </div>
            {/section}
        </div>
        <input type="hidden" id="curpage_HdbandtFile" name="curpage" value="{$vars.curpage}" />
    </fieldset>
    </form>
</div>
<!------------------------------------------------- Tool bar --------------------------------------------->
<div id="file_dthdban_tool_bar">
    <div id="file_dthdban_page_area">
        {if $vars.curpage eq 1}
            <img src="{$css_path}icon_first_page.png" class="img_all">
            <img src="{$css_path}icon_pre_page.png" class="img_all">
        {else}
            <a href="javascript: void(0)" id="first_page" onclick="gotoPage_HdbandtFile('{$processurl}',parseInt(1));" title="Trang đầu">
                <img src="{$css_path}icon_first_page.png" class="img_all">
            </a>
            <a href="javascript: void(0)" id="pre_page" onclick="gotoPage_HdbandtFile('{$processurl}',parseInt(document.getElementById('page_HdbandtFile').value)-parseInt(1));" title="Trang trước">
                <img src="{$css_path}icon_pre_page.png" class="img_all">
            </a>
        {/if}
    </div>
    <div style="float:left; line-height:19px">
        <div style="float:left; width:35px">Trang</div>
        <div style="float:left; width:35px">
            <input type="text" value="{$vars.curpage}" name="page" id="page_HdbandtFile" onblur=" gotoPage_HdbandtFile('{$processurl}',this.value);" style="width:30px; font-size:12px; height:15px; border:1px solid #99bbe8">
        </div>
        <div style="float:left; width:22px"> / {$num_page}</div>
    </div>
    <div id="file_page_area">
        {if $vars.curpage eq $num_page}
            <img src="{$css_path}icon_next_page.png" class="img_all">
            <img src="{$css_path}icon_last_page.png" class="img_all">
        {else}
            <a href="javascript: void(0)" id="next_page" onclick="gotoPage_HdbandtFile('{$processurl}',parseInt(document.getElementById('page_HdbandtFile').value)+parseInt(1));" title="Trang tiếp">
                <img src="{$css_path}icon_next_page.png" class="img_all">
            </a>
            <a href="javascript: void(0)" id="last_page" onclick="gotoPage_HdbandtFile('{$processurl}',parseInt({$num_page}));" title="Trang cuối">
                <img src="{$css_path}icon_last_page.png" class="img_all">
            </a>
        {/if}
    </div>

    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:left; width:15px">
        <a href="javascript: void(0)" id="a_ref_HdbandtFile" title="Tải lại"><img src="{$css_path}icon_refresh.png" class="img_all"></a>
    </div>
</div>
{literal}
    <script language="javascript">
        function docheck_HdbandtFile(status,from_){
            var alen=document.frmList_HdbandtFile.elements.length;
            alen=(alen>5)?document.frmList_HdbandtFile.chkid.length:0;
            if (alen>0){
                for(var i=0;i<alen;i++)
                    document.frmList_HdbandtFile.chkid[i].checked=status;
            }
            else{
                document.frmList_HdbandtFile.chkid.checked=status;
            }
            if(from_>0) document.frmList_HdbandtFile.chkall.checked=status;
        }

        function docheckone_HdbandtFile(){
            var alen=document.frmList_HdbandtFile.elements.length;
            var isChecked=true;
            alen=(alen>4)?document.frmList_HdbandtFile.chkid.length:0;
            if (alen>0){
                for(var i=0;i<alen;i++)
                    if(document.frmList_HdbandtFile.chkid[i].checked==false)
                        isChecked=false;
            }else{
                if(document.frmList_HdbandtFile.chkid.checked==false)
                    isChecked=false;
            }
            document.frmList_HdbandtFile.chkall.checked=isChecked;
        }

        function calculatechon_HdbandtFile(){
            var strchon="";
            var alen=document.frmList_HdbandtFile.elements.length;
            alen=(alen>2)?document.frmList_HdbandtFile.chkid.length:0;
            if (alen>0){
                for(var i=0;i<alen;i++)
                    if(document.frmList_HdbandtFile.chkid[i].checked==true)
                        strchon+=document.frmList_HdbandtFile.chkid[i].value+",";
            }else{
                if(document.frmList_HdbandtFile.chkid.checked==true)
                    strchon=document.frmList_HdbandtFile.chkid.value;
            }
            document.frmList_HdbandtFile.chon_HdbandtFile.value=strchon;
        }

        function delItems_HdbandtFile(processurl,delStr){
            if (delStr == undefined){
                calculatechon_HdbandtFile();
                delStr = document.getElementById("chon_HdbandtFile").value;
            }
            if (delStr == ""){
                return false;
            }
            if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
                return false;
            }

            var numresult_HdbandtFile,order_HdbandtFile,curpage_HdbandtFile;
            numresult = $("#numresult_HdbandtFile").val();
            order = $("#order_HdbandtFile").val();
            curpage = $("#curpage_HdbandtFile").val();

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
                    $('#list_dthdban_file_cont').fadeOut('fast').load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+curpage).fadeIn("fast");
                }
            });
        }

        function reloadPage_HdbandtFile(processurl){
            var numresult_HdbandtFile,order_HdbandtFile,cur_pos;
            numresult = $("#numresult_HdbandtFile").val();
            order = $("#order_HdbandtFile").val();
            cur_pos = 0;
            $("#list_dthdban_file_cont").load(processurl+"&numresult="+numresult+"&order="+order+"&cur_pos="+cur_pos);
        }

        function gotoPage_HdbandtFile(processurl,page){
            var numresult_HdbandtFile,order_HdbandtFile,cur_pos;
            numresult = $("#numresult_HdbandtFile").val();
            order = $("#order_HdbandtFile").val();
            //alert(processurl+'-'+page+'-'+numresult+'-'+order);
            $("#list_dthdban_file_cont").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
        }

        function edit_me_HdbandtFile(id){
            var dthdban_id = document.frmList_HdbandtFile.dthdban_id.value;
            $("#list_dthdban_file_cont").load("?listHdbandtFile&mod=hdban&edit_me=1&hdfile_id="+id+"&dthdban_id="+dthdban_id);
        }

        $("#a_ref_HdbandtFile").click( function () {
            var id = document.frmList_HdbandtFile.dthdban_id.value;
            $('#list_dthdban_file_cont').hide();
            $('#list_dthdban_file_cont').fadeOut('fast').load('index.php?listHdbandtFile&mod=hdban&dthdban_id='+id).fadeIn("fast");
        });
    </script>
{/literal}