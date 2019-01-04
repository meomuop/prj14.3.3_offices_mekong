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
    <form method="post" name="frmList_Khachhang" action="?listKhachhang{$vars.arg}" id="frmList_Khachhang">
        <!------------------------------------------THEM MOI------------------------------------>
        <fieldset style="width:1012px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
            <legend class="legend_list">
                Thêm/Chỉnh sửa&nbsp;|&nbsp;Thông báo:&nbsp;
                <span id="lblError_Khachhang" class="error">Mời bạn nhập đủ dữ liệu!</span>
            </legend>
            <table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
                <tr height="10"><td colspan="4"></td></tr>
                <tr height="30">
                    <td width="10%" align="left" height="20">Tên khách hàng <font color="#FF0000">*</font>:</td>
                    <td align="left" width="50%">
                        <input type="text" name="khachhang_name" id="khachhang_name" class="text_long" value="{$obj_info.khachhang_name}"/>
                    </td>
                    <td align="left" width="10%">Tên viết tắt:</td>
                    <td align="left" width="30%">
                        <input type="text" id="khachhang_viettat" name="khachhang_viettat" class="text_middle" value="{$obj_info.khachhang_viettat}"/>
                    </td>
                </tr>
                <tr height="30">
                    <td align="left" height="20">Trụ sở:</td>
                    <td align="left">
                        <input type="text" name="khachhang_truso" id="khachhang_truso" class="text_long" value="{$obj_info.khachhang_truso}"/>
                    </td>
                    <td align="left">Mã số thuế:</td>
                    <td align="left">
                        <input type="text" id="khachhang_mst" name="khachhang_mst" class="text_short" value="{$obj_info.khachhang_mst}"/>
                    </td>
                </tr>
                <tr height="30">
                    <td align="left" height="20">Văn phòng:</td>
                    <td align="left">
                        <input type="text" name="khachhang_vpgd" id="khachhang_vpgd" class="text_long" value="{$obj_info.khachhang_vpgd}"/>
                    </td>
                    <td align="left">Đại diện:</td>
                    <td align="left">
                        <input type="text" id="khachhang_daidien" name="khachhang_daidien" class="text_middle" value="{$obj_info.khachhang_daidien}"/>
                    </td>
                </tr>
                <tr height="30">
                    <td align="left" height="20">Sô điện thoại:</td>
                    <td align="left">
                        <div style="float:left; width: 190px">
                            <input type="text" name="khachhang_sdt" id="khachhang_sdt" class="text_short" value="{$obj_info.khachhang_sdt}"/>
                        </div>
                        <div style="float:left; width: 62px; line-height: 25px">Số fax:</div>
                        <div style="float:left; width: 150px">
                            <input type="text" name="khachhang_fax" id="khachhang_fax" class="text_short" value="{$obj_info.khachhang_fax}"/>
                        </div>
                    </td>
                    <td align="left">Email:</td>
                    <td align="left">
                        <input type="text" id="khachhang_email" name="khachhang_email" class="text_middle" value="{$obj_info.khachhang_email}"/>
                    </td>
                </tr>
                <tr height="30">
                    <td align="left">Tình trạng :</td>
                    <td align="left">
                        {if $obj_info.khachhang_active neq ''}
                            <input type="radio" id="khachhang_active" name="khachhang_active" value="1" {if $obj_info.khachhang_active eq 1} checked="checked" {/if} />&nbsp;Hiển thị&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" id="khachhang_active" name="khachhang_active" value="2" {if $obj_info.khachhang_active eq 2} checked="checked" {/if} />&nbsp;Không hiển thị
                        {else}
                            <input type="radio" id="khachhang_active" name="khachhang_active" value="1" checked/>&nbsp;Hiển thị&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" id="khachhang_active" name="khachhang_active" value="2" />&nbsp;Không hiển thị
                        {/if}
                    </td>
                    <td align="left" colspan="2">
                        <input type="button" name="btnSub_Khachhang" id="btnSub_Khachhang" value="Ghi lại" class="button" />
                        <input type="hidden" name="khachhang_id" id="khachhang_id" value="{$obj_info.khachhang_id}">
                        <input type="reset" name="Reset" value="Hủy bỏ" class="button" />
                        {literal}
                            <script language="javascript">
                                function hide_message_Khachhang(){
                                    $('#lblMessage_Khachhang').hide();
                                    $('#lblError_Khachhang').hide();
                                }

                                $(function() {
                                    $('.error').hide();
                                    $('#lblMessage_Khachhang').hide();

                                    $("#btnSub_Khachhang").click(function() {
                                        $('.error').hide();
                                        var $form = $("#frmList_Khachhang");

                                        var khachhang_name = $form.find('input#khachhang_name').val();
                                        var khachhang_viettat = $form.find('input#khachhang_viettat').val();
                                        var khachhang_truso = $form.find('input#khachhang_truso').val();
                                        var khachhang_daidien = $form.find('input#khachhang_daidien').val();
                                        var khachhang_mst = $form.find('input#khachhang_mst').val();
                                        var khachhang_vpgd = $form.find('input#khachhang_vpgd').val();
                                        var khachhang_sdt = $form.find('input#khachhang_sdt').val();
                                        var khachhang_fax = $form.find('input#khachhang_fax').val();
                                        var khachhang_email = $form.find('input#khachhang_email').val();
                                        var khachhang_active = $form.find('input#khachhang_active:checked').val();
                                        var khachhang_id = $form.find('input#khachhang_id').val();
                                        //begin validate form
                                        if (khachhang_name == ""){
                                            $('#lblError_Khachhang').show();
                                        }
                                        else{
                                            var dataString  = "khachhang_name=" + khachhang_name;
                                            dataString += "&khachhang_viettat=" + khachhang_viettat;
                                            dataString += "&khachhang_truso=" + khachhang_truso;
                                            dataString += "&khachhang_daidien=" + khachhang_daidien;
                                            dataString += "&khachhang_mst=" + khachhang_mst;
                                            dataString += "&khachhang_vpgd=" + khachhang_vpgd;
                                            dataString += "&khachhang_sdt=" + khachhang_sdt;
                                            dataString += "&khachhang_fax=" + khachhang_fax;
                                            dataString += "&khachhang_email=" + khachhang_email;
                                            dataString += "&khachhang_active=" + khachhang_active;
                                            dataString += "&khachhang_id=" + khachhang_id +"";

                                            $.ajax({
                                                type: "POST",
                                                url: "index.php?listKhachhang&mod=hdban&add_edit=1",
                                                data: dataString,
                                                success: function(data) {
                                                    $('#hdban_content_main').fadeOut('fast').load('index.php?listKhachhang&mod=hdban').fadeIn("fast");
                                                    //$('#lblMessage_Khachhang').show();
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
        <fieldset style="width:1012px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:272px">
            <legend class="legend_list">
                <div style="width:130px; float:left">Danh sách: {$total_num_result}</div>
                <div style="width:70px; float:left">&nbsp;|&nbsp;Tìm kiếm&nbsp;</div>
                <div style="width:100px; float:left">
                    <input type="text" name="keyword" id="keyword" class="text_seek" value="{$vars.keyword}"/>
                    <input type="hidden" id="processurl" value="{$processurl}" />
                </div>
                <div style="width:50px; float:left">
                    <input type="button" name="btnSeek" id="btnSeek" value="Tìm >>" class="button_seek" onclick="search_me_Khachhang()" /></div>
            </legend>
            <div style="float:left; height:5px; width:100%"></div>
            <div style="float:left; height:25px; width:992px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
                <div class="tbl_tit" style="width:30px; text-align:center"><b>STT</b></div>
                <div class="tbl_tit" style="width:256px"><B>&nbsp;Tên nhà cung cấp</B></div>
                <div class="tbl_tit" style="width:180px"><B>&nbsp;Viết tắt</B></div>
                <div class="tbl_tit" style="width:120px"><B>&nbsp;Người đại diện</B></div>
                <div class="tbl_tit" style="width:90px"><B>&nbsp;Điện thoại</B></div>
                <div class="tbl_tit" style="width:90px"><B>&nbsp;Mã số thuế</B></div>
                <div class="tbl_tit" style="width:59px; text-align:center"><B>Sắp xếp</B></div>
                <div class="tbl_tit" style="width:59px; text-align:center"><B>Hiển thị</B></div>
                <div class="tbl_tit" style="width:59px; text-align:center"><B>Chọn</B></div>
                <div class="tbl_tit" style="width:39px; text-align:center">
                    <input type="hidden" name="chon" id="chon_Khachhang">
                    <input type="checkbox" name="chkall" value="0" onclick="docheck_Khachhang(document.frmList_Khachhang.chkall.checked,0);">
                </div>
            </div>
            <div style="float:left; width:20px; text-align:right">
                <input type="button" name="del_Items" id='del_Items' value="&nbsp;" onClick="delItems_Khachhang('{$processurl}');" style="width:17px; font-size:12px; background:url(../images/admin/b_drop.png); cursor:pointer" title="Xóa lựa chọn">
            </div>
            <div style="float:left; height:215px; width:1012px; overflow-y:scroll">
                {section name=pi loop=$obj_list}
                    {if $smarty.section.pi.index is not div by 2}
                        {assign var="class_td" value="tbl_cont"}
                    {else}
                        {assign var="class_td" value="tbl_cont2"}
                    {/if}
                    {math x=$vars.curpage-1 y=$vars.numresult z=$smarty.section.pi.index t=1 equation="x*y+z+t" assign=stt}
                    <div class="{$class_td}" style="width:30px; text-align:center">{$stt}</div>
                    <div class="{$class_td}" style="width:256px; white-space:nowrap">
                        &nbsp;<a href="javascript: void(0);" onclick="edit_me_Khachhang({$obj_list[pi]->khachhang_id})" >{$obj_list[pi]->khachhang_name|str_string_cut:"60":"1"}</a>
                    </div>
                    <div class="{$class_td}" style="width:180px; white-space:nowrap">
                        &nbsp;{$obj_list[pi]->khachhang_viettat|str_string_cut:"40":"1"}
                    </div>
                    <div class="{$class_td}" style="width:120px; white-space:nowrap">
                        &nbsp;{$obj_list[pi]->khachhang_daidien}
                    </div>
                    <div class="{$class_td}" style="width:90px">
                        &nbsp;{$obj_list[pi]->khachhang_sdt}
                    </div>
                    <div class="{$class_td}" style="width:90px">
                        &nbsp;{$obj_list[pi]->khachhang_mst}
                    </div>
                    <div class="{$class_td}" style="width:59px; text-align:center">
                        <select name="khachhang_sort[]" onchange="sort_me_Khachhang({$obj_list[pi]->khachhang_id},this.value)" class="select_tiny">
                            {section name=i loop=$total_num_result}
                                <option value="{$smarty.section.i.index}" {if $smarty.section.i.index eq $obj_list[pi]->khachhang_sort} selected="selected"{/if}>{$smarty.section.i.index}</option>
                            {/section}
                        </select>
                        <input type="hidden" name="khachhang_id1[]" value="{$obj_list[pi]->khachhang_id}">
                    </div>
                    <div class="{$class_td}" style="width:59px; text-align:center">
                        {if $obj_list[pi]->khachhang_active eq 1}
                            <a href='javascript: void(0);' onclick="uncheck_fns_Khachhang('khachhang_active',2,{$obj_list[pi]->khachhang_id})"><img src="../images/admin/tick.png" width="10" height="10" border="0" title="Ẩn"></a>
                        {else}
                            <a href='javascript: void(0);' onclick="uncheck_fns_Khachhang('khachhang_active',1,{$obj_list[pi]->khachhang_id})"><img src="../images/admin/publish_x.png" width="10" height="10" border="0" title="Hiện"></a>
                        {/if}
                    </div>
                    <div class="{$class_td}" style="width:29px; text-align:center">
                        <a href='javascript: void(0);' onclick="edit_me_Khachhang({$obj_list[pi]->khachhang_id})">
                            <img src="../images/admin/b_edit.png" width="11" height="11" border="0" title="Sửa"></a>
                    </div>
                    <div class="{$class_td}" style="width:29px; text-align:center">
                        <a href='javascript: void(0'  onClick="delItems_Khachhang('{$processurl}', {$obj_list[pi]->khachhang_id});">
                            <img src="../images/admin/b_drop.png" width="11" height="11" border="0" title="Xóa"></a>
                    </div>
                    <div class="{$class_td}" style="width:39px; text-align:center">
                        <input type="checkbox" name="chkid" value="{$obj_list[pi]->khachhang_id}" onclick="docheckone_Khachhang();">
                    </div>
                {/section}
            </div>
            <input type="hidden" id="curpage_Khachhang" name="curpage" value="{$vars.curpage}" />
        </fieldset>
    </form>
</div>
<!------------------------------------------------- Tool bar --------------------------------------------->
<div id="doc_clear_txt"></div>
<div id="doc_tool_bar">

    <div id="doc_search_area">
        <select name="order" id="order_Khachhang" style="width:120px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_Khachhang('{$processurl}');">
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
            <a href="javascript: void(0)" id="first_page" onclick="gotoPage_Khachhang('{$processurl}',parseInt(1));" title="Trang đầu">
                <img src="{$css_path}icon_first_page.png" class="img_all">
            </a>
            <a href="javascript: void(0)" id="pre_page" onclick="gotoPage_Khachhang('{$processurl}',parseInt(document.getElementById('page_Khachhang').value)-parseInt(1));" title="Trang trước">
                <img src="{$css_path}icon_pre_page.png" class="img_all">
            </a>
        {/if}
    </div>
    <div style="float:left; line-height:19px">
        <div style="float:left; width:35px">Trang</div>
        <div style="float:left; width:35px">
            <input type="text" value="{$vars.curpage}" name="page" id="page_Khachhang" onblur=" gotoPage_Khachhang('{$processurl}',this.value);" style="width:30px; font-size:12px; height:15px; border:1px solid #99bbe8">
        </div>
        <div style="float:left; width:42px"> / {$num_page}</div>
    </div>
    <div id="doc_page_area">
        {if $vars.curpage eq $num_page}
            <img src="{$css_path}icon_next_page.png" class="img_all">
            <img src="{$css_path}icon_last_page.png" class="img_all">
        {else}
            <a href="javascript: void(0)" id="next_page" onclick="gotoPage_Khachhang('{$processurl}',parseInt(document.getElementById('page_Khachhang').value)+parseInt(1));" title="Trang tiếp">
                <img src="{$css_path}icon_next_page.png" class="img_all">
            </a>
            <a href="javascript: void(0)" id="last_page" onclick="gotoPage_Khachhang('{$processurl}',parseInt({$num_page}));" title="Trang cuối">
                <img src="{$css_path}icon_last_page.png" class="img_all">
            </a>
        {/if}
    </div>

    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:left; width:15px">
        <a href="javascript: void(0)" id="a_ref_Khachhang" title="Tải lại"><img src="{$css_path}icon_refresh.png" class="img_all"></a>
    </div>

    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:right; line-height:19px; margin-right:2px">
        <div style="float:left; width:40px">Xem</div>
        <div style="float:left; width:52px">
            <select name="numresult" id="numresult_Khachhang" style="width:50px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_Khachhang('{$processurl}');">
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
        function docheck_Khachhang(status,from_){
            var alen=document.frmList_Khachhang.elements.length;
            alen=(alen>5)?document.frmList_Khachhang.chkid.length:0;
            if (alen>0){
                for(var i=0;i<alen;i++)
                    document.frmList_Khachhang.chkid[i].checked=status;
            }
            else{
                document.frmList_Khachhang.chkid.checked=status;
            }
            if(from_>0) document.frmList_Khachhang.chkall.checked=status;
        }

        function docheckone_Khachhang(){
            var alen=document.frmList_Khachhang.elements.length;

            var isChecked=true;
            alen=(alen>4)?document.frmList_Khachhang.chkid.length:0;
            if (alen>0){
                for(var i=0;i<alen;i++)
                    if(document.frmList_Khachhang.chkid[i].checked==false)
                        isChecked=false;
            }else{
                if(document.frmList_Khachhang.chkid.checked==false)
                    isChecked=false;
            }
            document.frmList_Khachhang.chkall.checked=isChecked;
        }

        function calculatechon_Khachhang(){
            var strchon="";
            var alen=document.frmList_Khachhang.elements.length;
            alen=(alen>2)?document.frmList_Khachhang.chkid.length:0;
            if (alen>0){
                for(var i=0;i<alen;i++)
                    if(document.frmList_Khachhang.chkid[i].checked==true)
                        strchon+=document.frmList_Khachhang.chkid[i].value+",";
            }else{
                if(document.frmList_Khachhang.chkid.checked==true)
                    strchon=document.frmList_Khachhang.chkid.value;
            }
            document.frmList_Khachhang.chon_Khachhang.value=strchon;
        }

        function delItems_Khachhang(processurl,delStr){
            if (delStr == undefined){
                calculatechon_Khachhang();
                delStr = document.getElementById("chon_Khachhang").value;
            }
            if (delStr == ""){
                return false;
            }
            if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
                return false;
            }

            var numresult_Khachhang,order_Khachhang,curpage_Khachhang;
            numresult = $("#numresult_Khachhang").val();
            order = $("#order_Khachhang").val();
            curpage = $("#curpage_Khachhang").val();

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

        function reloadPage_Khachhang(processurl){
            var numresult_Khachhang,order_Khachhang,cur_pos;
            numresult = $("#numresult_Khachhang").val();
            order = $("#order_Khachhang").val();
            cur_pos = 0;
            $("#hdban_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&cur_pos="+cur_pos);
        }

        function gotoPage_Khachhang(processurl,page){
            var numresult_Khachhang,order_Khachhang,cur_pos;
            numresult = $("#numresult_Khachhang").val();
            order = $("#order_Khachhang").val();
            //alert(processurl+'-'+page+'-'+numresult+'-'+order);
            $("#hdban_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
        }

        function uncheck_fns_Khachhang(field,val,id){
            $("#hdban_content_main").load("?listKhachhang&mod=hdban&checkUncheck="+val+"&setfield="+field+"&checkUncheckID="+id);
        }

        function sort_me_Khachhang(id,val){
            $("#hdban_content_main").load("?listKhachhang&mod=hdban&sort_me=1&khachhang_id="+id+"&val="+val);
        }

        function search_me_Khachhang(){
            var keyword = document.getElementById('keyword').value;
            if (keyword == ""){
                return false;
            }

            $.post('?listKhachhang&mod=hdban',
                {keyword:keyword},
                function(data){
                    $('#hdban_content_main').html(data);
                    $("#hdban_content_main").show();
                }
            );
        }

        function edit_me_Khachhang(id){
            $("#hdban_content_main").load("?listKhachhang&mod=hdban&edit_me=1&khachhang_id="+id);
        }

        $("#a_ref_Khachhang").click( function () {
            $('#hdban_content_main').hide();
            $('#hdban_content_main').fadeOut('fast').load('index.php?listKhachhang&mod=hdban').fadeIn("fast");
        });
    </script>
{/literal}