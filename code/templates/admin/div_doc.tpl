{literal}
<style>
#div_doc{ width: 1045px; height: 550px; padding: 0px 1px 1px 1px; border:1px solid #8ea4c1; background-color:#ffffff;
	position:absolute; margin:40px 200px; z-index:100; font-size:12px
	/*display: none; position: absolute; background-color: white2; overflow: auto;	*/
}
#doc_main_cont{ float:left; width:100%; height:550px; background-color:#ccd8e7}
#doc_tab_bar_tit{ float:left; font-weight:bold; text-transform:uppercase; line-height:20px; padding-left:8px; width:80%;cursor:move; color:#15428b;}
#doc_tab_bar_icon{ float:right; width:10%; text-align:right; padding-top:2px; padding-right:6px}
#doc_content_outsign{ float:left; width:98%; height:495px; background-color:#ffffff; margin-left:8px; border:1px solid #99bbe8}
#doc_content_insign{ float:left; width:99.7%; height:472px; background-color:#dfe8f6; margin-left:1px;}
#doc_content_main{ float:left; width:99.8%; height:494px; background-color:#dfe8f6; margin-left:1px;}

#doc_content_main_small_1{ float:left; width:49.8%; height:495px; background-color:#dfe8f6; margin-left:1px;}
#doc_content_main_small_2{ float:left; width:49.8%; height:495px; background-color:#dfe8f6; margin-left:1px;}
#doc_content_main_small_3{ float:left; width:99.7%; height:194px; background-color:#dfe8f6; margin-left:1px;}
#doc_content_main_small_4{ float:left; width:49.8%; height:300px; background-color:#dfe8f6; margin-left:1px;}
#doc_content_main_small_5{ float:left; width:49.8%; height:300px; background-color:#dfe8f6; margin-left:1px;}

#doc_clear_txt{ float:left; width:100%; height:1px}
#doc_tool_bar{ float:left; width:99.7%; height:20px; background-color:#dfe8f6; margin-left:1px}
#doc_search_area{ float:left; width:120px; height:20px; padding-left:2px}
#doc_page_area{ float:left; width:40px; height:20px; padding-left:2px}
#doc_menu{ float:left; width:99.7%; height:25px; padding-left:8px; position:absolute; margin-top:21px}

/*----------------------file div---------------------*/
#file_main_cont{ float:left; width:100%; height:350px; background-color:#ccd8e7}
#file_tab_bar_tit{ float:left; font-weight:bold; text-transform:uppercase; line-height:20px; padding-left:8px; width:80%;cursor:move; color:#15428b;}
#file_tab_bar_icon{ float:right; width:10%; text-align:right; padding-top:2px; padding-right:6px}
#file_content_outsign{ float:left; width:94.4%; height:320px; background-color:#ffffff; margin-left:8px; border:1px solid #99bbe8}
#file_content_insign{ float:left; width:99.7%; height:297px; background-color:#dfe8f6; margin-left:1px;}
#list_file_cont{ float:left; width:99.2%; height:319px; background-color:#dfe8f6; margin-left:1px;}
#file_clear_txt{ float:left; width:100%; height:1px}
#file_tool_bar{ float:left; width:99.7%; height:20px; background-color:#dfe8f6; margin-left:1px}
#file_search_area{ float:left; width:120px; height:20px; padding-left:2px}
#file_page_area{ float:left; width:40px; height:20px; padding-left:2px}
#file_menu{ float:left; width:99.7%; height:25px; padding-left:8px; position:absolute; margin-top:21px}
/*----------------------end file div---------------------*/

/*----------------------file dt div---------------------*/
#file_dt_main_cont{ float:left; width:100%; height:350px; background-color:#ccd8e7}
#file_dt_tab_bar_tit{ float:left; font-weight:bold; text-transform:uppercase; line-height:20px; padding-left:8px; width:80%;cursor:move; color:#15428b;}
#file_dt_tab_bar_icon{ float:right; width:10%; text-align:right; padding-top:2px; padding-right:6px}
#file_dt_content_outsign{ float:left; width:96%; height:320px; background-color:#ffffff; margin-left:8px; border:1px solid #99bbe8}
#file_dt_content_insign{ float:left; width:99.7%; height:297px; background-color:#dfe8f6; margin-left:1px;}
#list_dt_file_cont{ float:left; width:99.5%; height:319px; background-color:#dfe8f6; margin-left:1px;}
#file_dt_clear_txt{ float:left; width:100%; height:1px}
#file_dt_tool_bar{ float:left; width:99.7%; height:20px; background-color:#dfe8f6; margin-left:1px}
#file_dt_search_area{ float:left; width:120px; height:20px; padding-left:2px}
#file_dt_page_area{ float:left; width:40px; height:20px; padding-left:2px}
#file_dt_menu{ float:left; width:99.7%; height:25px; padding-left:8px; position:absolute; margin-top:21px}
/*----------------------end file div---------------------*/

/*----------------------file log div---------------------*/
#file_log_main_cont{ float:left; width:100%; height:350px; background-color:#ccd8e7}
#file_log_tab_bar_tit{ float:left; font-weight:bold; text-transform:uppercase; line-height:20px; padding-left:8px; width:80%;cursor:move; color:#15428b;}
#file_log_tab_bar_icon{ float:right; width:10%; text-align:right; padding-top:2px; padding-right:6px}
#file_log_content_outsign{ float:left; width:93%; height:320px; background-color:#ffffff; margin-left:8px; border:1px solid #99bbe8}
#file_log_content_insign{ float:left; width:99.7%; height:297px; background-color:#dfe8f6; margin-left:1px;}
#list_file_log_cont{ float:left; width:99.5%; height:319px; background-color:#dfe8f6; margin-left:1px;}
#file_log_clear_txt{ float:left; width:100%; height:1px}
#file_log_tool_bar{ float:left; width:99.7%; height:20px; background-color:#dfe8f6; margin-left:1px}
#file_log_search_area{ float:left; width:120px; height:20px; padding-left:2px}
#file_log_page_area{ float:left; width:40px; height:20px; padding-left:2px}
#file_log_menu{ float:left; width:99.7%; height:25px; padding-left:8px; position:absolute; margin-top:21px}
/*----------------------end file div---------------------*/

/*----------------------reply div---------------------*/
#reply_main_cont{ float:left; width:100%; height:450px; background-color:#ccd8e7}
#reply_tab_bar_tit{ float:left; font-weight:bold; text-transform:uppercase; line-height:20px; padding-left:8px; width:80%;cursor:move; color:#15428b;}
#reply_tab_bar_icon{ float:right; width:10%; text-align:right; padding-top:2px; padding-right:6px}
#reply_content_outsign{ float:left; width:97.3%; height:420px; background-color:#ffffff; margin-left:8px; border:1px solid #99bbe8}
#reply_content_insign{ float:left; width:99.8%; height:397px; background-color:#dfe8f6; margin-left:1px;}
#list_reply_cont{ float:left; width:99.7%; height:419px; background-color:#dfe8f6; margin-left:1px;}
#reply_clear_txt{ float:left; width:100%; height:1px}
#reply_tool_bar{ float:left; width:99.8%; height:20px; background-color:#dfe8f6; margin-left:1px}
#reply_search_area{ float:left; width:120px; height:20px; padding-left:2px}
#reply_page_area{ float:left; width:40px; height:20px; padding-left:2px}
#reply_menu{ float:left; width:99.8%; height:25px; padding-left:8px; position:absolute; margin-top:21px}
/*----------------------end reply div---------------------*/

/*----------------------phanloai div---------------------*/
#phanloai_main_cont{ float:left; width:100%; height:250px; background-color:#ccd8e7}
#phanloai_tab_bar_tit{ float:left; font-weight:bold; text-transform:uppercase; line-height:20px; padding-left:8px; width:80%;cursor:move; color:#15428b;}
#phanloai_tab_bar_icon{ float:right; width:10%; text-align:right; padding-top:2px; padding-right:6px}
#phanloai_content_outsign{ float:left; width:96.4%; height:220px; background-color:#ffffff; margin-left:8px; border:1px solid #99bbe8}
#phanloai_content_insign{ float:left; width:99.8%; height:207px; background-color:#dfe8f6; margin-left:1px;}
#list_phanloai_cont{ float:left; width:99.7%; height:219px; background-color:#dfe8f6; margin-left:1px;}
#phanloai_clear_txt{ float:left; width:100%; height:1px}
#phanloai_tool_bar{ float:left; width:99.8%; height:20px; background-color:#dfe8f6; margin-left:1px}
#phanloai_search_area{ float:left; width:120px; height:20px; padding-left:2px}
#phanloai_page_area{ float:left; width:40px; height:20px; padding-left:2px}
#phanloai_menu{ float:left; width:99.8%; height:25px; padding-left:8px; position:absolute; margin-top:21px}
/*----------------------end phanloai div---------------------*/

/*----------------------thanhcong div---------------------*/
#thanhcong_main_cont{ float:left; width:100%; height:100px; background-color:#ccd8e7}
#thanhcong_tab_bar_tit{ float:left; font-weight:bold; text-transform:uppercase; line-height:20px; padding-left:8px; width:80%;cursor:move; color:#15428b;}
#thanhcong_tab_bar_icon{ float:right; width:10%; text-align:right; padding-top:2px; padding-right:6px}
#thanhcong_content_outsign{ float:left; width:90%; height:70px; background-color:#ffffff; margin-left:8px; border:1px solid #99bbe8}
#thanhcong_content_insign{ float:left; width:99.8%; height:58px; background-color:#dfe8f6; margin-left:1px;}
#list_thanhcong_cont{ float:left; width:99.7%; height:70px; background-color:#dfe8f6; margin-left:1px;}
/*----------------------end thanhcong div---------------------*/

/*----------------------view_doc div---------------------*/
#view_doc_main_cont{ float:left; width:100%; height:420px; background-color:#ccd8e7}
#view_doc_tab_bar_tit{ float:left; font-weight:bold; text-transform:uppercase; line-height:20px; padding-left:8px; width:80%;cursor:move; color:#15428b;}
#view_doc_tab_bar_icon{ float:right; width:10%; text-align:right; padding-top:2px; padding-right:6px}
#view_doc_content_outsign{ float:left; width:96.4%; height:390px; background-color:#ffffff; margin-left:8px; border:1px solid #99bbe8}
#view_doc_content_insign{ float:left; width:99.8%; height:377px; background-color:#dfe8f6; margin-left:1px;}
#list_view_doc_cont{ float:left; width:99.7%; height:389px; background-color:#dfe8f6; margin-left:1px;}
#view_doc_clear_txt{ float:left; width:100%; height:1px}
#view_doc_tool_bar{ float:left; width:99.8%; height:20px; background-color:#dfe8f6; margin-left:1px}
#view_doc_search_area{ float:left; width:120px; height:20px; padding-left:2px}
#view_doc_page_area{ float:left; width:40px; height:20px; padding-left:2px}
#view_doc_menu{ float:left; width:99.8%; height:25px; padding-left:8px; position:absolute; margin-top:21px}
/*----------------------end view_doc div---------------------*/

/*----------------------div_note div---------------------*/
#div_note_main_cont{ float:left; width:100%; height:220px; background-color:#ccd8e7}
#div_note_tab_bar_tit{ float:left; font-weight:bold; text-transform:uppercase; line-height:20px; padding-left:8px; width:80%;cursor:move; color:#15428b;}
#div_note_tab_bar_icon{ float:right; width:10%; text-align:right; padding-top:2px; padding-right:6px}
#div_note_content_outsign{ float:left; width:96.4%; height:190px; background-color:#ffffff; margin-left:8px; border:1px solid #99bbe8}
#div_note_content_insign{ float:left; width:99.8%; height:177px; background-color:#dfe8f6; margin-left:1px;}
#list_div_note_cont{ float:left; width:99.7%; height:189px; background-color:#dfe8f6; margin-left:1px;}
#div_note_clear_txt{ float:left; width:100%; height:1px}
#div_note_tool_bar{ float:left; width:99.8%; height:20px; background-color:#dfe8f6; margin-left:1px}
#div_note_search_area{ float:left; width:120px; height:20px; padding-left:2px}
#div_note_page_area{ float:left; width:40px; height:20px; padding-left:2px}
#div_note_menu{ float:left; width:99.8%; height:25px; padding-left:8px; position:absolute; margin-top:21px}
/*----------------------end div_note div---------------------*/

/*----------------------view_docout div---------------------*/
#view_docout_main_cont{ float:left; width:100%; height:260px; background-color:#ccd8e7}
#view_docout_tab_bar_tit{ float:left; font-weight:bold; text-transform:uppercase; line-height:20px; padding-left:8px; width:80%;cursor:move; color:#15428b;}
#view_docout_tab_bar_icon{ float:right; width:10%; text-align:right; padding-top:2px; padding-right:6px}
#view_docout_content_outsign{ float:left; width:96.4%; height:230px; background-color:#ffffff; margin-left:8px; border:1px solid #99bbe8}
#view_docout_content_insign{ float:left; width:99.8%; height:217px; background-color:#dfe8f6; margin-left:1px;}
#list_view_docout_cont{ float:left; width:99.7%; height:229px; background-color:#dfe8f6; margin-left:1px;}
#view_docout_clear_txt{ float:left; width:100%; height:1px}
#view_docout_tool_bar{ float:left; width:99.8%; height:20px; background-color:#dfe8f6; margin-left:1px}
#view_docout_search_area{ float:left; width:120px; height:20px; padding-left:2px}
#view_docout_page_area{ float:left; width:40px; height:20px; padding-left:2px}
#view_docout_menu{ float:left; width:99.8%; height:25px; padding-left:8px; position:absolute; margin-top:21px}
/*----------------------end view_docout div---------------------*/

/*----------------------huongdan div---------------------*/
#huongdan_main_cont{ float:left; width:100%; height:420px; background-color:#ccd8e7}
#huongdan_tab_bar_tit{ float:left; font-weight:bold; text-transform:uppercase; line-height:20px; padding-left:8px; width:80%;cursor:move; color:#15428b;}
#huongdan_tab_bar_icon{ float:right; width:10%; text-align:right; padding-top:2px; padding-right:6px}
#huongdan_content_outsign{ float:left; width:96.4%; height:390px; background-color:#ffffff; margin-left:8px; border:1px solid #99bbe8}
#huongdan_content_insign{ float:left; width:99.8%; height:357px; background-color:#dfe8f6; margin-left:1px;}
#list_huongdan_cont{ float:left; width:99.7%; height:389px; background-color:#dfe8f6; margin-left:1px;}
#huongdan_clear_txt{ float:left; width:100%; height:1px}
#huongdan_tool_bar{ float:left; width:99.8%; height:20px; background-color:#dfe8f6; margin-left:1px}
#huongdan_search_area{ float:left; width:120px; height:20px; padding-left:2px}
#huongdan_page_area{ float:left; width:40px; height:20px; padding-left:2px}
#huongdan_menu{ float:left; width:99.8%; height:25px; padding-left:8px; position:absolute; margin-top:21px}
/*----------------------end huongdan div---------------------*/

/*----------------------giaiquyet div---------------------*/
#giaiquyet_main_cont{ float:left; width:100%; height:155px; background-color:#ccd8e7}
#giaiquyet_tab_bar_tit{ float:left; font-weight:bold; text-transform:uppercase; line-height:20px; padding-left:8px; width:80%;cursor:move; color:#15428b;}
#giaiquyet_tab_bar_icon{ float:right; width:10%; text-align:right; padding-top:2px; padding-right:6px}
#giaiquyet_content_outsign{ float:left; width:96.4%; height:125px; background-color:#ffffff; margin-left:8px; border:1px solid #99bbe8}
#giaiquyet_content_insign{ float:left; width:99.8%; height:112px; background-color:#dfe8f6; margin-left:1px;}
#list_giaiquyet_cont{ float:left; width:99.7%; height:124px; background-color:#dfe8f6; margin-left:1px;}
#giaiquyet_clear_txt{ float:left; width:100%; height:1px}
#giaiquyet_tool_bar{ float:left; width:99.8%; height:20px; background-color:#dfe8f6; margin-left:1px}
#giaiquyet_search_area{ float:left; width:120px; height:20px; padding-left:2px}
#giaiquyet_page_area{ float:left; width:40px; height:20px; padding-left:2px}
#giaiquyet_menu{ float:left; width:99.8%; height:25px; padding-left:8px; position:absolute; margin-top:21px}
/*----------------------end giaiquyet div---------------------*/

/*----------------------phoihop div---------------------*/
#phoihop_main_cont{ float:left; width:100%; height:350px; background-color:#ccd8e7}
#phoihop_tab_bar_tit{ float:left; font-weight:bold; text-transform:uppercase; line-height:20px; padding-left:8px; width:80%;cursor:move; color:#15428b;}
#phoihop_tab_bar_icon{ float:right; width:10%; text-align:right; padding-top:2px; padding-right:6px}
#phoihop_content_outsign{ float:left; width:96.4%; height:320px; background-color:#ffffff; margin-left:8px; border:1px solid #99bbe8}
#phoihop_content_insign{ float:left; width:99.8%; height:297px; background-color:#dfe8f6; margin-left:1px;}
#list_phoihop_cont{ float:left; width:99.7%; height:319px; background-color:#dfe8f6; margin-left:1px;}
#phoihop_clear_txt{ float:left; width:100%; height:1px}
#phoihop_tool_bar{ float:left; width:99.8%; height:20px; background-color:#dfe8f6; margin-left:1px}
#phoihop_search_area{ float:left; width:120px; height:20px; padding-left:2px}
#phoihop_page_area{ float:left; width:40px; height:20px; padding-left:2px}
#phoihop_menu{ float:left; width:99.8%; height:25px; padding-left:8px; position:absolute; margin-top:21px}
/*----------------------end phoihop div---------------------*/

.c_menu_doc{float:left; border-right:1px solid #99bbe8; line-height:21px; height:21px; padding-left:2px; border-top:1px solid #99bbe8; margin-top:4px}
.legend{margin-left:20px; border:1px solid #99bbe8; width:100px; font-weight:bold; padding-left:2px; line-height:20px; background-color:#ccd8e7}

.img_all{opacity:0.7}
.img_all:hover{opacity:1}
</style>
<script>
$(function() {
	$( "#div_doc" ).draggable();
	$( "#list_file" ).draggable();
    $( "#list_file_dt" ).draggable();
    $( "#list_file_log" ).draggable();
	$( "#list_reply" ).draggable();
	$( "#list_phanloai" ).draggable();
	$( "#div_phoihop" ).draggable();
	$( "#div_giaiquyet" ).draggable();
	$( "#list_view_doc" ).draggable();
	$( "#list_huongdan" ).draggable();
});
function min_size_doc(){
	if(document.getElementById('div_doc').style.height=='550px'){
		document.getElementById('div_doc').style.height='20px';
		document.getElementById('doc_main_cont').style.height='20px';
		document.getElementById('doc_content_outsign').style.display='none';
		document.getElementById('doc_content_insign').style.display='none';
		document.getElementById('doc_tool_bar').style.display='none';
		document.getElementById('doc_menu').style.display='none';
	}else{
		document.getElementById('div_doc').style.height='550px';
		document.getElementById('doc_main_cont').style.height='550px';
		document.getElementById('doc_content_outsign').style.display='';
		document.getElementById('doc_content_insign').style.display='';
		document.getElementById('doc_tool_bar').style.display='';
		document.getElementById('doc_menu').style.display='';
	}
}
function reset_pos_doc(){
	document.getElementById('div_doc').style.margin='40px 200px';
}
function max_size_doc(){
	if(document.getElementById('div_doc').style.width=='70%'){
		document.getElementById('div_doc').style.margin='0';
		document.getElementById('div_doc').style.width='98%';
		document.getElementById('div_doc').style.height='600px';
		document.getElementById('doc_main_cont').style.height='600px';
		document.getElementById('doc_content_outsign').style.height='545px';
		document.getElementById('doc_content_insign').style.height='523px';
	}else{
		document.getElementById('div_doc').style.margin='10px 200px';
		document.getElementById('div_doc').style.width='70%';
		document.getElementById('div_doc').style.height='550px';
		document.getElementById('doc_main_cont').style.height='550px';
		document.getElementById('doc_content_outsign').style.height='495px';
		document.getElementById('doc_content_insign').style.height='473px';
	}
}

function change_style_doc(obj){

	for(i=1;i<=11;i++){
		if(i==parseInt(obj)){
            if(document.getElementById('c_menu_doc_'+i) === null) {
                continue;
            }else {
                document.getElementById('c_menu_doc_' + i).style.borderLeft = '1px solid #99bbe8';
                document.getElementById('c_menu_doc_' + i).style.borderRight = '1px solid #99bbe8';
                document.getElementById('c_menu_doc_' + i).style.borderBottom = '1px solid #dfe8f6';
                document.getElementById('c_menu_doc_' + i).style.backgroundColor = '#dfe8f6';
                document.getElementById('c_menu_doc_' + i).style.height = '25px';
                document.getElementById('c_menu_doc_' + i).style.marginTop = '0px';
                //if(parseInt(obj)==10){
                  //  document.getElementById('c_menu_doc_3').style.borderRight = 'none';
                //}
            }
		}
		else{
            if(document.getElementById('c_menu_doc_'+i) === null) {
                continue;
            }else {
                if (i != 1) {
                    document.getElementById('c_menu_doc_' + i).style.borderLeft = 'none';
                }
                if (i == parseInt(obj) - 1) {
                    document.getElementById('c_menu_doc_' + i).style.borderRight = 'none';
                } else {
                    document.getElementById('c_menu_doc_' + i).style.borderRight = '1px solid #99bbe8';
                }
                document.getElementById('c_menu_doc_' + i).style.borderBottom = 'none';
                document.getElementById('c_menu_doc_' + i).style.backgroundColor = '#ccd8e7';
                document.getElementById('c_menu_doc_' + i).style.height = '20px';
                document.getElementById('c_menu_doc_' + i).style.marginTop = '4px';
            }
		}
	}
}
</script>
{/literal}
<!--*******************************************VUNG DIV CHUC NANG*****************************************-->
<div id="div_doc" class="ui-widget-content" style="display:none" onclick="javascript: change_Zindex('div_doc');">
    <div id="doc_main_cont">
        <!-- Tab bar -->
        <div id="doc_tab_bar_tit">Quản lý văn bản</div>
        <div id="doc_tab_bar_icon">
            <a href="javascript: void(0);" onClick="min_size_doc();" style="text-decoration:none">
            <img src="{$css_path}icon_thu_gon.png" class="img_all" title="Ẩn/hiện"></a>
            <a href="javascript: void(0);" onClick="max_size_doc();" style="text-decoration:none">
            <img src="{$css_path}icon_mo_rong.png" class="img_all" title="Mở rộng/thu nhỏ"></a>
            <a href="javascript: void(0);" onClick="javascript: close_all_window_doc(); change_style_doc(1)" style="text-decoration:none">
            <img src="{$css_path}icon_dong.png" class="img_all" title="Đóng lại"></a>
        </div>
        <!-- Menu -->
        <div id="doc_menu">
        	<div style="width:10px; float:left">&nbsp;</div>
            {if $user_level eq 1 or $user_level eq 2 or $user_level eq 9}
                <a href="javascript: void(0)" onclick="change_style_doc(1)" id="a_menu_doc_1">
                    <div class="c_menu_doc" id="c_menu_doc_1" style="width:80px; border-left:1px solid #99bbe8; border-bottom:1px solid #dfe8f6; background-color:#dfe8f6; height:25px; margin-top:0px">Văn bản đến</div></a>
                <a href="javascript: void(0)" onclick="change_style_doc(2)" id="a_menu_doc_2">
                    <div class="c_menu_doc" id="c_menu_doc_2" style="width:70px;">Văn bản đi</div></a>
                <a href="javascript: void(0)" onclick="change_style_doc(10)" id="a_menu_doc_10">
                    <div class="c_menu_doc" id="c_menu_doc_10" style="width:70px;">VB Dự thảo</div></a>
            {elseif $user_level eq 3}
                <a href="javascript: void(0)" onclick="change_style_doc(1)" id="a_menu_doc_1">
                    <div class="c_menu_doc" id="c_menu_doc_1" style="width:100px; border-left:1px solid #99bbe8; border-bottom:1px solid #dfe8f6; background-color:#dfe8f6; height:25px; margin-top:0px">Tham mưu văn bản</div></a>
                <a href="javascript: void(0)" onclick="change_style_doc(2)" id="a_menu_doc_2">
                    <div class="c_menu_doc" id="c_menu_doc_2" style="width:105px;">Giải quyết văn bản</div></a>
                <a href="javascript: void(0)" onclick="change_style_doc(3)" id="a_menu_doc_3">
                    <div class="c_menu_doc" id="c_menu_doc_3" style="width:95px;">Văn bản phối hợp</div></a>
                <a href="javascript: void(0)" onclick="change_style_doc(4)" id="a_menu_doc_4">
                    <div class="c_menu_doc" id="c_menu_doc_4" style="width:80px;">Văn bản đi</div></a>
                <a href="javascript: void(0)" onclick="change_style_doc(10)" id="a_menu_doc_10">
                    <div class="c_menu_doc" id="c_menu_doc_10" style="width:60px;">VB Dự thảo</div></a>
            {elseif $user_level eq 4 or $user_level eq 5 or $user_level eq 6 or $user_level eq 7 or $user_level eq 8 or $user_level eq 10}
            	<a href="javascript: void(0)" onclick="change_style_doc(1)" id="a_menu_doc_1">
                    <div class="c_menu_doc" id="c_menu_doc_1" style="width:80px; border-left:1px solid #99bbe8; border-bottom:1px solid #dfe8f6; background-color:#dfe8f6; height:25px; margin-top:0px">Văn bản đến</div></a>
                <a href="javascript: void(0)" onclick="change_style_doc(2)" id="a_menu_doc_2">
                    <div class="c_menu_doc" id="c_menu_doc_2" style="width:95px;">Văn bản phối hợp</div></a>
                <a href="javascript: void(0)" onclick="change_style_doc(3)" id="a_menu_doc_3">
                    <div class="c_menu_doc" id="c_menu_doc_3" style="width:80px;">Văn bản đi</div></a>
                <a href="javascript: void(0)" onclick="change_style_doc(10)" id="a_menu_doc_10">
                    <div class="c_menu_doc" id="c_menu_doc_10" style="width:60px;">VB Dự thảo</div></a>
            {/if}
        </div>
        <div style="float:left; height:26px; width:100%"></div>
        <!-- Content -->
        <div id="doc_content_outsign">
        	<!-- Main -->
            <div id="doc_content_main" style="display:none">
            </div>
            <div id="doc_content_main_small_1" style="display:none">
            </div>
            <div id="doc_content_main_small_2" style="display:none">
            </div>
            <div id="doc_content_main_small_3" style="display:none">
            </div><div style="float:left; width:100%; height:1px; background-color:#FFF"></div>
            <div id="doc_content_main_small_4" style="display:none">
            </div>
            <div id="doc_content_main_small_5" style="display:none">
            </div>
            <!-------####---------->
        </div>
    </div>
</div>

<div id="list_file" onclick="javascript: change_bgcl_doc('list_file')" style="width:320px; float:left; font-weight:normal; position:absolute; display:none; margin:90px 0 0 690px; background-color:#ffffff; border:1px solid #99bbe8; z-index:1010; padding: 0px 1px 1px 1px">
	<div id="file_main_cont">
        <div id="file_tab_bar_tit">Tệp tin văn bản</div>
        <div id="file_tab_bar_icon">
            <a href="javascript: void(0);" onClick="javascript: document.getElementById('list_file').style.display='none'" style="text-decoration:none">
            <img src="{$css_path}icon_dong.png" class="img_all" title="Đóng lại"></a>
        </div>
        <div id="file_content_outsign">
        	<div id="list_file_cont">
            </div>
        </div>
    </div>
</div>

<div id="list_file_dt" onclick="javascript: change_bgcl_doc('list_file_dt')" style="width:480px; float:left; font-weight:normal; position:absolute; display:none; margin:90px 0 0 690px; background-color:#ffffff; border:1px solid #99bbe8; z-index:1010; padding: 0px 1px 1px 1px">
    <div id="file_dt_main_cont">
        <div id="file_dt_tab_bar_tit">Tệp tin văn bản dự thảo</div>
        <div id="file_dt_tab_bar_icon">
            <a href="javascript: void(0);" onClick="javascript: document.getElementById('list_file_dt').style.display='none'" style="text-decoration:none">
                <img src="{$css_path}icon_dong.png" class="img_all" title="Đóng lại"></a>
        </div>
        <div id="file_dt_content_outsign">
            <div id="list_file_dt_cont">
            </div>
        </div>
    </div>
</div>

<div id="list_file_log" onclick="javascript: change_bgcl_doc('list_file_log')" style="width:280px; float:left; font-weight:normal; position:absolute; display:none; margin:90px 0 0 690px; background-color:#ffffff; border:1px solid #99bbe8; z-index:1010; padding: 0px 1px 1px 1px">
    <div id="file_log_main_cont">
        <div id="file_log_tab_bar_tit">Nhật ký dự thảo</div>
        <div id="file_log_tab_bar_icon">
            <a href="javascript: void(0);" onClick="javascript: document.getElementById('list_file').style.display='none'" style="text-decoration:none">
                <img src="{$css_path}icon_dong.png" class="img_all" title="Đóng lại"></a>
        </div>
        <div id="file_log_content_outsign">
            <div id="list_file_log_cont">
            </div>
        </div>
    </div>
</div>

<div id="list_reply" onclick="javascript: change_bgcl_doc('list_reply')"  style="width:686px; float:left; font-weight:normal; position:absolute; display:none; margin:90px 0 0 220px; background-color:#ffffff; border:1px solid #99bbe8; z-index:1010; padding: 0px 1px 1px 1px">
	<div id="reply_main_cont">
        <div id="reply_tab_bar_tit">Ý kiến chỉ đạo</div>
        <div id="reply_tab_bar_icon">
            <a href="javascript: void(0);" onClick="javascript: document.getElementById('list_reply').style.display='none'" style="text-decoration:none">
            <img src="{$css_path}icon_dong.png" class="img_all" title="Đóng lại"></a>
        </div>
        <div id="reply_content_outsign">
        	<div id="list_reply_cont">
            </div>
        </div>
    </div>
</div>

<div id="list_phanloai" onclick="javascript: change_bgcl_doc('list_phanloai')" style="width:556px; float:left; font-weight:normal; position:absolute; display:none; margin:120px 0 0 240px; background-color:#ffffff; border:1px solid #99bbe8; z-index:1010; padding: 0px 1px 1px 1px">
	<div id="phanloai_main_cont">
        <div id="phanloai_tab_bar_tit">Tham mưu văn bản</div>
        <div id="phanloai_tab_bar_icon">
            <a href="javascript: void(0);" onClick="javascript: document.getElementById('list_phanloai').style.display='none'" style="text-decoration:none">
            	<img src="{$css_path}icon_dong.png" class="img_all" title="Đóng lại"></a>
        </div>
        <div id="phanloai_content_outsign">
        	<div id="list_phanloai_cont">
            </div>
        </div>
    </div>
</div>

<div id="div_view_doc" onclick="javascript: change_bgcl_doc('div_view_doc')" style="width:556px; float:left; font-weight:normal; position:absolute; display:none; margin:90px 0 0 237px; background-color:#ffffff; border:1px solid #99bbe8; z-index:1010; padding: 0px 1px 1px 1px">
	<div id="view_doc_main_cont">
        <div id="view_doc_tab_bar_tit">Thông tin văn bản đến</div>
        <div id="view_doc_tab_bar_icon">
            <a href="javascript: void(0);" onClick="javascript: document.getElementById('div_view_doc').style.display='none'" style="text-decoration:none">
            	<img src="{$css_path}icon_dong.png" class="img_all" title="Đóng lại"></a>
        </div>
        <div id="view_doc_content_outsign">
        	<div id="list_view_doc_cont">
            </div>
        </div>
    </div>
</div>

<div id="div_view_docout" onclick="javascript: change_bgcl_doc('div_view_docout')" style="width:556px; float:left; font-weight:normal; position:absolute; display:none; margin:90px 0 0 237px; background-color:#ffffff; border:1px solid #99bbe8; z-index:1010; padding: 0px 1px 1px 1px">
	<div id="view_docout_main_cont">
        <div id="view_docout_tab_bar_tit">Thông tin văn bản đi</div>
        <div id="view_docout_tab_bar_icon">
            <a href="javascript: void(0);" onClick="javascript: document.getElementById('div_view_docout').style.display='none'" style="text-decoration:none">
            	<img src="{$css_path}icon_dong.png" class="img_all" title="Đóng lại"></a>
        </div>
        <div id="view_docout_content_outsign">
        	<div id="list_view_docout_cont">
            </div>
        </div>
    </div>
</div>

<div id="div_huongdan" onclick="javascript: change_bgcl_doc('div_huongdan')" style="width:556px; float:left; font-weight:normal; position:absolute; display:none; margin:90px 0 0 540px; background-color:#ffffff; border:1px solid #99bbe8; z-index:1010; padding: 0px 1px 1px 1px">
	<div id="huongdan_main_cont">
        <div id="huongdan_tab_bar_tit">Bảng chú thích phím tắt</div>
        <div id="huongdan_tab_bar_icon">
            <a href="javascript: void(0);" onClick="javascript: document.getElementById('div_huongdan').style.display='none'" style="text-decoration:none">
            	<img src="{$css_path}icon_dong.png" class="img_all" title="Đóng lại"></a>
        </div>
        <div id="huongdan_content_outsign">
        	<div id="list_huongdan_cont">
            </div>
        </div>
    </div>
</div>

<div id="div_giaiquyet" onclick="javascript: change_bgcl_doc('div_giaiquyet')" style="width:500px; float:left; font-weight:normal; position:absolute; display:none; margin:120px 0 0 240px; background-color:#ffffff; border:1px solid #99bbe8; z-index:1010; padding: 0px 1px 1px 1px">
	<div id="giaiquyet_main_cont">
        <div id="giaiquyet_tab_bar_tit">Giải quyết văn bản</div>
        <div id="giaiquyet_tab_bar_icon">
            <a href="javascript: void(0);" onClick="javascript: document.getElementById('div_giaiquyet').style.display='none'" style="text-decoration:none">
            	<img src="{$css_path}icon_dong.png" class="img_all" title="Đóng lại"></a>
        </div>
        <div id="giaiquyet_content_outsign">
        	<div id="list_giaiquyet_cont">
            </div>
        </div>
    </div>
</div>

<div id="div_phoihop" onclick="javascript: change_bgcl_doc('div_phoihop')" style="width:556px; float:left; font-weight:normal; position:absolute; display:none; margin:120px 0 0 240px; background-color:#ffffff; border:1px solid #99bbe8; z-index:1010; padding: 0px 1px 1px 1px">
	<div id="phoihop_main_cont">
        <div id="phoihop_tab_bar_tit">Chỉ đạo phối hợp</div>
        <div id="phoihop_tab_bar_icon">
            <a href="javascript: void(0);" onClick="javascript: document.getElementById('div_phoihop').style.display='none'" style="text-decoration:none">
            	<img src="{$css_path}icon_dong.png" class="img_all" title="Đóng lại"></a>
        </div>
        <div id="phoihop_content_outsign">
        	<div id="list_phoihop_cont">
            </div>
        </div>
    </div>
</div>

{literal}
<script language="javascript">	
	var div_arr = ['list_file','list_file_dt','list_file_log','list_reply','list_phanloai','div_phoihop','div_view_doc','div_view_docout','div_huongdan','div_giaiquyet'];

	function change_bgcl_doc(obj){
		for(i=0;i<=div_arr.length;i++){
			if(div_arr[i] == obj){
				document.getElementById('div_doc').style.zIndex='2000';
				document.getElementById(obj).style.zIndex = '2001'; 
				document.getElementById(obj).style.borderColor='#F00';
			}else{
				document.getElementById(div_arr[i]).style.zIndex='2000';
				document.getElementById(div_arr[i]).style.borderColor='#99bbe8';
			}
		}
	}
	
	
	$("#doc_content_outsign").mouseover( function () { 
		$( "#div_doc" ).draggable({ disabled: true });
	});
	$("#doc_content_outsign").mouseout( function () { 
		$( "#div_doc" ).draggable({ disabled: false });
	});
	
	$("#doc_menu").mouseover( function () { 
		$( "#div_doc" ).draggable({ disabled: true });
	});
	$("#doc_menu").mouseout( function () { 
		$( "#div_doc" ).draggable({ disabled: false });
	});
	
	$("#file_content_outsign").mouseover( function () { 
		$( "#list_file" ).draggable({ disabled: true });
	});
	$("#file_content_outsign").mouseout( function () { 
		$( "#list_file" ).draggable({ disabled: false });
	});

    $("#file_log_content_outsign").mouseover( function () {
        $( "#list_file" ).draggable({ disabled: true });
    });
    $("#file_log_content_outsign").mouseout( function () {
        $( "#list_file" ).draggable({ disabled: false });
    });
	
	$("#reply_content_outsign").mouseover( function () { 
		$( "#list_reply" ).draggable({ disabled: true });
	});
	$("#reply_content_outsign").mouseout( function () { 
		$( "#list_reply" ).draggable({ disabled: false });
	});
	
	$("#phanloai_content_outsign").mouseover( function () { 
		$( "#list_phanloai" ).draggable({ disabled: true });
	});
	$("#phanloai_content_outsign").mouseout( function () { 
		$( "#list_phanloai" ).draggable({ disabled: false });
	});
	
	$("#phoihop_content_outsign").mouseover( function () { 
		$( "#div_phoihop" ).draggable({ disabled: true });
	});
	$("#phoihop_content_outsign").mouseout( function () { 
		$( "#div_phoihop" ).draggable({ disabled: false });
	});
	
	$("#view_doc_content_outsign").mouseover( function () { 
		$( "#div_view_doc" ).draggable({ disabled: true });
	});
	$("#view_doc_content_outsign").mouseout( function () { 
		$( "#div_view_doc" ).draggable({ disabled: false });
	});
	
	$("#view_docout_content_outsign").mouseover( function () { 
		$( "#div_view_docout" ).draggable({ disabled: true });
	});
	$("#view_docout_content_outsign").mouseout( function () { 
		$( "#div_view_docout" ).draggable({ disabled: false });
	});
	
	$("#huongdan_content_outsign").mouseover( function () { 
		$( "#div_huongdan" ).draggable({ disabled: true });
	});
	$("#huongdan_content_outsign").mouseout( function () { 
		$( "#div_huongdan" ).draggable({ disabled: false });
	});
	
	$("#a_menu_doc_1").click( function () { 
		for(i=0;i<div_arr.length;i++){
			document.getElementById(div_arr[i]).style.display='none';
		}
		
		document.getElementById('doc_content_main_small_1').style.display='none';
		document.getElementById('doc_content_main_small_2').style.display='none';
		document.getElementById('doc_content_main_small_3').style.display='none';
		document.getElementById('doc_content_main_small_4').style.display='none';
		document.getElementById('doc_content_main_small_5').style.display='none';
		$("#doc_content_main_small_1").load("index.php?nothingPage");
		$("#doc_content_main_small_2").load("index.php?nothingPage");
		$("#doc_content_main_small_3").load("index.php?nothingPage");
		$("#doc_content_main_small_4").load("index.php?nothingPage");
		$("#doc_content_main_small_5").load("index.php?nothingPage");
		
		document.getElementById('doc_content_main').style.display='block';
		
		var user_level_txt 	= document.getElementById('user_level_txt').value;
		if(user_level_txt==1 || user_level_txt==2 || user_level_txt==9)
			$("#doc_content_main").load("index.php?listDoc&mod=docs");
		else if(user_level_txt==4 || user_level_txt==5)
			$("#doc_content_main").load("index.php?replyDoc&mod=docs");
		else if(user_level_txt==3)
			$("#doc_content_main").load("index.php?tranDoc&mod=docs");
		else if(user_level_txt==6 || user_level_txt==7)
			$("#doc_content_main").load("index.php?processDoc&mod=docs");
		else if(user_level_txt==8)
			$("#doc_content_main").load("index.php?finishDoc&mod=docs");
        else if(user_level_txt==10)
            $("#doc_content_main").load("index.php?finishDocAll&mod=docs");
	});
	$("#a_menu_doc_2").click( function () { 
		for(i=0;i<div_arr.length;i++){
			document.getElementById(div_arr[i]).style.display='none';
		}
		
		document.getElementById('doc_content_main_small_1').style.display='none';
		document.getElementById('doc_content_main_small_2').style.display='none';
		document.getElementById('doc_content_main_small_3').style.display='none';
		document.getElementById('doc_content_main_small_4').style.display='none';
		document.getElementById('doc_content_main_small_5').style.display='none';
		$("#doc_content_main_small_1").load("index.php?nothingPage");
		$("#doc_content_main_small_2").load("index.php?nothingPage");
		$("#doc_content_main_small_3").load("index.php?nothingPage");
		$("#doc_content_main_small_4").load("index.php?nothingPage");
		$("#doc_content_main_small_5").load("index.php?nothingPage");
		
		document.getElementById('doc_content_main').style.display='block';
		var user_level_txt 	= document.getElementById('user_level_txt').value;
		
		if(user_level_txt==3)
			$("#doc_content_main").load("index.php?processDoc&mod=docs");
		else if(user_level_txt==4 || user_level_txt==5 || user_level_txt==6 || user_level_txt==7 || user_level_txt==8 || user_level_txt==10)
			$("#doc_content_main").load("index.php?phoihopDoc&mod=docs");
		else
			$("#doc_content_main").load("index.php?listDocOut&mod=docs");
	});
    $("#a_menu_doc_10").click( function () {
        for(i=0;i<div_arr.length;i++){
            document.getElementById(div_arr[i]).style.display='none';
        }

        document.getElementById('doc_content_main_small_1').style.display='none';
        document.getElementById('doc_content_main_small_2').style.display='none';
        document.getElementById('doc_content_main_small_3').style.display='none';
        document.getElementById('doc_content_main_small_4').style.display='none';
        document.getElementById('doc_content_main_small_5').style.display='none';
        $("#doc_content_main_small_1").load("index.php?nothingPage");
        $("#doc_content_main_small_2").load("index.php?nothingPage");
        $("#doc_content_main_small_3").load("index.php?nothingPage");
        $("#doc_content_main_small_4").load("index.php?nothingPage");
        $("#doc_content_main_small_5").load("index.php?nothingPage");

        document.getElementById('doc_content_main').style.display='block';
        var user_level_txt 	= document.getElementById('user_level_txt').value;

        $("#doc_content_main").load("index.php?listDocDT&mod=docs");

        //if(user_level_txt==3)
        //    $("#doc_content_main").load("index.php?listDocDT&mod=docs");
       // else
        //    $("#doc_content_main").load("index.php?listDocDT&mod=docs");
    });
	$("#a_menu_doc_3").click( function () {
		
		for(i=0;i<div_arr.length;i++){
			document.getElementById(div_arr[i]).style.display='none';
		}
		
		var user_level_txt 	= document.getElementById('user_level_txt').value;
		if(user_level_txt==3)
			$("#doc_content_main").load("index.php?phoihopDoc&mod=docs");
		else if(user_level_txt==4 || user_level_txt==5 || user_level_txt==6 || user_level_txt==7 || user_level_txt==8 || user_level_txt==10)
			$("#doc_content_main").load("index.php?listDocOut&mod=docs");
	});
	$("#a_menu_doc_4").click( function () { 
		for(i=0;i<div_arr.length;i++){
			document.getElementById(div_arr[i]).style.display='none';
		}
		
		document.getElementById('doc_content_main_small_1').style.display='none';
		document.getElementById('doc_content_main_small_2').style.display='none';
		document.getElementById('doc_content_main_small_3').style.display='none';
		document.getElementById('doc_content_main_small_4').style.display='none';
		document.getElementById('doc_content_main_small_5').style.display='none';
		$("#doc_content_main_small_1").load("index.php?nothingPage");
		$("#doc_content_main_small_2").load("index.php?nothingPage");
		$("#doc_content_main_small_3").load("index.php?nothingPage");
		$("#doc_content_main_small_4").load("index.php?nothingPage");
		$("#doc_content_main_small_5").load("index.php?nothingPage");
		
		document.getElementById('doc_content_main').style.display='block';
		var user_level_txt 	= document.getElementById('user_level_txt').value;
		if(user_level_txt==3)
			$("#doc_content_main").load("index.php?listDocOut&mod=docs");
		else
			$("#doc_content_main").load("index.php?listDocCat&mod=docs");
	});
	$("#a_menu_doc_5").click( function () { 
		for(i=0;i<div_arr.length;i++){
			document.getElementById(div_arr[i]).style.display='none';
		}
		
		document.getElementById('doc_content_main').style.display='none';
		document.getElementById('doc_content_main_small_3').style.display='none';
		document.getElementById('doc_content_main_small_4').style.display='none';
		document.getElementById('doc_content_main_small_5').style.display='none';
		$("#doc_content_main").load("index.php?nothingPage");
		$("#doc_content_main_small_3").load("index.php?nothingPage");
		$("#doc_content_main_small_4").load("index.php?nothingPage");
		$("#doc_content_main_small_5").load("index.php?nothingPage");
		
		document.getElementById('doc_content_main_small_1').style.display='block';
		document.getElementById('doc_content_main_small_2').style.display='block';
		$("#doc_content_main_small_1").load("index.php?listDocField&mod=docs");
		$("#doc_content_main_small_2").load("index.php?listDocLevel&mod=docs");
	});
	$("#a_menu_doc_6").click( function () { 
		for(i=0;i<div_arr.length;i++){
			document.getElementById(div_arr[i]).style.display='none';
		}
		
		document.getElementById('doc_content_main').style.display='none';
		document.getElementById('doc_content_main_small_3').style.display='none';
		document.getElementById('doc_content_main_small_4').style.display='none';
		document.getElementById('doc_content_main_small_5').style.display='none';
		$("#doc_content_main").load("index.php?nothingPage");
		$("#doc_content_main_small_3").load("index.php?nothingPage");
		$("#doc_content_main_small_4").load("index.php?nothingPage");
		$("#doc_content_main_small_5").load("index.php?nothingPage");
		
		document.getElementById('doc_content_main_small_1').style.display='block';
		document.getElementById('doc_content_main_small_2').style.display='block';
		$("#doc_content_main_small_1").load("index.php?listImportant&mod=importants");
		$("#doc_content_main_small_2").load("index.php?listSecret&mod=secrets");
	});
	$("#a_menu_doc_7").click( function () { 
		for(i=0;i<div_arr.length;i++){
			document.getElementById(div_arr[i]).style.display='none';
		}
		
		document.getElementById('doc_content_main_small_1').style.display='none';
		document.getElementById('doc_content_main_small_2').style.display='none';
		document.getElementById('doc_content_main').style.display='none';
		$("#doc_content_main_small_1").load("index.php?nothingPage");
		$("#doc_content_main_small_2").load("index.php?nothingPage");
		$("#doc_content_main").load("index.php?nothingPage");
		
		document.getElementById('doc_content_main_small_3').style.display='block';
		document.getElementById('doc_content_main_small_4').style.display='block';
		document.getElementById('doc_content_main_small_5').style.display='block';
		$("#doc_content_main_small_3").load("index.php?listSignObj&mod=signobjs");
		$("#doc_content_main_small_4").load("index.php?listSignPer&mod=signpers");
		$("#doc_content_main_small_5").load("index.php?listInterdisci&mod=interdiscis");
	});
	$("#a_menu_doc_8").click( function () { 
		for(i=0;i<div_arr.length;i++){
			document.getElementById(div_arr[i]).style.display='none';
		}
		
		document.getElementById('doc_content_main_small_1').style.display='none';
		document.getElementById('doc_content_main_small_2').style.display='none';
		document.getElementById('doc_content_main_small_3').style.display='none';
		document.getElementById('doc_content_main_small_4').style.display='none';
		document.getElementById('doc_content_main_small_5').style.display='none';
		$("#doc_content_main_small_1").load("index.php?nothingPage");
		$("#doc_content_main_small_2").load("index.php?nothingPage");
		$("#doc_content_main_small_3").load("index.php?nothingPage");
		$("#doc_content_main_small_4").load("index.php?nothingPage");
		$("#doc_content_main_small_5").load("index.php?nothingPage");
		
		document.getElementById('doc_content_main').style.display='block';
		$("#doc_content_main").load("index.php?listUnit&mod=units");
	});
	$("#a_menu_doc_9").click( function () { 
		for(i=0;i<div_arr.length;i++){
			document.getElementById(div_arr[i]).style.display='none';
		}
		
		document.getElementById('doc_content_main_small_1').style.display='none';
		document.getElementById('doc_content_main_small_2').style.display='none';
		document.getElementById('doc_content_main_small_3').style.display='none';
		document.getElementById('doc_content_main_small_4').style.display='none';
		document.getElementById('doc_content_main_small_5').style.display='none';
		$("#doc_content_main_small_1").load("index.php?nothingPage");
		$("#doc_content_main_small_2").load("index.php?nothingPage");
		$("#doc_content_main_small_3").load("index.php?nothingPage");
		$("#doc_content_main_small_4").load("index.php?nothingPage");
		$("#doc_content_main_small_5").load("index.php?nothingPage");
		
		document.getElementById('doc_content_main').style.display='block';
		$("#doc_content_main").load("index.php?listDocday&mod=daydocs");
	});
	
	function close_all_window_doc(){
		document.getElementById('div_doc').style.display='none';
		for(i=0;i<div_arr.length;i++){
			document.getElementById(div_arr[i]).style.display='none';
		}
	}
</script>
{/literal}
<!--****************************************HET VUNG DIV CHUC NANG****************************************-->
