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
    <form method="post" name="frmList_Doitac" action="?listDoitac{$vars.arg}" id="frmList_Doitac">
        <!------------------------------------------THEM MOI------------------------------------>
        <fieldset style="width:1012px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px">
            <legend class="legend_list">
                Thêm/Chỉnh sửa&nbsp;|&nbsp;Thông báo:&nbsp;
                <span id="lblError_Doitac" class="error">Mời bạn nhập đủ dữ liệu!</span>
            </legend>
            <table width="98%" cellspacing="0" cellpadding="0" border="0" style="margin-left:5px">
                <tr height="10"><td colspan="4"></td></tr>
                <tr height="30">
                    <td width="10%" align="left" height="20">Tên đối tác <font color="#FF0000">*</font>:</td>
                    <td align="left" width="50%">
                        <input type="text" name="doitac_name" id="doitac_name" class="text_long" value="{$obj_info.doitac_name}"/>
                    </td>
                    <td align="left" width="10%">Tên viết tắt:</td>
                    <td align="left" width="30%">
                        <input type="text" id="doitac_viettat" name="doitac_viettat" class="text_middle" value="{$obj_info.doitac_viettat}"/>
                    </td>
                </tr>
                <tr height="30">
                    <td align="left" height="20">Trụ sở:</td>
                    <td align="left">
                        <input type="text" name="doitac_truso" id="doitac_truso" class="text_long" value="{$obj_info.doitac_truso}"/>
                    </td>
                    <td align="left">Mã số thuế:</td>
                    <td align="left">
                        <input type="text" id="doitac_mst" name="doitac_mst" class="text_short" value="{$obj_info.doitac_mst}"/>
                    </td>
                </tr>
                <tr height="30">
                    <td align="left" height="20">Văn phòng:</td>
                    <td align="left">
                        <input type="text" name="doitac_vpgd" id="doitac_vpgd" class="text_long" value="{$obj_info.doitac_vpgd}"/>
                    </td>
                    <td align="left">Đại diện:</td>
                    <td align="left">
                        <input type="text" id="doitac_daidien" name="doitac_daidien" class="text_middle" value="{$obj_info.doitac_daidien}"/>
                    </td>
                </tr>
                <tr height="30">
                    <td align="left" height="20">Sô điện thoại:</td>
                    <td align="left">
                        <div style="float:left; width: 190px">
                            <input type="text" name="doitac_sdt" id="doitac_sdt" class="text_short" value="{$obj_info.doitac_sdt}"/>
                        </div>
                        <div style="float:left; width: 62px; line-height: 25px">Số fax:</div>
                        <div style="float:left; width: 150px">
                            <input type="text" name="doitac_fax" id="doitac_fax" class="text_short" value="{$obj_info.doitac_fax}"/>
                        </div>
                    </td>
                    <td align="left">Email:</td>
                    <td align="left">
                        <input type="text" id="doitac_email" name="doitac_email" class="text_middle" value="{$obj_info.doitac_email}"/>
                    </td>
                </tr>
                <tr height="30">
                    <td align="left">Tình trạng :</td>
                    <td align="left">
                        {if $obj_info.doitac_active neq ''}
                            <input type="radio" id="doitac_active" name="doitac_active" value="1" {if $obj_info.doitac_active eq 1} checked="checked" {/if} />&nbsp;Hiển thị&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" id="doitac_active" name="doitac_active" value="2" {if $obj_info.doitac_active eq 2} checked="checked" {/if} />&nbsp;Không hiển thị
                        {else}
                            <input type="radio" id="doitac_active" name="doitac_active" value="1" checked/>&nbsp;Hiển thị&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" id="doitac_active" name="doitac_active" value="2" />&nbsp;Không hiển thị
                        {/if}
                    </td>
                    <td align="left" colspan="2">
                        <input type="button" name="btnSub_Doitac" id="btnSub_Doitac" value="Ghi lại" class="button" />
                        <input type="hidden" name="doitac_id" id="doitac_id" value="{$obj_info.doitac_id}">
                        <input type="reset" name="Reset" value="Hủy bỏ" class="button" />
                        {literal}
                            <script language="javascript">
                                function hide_message_Doitac(){
                                    $('#lblMessage_Doitac').hide();
                                    $('#lblError_Doitac').hide();
                                }

                                $(function() {
                                    $('.error').hide();
                                    $('#lblMessage_Doitac').hide();

                                    $("#btnSub_Doitac").click(function() {
                                        $('.error').hide();
                                        var $form = $("#frmList_Doitac");

                                        var doitac_name = $form.find('input#doitac_name').val();
                                        var doitac_viettat = $form.find('input#doitac_viettat').val();
                                        var doitac_truso = $form.find('input#doitac_truso').val();
                                        var doitac_daidien = $form.find('input#doitac_daidien').val();
                                        var doitac_mst = $form.find('input#doitac_mst').val();
                                        var doitac_vpgd = $form.find('input#doitac_vpgd').val();
                                        var doitac_sdt = $form.find('input#doitac_sdt').val();
                                        var doitac_fax = $form.find('input#doitac_fax').val();
                                        var doitac_email = $form.find('input#doitac_email').val();
                                        var doitac_active = $form.find('input#doitac_active:checked').val();
                                        var doitac_id = $form.find('input#doitac_id').val();
                                        //begin validate form
                                        if (doitac_name == ""){
                                            $('#lblError_Doitac').show();
                                        }
                                        else{
                                            var dataString  = "doitac_name=" + doitac_name;
                                            dataString += "&doitac_viettat=" + doitac_viettat;
                                            dataString += "&doitac_truso=" + doitac_truso;
                                            dataString += "&doitac_daidien=" + doitac_daidien;
                                            dataString += "&doitac_mst=" + doitac_mst;
                                            dataString += "&doitac_vpgd=" + doitac_vpgd;
                                            dataString += "&doitac_sdt=" + doitac_sdt;
                                            dataString += "&doitac_fax=" + doitac_fax;
                                            dataString += "&doitac_email=" + doitac_email;
                                            dataString += "&doitac_active=" + doitac_active;
                                            dataString += "&doitac_id=" + doitac_id +"";

                                            $.ajax({
                                                type: "POST",
                                                url: "index.php?listDoitac&mod=hdmua&add_edit=1",
                                                data: dataString,
                                                success: function(data) {
                                                    $('#hdmua_content_main').fadeOut('fast').load('index.php?listDoitac&mod=hdmua').fadeIn("fast");
                                                    //$('#lblMessage_Doitac').show();
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
                    <input type="button" name="btnSeek" id="btnSeek" value="Tìm >>" class="button_seek" onclick="search_me_Doitac()" /></div>
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
                    <input type="hidden" name="chon" id="chon_Doitac">
                    <input type="checkbox" name="chkall" value="0" onclick="docheck_Doitac(document.frmList_Doitac.chkall.checked,0);">
                </div>
            </div>
            <div style="float:left; width:20px; text-align:right">
                <input type="button" name="del_Items" id='del_Items' value="&nbsp;" onClick="delItems_Doitac('{$processurl}');" style="width:17px; font-size:12px; background:url(../images/admin/b_drop.png); cursor:pointer" title="Xóa lựa chọn">
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
                    <div class="{$class_td}" style="width:256px">
                        &nbsp;<a href="javascript: void(0);" onclick="edit_me_Doitac({$obj_list[pi]->doitac_id})" >{$obj_list[pi]->doitac_name|str_string_cut:"60":"1"}</a>
                    </div>
                    <div class="{$class_td}" style="width:180px">
                        &nbsp;{$obj_list[pi]->doitac_viettat|str_string_cut:"40":"1"}
                    </div>
                    <div class="{$class_td}" style="width:120px">
                        &nbsp;{$obj_list[pi]->doitac_daidien}
                    </div>
                    <div class="{$class_td}" style="width:90px">
                        &nbsp;{$obj_list[pi]->doitac_sdt}
                    </div>
                    <div class="{$class_td}" style="width:90px">
                        &nbsp;{$obj_list[pi]->doitac_mst}
                    </div>
                    <div class="{$class_td}" style="width:59px; text-align:center">
                        <select name="doitac_sort[]" onchange="sort_me_Doitac({$obj_list[pi]->doitac_id},this.value)" class="select_tiny">
                            {section name=i loop=$total_num_result}
                                <option value="{$smarty.section.i.index}" {if $smarty.section.i.index eq $obj_list[pi]->doitac_sort} selected="selected"{/if}>{$smarty.section.i.index}</option>
                            {/section}
                        </select>
                        <input type="hidden" name="doitac_id1[]" value="{$obj_list[pi]->doitac_id}">
                    </div>
                    <div class="{$class_td}" style="width:59px; text-align:center">
                        {if $obj_list[pi]->doitac_active eq 1}
                            <a href='javascript: void(0);' onclick="uncheck_fns_Doitac('doitac_active',2,{$obj_list[pi]->doitac_id})"><img src="../images/admin/tick.png" width="10" height="10" border="0" title="Ẩn"></a>
                        {else}
                            <a href='javascript: void(0);' onclick="uncheck_fns_Doitac('doitac_active',1,{$obj_list[pi]->doitac_id})"><img src="../images/admin/publish_x.png" width="10" height="10" border="0" title="Hiện"></a>
                        {/if}
                    </div>
                    <div class="{$class_td}" style="width:29px; text-align:center">
                        <a href='javascript: void(0);' onclick="edit_me_Doitac({$obj_list[pi]->doitac_id})">
                            <img src="../images/admin/b_edit.png" width="11" height="11" border="0" title="Sửa"></a>
                    </div>
                    <div class="{$class_td}" style="width:29px; text-align:center">
                        <a href='javascript: void(0'  onClick="delItems_Doitac('{$processurl}', {$obj_list[pi]->doitac_id});">
                            <img src="../images/admin/b_drop.png" width="11" height="11" border="0" title="Xóa"></a>
                    </div>
                    <div class="{$class_td}" style="width:39px; text-align:center">
                        <input type="checkbox" name="chkid" value="{$obj_list[pi]->doitac_id}" onclick="docheckone_Doitac();">
                    </div>
                {/section}
            </div>
            <input type="hidden" id="curpage_Doitac" name="curpage" value="{$vars.curpage}" />
        </fieldset>
    </form>
</div>
<!------------------------------------------------- Tool bar --------------------------------------------->
<div id="doc_clear_txt"></div>
<div id="doc_tool_bar">

    <div id="doc_search_area">
        <select name="order" id="order_Doitac" style="width:120px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_Doitac('{$processurl}');">
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
            <a href="javascript: void(0)" id="first_page" onclick="gotoPage_Doitac('{$processurl}',parseInt(1));" title="Trang đầu">
                <img src="{$css_path}icon_first_page.png" class="img_all">
            </a>
            <a href="javascript: void(0)" id="pre_page" onclick="gotoPage_Doitac('{$processurl}',parseInt(document.getElementById('page_Doitac').value)-parseInt(1));" title="Trang trước">
                <img src="{$css_path}icon_pre_page.png" class="img_all">
            </a>
        {/if}
    </div>
    <div style="float:left; line-height:19px">
        <div style="float:left; width:35px">Trang</div>
        <div style="float:left; width:35px">
            <input type="text" value="{$vars.curpage}" name="page" id="page_Doitac" onblur=" gotoPage_Doitac('{$processurl}',this.value);" style="width:30px; font-size:12px; height:15px; border:1px solid #99bbe8">
        </div>
        <div style="float:left; width:42px"> / {$num_page}</div>
    </div>
    <div id="doc_page_area">
        {if $vars.curpage eq $num_page}
            <img src="{$css_path}icon_next_page.png" class="img_all">
            <img src="{$css_path}icon_last_page.png" class="img_all">
        {else}
            <a href="javascript: void(0)" id="next_page" onclick="gotoPage_Doitac('{$processurl}',parseInt(document.getElementById('page_Doitac').value)+parseInt(1));" title="Trang tiếp">
                <img src="{$css_path}icon_next_page.png" class="img_all">
            </a>
            <a href="javascript: void(0)" id="last_page" onclick="gotoPage_Doitac('{$processurl}',parseInt({$num_page}));" title="Trang cuối">
                <img src="{$css_path}icon_last_page.png" class="img_all">
            </a>
        {/if}
    </div>

    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:left; width:15px">
        <a href="javascript: void(0)" id="a_ref_Doitac" title="Tải lại"><img src="{$css_path}icon_refresh.png" class="img_all"></a>
    </div>

    <div style="float:left; width:12px; background-image:url({$css_path}gach_doc.png)">&nbsp;</div>
    <div style="float:right; line-height:19px; margin-right:2px">
        <div style="float:left; width:40px">Xem</div>
        <div style="float:left; width:52px">
            <select name="numresult" id="numresult_Doitac" style="width:50px; font-size:12px; border:1px solid #99bbe8" onchange="reloadPage_Doitac('{$processurl}');">
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
        function docheck_Doitac(status,from_){
            var alen=document.frmList_Doitac.elements.length;
            alen=(alen>5)?document.frmList_Doitac.chkid.length:0;
            if (alen>0){
                for(var i=0;i<alen;i++)
                    document.frmList_Doitac.chkid[i].checked=status;
            }
            else{
                document.frmList_Doitac.chkid.checked=status;
            }
            if(from_>0) document.frmList_Doitac.chkall.checked=status;
        }

        function docheckone_Doitac(){
            var alen=document.frmList_Doitac.elements.length;

            var isChecked=true;
            alen=(alen>4)?document.frmList_Doitac.chkid.length:0;
            if (alen>0){
                for(var i=0;i<alen;i++)
                    if(document.frmList_Doitac.chkid[i].checked==false)
                        isChecked=false;
            }else{
                if(document.frmList_Doitac.chkid.checked==false)
                    isChecked=false;
            }
            document.frmList_Doitac.chkall.checked=isChecked;
        }

        function calculatechon_Doitac(){
            var strchon="";
            var alen=document.frmList_Doitac.elements.length;
            alen=(alen>2)?document.frmList_Doitac.chkid.length:0;
            if (alen>0){
                for(var i=0;i<alen;i++)
                    if(document.frmList_Doitac.chkid[i].checked==true)
                        strchon+=document.frmList_Doitac.chkid[i].value+",";
            }else{
                if(document.frmList_Doitac.chkid.checked==true)
                    strchon=document.frmList_Doitac.chkid.value;
            }
            document.frmList_Doitac.chon_Doitac.value=strchon;
        }

        function delItems_Doitac(processurl,delStr){
            if (delStr == undefined){
                calculatechon_Doitac();
                delStr = document.getElementById("chon_Doitac").value;
            }
            if (delStr == ""){
                return false;
            }
            if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
                return false;
            }

            var numresult_Doitac,order_Doitac,curpage_Doitac;
            numresult = $("#numresult_Doitac").val();
            order = $("#order_Doitac").val();
            curpage = $("#curpage_Doitac").val();

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

        function reloadPage_Doitac(processurl){
            var numresult_Doitac,order_Doitac,cur_pos;
            numresult = $("#numresult_Doitac").val();
            order = $("#order_Doitac").val();
            cur_pos = 0;
            $("#hdmua_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&cur_pos="+cur_pos);
        }

        function gotoPage_Doitac(processurl,page){
            var numresult_Doitac,order_Doitac,cur_pos;
            numresult = $("#numresult_Doitac").val();
            order = $("#order_Doitac").val();
            //alert(processurl+'-'+page+'-'+numresult+'-'+order);
            $("#hdmua_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
        }

        function uncheck_fns_Doitac(field,val,id){
            $("#hdmua_content_main").load("?listDoitac&mod=hdmua&checkUncheck="+val+"&setfield="+field+"&checkUncheckID="+id);
        }

        function sort_me_Doitac(id,val){
            $("#hdmua_content_main").load("?listDoitac&mod=hdmua&sort_me=1&doitac_id="+id+"&val="+val);
        }

        function search_me_Doitac(){
            var keyword = document.getElementById('keyword').value;
            if (keyword == ""){
                return false;
            }

            $.post('?listDoitac&mod=hdmua',
                {keyword:keyword},
                function(data){
                    $('#hdmua_content_main').html(data);
                    $("#hdmua_content_main").show();
                }
            );
        }

        function edit_me_Doitac(id){
            $("#hdmua_content_main").load("?listDoitac&mod=hdmua&edit_me=1&doitac_id="+id);
        }

        $("#a_ref_Doitac").click( function () {
            $('#hdmua_content_main').hide();
            $('#hdmua_content_main').fadeOut('fast').load('index.php?listDoitac&mod=hdmua').fadeIn("fast");
        });
    </script>
{/literal}