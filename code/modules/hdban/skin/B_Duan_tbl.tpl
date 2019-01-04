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
<div id="tthd_content_insign">
    <form method="post" name="frmList_Duan" action="?listDuan{$vars.arg}" id="frmList_Duan">
        <!------------------------------------------THEM MOI------------------------------------>
        <fieldset style="width:712px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
            <legend class="legend_list">
                Thêm/Chỉnh sửa&nbsp;|&nbsp;Thông báo:&nbsp;
                <span id="lblError_Duan" class="error">Mời bạn nhập đủ dữ liệu!</span>
            </legend>
            <table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
                <tr height="10"><td colspan="4"></td></tr>
                <tr>
                    <td width="70%">
                        <div style="float:left; width:14%; line-height:25px; text-align:left">Tên dự án <font color="#FF0000">*</font>:</div>
                        <div style="float:left; width:86%; line-height:25px; text-align:left">
                            <input type="text" name="duan_name" id="duan_name" class="text_super_long" value="{$obj_info.duan_name}"/>
                        </div>
                        <div style="float:left; width:14%; line-height:25px; text-align:left">Tên giao dịch: <font color="#FF0000">*</font>:</div>
                        <div style="float:left; width:86%; line-height:25px; text-align:left">
                            <input type="text" id="duan_thuongmai" name="duan_thuongmai" class="text_super_long" value="{$obj_info.duan_thuongmai}"/>
                        </div>
                        <div style="float:left; width:14%; line-height:25px; text-align:left">Chủ đầu tư: <font color="#FF0000">*</font>:</div>
                        <div style="float:left; width:86%; line-height:25px; text-align:left">
                            <input type="text" id="duan_chudautu" name="duan_chudautu" class="text_super_long" value="{$obj_info.duan_chudautu}"/>
                        </div>
                        <div style="float:left; width:14%; line-height:25px; text-align:left">Mô tả <font color="#FF0000">*</font>:</div>
                        <div style="float:left; width:86%; line-height:25px; text-align:left; height:75px">
                            <textarea spellcheck="false" name="duan_mota" id="duan_mota" cols="30" rows="5" class="text_area_long" onfocus="hide_message_Hdban()" tabindex="8">{$obj_info.duan_mota}</textarea>
                        </div>
                        <div style="float:left; width:14%; line-height:25px; text-align:left">Mã dự án: <font color="#FF0000">*</font>:</div>
                        <div style="float:left; width:19%; line-height:25px; text-align:left">
                            <input type="text" id="duan_maduan" name="duan_maduan" class="text_short" value="{$obj_info.duan_maduan}"/>
                        </div>
                        <div style="float:left; width:9%; line-height:25px; text-align:left">Tình trạng:</div>
                        <div style="float:left; width:28%; line-height:25px; text-align:left;">
                            {if $obj_info.duan_active neq ''}
                                <input type="radio" id="duan_active" name="duan_active" value="1" {if $obj_info.duan_active eq 1} checked="checked" {/if} />&nbsp;Hiển thị&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="radio" id="duan_active" name="duan_active" value="2" {if $obj_info.duan_active eq 2} checked="checked" {/if} />&nbsp;Không hiển thị
                            {else}
                                <input type="radio" id="duan_active" name="duan_active" value="1" checked/>&nbsp;Hiển thị&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="radio" id="duan_active" name="duan_active" value="2" />&nbsp;Không hiển thị
                            {/if}
                        </div>
                        <div style="float:left; width:25%; line-height:25px; text-align:left;">
                            <input type="button" name="btnSub_Duan" id="btnSub_Duan" value="Ghi lại" class="button" />
                            <input type="hidden" name="duan_id" id="duan_id" value="{$obj_info.duan_id}">
                            <input type="reset" name="Reset" value="Hủy bỏ" class="button" />
                            {literal}
                                <script language="javascript">
                                    function hide_message_Duan(){
                                        $('#lblMessage_Duan').hide();
                                        $('#lblError_Duan').hide();
                                    }

                                    $(function() {
                                        $('.error').hide();
                                        $('#lblMessage_Duan').hide();

                                        $("#btnSub_Duan").click(function() {
                                            $('.error').hide();
                                            var $form = $("#frmList_Duan");

                                            var duan_name       = $form.find('input#duan_name').val();
                                            var duan_thuongmai    = $form.find('input#duan_thuongmai').val();
                                            var duan_maduan     = $form.find('input#duan_maduan').val();
                                            var duan_chudautu     = $form.find('input#duan_chudautu').val();
                                            var duan_mota       = $form.find('textarea#duan_mota').val();
                                            var duan_active     = $form.find('input#duan_active:checked').val();
                                            var duan_id         = $form.find('input#duan_id').val();
                                            //begin validate form
                                            if (duan_name == ""){
                                                $('#lblError_Duan').show();
                                            }
                                            else{
                                                var dataString  = "duan_name=" + duan_name;
                                                dataString += "&duan_thuongmai=" + duan_thuongmai;
                                                dataString += "&duan_maduan=" + duan_maduan;
                                                dataString += "&duan_chudautu=" + duan_chudautu;
                                                dataString += "&duan_mota=" + duan_mota;
                                                dataString += "&duan_active=" + duan_active;
                                                dataString += "&duan_id=" + duan_id +"";

                                                $.ajax({
                                                    type: "POST",
                                                    url: "index.php?listDuan&mod=hdban&add_edit=1",
                                                    data: dataString,
                                                    success: function(data) {
                                                        $('#hdban_content_main').fadeOut('fast').load('index.php?listDuan&mod=hdban').fadeIn("fast");
                                                        //$('#lblMessage_Duan').show();
                                                    }
                                                });
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
        <fieldset style="width:1012px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:250px">
            <legend class="legend_list">
                <div style="width:130px; float:left">Danh sách: {$total_num_result}</div>
                <div style="width:70px; float:left">&nbsp;|&nbsp;Tìm kiếm&nbsp;</div>
                <div style="width:100px; float:left">
                    <input type="text" name="keyword" id="keyword" class="text_seek" value="{$vars.keyword}"/>
                    <input type="hidden" id="processurl" value="{$processurl}" />
                </div>
                <div style="width:50px; float:left">
                    <input type="button" name="btnSeek" id="btnSeek" value="Tìm >>" class="button_seek" onclick="search_me_Duan()" /></div>
            </legend>
            <div style="float:left; height:5px; width:100%"></div>
            <div style="float:left; height:25px; width:992px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
                <div class="tbl_tit" style="width:30px; text-align:center"><b>STT</b></div>
                <div class="tbl_tit" style="width:350px"><B>&nbsp;Tên dự án</B></div>
                <div class="tbl_tit" style="width:100px"><B>&nbsp;Mã dự án</B></div>
                <div class="tbl_tit" style="width:288px"><B>&nbsp;Chủ đầu tư</B></div>
                <div class="tbl_tit" style="width:59px; text-align:center"><B>Sắp xếp</B></div>
                <div class="tbl_tit" style="width:59px; text-align:center"><B>Hiển thị</B></div>
                <div class="tbl_tit" style="width:59px; text-align:center"><B>Chọn</B></div>
                <div class="tbl_tit" style="width:39px; text-align:center">
                    <input type="hidden" name="chon" id="chon_Duan">
                    <input type="checkbox" name="chkall" value="0" onclick="docheck_Duan(document.frmList_Duan.chkall.checked,0);">
                </div>
            </div>
            <div style="float:left; width:20px; text-align:right">
                <input type="button" name="del_Items" id='del_Items' value="&nbsp;" onClick="delItems_Duan('{$processurl}');" style="width:17px; font-size:12px; background:url(../images/admin/b_drop.png); cursor:pointer" title="Xóa lựa chọn">
            </div>
            <div style="float:left; height:197px; width:1012px; overflow-y:scroll">
                {section name=pi loop=$obj_list}
                    {if $smarty.section.pi.index is not div by 2}
                        {assign var="class_td" value="tbl_cont"}
                    {else}
                        {assign var="class_td" value="tbl_cont2"}
                    {/if}
                    {math x=$vars.curpage-1 y=$vars.numresult z=$smarty.section.pi.index t=1 equation="x*y+z+t" assign=stt}
                    <div style="float:left;">
                        <div class="{$class_td}" style="width:30px; text-align:center">{$stt}</div>
                        <div class="{$class_td}" style="width:350px; white-space: nowrap">
                            &nbsp;<a href="javascript: void(0);" onclick="edit_me_Duan({$obj_list[pi]->duan_id})"  title="{$obj_list[pi]->duan_name}">{$obj_list[pi]->duan_name|str_string_cut:"80":"1"}</a>
                        </div>
                        <div class="{$class_td}" style="width:100px; white-space: nowrap">
                            &nbsp;{$obj_list[pi]->duan_maduan}
                        </div>
                        <div class="{$class_td}" style="width:288px; white-space: nowrap" title="{$obj_list[pi]->duan_chudautu}">
                            &nbsp;{$obj_list[pi]->duan_chudautu|str_string_cut:"65":"1"}
                        </div>
                        <div class="{$class_td}" style="width:59px; text-align:center">
                            <select name="duan_sort[]" onchange="sort_me_Duan({$obj_list[pi]->duan_id},this.value)" class="select_tiny">
                                {section name=i loop=$total_num_result}
                                    <option value="{$smarty.section.i.index}" {if $smarty.section.i.index eq $obj_list[pi]->duan_sort} selected="selected"{/if}>{$smarty.section.i.index}</option>
                                {/section}
                            </select>
                            <input type="hidden" name="duan_id1[]" value="{$obj_list[pi]->duan_id}">
                        </div>
                        <div class="{$class_td}" style="width:59px; text-align:center">
                            {if $obj_list[pi]->duan_active eq 1}
                                <a href='javascript: void(0);' onclick="uncheck_fns_Duan('duan_active',2,{$obj_list[pi]->duan_id})"><img src="../images/admin/tick.png" width="10" height="10" border="0" title="Ẩn"></a>
                            {else}
                                <a href='javascript: void(0);' onclick="uncheck_fns_Duan('duan_active',1,{$obj_list[pi]->duan_id})"><img src="../images/admin/publish_x.png" width="10" height="10" border="0" title="Hiện"></a>
                            {/if}
                        </div>
                        <div class="{$class_td}" style="width:29px; text-align:center">
                            <a href='javascript: void(0);' onclick="edit_me_Duan({$obj_list[pi]->duan_id})">
                                <img src="../images/admin/b_edit.png" width="11" height="11" border="0" title="Sửa"></a>
                        </div>
                        <div class="{$class_td}" style="width:29px; text-align:center">
                            <a href='javascript: void(0'  onClick="delItems_Duan('{$processurl}', {$obj_list[pi]->duan_id});">
                                <img src="../images/admin/b_drop.png" width="11" height="11" border="0" title="Xóa"></a>
                        </div>
                        <div class="{$class_td}" style="width:39px; text-align:center">
                            <input type="checkbox" name="chkid" value="{$obj_list[pi]->duan_id}" onclick="docheckone_Duan();">
                        </div>
                    </div>
                {/section}
            </div>
            <input type="hidden" id="curpage_Duan" name="curpage" value="{$vars.curpage}" />
        </fieldset>
    </form>
</div>
<!------------------------------------------------- Tool bar --------------------------------------------->
<div id="doc_clear_txt"></div>
<div id="doc_tool_bar">

    <div id="doc_search_area">
        <select name="order" id="order_Duan" style="width:120px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_Duan('{$processurl}');">
            {section name=sli loop=$order_arr}
                <option value="{$smarty.section.sli.index}" {if $smarty.section.sli.index eq $vars.order}selected{/if} >
                    {$order_arr[sli]}
                </option>
            {/section}
        </select>
    </div>

    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div id="doc_page_area">
        {if $vars.curpage eq 1}
            <img src="{$css_path}icon_first_page.png" class="img_all">
            <img src="{$css_path}icon_pre_page.png" class="img_all">
        {else}
            <a href="javascript: void(0)" id="first_page" onclick="gotoPage_Duan('{$processurl}',parseInt(1));" title="Trang đầu">
                <img src="{$css_path}icon_first_page.png" class="img_all">
            </a>
            <a href="javascript: void(0)" id="pre_page" onclick="gotoPage_Duan('{$processurl}',parseInt(document.getElementById('page_Duan').value)-parseInt(1));" title="Trang trước">
                <img src="{$css_path}icon_pre_page.png" class="img_all">
            </a>
        {/if}
    </div>
    <div style="float:left; line-height:19px">
        <div style="float:left; width:35px">Trang</div>
        <div style="float:left; width:35px">
            <input type="text" value="{$vars.curpage}" name="page" id="page_Duan" onblur=" gotoPage_Duan('{$processurl}',this.value);" style="width:30px; font-size:12px; height:15px; border:1px solid #99bbe8">
        </div>
        <div style="float:left; width:42px"> / {$num_page}</div>
    </div>
    <div id="doc_page_area">
        {if $vars.curpage eq $num_page}
            <img src="{$css_path}icon_next_page.png" class="img_all">
            <img src="{$css_path}icon_last_page.png" class="img_all">
        {else}
            <a href="javascript: void(0)" id="next_page" onclick="gotoPage_Duan('{$processurl}',parseInt(document.getElementById('page_Duan').value)+parseInt(1));" title="Trang tiếp">
                <img src="{$css_path}icon_next_page.png" class="img_all">
            </a>
            <a href="javascript: void(0)" id="last_page" onclick="gotoPage_Duan('{$processurl}',parseInt({$num_page}));" title="Trang cuối">
                <img src="{$css_path}icon_last_page.png" class="img_all">
            </a>
        {/if}
    </div>

    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:left; width:15px">
        <a href="javascript: void(0)" id="a_ref_Duan" title="Tải lại"><img src="{$css_path}icon_refresh.png" class="img_all"></a>
    </div>

    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:right; line-height:19px; margin-right:2px">
        <div style="float:left; width:40px">Xem</div>
        <div style="float:left; width:52px">
            <select name="numresult" id="numresult_Duan" style="width:50px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_Duan('{$processurl}');">
                {section name=sli loop=$nrs_arr}
                    <option value="{$nrs_arr[sli]}" {if $nrs_arr[sli] eq $vars.numresult}selected{/if}>{$nrs_arr[sli]} </option>
                {/section}
            </select>
        </div>
        <div style="float:left">dòng / trang</div>
    </div>

</div>
{literal}
    <script language="javascript">
        function docheck_Duan(status,from_){
            var alen=document.frmList_Duan.elements.length;
            alen=(alen>5)?document.frmList_Duan.chkid.length:0;
            if (alen>0){
                for(var i=0;i<alen;i++)
                    document.frmList_Duan.chkid[i].checked=status;
            }
            else{
                document.frmList_Duan.chkid.checked=status;
            }
            if(from_>0) document.frmList_Duan.chkall.checked=status;
        }

        function docheckone_Duan(){
            var alen=document.frmList_Duan.elements.length;

            var isChecked=true;
            alen=(alen>4)?document.frmList_Duan.chkid.length:0;
            if (alen>0){
                for(var i=0;i<alen;i++)
                    if(document.frmList_Duan.chkid[i].checked==false)
                        isChecked=false;
            }else{
                if(document.frmList_Duan.chkid.checked==false)
                    isChecked=false;
            }
            document.frmList_Duan.chkall.checked=isChecked;
        }

        function calculatechon_Duan(){
            var strchon="";
            var alen=document.frmList_Duan.elements.length;
            alen=(alen>2)?document.frmList_Duan.chkid.length:0;
            if (alen>0){
                for(var i=0;i<alen;i++)
                    if(document.frmList_Duan.chkid[i].checked==true)
                        strchon+=document.frmList_Duan.chkid[i].value+",";
            }else{
                if(document.frmList_Duan.chkid.checked==true)
                    strchon=document.frmList_Duan.chkid.value;
            }
            document.frmList_Duan.chon_Duan.value=strchon;
        }

        function delItems_Duan(processurl,delStr){
            if (delStr == undefined){
                calculatechon_Duan();
                delStr = document.getElementById("chon_Duan").value;
            }
            if (delStr == ""){
                return false;
            }
            if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
                return false;
            }

            var numresult_Duan,order_Duan,curpage_Duan;
            numresult = $("#numresult_Duan").val();
            order = $("#order_Duan").val();
            curpage = $("#curpage_Duan").val();

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
                    $('#hdban_content_main').fadeOut('fast').load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+curpage).fadeIn("fast");
                }
            });
        }

        function reloadPage_Duan(processurl){
            var numresult_Duan,order_Duan,cur_pos;
            numresult = $("#numresult_Duan").val();
            order = $("#order_Duan").val();
            cur_pos = 0;
            $("#hdban_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&cur_pos="+cur_pos);
        }

        function gotoPage_Duan(processurl,page){
            var numresult_Duan,order_Duan,cur_pos;
            numresult = $("#numresult_Duan").val();
            order = $("#order_Duan").val();
            //alert(processurl+'-'+page+'-'+numresult+'-'+order);
            $("#hdban_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
        }

        function uncheck_fns_Duan(field,val,id){
            $("#hdban_content_main").load("?listDuan&mod=hdban&checkUncheck="+val+"&setfield="+field+"&checkUncheckID="+id);
        }

        function sort_me_Duan(id,val){
            $("#hdban_content_main").load("?listDuan&mod=hdban&sort_me=1&duan_id="+id+"&val="+val);
        }

        function search_me_Duan(){
            var keyword = document.getElementById('keyword').value;
            if (keyword == ""){
                return false;
            }

            $.post('?listDuan&mod=hdban',
                {keyword:keyword},
                function(data){
                    $('#hdban_content_main').html(data);
                    $("#hdban_content_main").show();
                }
            );
        }

        function edit_me_Duan(id){
            $("#hdban_content_main").load("?listDuan&mod=hdban&edit_me=1&duan_id="+id);
        }

        $("#a_ref_Duan").click( function () {
            $('#hdban_content_main').hide();
            $('#hdban_content_main').fadeOut('fast').load('index.php?listDuan&mod=hdban').fadeIn("fast");
        });
    </script>
{/literal}