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
    <form method="post" name="frmList_Danhmuc" action="?listDanhmuc{$vars.arg}" id="frmList_Danhmuc">
        <!------------------------------------------THEM MOI------------------------------------>
        <fieldset style="width:912px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
            <legend class="legend_list">
                Thêm/Chỉnh sửa&nbsp;|&nbsp;Thông báo:&nbsp;
                <span id="lblError_Danhmuc" class="error">Mời bạn nhập đủ dữ liệu!</span>
            </legend>
            <table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
                <tr height="10"><td colspan="4"></td></tr>
                <tr height="30">
                    <td width="12%" align="left" height="20">Tên danh mục <font color="#FF0000">*</font>:</td>
                    <td align="left" width="58%">
                        <input type="text" name="danhmuc_name" id="danhmuc_name" class="text_long" value="{$obj_info.danhmuc_name}"/>
                    </td>
                    <td align="left" width="10%">Tên viết tắt:</td>
                    <td align="left" width="29%">
                        <input type="text" id="danhmuc_viettat" name="danhmuc_viettat" class="text_short" value="{$obj_info.danhmuc_viettat}" onfocus="hide_message_Danhmuc()"/>
                    </td>
                </tr>
                <tr height="30">
                    <td align="left" height="20">Mô tả:</td>
                    <td align="left">
                        <input type="text" name="danhmuc_mota" id="danhmuc_mota" class="text_long" value="{$obj_info.danhmuc_mota}"/>
                    </td>
                    <td align="left">Tình trạng :</td>
                    <td align="left">
                        {if $obj_info.danhmuc_active neq ''}
                            <input type="radio" id="danhmuc_active" name="danhmuc_active" value="1" {if $obj_info.danhmuc_active eq 1} checked="checked" {/if} />&nbsp;Hiển thị&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" id="danhmuc_active" name="danhmuc_active" value="2" {if $obj_info.danhmuc_active eq 2} checked="checked" {/if} />&nbsp;Không hiển thị
                        {else}
                            <input type="radio" id="danhmuc_active" name="danhmuc_active" value="1" checked/>&nbsp;Hiển thị&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" id="danhmuc_active" name="danhmuc_active" value="2" />&nbsp;Không hiển thị
                        {/if}
                    </td>
                </tr>
                <tr height="30">
                    <td align="left" height="20">&nbsp;</td>
                    <td align="left" colspan="3">
                        <input type="button" name="btnSub_Danhmuc" id="btnSub_Danhmuc" value="Ghi lại" class="button" />
                        <input type="hidden" name="danhmuc_id" id="danhmuc_id" value="{$obj_info.danhmuc_id}">
                        <input type="reset" name="Reset" value="Hủy bỏ" class="button" />
                        {literal}
                            <script language="javascript">
                                function hide_message_Danhmuc(){
                                    $('#lblMessage_Danhmuc').hide();
                                    $('#lblError_Danhmuc').hide();
                                }

                                $(function() {
                                    $('.error').hide();
                                    $('#lblMessage_Danhmuc').hide();

                                    $("#btnSub_Danhmuc").click(function() {
                                        $('.error').hide();

                                        var $form = $("#frmList_Danhmuc");
                                        var danhmuc_name = $form.find('input#danhmuc_name').val();
                                        var danhmuc_viettat = $form.find('input#danhmuc_viettat').val();
                                        var danhmuc_mota = $form.find('input#danhmuc_mota').val();
                                        var danhmuc_active = $form.find('input#danhmuc_active:checked').val();
                                        var danhmuc_id = $form.find('input#danhmuc_id').val();

                                        //begin validate form
                                        if (danhmuc_name == ""){
                                            $('#lblError_Danhmuc').show();
                                        }
                                        else{
                                            var dataString  = "danhmuc_name=" + danhmuc_name;
                                            dataString += "&danhmuc_viettat=" + danhmuc_viettat;
                                            dataString += "&danhmuc_mota=" + danhmuc_mota;
                                            dataString += "&danhmuc_active=" + danhmuc_active;
                                            dataString += "&danhmuc_id=" + danhmuc_id +"";
                                            //alert (dataString);return false;
                                            $.ajax({
                                                type: "POST",
                                                url: "index.php?listDanhmuc&mod=tthopdong&add_edit=1",
                                                data: dataString,
                                                success: function(data) {
                                                    $('#tthd_content_main').fadeOut('fast').load('index.php?listDanhmuc&mod=tthopdong').fadeIn("fast");
                                                    //$('#lblMessage_Danhmuc').show();
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
                    <input type="button" name="btnSeek" id="btnSeek" value="Tìm >>" class="button_seek" onclick="search_me_Danhmuc()" /></div>
            </legend>
            <div style="float:left; height:5px; width:100%"></div>
            <div style="float:left; height:25px; width:890px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
                <div class="tbl_tit" style="width:30px; text-align:center"><b>STT</b></div>
                <div class="tbl_tit" style="width:226px"><B>&nbsp;Danh mục</B></div>
                <div class="tbl_tit" style="width:90px"><B>&nbsp;Viết tắt</B></div>
                <div class="tbl_tit" style="width:320px"><B>&nbsp;Mô tả</B></div>
                <div class="tbl_tit" style="width:59px; text-align:center"><B>Sắp xếp</B></div>
                <div class="tbl_tit" style="width:59px; text-align:center"><B>Hiển thị</B></div>
                <div class="tbl_tit" style="width:59px; text-align:center"><B>Chọn</B></div>
                <div class="tbl_tit" style="width:39px; text-align:center">
                    <input type="hidden" name="chon" id="chon_Danhmuc">
                    <input type="checkbox" name="chkall" value="0" onclick="docheck_Danhmuc(document.frmList_Danhmuc.chkall.checked,0);">
                </div>
            </div>
            <div style="float:left; width:20px; text-align:right">
                <input type="button" name="del_Items" id='del_Items' value="&nbsp;" onClick="delItems_Danhmuc('{$processurl}');" style="width:17px; font-size:12px; background:url(../images/admin/b_drop.png); cursor:pointer" title="Xóa lựa chọn">
            </div>
            <div style="float:left; height:275px; width:910px; overflow-y:scroll">
                {section name=pi loop=$obj_list}
                    {if $smarty.section.pi.index is not div by 2}
                        {assign var="class_td" value="tbl_cont"}
                    {else}
                        {assign var="class_td" value="tbl_cont2"}
                    {/if}
                    {math x=$vars.curpage-1 y=$vars.numresult z=$smarty.section.pi.index t=1 equation="x*y+z+t" assign=stt}
                    <div class="{$class_td}" style="width:30px; text-align:center">{$stt}</div>
                    <div class="{$class_td}" style="width:226px">
                        &nbsp;<a href="javascript: void(0);" onclick="edit_me_Danhmuc({$obj_list[pi]->danhmuc_id})" >{$obj_list[pi]->danhmuc_name|str_string_cut:"40":"1"}</a>
                    </div>
                    <div class="{$class_td}" style="width:90px">
                        &nbsp;{$obj_list[pi]->danhmuc_viettat}
                    </div>
                    <div class="{$class_td}" style="width:320px">
                        &nbsp;{$obj_list[pi]->danhmuc_mota|str_string_cut:"70":"1"}
                    </div>
                    <div class="{$class_td}" style="width:59px; text-align:center">
                        <select name="danhmuc_sort[]" onchange="sort_me_Danhmuc({$obj_list[pi]->danhmuc_id},this.value)" class="select_tiny">
                            {section name=i loop=$total_num_result}
                                <option value="{$smarty.section.i.index}" {if $smarty.section.i.index eq $obj_list[pi]->danhmuc_sort} selected="selected"{/if}>{$smarty.section.i.index}</option>
                            {/section}
                        </select>
                        <input type="hidden" name="danhmuc_id1[]" value="{$obj_list[pi]->danhmuc_id}">
                    </div>
                    <div class="{$class_td}" style="width:59px; text-align:center">
                        {if $obj_list[pi]->danhmuc_active eq 1}
                            <a href='javascript: void(0);' onclick="uncheck_fns_Danhmuc('danhmuc_active',2,{$obj_list[pi]->danhmuc_id})"><img src="../images/admin/tick.png" width="10" height="10" border="0" title="Ẩn"></a>
                        {else}
                            <a href='javascript: void(0);' onclick="uncheck_fns_Danhmuc('danhmuc_active',1,{$obj_list[pi]->danhmuc_id})"><img src="../images/admin/publish_x.png" width="10" height="10" border="0" title="Hiện"></a>
                        {/if}
                    </div>
                    <div class="{$class_td}" style="width:29px; text-align:center">
                        <a href='javascript: void(0);' onclick="edit_me_Danhmuc({$obj_list[pi]->danhmuc_id})">
                            <img src="../images/admin/b_edit.png" width="11" height="11" border="0" title="Sửa"></a>
                    </div>
                    <div class="{$class_td}" style="width:29px; text-align:center">
                        <a href='javascript: void(0'  onClick="delItems_Danhmuc('{$processurl}', {$obj_list[pi]->danhmuc_id});">
                            <img src="../images/admin/b_drop.png" width="11" height="11" border="0" title="Xóa"></a>
                    </div>
                    <div class="{$class_td}" style="width:39px; text-align:center">
                        <input type="checkbox" name="chkid" value="{$obj_list[pi]->danhmuc_id}" onclick="docheckone_Danhmuc();">
                    </div>
                {/section}
            </div>
            <input type="hidden" id="curpage_Danhmuc" name="curpage" value="{$vars.curpage}" />
        </fieldset>
    </form>
</div>
<!------------------------------------------------- Tool bar --------------------------------------------->
<div id="doc_clear_txt"></div>
<div id="doc_tool_bar">

    <div id="doc_search_area">
        <select name="order" id="order_Danhmuc" style="width:120px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_Danhmuc('{$processurl}');">
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
            <a href="javascript: void(0)" id="first_page" onclick="gotoPage_Danhmuc('{$processurl}',parseInt(1));" title="Trang đầu">
                <img src="{$css_path}icon_first_page.png" class="img_all">
            </a>
            <a href="javascript: void(0)" id="pre_page" onclick="gotoPage_Danhmuc('{$processurl}',parseInt(document.getElementById('page_Danhmuc').value)-parseInt(1));" title="Trang trước">
                <img src="{$css_path}icon_pre_page.png" class="img_all">
            </a>
        {/if}
    </div>
    <div style="float:left; line-height:19px">
        <div style="float:left; width:35px">Trang</div>
        <div style="float:left; width:35px">
            <input type="text" value="{$vars.curpage}" name="page" id="page_Danhmuc" onblur=" gotoPage_Danhmuc('{$processurl}',this.value);" style="width:30px; font-size:12px; height:15px; border:1px solid #99bbe8">
        </div>
        <div style="float:left; width:42px"> / {$num_page}</div>
    </div>
    <div id="doc_page_area">
        {if $vars.curpage eq $num_page}
            <img src="{$css_path}icon_next_page.png" class="img_all">
            <img src="{$css_path}icon_last_page.png" class="img_all">
        {else}
            <a href="javascript: void(0)" id="next_page" onclick="gotoPage_Danhmuc('{$processurl}',parseInt(document.getElementById('page_Danhmuc').value)+parseInt(1));" title="Trang tiếp">
                <img src="{$css_path}icon_next_page.png" class="img_all">
            </a>
            <a href="javascript: void(0)" id="last_page" onclick="gotoPage_Danhmuc('{$processurl}',parseInt({$num_page}));" title="Trang cuối">
                <img src="{$css_path}icon_last_page.png" class="img_all">
            </a>
        {/if}
    </div>

    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:left; width:15px">
        <a href="javascript: void(0)" id="a_ref_Danhmuc" title="Tải lại"><img src="{$css_path}icon_refresh.png" class="img_all"></a>
    </div>

    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:right; line-height:19px; margin-right:2px">
        <div style="float:left; width:40px">Xem</div>
        <div style="float:left; width:52px">
            <select name="numresult" id="numresult_Danhmuc" style="width:50px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_Danhmuc('{$processurl}');">
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
        function docheck_Danhmuc(status,from_){
            var alen=document.frmList_Danhmuc.elements.length;
            alen=(alen>5)?document.frmList_Danhmuc.chkid.length:0;
            if (alen>0){
                for(var i=0;i<alen;i++)
                    document.frmList_Danhmuc.chkid[i].checked=status;
            }
            else{
                document.frmList_Danhmuc.chkid.checked=status;
            }
            if(from_>0) document.frmList_Danhmuc.chkall.checked=status;
        }

        function docheckone_Danhmuc(){
            var alen=document.frmList_Danhmuc.elements.length;

            var isChecked=true;
            alen=(alen>4)?document.frmList_Danhmuc.chkid.length:0;
            if (alen>0){
                for(var i=0;i<alen;i++)
                    if(document.frmList_Danhmuc.chkid[i].checked==false)
                        isChecked=false;
            }else{
                if(document.frmList_Danhmuc.chkid.checked==false)
                    isChecked=false;
            }
            document.frmList_Danhmuc.chkall.checked=isChecked;
        }

        function calculatechon_Danhmuc(){
            var strchon="";
            var alen=document.frmList_Danhmuc.elements.length;
            alen=(alen>2)?document.frmList_Danhmuc.chkid.length:0;
            if (alen>0){
                for(var i=0;i<alen;i++)
                    if(document.frmList_Danhmuc.chkid[i].checked==true)
                        strchon+=document.frmList_Danhmuc.chkid[i].value+",";
            }else{
                if(document.frmList_Danhmuc.chkid.checked==true)
                    strchon=document.frmList_Danhmuc.chkid.value;
            }
            document.frmList_Danhmuc.chon_Danhmuc.value=strchon;
        }

        function delItems_Danhmuc(processurl,delStr){
            if (delStr == undefined){
                calculatechon_Danhmuc();
                delStr = document.getElementById("chon_Danhmuc").value;
            }
            if (delStr == ""){
                return false;
            }
            if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
                return false;
            }

            var numresult_Danhmuc,order_Danhmuc,curpage_Danhmuc;
            numresult = $("#numresult_Danhmuc").val();
            order = $("#order_Danhmuc").val();
            curpage = $("#curpage_Danhmuc").val();

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

        function reloadPage_Danhmuc(processurl){
            var numresult_Danhmuc,order_Danhmuc,cur_pos;
            numresult = $("#numresult_Danhmuc").val();
            order = $("#order_Danhmuc").val();
            cur_pos = 0;
            $("#tthd_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&cur_pos="+cur_pos);
        }

        function gotoPage_Danhmuc(processurl,page){
            var numresult_Danhmuc,order_Danhmuc,cur_pos;
            numresult = $("#numresult_Danhmuc").val();
            order = $("#order_Danhmuc").val();
            //alert(processurl+'-'+page+'-'+numresult+'-'+order);
            $("#tthd_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
        }

        function uncheck_fns_Danhmuc(field,val,id){
            $("#tthd_content_main").load("?listDanhmuc&mod=tthopdong&checkUncheck="+val+"&setfield="+field+"&checkUncheckID="+id);
        }

        function sort_me_Danhmuc(id,val){
            $("#tthd_content_main").load("?listDanhmuc&mod=tthopdong&sort_me=1&danhmuc_id="+id+"&val="+val);
        }

        function search_me_Danhmuc(){
            var keyword = document.getElementById('keyword').value;
            if (keyword == ""){
                return false;
            }

            $.post('?listDanhmuc&mod=tthopdong',
                {keyword:keyword},
                function(data){
                    $('#tthd_content_main').html(data);
                    $("#tthd_content_main").show();
                }
            );
        }

        function edit_me_Danhmuc(id){
            $("#tthd_content_main").load("?listDanhmuc&mod=tthopdong&edit_me=1&danhmuc_id="+id);
        }

        $("#a_ref_Danhmuc").click( function () {
            $('#tthd_content_main').hide();
            $('#tthd_content_main').fadeOut('fast').load('index.php?listDanhmuc&mod=tthopdong').fadeIn("fast");
        });
    </script>
{/literal}