{literal}
<style>
#div_tthd{ width: 945px; height: 550px; padding: 0px 1px 1px 1px; border:1px solid #8ea4c1; background-color:#ffffff;
	position:absolute; margin:40px 200px; z-index:100; font-size:12px
	/*display: none; position: absolute; background-color: white2; overflow: auto;	*/
}

/*----------------------div_tthd div---------------------*/
#tthd_main_cont{ float:left; width:100%; height:550px; background-color:#ccd8e7}
#tthd_tab_bar_tit{ float:left; font-weight:bold; text-transform:uppercase; line-height:20px; padding-left:8px; width:80%;cursor:move; color:#15428b;}
#tthd_tab_bar_icon{ float:right; width:10%; text-align:right; padding-top:2px; padding-right:6px}
#tthd_content_outsign{ float:left; width:98.2%; height:495px; background-color:#ffffff; margin-left:8px; border:1px solid #99bbe8}
#tthd_content_insign{ float:left; width:99.8%; height:473px; background-color:#dfe8f6; margin-left:1px;}
#tthd_content_main{ float:left; width:99.8%; height:494px; background-color:#dfe8f6; margin-left:1px;}
#tthd_content_main_small_1{ float:left; width:49.8%; height:495px; background-color:#dfe8f6; margin-left:1px;}
#tthd_content_main_small_2{ float:left; width:49.8%; height:495px; background-color:#dfe8f6; margin-left:1px;}
#tthd_content_main_small_3{ float:left; width:99.7%; height:194px; background-color:#dfe8f6; margin-left:1px;}
#tthd_content_main_small_4{ float:left; width:49.8%; height:300px; background-color:#dfe8f6; margin-left:1px;}
#tthd_content_main_small_5{ float:left; width:49.8%; height:300px; background-color:#dfe8f6; margin-left:1px;}

#list_tthd_cont{ float:left; width:99.8%; height:520px; background-color:#dfe8f6; margin-left:1px;}
#tthd_clear_txt{ float:left; width:100%; height:1px}
#tthd_tool_bar{ float:left; width:99.8%; height:20px; background-color:#dfe8f6; margin-left:1px}
#tthd_search_area{ float:left; width:120px; height:20px; padding-left:2px}
#tthd_page_area{ float:left; width:40px; height:20px; padding-left:2px}
#tthd_menu{ float:left; width:99.8%; height:25px; padding-left:8px; position:absolute; margin-top:21px}
/*----------------------end div_tthd div---------------------*/

.c_menu_tthd{float:left; border-right:1px solid #99bbe8; line-height:21px; height:21px; padding-left:2px; border-top:1px solid #99bbe8; margin-top:4px}
.legend{margin-left:20px; border:1px solid #99bbe8; width:100px; font-weight:bold; padding-left:2px; line-height:20px; background-color:#ccd8e7}

.img_all{opacity:0.7}
.img_all:hover{opacity:1}
</style>
<script>
$(function() {
	$( "#div_tthd" ).draggable();
});
function min_size_tthd(){
	if(document.getElementById('div_tthd').style.height=='550px'){
		document.getElementById('div_tthd').style.height='20px';
		document.getElementById('tthd_main_cont').style.height='20px';
		document.getElementById('tthd_content_outsign').style.display='none';
		document.getElementById('tthd_content_insign').style.display='none';
		document.getElementById('tthd_tool_bar').style.display='none';
		document.getElementById('tthd_menu').style.display='none';
	}else{
		document.getElementById('div_tthd').style.height='550px';
		document.getElementById('tthd_main_cont').style.height='550px';
		document.getElementById('tthd_content_outsign').style.display='';
		document.getElementById('tthd_content_insign').style.display='';
		document.getElementById('tthd_tool_bar').style.display='';
		document.getElementById('tthd_menu').style.display='';
	}
}
function reset_pos_tthd(){
	document.getElementById('div_tthd').style.margin='40px 200px';
}
function max_size_tthd(){
	if(document.getElementById('div_tthd').style.width=='70%'){
		document.getElementById('div_tthd').style.margin='0';
		document.getElementById('div_tthd').style.width='98%';
		document.getElementById('div_tthd').style.height='600px';
		document.getElementById('tthd_main_cont').style.height='600px';
		document.getElementById('tthd_content_outsign').style.height='545px';
		document.getElementById('tthd_content_insign').style.height='523px';
	}else{
		document.getElementById('div_tthd').style.margin='10px 200px';
		document.getElementById('div_tthd').style.width='70%';
		document.getElementById('div_tthd').style.height='550px';
		document.getElementById('tthd_main_cont').style.height='550px';
		document.getElementById('tthd_content_outsign').style.height='495px';
		document.getElementById('tthd_content_insign').style.height='473px';
	}
}

function change_style_tthd(obj){

	for(i=1;i<=11;i++){
		if(i==parseInt(obj)){
            if(document.getElementById('c_menu_tthd_'+i) === null) {
                continue;
            }else {
                document.getElementById('c_menu_tthd_' + i).style.borderLeft = '1px solid #99bbe8';
                document.getElementById('c_menu_tthd_' + i).style.borderRight = '1px solid #99bbe8';
                document.getElementById('c_menu_tthd_' + i).style.borderBottom = '1px solid #dfe8f6';
                document.getElementById('c_menu_tthd_' + i).style.backgroundColor = '#dfe8f6';
                document.getElementById('c_menu_tthd_' + i).style.height = '25px';
                document.getElementById('c_menu_tthd_' + i).style.marginTop = '0px';
                //if(parseInt(obj)==10){
                  //  document.getElementById('c_menu_tthd_3').style.borderRight = 'none';
                //}
            }
		}
		else{
            if(document.getElementById('c_menu_tthd_'+i) === null) {
                continue;
            }else {
                if (i != 1) {
                    document.getElementById('c_menu_tthd_' + i).style.borderLeft = 'none';
                }
                if (i == parseInt(obj) - 1) {
                    document.getElementById('c_menu_tthd_' + i).style.borderRight = 'none';
                } else {
                    document.getElementById('c_menu_tthd_' + i).style.borderRight = '1px solid #99bbe8';
                }
                document.getElementById('c_menu_tthd_' + i).style.borderBottom = 'none';
                document.getElementById('c_menu_tthd_' + i).style.backgroundColor = '#ccd8e7';
                document.getElementById('c_menu_tthd_' + i).style.height = '20px';
                document.getElementById('c_menu_tthd_' + i).style.marginTop = '4px';
            }
		}
	}
}
</script>
{/literal}
<!--*******************************************VUNG DIV CHUC NANG*****************************************-->
<div id="div_tthd" class="ui-widget-content" style="display:none" onclick="javascript: change_Zindex('div_tthd');">
    <div id="tthd_main_cont">
        <!-- Tab bar -->
        <div id="tthd_tab_bar_tit">Quản lý thuộc tính</div>
        <div id="tthd_tab_bar_icon">
            <a href="javascript: void(0);" onClick="min_size_tthd();" style="text-decoration:none">
            <img src="{$css_path}icon_thu_gon.png" class="img_all" title="Ẩn/hiện"></a>
            <a href="javascript: void(0);" onClick="max_size_tthd();" style="text-decoration:none">
            <img src="{$css_path}icon_mo_rong.png" class="img_all" title="Mở rộng/thu nhỏ"></a>
            <a href="javascript: void(0);"  onClick="javascript: document.getElementById('div_tthd').style.display='none'; change_style_user(1)" style="text-decoration:none">
            <img src="{$css_path}icon_dong.png" class="img_all" title="Đóng lại"></a>
        </div>
        <!-- Menu -->
        <div id="tthd_menu">
            <div style="width:10px; float:left">&nbsp;</div>
            <a href="javascript: void(0)" onclick="change_style_tthd(1)" id="a_menu_tthd_1"><div class="c_menu_tthd" id="c_menu_tthd_1" style="width:70px; border-left:1px solid #99bbe8; border-bottom:1px solid #dfe8f6; background-color:#dfe8f6; height:25px; margin-top:0px">Danh mục</div></a>
            <a href="javascript: void(0)" onclick="change_style_tthd(2)" id="a_menu_tthd_2"><div class="c_menu_tthd" id="c_menu_tthd_2" style="width:70px;">Hàng hóa</div></a>
            <a href="javascript: void(0)" onclick="change_style_tthd(3)" id="a_menu_tthd_3"><div class="c_menu_tthd" id="c_menu_tthd_3" style="width:90px;">Đơn vị tiền tệ</div></a>
            <a href="javascript: void(0)" onclick="change_style_tthd(4)" id="a_menu_tthd_4"><div class="c_menu_tthd" id="c_menu_tthd_4" style="width:90px;">Đơn vị tính</div></a>
        </div>
        <div style="float:left; height:26px; width:100%"></div>
        <!-- Content -->
        <div id="tthd_content_outsign">
        	<!-- Main -->
            <div id="tthd_content_main"></div>
            <!-------####---------->
        </div>
    </div>
</div>

{literal}
    <script language="javascript">
        $("#tthd_content_outsign").mouseover( function () {
            $( "#div_tthd" ).draggable({ disabled: true });
        });

        $("#tthd_content_outsign").mouseout( function () {
            $( "#div_tthd" ).draggable({ disabled: false });
        });

        $("#a_menu_tthd_1").click( function () {
            document.getElementById('tthd_content_main').style.display='block';
            $("#tthd_content_main").load("index.php?listDanhmuc&mod=tthopdong");

        });
        $("#a_menu_tthd_2").click( function () {
            $("#tthd_content_main").load("index.php?nothingPage");
            document.getElementById('tthd_content_main').style.display='block';
            $("#tthd_content_main").load("index.php?listHanghoa&mod=tthopdong");
        });
        $("#a_menu_tthd_3").click( function () {
            $("#tthd_content_main").load("index.php?nothingPage");
            document.getElementById('tthd_content_main').style.display='block';
            $("#tthd_content_main").load("index.php?listDvtiente&mod=tthopdong");
        });
        $("#a_menu_tthd_4").click( function () {
            $("#tthd_content_main").load("index.php?nothingPage");
            document.getElementById('tthd_content_main').style.display='block';
            $("#tthd_content_main").load("index.php?listDvtinh&mod=tthopdong");
        });
    </script>
{/literal}
<!--****************************************HET VUNG DIV CHUC NANG****************************************-->
