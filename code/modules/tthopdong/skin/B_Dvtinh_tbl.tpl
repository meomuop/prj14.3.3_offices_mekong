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
<div id="tthd_content_insign" style="width:392px;">
    <form method="post" name="frmList_Dvtinh" action="?listDvtinh{$vars.arg}" id="frmList_Dvtinh">
        <!------------------------------------------THEM MOI------------------------------------>
        <fieldset style="width:382px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
            <legend class="legend_list">
                Thêm/Chỉnh sửa&nbsp;|&nbsp;Thông báo:&nbsp;
                <span id="lblError_Dvtinh" class="error">Mời bạn nhập đủ dữ liệu!</span>
            </legend>
            <table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
                <tr height="10"><td colspan="4"></td></tr>
                <tr height="30">
                    <td width="30%" align="left" height="20">Tên đơn vị <font color="#FF0000">*</font>:</td>
                    <td align="left" width="70%">
                        <input type="text" name="dvtinh_name" id="dvtinh_name" class="text_short" value="{$obj_info.dvtinh_name}"/>
                    </td>
                </tr>
                <tr height="30">
                    <td align="left" width="30%">Tình trạng :</td>
                    <td align="left" width="70%">
                        {if $obj_info.dvtinh_active neq ''}
                            <input type="radio" id="dvtinh_active" name="dvtinh_active" value="1" {if $obj_info.dvtinh_active eq 1} checked="checked" {/if} />&nbsp;Hiển thị&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" id="dvtinh_active" name="dvtinh_active" value="2" {if $obj_info.dvtinh_active eq 2} checked="checked" {/if} />&nbsp;Không hiển thị
                        {else}
                            <input type="radio" id="dvtinh_active" name="dvtinh_active" value="1" checked/>&nbsp;Hiển thị&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" id="dvtinh_active" name="dvtinh_active" value="2" />&nbsp;Không hiển thị
                        {/if}
                    </td>
                </tr>
                <tr height="30">
                    <td align="left">&nbsp;</td>
                    <td align="left">
                        <input type="button" name="btnSub_Dvtinh" id="btnSub_Dvtinh" value="Ghi lại" class="button" />
                        <input type="hidden" name="dvtinh_id" id="dvtinh_id" value="{$obj_info.dvtinh_id}">
                        <input type="reset" name="Reset" value="Hủy bỏ" class="button" />
                        {literal}
                            <script language="javascript">
                                function hide_message_Dvtinh(){
                                    $('#lblMessage_Dvtinh').hide();
                                    $('#lblError_Dvtinh').hide();
                                }

                                $(function() {
                                    $('.error').hide();
                                    $('#lblMessage_Dvtinh').hide();

                                    $("#btnSub_Dvtinh").click(function() {
                                        $('.error').hide();

                                        var $form = $("#frmList_Dvtinh");
                                        var dvtinh_name = $form.find('input#dvtinh_name').val();
                                        var dvtinh_active = $form.find('input#dvtinh_active:checked').val();
                                        var dvtinh_id = $form.find('input#dvtinh_id').val();

                                        //begin validate form
                                        if (dvtinh_name == ""){
                                            $('#lblError_Dvtinh').show();
                                        }
                                        else{
                                            var dataString  = "dvtinh_name=" + dvtinh_name;
                                            dataString += "&dvtinh_active=" + dvtinh_active;
                                            dataString += "&dvtinh_id=" + dvtinh_id +"";
                                            //alert (dataString);return false;
                                            $.ajax({
                                                type: "POST",
                                                url: "index.php?listDvtinh&mod=tthopdong&add_edit=1",
                                                data: dataString,
                                                success: function(data) {
                                                    $('#tthd_content_main').fadeOut('fast').load('index.php?listDvtinh&mod=tthopdong').fadeIn("fast");
                                                    //$('#lblMessage_Dvtinh').show();
                                                }
                                            });
                                            return false;
                                        }
                                        //end form
                                    });
                                });
                            </script>
                        {/literal}
                    </td>
                </tr>
            </table>
        </fieldset>

        <!------------------------------------DANH SACH---------------------------------------------->
        <fieldset style="width:912px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:332px">
            <legend class="legend_list">
                <div style="width:130px; float:left">Danh sách: {$total_num_result}</div>
                <div style="width:70px; float:left">&nbsp;|&nbsp;Tìm kiếm&nbsp;</div>
                <div style="width:100px; float:left">
                    <input type="text" name="keyword" id="keyword" class="text_seek" value="{$vars.keyword}"/>
                    <input type="hidden" id="processurl" value="{$processurl}" />
                </div>
                <div style="width:50px; float:left">
                    <input type="button" name="btnSeek" id="btnSeek" value="Tìm >>" class="button_seek" onclick="search_me_Dvtinh()" /></div>
            </legend>
            <div style="float:left; height:5px; width:100%"></div>
            <div style="float:left; height:25px; width:890px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
                <div class="tbl_tit" style="width:30px; text-align:center"><b>STT</b></div>
                <div class="tbl_tit" style="width:567px"><B>&nbsp;Tên đơn vị</B></div>
                <div class="tbl_tit" style="width:70px; text-align:center"><B>Ngày nhập</B></div>
                <div class="tbl_tit" style="width:59px; text-align:center"><B>Sắp xếp</B></div>
                <div class="tbl_tit" style="width:59px; text-align:center"><B>Hiển thị</B></div>
                <div class="tbl_tit" style="width:59px; text-align:center"><B>Chọn</B></div>
                <div class="tbl_tit" style="width:39px; text-align:center">
                    <input type="hidden" name="chon" id="chon_Dvtinh">
                    <input type="checkbox" name="chkall" value="0" onclick="docheck_Dvtinh(document.frmList_Dvtinh.chkall.checked,0);">
                </div>
            </div>
            <div style="float:left; width:20px; text-align:right">
                <input type="button" name="del_Items" id='del_Items' value="&nbsp;" onClick="delItems_Dvtinh('{$processurl}');" style="width:17px; font-size:12px; background:url(../images/admin/b_drop.png); cursor:pointer" title="Xóa lựa chọn">
            </div>
            <div style="float:left; height:275px; width:912px; overflow-y:scroll">
                {section name=pi loop=$obj_list}
                    {if $smarty.section.pi.index is not div by 2}
                        {assign var="class_td" value="tbl_cont"}
                    {else}
                        {assign var="class_td" value="tbl_cont2"}
                    {/if}
                    {math x=$vars.curpage-1 y=$vars.numresult z=$smarty.section.pi.index t=1 equation="x*y+z+t" assign=stt}
                    <div class="{$class_td}" style="width:30px; text-align:center">{$stt}</div>
                    <div class="{$class_td}" style="width:567px">
                        &nbsp;<a href="javascript: void(0);" onclick="edit_me_Dvtinh({$obj_list[pi]->dvtinh_id})" >{$obj_list[pi]->dvtinh_name|str_string_cut:"40":"1"}</a>
                    </div>
                    <div class="{$class_td}" style="width:70px; text-align:center">
                        {$obj_list[pi]->dvtinh_date|date_format:"%d/%m/%Y"}
                    </div>
                    <div class="{$class_td}" style="width:59px; text-align:center">
                        <select name="dvtinh_sort[]" onchange="sort_me_Dvtinh({$obj_list[pi]->dvtinh_id},this.value)" class="select_tiny">
                            {section name=i loop=$total_num_result}
                                <option value="{$smarty.section.i.index}" {if $smarty.section.i.index eq $obj_list[pi]->dvtinh_sort} selected="selected"{/if}>{$smarty.section.i.index}</option>
                            {/section}
                        </select>
                        <input type="hidden" name="dvtinh_id1[]" value="{$obj_list[pi]->dvtinh_id}">
                    </div>
                    <div class="{$class_td}" style="width:59px; text-align:center">
                        {if $obj_list[pi]->dvtinh_active eq 1}
                            <a href='javascript: void(0);' onclick="uncheck_fns_Dvtinh('dvtinh_active',2,{$obj_list[pi]->dvtinh_id})"><img src="../images/admin/tick.png" width="10" height="10" border="0" title="Ẩn"></a>
                        {else}
                            <a href='javascript: void(0);' onclick="uncheck_fns_Dvtinh('dvtinh_active',1,{$obj_list[pi]->dvtinh_id})"><img src="../images/admin/publish_x.png" width="10" height="10" border="0" title="Hiện"></a>
                        {/if}
                    </div>
                    <div class="{$class_td}" style="width:29px; text-align:center">
                        <a href='javascript: void(0);' onclick="edit_me_Dvtinh({$obj_list[pi]->dvtinh_id})">
                            <img src="../images/admin/b_edit.png" width="11" height="11" border="0" title="Sửa"></a>
                    </div>
                    <div class="{$class_td}" style="width:29px; text-align:center">
                        <a href='javascript: void(0'  onClick="delItems_Dvtinh('{$processurl}', {$obj_list[pi]->dvtinh_id});">
                            <img src="../images/admin/b_drop.png" width="11" height="11" border="0" title="Xóa"></a>
                    </div>
                    <div class="{$class_td}" style="width:39px; text-align:center">
                        <input type="checkbox" name="chkid" value="{$obj_list[pi]->dvtinh_id}" onclick="docheckone_Dvtinh();">
                    </div>
                {/section}
            </div>
            <input type="hidden" id="curpage_Dvtinh" name="curpage" value="{$vars.curpage}" />
        </fieldset>
    </form>
</div>
<!------------------------------------------------- Tool bar --------------------------------------------->
<div id="doc_clear_txt"></div>
<div id="doc_tool_bar">

    <div id="doc_search_area">
        <select name="order" id="order_Dvtinh" style="width:120px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_Dvtinh('{$processurl}');">
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
            <a href="javascript: void(0)" id="first_page" onclick="gotoPage_Dvtinh('{$processurl}',parseInt(1));" title="Trang đầu">
                <img src="{$css_path}icon_first_page.png" class="img_all">
            </a>
            <a href="javascript: void(0)" id="pre_page" onclick="gotoPage_Dvtinh('{$processurl}',parseInt(document.getElementById('page_Dvtinh').value)-parseInt(1));" title="Trang trước">
                <img src="{$css_path}icon_pre_page.png" class="img_all">
            </a>
        {/if}
    </div>
    <div style="float:left; line-height:19px">
        <div style="float:left; width:35px">Trang</div>
        <div style="float:left; width:35px">
            <input type="text" value="{$vars.curpage}" name="page" id="page_Dvtinh" onblur=" gotoPage_Dvtinh('{$processurl}',this.value);" style="width:30px; font-size:12px; height:15px; border:1px solid #99bbe8">
        </div>
        <div style="float:left; width:42px"> / {$num_page}</div>
    </div>
    <div id="doc_page_area">
        {if $vars.curpage eq $num_page}
            <img src="{$css_path}icon_next_page.png" class="img_all">
            <img src="{$css_path}icon_last_page.png" class="img_all">
        {else}
            <a href="javascript: void(0)" id="next_page" onclick="gotoPage_Dvtinh('{$processurl}',parseInt(document.getElementById('page_Dvtinh').value)+parseInt(1));" title="Trang tiếp">
                <img src="{$css_path}icon_next_page.png" class="img_all">
            </a>
            <a href="javascript: void(0)" id="last_page" onclick="gotoPage_Dvtinh('{$processurl}',parseInt({$num_page}));" title="Trang cuối">
                <img src="{$css_path}icon_last_page.png" class="img_all">
            </a>
        {/if}
    </div>

    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:left; width:15px">
        <a href="javascript: void(0)" id="a_ref_Dvtinh" title="Tải lại"><img src="{$css_path}icon_refresh.png" class="img_all"></a>
    </div>

    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:right; line-height:19px; margin-right:2px">
        <div style="float:left; width:40px">Xem</div>
        <div style="float:left; width:52px">
            <select name="numresult" id="numresult_Dvtinh" style="width:50px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_Dvtinh('{$processurl}');">
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
        function docheck_Dvtinh(status,from_){
            var alen=document.frmList_Dvtinh.elements.length;
            alen=(alen>5)?document.frmList_Dvtinh.chkid.length:0;
            if (alen>0){
                for(var i=0;i<alen;i++)
                    document.frmList_Dvtinh.chkid[i].checked=status;
            }
            else{
                document.frmList_Dvtinh.chkid.checked=status;
            }
            if(from_>0) document.frmList_Dvtinh.chkall.checked=status;
        }

        function docheckone_Dvtinh(){
            var alen=document.frmList_Dvtinh.elements.length;

            var isChecked=true;
            alen=(alen>4)?document.frmList_Dvtinh.chkid.length:0;
            if (alen>0){
                for(var i=0;i<alen;i++)
                    if(document.frmList_Dvtinh.chkid[i].checked==false)
                        isChecked=false;
            }else{
                if(document.frmList_Dvtinh.chkid.checked==false)
                    isChecked=false;
            }
            document.frmList_Dvtinh.chkall.checked=isChecked;
        }

        function calculatechon_Dvtinh(){
            var strchon="";
            var alen=document.frmList_Dvtinh.elements.length;
            alen=(alen>2)?document.frmList_Dvtinh.chkid.length:0;
            if (alen>0){
                for(var i=0;i<alen;i++)
                    if(document.frmList_Dvtinh.chkid[i].checked==true)
                        strchon+=document.frmList_Dvtinh.chkid[i].value+",";
            }else{
                if(document.frmList_Dvtinh.chkid.checked==true)
                    strchon=document.frmList_Dvtinh.chkid.value;
            }
            document.frmList_Dvtinh.chon_Dvtinh.value=strchon;
        }

        function delItems_Dvtinh(processurl,delStr){
            if (delStr == undefined){
                calculatechon_Dvtinh();
                delStr = document.getElementById("chon_Dvtinh").value;
            }
            if (delStr == ""){
                return false;
            }
            if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
                return false;
            }

            var numresult_Dvtinh,order_Dvtinh,curpage_Dvtinh;
            numresult = $("#numresult_Dvtinh").val();
            order = $("#order_Dvtinh").val();
            curpage = $("#curpage_Dvtinh").val();

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
                    $('#tthd_content_main').fadeOut('fast').load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+curpage).fadeIn("fast");
                }
            });
        }

        function reloadPage_Dvtinh(processurl){
            var numresult_Dvtinh,order_Dvtinh,cur_pos;
            numresult = $("#numresult_Dvtinh").val();
            order = $("#order_Dvtinh").val();
            cur_pos = 0;
            $("#tthd_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&cur_pos="+cur_pos);
        }

        function gotoPage_Dvtinh(processurl,page){
            var numresult_Dvtinh,order_Dvtinh,cur_pos;
            numresult = $("#numresult_Dvtinh").val();
            order = $("#order_Dvtinh").val();
            //alert(processurl+'-'+page+'-'+numresult+'-'+order);
            $("#tthd_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
        }

        function uncheck_fns_Dvtinh(field,val,id){
            $("#tthd_content_main").load("?listDvtinh&mod=tthopdong&checkUncheck="+val+"&setfield="+field+"&checkUncheckID="+id);
        }

        function sort_me_Dvtinh(id,val){
            $("#tthd_content_main").load("?listDvtinh&mod=tthopdong&sort_me=1&dvtinh_id="+id+"&val="+val);
        }

        function search_me_Dvtinh(){
            var keyword = document.getElementById('keyword').value;
            if (keyword == ""){
                return false;
            }

            $.post('?listDvtinh&mod=tthopdong',
                {keyword:keyword},
                function(data){
                    $('#tthd_content_main').html(data);
                    $("#tthd_content_main").show();
                }
            );
        }

        function edit_me_Dvtinh(id){
            $("#tthd_content_main").load("?listDvtinh&mod=tthopdong&edit_me=1&dvtinh_id="+id);
        }

        $("#a_ref_Dvtinh").click( function () {
            $('#tthd_content_main').hide();
            $('#tthd_content_main').fadeOut('fast').load('index.php?listDvtinh&mod=tthopdong').fadeIn("fast");
        });
    </script>
{/literal}