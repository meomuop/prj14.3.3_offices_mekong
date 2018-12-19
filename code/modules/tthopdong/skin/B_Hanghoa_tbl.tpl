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
    <form method="post" name="frmList_Hanghoa" action="?listHanghoa{$vars.arg}" id="frmList_Hanghoa">
        <!------------------------------------------THEM MOI------------------------------------>
        <fieldset style="width:912px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
            <legend class="legend_list">
                Thêm/Chỉnh sửa&nbsp;|&nbsp;Thông báo:&nbsp;
                <span id="lblError_Hanghoa" class="error">Mời bạn nhập đủ dữ liệu!</span>
            </legend>
            <table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
                <tr height="10"><td colspan="4"></td></tr>
                <tr height="30">
                    <td width="12%" align="left" height="20">Tên danh mục <font color="#FF0000">*</font>:</td>
                    <td align="left" width="58%">
                        <input type="text" name="hanghoa_name" id="hanghoa_name" class="text_long" value="{$obj_info.hanghoa_name}"/>
                    </td>
                    <td align="left" width="10%">Mã hàng:</td>
                    <td align="left" width="29%">
                        <input type="text" id="hanghoa_mahang" name="hanghoa_mahang" class="text_short" value="{$obj_info.hanghoa_mahang}" onfocus="hide_message_Hanghoa()"/>
                    </td>
                </tr>
                <tr height="30">
                    <td align="left" height="20">Danh mục:</td>
                    <td align="left">
                        <select name="danhmuc_id" id="danhmuc_id" class="select_middle" tabindex="1">
                            <option value="0">Chọn danh mục</option>
                            {section name=qi loop=$obj_list_danhmuc}
                                <option value="{$obj_list_danhmuc[qi]->danhmuc_id}" {if $obj_list_danhmuc[qi]->danhmuc_id eq $obj_info.danhmuc_id}selected="selected"{/if}>-&nbsp;{$obj_list_danhmuc[qi]->danhmuc_name}</option>
                            {/section}
                        </select>
                    </td>
                    <td align="left">Tình trạng :</td>
                    <td align="left">
                        {if $obj_info.hanghoa_active neq ''}
                            <input type="radio" id="hanghoa_active" name="hanghoa_active" value="1" {if $obj_info.hanghoa_active eq 1} checked="checked" {/if} />&nbsp;Hiển thị&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" id="hanghoa_active" name="hanghoa_active" value="2" {if $obj_info.hanghoa_active eq 2} checked="checked" {/if} />&nbsp;Không hiển thị
                        {else}
                            <input type="radio" id="hanghoa_active" name="hanghoa_active" value="1" checked/>&nbsp;Hiển thị&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" id="hanghoa_active" name="hanghoa_active" value="2" />&nbsp;Không hiển thị
                        {/if}
                    </td>
                </tr>
                <tr height="30">
                    <td align="left" height="20">Mô tả:</td>
                    <td align="left">
                        <input type="text" name="hanghoa_mota" id="hanghoa_mota" class="text_long" value="{$obj_info.hanghoa_mota}"/>
                    </td>
                    <td align="left" colspan="3">
                        <input type="button" name="btnSub_Hanghoa" id="btnSub_Hanghoa" value="Ghi lại" class="button" />
                        <input type="hidden" name="hanghoa_id" id="hanghoa_id" value="{$obj_info.hanghoa_id}">
                        <input type="reset" name="Reset" value="Hủy bỏ" class="button" />
                        {literal}
                            <script language="javascript">
                                function hide_message_Hanghoa(){
                                    $('#lblMessage_Hanghoa').hide();
                                    $('#lblError_Hanghoa').hide();
                                }

                                $(function() {
                                    $('.error').hide();
                                    $('#lblMessage_Hanghoa').hide();

                                    $("#btnSub_Hanghoa").click(function() {
                                        $('.error').hide();

                                        var $form = $("#frmList_Hanghoa");
                                        var hanghoa_name = $form.find('input#hanghoa_name').val();
                                        var danhmuc_id = $form.find('select#danhmuc_id :selected').val();
                                        var hanghoa_mahang = $form.find('input#hanghoa_mahang').val();
                                        var hanghoa_mota = $form.find('input#hanghoa_mota').val();
                                        var hanghoa_active = $form.find('input#hanghoa_active:checked').val();
                                        var hanghoa_id = $form.find('input#hanghoa_id').val();

                                        //begin validate form
                                        if (hanghoa_name == ""){
                                            $('#lblError_Hanghoa').show();
                                        }
                                        else{
                                            var dataString  = "hanghoa_name=" + hanghoa_name;
                                            dataString += "&danhmuc_id=" + danhmuc_id;
                                            dataString += "&hanghoa_mahang=" + hanghoa_mahang;
                                            dataString += "&hanghoa_mota=" + hanghoa_mota;
                                            dataString += "&hanghoa_active=" + hanghoa_active;
                                            dataString += "&hanghoa_id=" + hanghoa_id +"";
                                            //alert (dataString);return false;
                                            $.ajax({
                                                type: "POST",
                                                url: "index.php?listHanghoa&mod=tthopdong&add_edit=1",
                                                data: dataString,
                                                success: function(data) {
                                                    $('#tthd_content_main').fadeOut('fast').load('index.php?listHanghoa&mod=tthopdong').fadeIn("fast");
                                                    //$('#lblMessage_Hanghoa').show();
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
                    <input type="button" name="btnSeek" id="btnSeek" value="Tìm >>" class="button_seek" onclick="search_me_Hanghoa()" /></div>
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
                    <input type="hidden" name="chon" id="chon_Hanghoa">
                    <input type="checkbox" name="chkall" value="0" onclick="docheck_Hanghoa(document.frmList_Hanghoa.chkall.checked,0);">
                </div>
            </div>
            <div style="float:left; width:20px; text-align:right">
                <input type="button" name="del_Items" id='del_Items' value="&nbsp;" onClick="delItems_Hanghoa('{$processurl}');" style="width:17px; font-size:12px; background:url(../images/admin/b_drop.png); cursor:pointer" title="Xóa lựa chọn">
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
                        &nbsp;<a href="javascript: void(0);" onclick="edit_me_Hanghoa({$obj_list[pi]->hanghoa_id})" >{$obj_list[pi]->hanghoa_name|str_string_cut:"40":"1"}</a>
                    </div>
                    <div class="{$class_td}" style="width:90px">
                        &nbsp;{$obj_list[pi]->hanghoa_mahang}
                    </div>
                    <div class="{$class_td}" style="width:320px">
                        &nbsp;{$obj_list[pi]->hanghoa_mota|str_string_cut:"70":"1"}
                    </div>
                    <div class="{$class_td}" style="width:59px; text-align:center">
                        <select name="hanghoa_sort[]" onchange="sort_me_Hanghoa({$obj_list[pi]->hanghoa_id},this.value)" class="select_tiny">
                            {section name=i loop=$total_num_result}
                                <option value="{$smarty.section.i.index}" {if $smarty.section.i.index eq $obj_list[pi]->hanghoa_sort} selected="selected"{/if}>{$smarty.section.i.index}</option>
                            {/section}
                        </select>
                        <input type="hidden" name="hanghoa_id1[]" value="{$obj_list[pi]->hanghoa_id}">
                    </div>
                    <div class="{$class_td}" style="width:59px; text-align:center">
                        {if $obj_list[pi]->hanghoa_active eq 1}
                            <a href='javascript: void(0);' onclick="uncheck_fns_Hanghoa('hanghoa_active',2,{$obj_list[pi]->hanghoa_id})"><img src="../images/admin/tick.png" width="10" height="10" border="0" title="Ẩn"></a>
                        {else}
                            <a href='javascript: void(0);' onclick="uncheck_fns_Hanghoa('hanghoa_active',1,{$obj_list[pi]->hanghoa_id})"><img src="../images/admin/publish_x.png" width="10" height="10" border="0" title="Hiện"></a>
                        {/if}
                    </div>
                    <div class="{$class_td}" style="width:29px; text-align:center">
                        <a href='javascript: void(0);' onclick="edit_me_Hanghoa({$obj_list[pi]->hanghoa_id})">
                            <img src="../images/admin/b_edit.png" width="11" height="11" border="0" title="Sửa"></a>
                    </div>
                    <div class="{$class_td}" style="width:29px; text-align:center">
                        <a href='javascript: void(0'  onClick="delItems_Hanghoa('{$processurl}', {$obj_list[pi]->hanghoa_id});">
                            <img src="../images/admin/b_drop.png" width="11" height="11" border="0" title="Xóa"></a>
                    </div>
                    <div class="{$class_td}" style="width:39px; text-align:center">
                        <input type="checkbox" name="chkid" value="{$obj_list[pi]->hanghoa_id}" onclick="docheckone_Hanghoa();">
                    </div>
                {/section}
            </div>
            <input type="hidden" id="curpage_Hanghoa" name="curpage" value="{$vars.curpage}" />
        </fieldset>
    </form>
</div>
<!------------------------------------------------- Tool bar --------------------------------------------->
<div id="doc_clear_txt"></div>
<div id="doc_tool_bar">

    <div id="doc_search_area">
        <select name="order" id="order_Hanghoa" style="width:120px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_Hanghoa('{$processurl}');">
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
            <a href="javascript: void(0)" id="first_page" onclick="gotoPage_Hanghoa('{$processurl}',parseInt(1));" title="Trang đầu">
                <img src="{$css_path}icon_first_page.png" class="img_all">
            </a>
            <a href="javascript: void(0)" id="pre_page" onclick="gotoPage_Hanghoa('{$processurl}',parseInt(document.getElementById('page_Hanghoa').value)-parseInt(1));" title="Trang trước">
                <img src="{$css_path}icon_pre_page.png" class="img_all">
            </a>
        {/if}
    </div>
    <div style="float:left; line-height:19px">
        <div style="float:left; width:35px">Trang</div>
        <div style="float:left; width:35px">
            <input type="text" value="{$vars.curpage}" name="page" id="page_Hanghoa" onblur=" gotoPage_Hanghoa('{$processurl}',this.value);" style="width:30px; font-size:12px; height:15px; border:1px solid #99bbe8">
        </div>
        <div style="float:left; width:42px"> / {$num_page}</div>
    </div>
    <div id="doc_page_area">
        {if $vars.curpage eq $num_page}
            <img src="{$css_path}icon_next_page.png" class="img_all">
            <img src="{$css_path}icon_last_page.png" class="img_all">
        {else}
            <a href="javascript: void(0)" id="next_page" onclick="gotoPage_Hanghoa('{$processurl}',parseInt(document.getElementById('page_Hanghoa').value)+parseInt(1));" title="Trang tiếp">
                <img src="{$css_path}icon_next_page.png" class="img_all">
            </a>
            <a href="javascript: void(0)" id="last_page" onclick="gotoPage_Hanghoa('{$processurl}',parseInt({$num_page}));" title="Trang cuối">
                <img src="{$css_path}icon_last_page.png" class="img_all">
            </a>
        {/if}
    </div>

    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:left; width:15px">
        <a href="javascript: void(0)" id="a_ref_Hanghoa" title="Tải lại"><img src="{$css_path}icon_refresh.png" class="img_all"></a>
    </div>

    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:right; line-height:19px; margin-right:2px">
        <div style="float:left; width:40px">Xem</div>
        <div style="float:left; width:52px">
            <select name="numresult" id="numresult_Hanghoa" style="width:50px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_Hanghoa('{$processurl}');">
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
        function docheck_Hanghoa(status,from_){
            var alen=document.frmList_Hanghoa.elements.length;
            alen=(alen>5)?document.frmList_Hanghoa.chkid.length:0;
            if (alen>0){
                for(var i=0;i<alen;i++)
                    document.frmList_Hanghoa.chkid[i].checked=status;
            }
            else{
                document.frmList_Hanghoa.chkid.checked=status;
            }
            if(from_>0) document.frmList_Hanghoa.chkall.checked=status;
        }

        function docheckone_Hanghoa(){
            var alen=document.frmList_Hanghoa.elements.length;

            var isChecked=true;
            alen=(alen>4)?document.frmList_Hanghoa.chkid.length:0;
            if (alen>0){
                for(var i=0;i<alen;i++)
                    if(document.frmList_Hanghoa.chkid[i].checked==false)
                        isChecked=false;
            }else{
                if(document.frmList_Hanghoa.chkid.checked==false)
                    isChecked=false;
            }
            document.frmList_Hanghoa.chkall.checked=isChecked;
        }

        function calculatechon_Hanghoa(){
            var strchon="";
            var alen=document.frmList_Hanghoa.elements.length;
            alen=(alen>2)?document.frmList_Hanghoa.chkid.length:0;
            if (alen>0){
                for(var i=0;i<alen;i++)
                    if(document.frmList_Hanghoa.chkid[i].checked==true)
                        strchon+=document.frmList_Hanghoa.chkid[i].value+",";
            }else{
                if(document.frmList_Hanghoa.chkid.checked==true)
                    strchon=document.frmList_Hanghoa.chkid.value;
            }
            document.frmList_Hanghoa.chon_Hanghoa.value=strchon;
        }

        function delItems_Hanghoa(processurl,delStr){
            if (delStr == undefined){
                calculatechon_Hanghoa();
                delStr = document.getElementById("chon_Hanghoa").value;
            }
            if (delStr == ""){
                return false;
            }
            if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
                return false;
            }

            var numresult_Hanghoa,order_Hanghoa,curpage_Hanghoa;
            numresult = $("#numresult_Hanghoa").val();
            order = $("#order_Hanghoa").val();
            curpage = $("#curpage_Hanghoa").val();

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

        function reloadPage_Hanghoa(processurl){
            var numresult_Hanghoa,order_Hanghoa,cur_pos;
            numresult = $("#numresult_Hanghoa").val();
            order = $("#order_Hanghoa").val();
            cur_pos = 0;
            $("#tthd_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&cur_pos="+cur_pos);
        }

        function gotoPage_Hanghoa(processurl,page){
            var numresult_Hanghoa,order_Hanghoa,cur_pos;
            numresult = $("#numresult_Hanghoa").val();
            order = $("#order_Hanghoa").val();
            //alert(processurl+'-'+page+'-'+numresult+'-'+order);
            $("#tthd_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
        }

        function uncheck_fns_Hanghoa(field,val,id){
            $("#tthd_content_main").load("?listHanghoa&mod=tthopdong&checkUncheck="+val+"&setfield="+field+"&checkUncheckID="+id);
        }

        function sort_me_Hanghoa(id,val){
            $("#tthd_content_main").load("?listHanghoa&mod=tthopdong&sort_me=1&hanghoa_id="+id+"&val="+val);
        }

        function search_me_Hanghoa(){
            var keyword = document.getElementById('keyword').value;
            if (keyword == ""){
                return false;
            }

            $.post('?listHanghoa&mod=tthopdong',
                {keyword:keyword},
                function(data){
                    $('#tthd_content_main').html(data);
                    $("#tthd_content_main").show();
                }
            );
        }

        function edit_me_Hanghoa(id){
            $("#tthd_content_main").load("?listHanghoa&mod=tthopdong&edit_me=1&hanghoa_id="+id);
        }

        $("#a_ref_Hanghoa").click( function () {
            $('#tthd_content_main').hide();
            $('#tthd_content_main').fadeOut('fast').load('index.php?listHanghoa&mod=tthopdong').fadeIn("fast");
        });
    </script>
{/literal}