<?php /* Smarty version 2.6.2, created on 2018-12-16 10:16:30
         compiled from div_thuoctinh.tpl */ ?>
﻿<?php echo '
<style>
#div_thuoctinh{ width: 945px; height: 550px; padding: 0px 1px 1px 1px; border:1px solid #8ea4c1; background-color:#ffffff;
	position:absolute; margin:40px 200px; z-index:100; font-size:12px
	/*display: none; position: absolute; background-color: white2; overflow: auto;	*/
}

/*----------------------div_thuoctinh div---------------------*/
#thuoctinh_main_cont{ float:left; width:100%; height:550px; background-color:#ccd8e7}
#thuoctinh_tab_bar_tit{ float:left; font-weight:bold; text-transform:uppercase; line-height:20px; padding-left:8px; width:80%;cursor:move; color:#15428b;}
#thuoctinh_tab_bar_icon{ float:right; width:10%; text-align:right; padding-top:2px; padding-right:6px}
#thuoctinh_content_outsign{ float:left; width:98.2%; height:495px; background-color:#ffffff; margin-left:8px; border:1px solid #99bbe8}
#thuoctinh_content_insign{ float:left; width:99.8%; height:473px; background-color:#dfe8f6; margin-left:1px;}
#thuoctinh_content_main{ float:left; width:99.8%; height:494px; background-color:#dfe8f6; margin-left:1px;}
#thuoctinh_content_main_small_1{ float:left; width:49.8%; height:495px; background-color:#dfe8f6; margin-left:1px;}
#thuoctinh_content_main_small_2{ float:left; width:49.8%; height:495px; background-color:#dfe8f6; margin-left:1px;}
#thuoctinh_content_main_small_3{ float:left; width:99.7%; height:194px; background-color:#dfe8f6; margin-left:1px;}
#thuoctinh_content_main_small_4{ float:left; width:49.8%; height:300px; background-color:#dfe8f6; margin-left:1px;}
#thuoctinh_content_main_small_5{ float:left; width:49.8%; height:300px; background-color:#dfe8f6; margin-left:1px;}

#list_thuoctinh_cont{ float:left; width:99.8%; height:520px; background-color:#dfe8f6; margin-left:1px;}
#thuoctinh_clear_txt{ float:left; width:100%; height:1px}
#thuoctinh_tool_bar{ float:left; width:99.8%; height:20px; background-color:#dfe8f6; margin-left:1px}
#thuoctinh_search_area{ float:left; width:120px; height:20px; padding-left:2px}
#thuoctinh_page_area{ float:left; width:40px; height:20px; padding-left:2px}
#thuoctinh_menu{ float:left; width:99.8%; height:25px; padding-left:8px; position:absolute; margin-top:21px}
/*----------------------end div_thuoctinh div---------------------*/

.c_menu_thuoctinh{float:left; border-right:1px solid #99bbe8; line-height:21px; height:21px; padding-left:2px; border-top:1px solid #99bbe8; margin-top:4px}
.legend{margin-left:20px; border:1px solid #99bbe8; width:100px; font-weight:bold; padding-left:2px; line-height:20px; background-color:#ccd8e7}

.img_all{opacity:0.7}
.img_all:hover{opacity:1}
</style>
<script>
$(function() {
	$( "#div_thuoctinh" ).draggable();
});
function min_size_thuoctinh(){
	if(document.getElementById(\'div_thuoctinh\').style.height==\'550px\'){
		document.getElementById(\'div_thuoctinh\').style.height=\'20px\';
		document.getElementById(\'thuoctinh_main_cont\').style.height=\'20px\';
		document.getElementById(\'thuoctinh_content_outsign\').style.display=\'none\';
		document.getElementById(\'thuoctinh_content_insign\').style.display=\'none\';
		document.getElementById(\'thuoctinh_tool_bar\').style.display=\'none\';
		document.getElementById(\'thuoctinh_menu\').style.display=\'none\';
	}else{
		document.getElementById(\'div_thuoctinh\').style.height=\'550px\';
		document.getElementById(\'thuoctinh_main_cont\').style.height=\'550px\';
		document.getElementById(\'thuoctinh_content_outsign\').style.display=\'\';
		document.getElementById(\'thuoctinh_content_insign\').style.display=\'\';
		document.getElementById(\'thuoctinh_tool_bar\').style.display=\'\';
		document.getElementById(\'thuoctinh_menu\').style.display=\'\';
	}
}
function reset_pos_thuoctinh(){
	document.getElementById(\'div_thuoctinh\').style.margin=\'40px 200px\';
}
function max_size_thuoctinh(){
	if(document.getElementById(\'div_thuoctinh\').style.width==\'70%\'){
		document.getElementById(\'div_thuoctinh\').style.margin=\'0\';
		document.getElementById(\'div_thuoctinh\').style.width=\'98%\';
		document.getElementById(\'div_thuoctinh\').style.height=\'600px\';
		document.getElementById(\'thuoctinh_main_cont\').style.height=\'600px\';
		document.getElementById(\'thuoctinh_content_outsign\').style.height=\'545px\';
		document.getElementById(\'thuoctinh_content_insign\').style.height=\'523px\';
	}else{
		document.getElementById(\'div_thuoctinh\').style.margin=\'10px 200px\';
		document.getElementById(\'div_thuoctinh\').style.width=\'70%\';
		document.getElementById(\'div_thuoctinh\').style.height=\'550px\';
		document.getElementById(\'thuoctinh_main_cont\').style.height=\'550px\';
		document.getElementById(\'thuoctinh_content_outsign\').style.height=\'495px\';
		document.getElementById(\'thuoctinh_content_insign\').style.height=\'473px\';
	}
}

function change_style_thuoctinh(obj){

	for(i=1;i<=11;i++){
		if(i==parseInt(obj)){
            if(document.getElementById(\'c_menu_thuoctinh_\'+i) === null) {
                continue;
            }else {
                document.getElementById(\'c_menu_thuoctinh_\' + i).style.borderLeft = \'1px solid #99bbe8\';
                document.getElementById(\'c_menu_thuoctinh_\' + i).style.borderRight = \'1px solid #99bbe8\';
                document.getElementById(\'c_menu_thuoctinh_\' + i).style.borderBottom = \'1px solid #dfe8f6\';
                document.getElementById(\'c_menu_thuoctinh_\' + i).style.backgroundColor = \'#dfe8f6\';
                document.getElementById(\'c_menu_thuoctinh_\' + i).style.height = \'25px\';
                document.getElementById(\'c_menu_thuoctinh_\' + i).style.marginTop = \'0px\';
                //if(parseInt(obj)==10){
                  //  document.getElementById(\'c_menu_thuoctinh_3\').style.borderRight = \'none\';
                //}
            }
		}
		else{
            if(document.getElementById(\'c_menu_thuoctinh_\'+i) === null) {
                continue;
            }else {
                if (i != 1) {
                    document.getElementById(\'c_menu_thuoctinh_\' + i).style.borderLeft = \'none\';
                }
                if (i == parseInt(obj) - 1) {
                    document.getElementById(\'c_menu_thuoctinh_\' + i).style.borderRight = \'none\';
                } else {
                    document.getElementById(\'c_menu_thuoctinh_\' + i).style.borderRight = \'1px solid #99bbe8\';
                }
                document.getElementById(\'c_menu_thuoctinh_\' + i).style.borderBottom = \'none\';
                document.getElementById(\'c_menu_thuoctinh_\' + i).style.backgroundColor = \'#ccd8e7\';
                document.getElementById(\'c_menu_thuoctinh_\' + i).style.height = \'20px\';
                document.getElementById(\'c_menu_thuoctinh_\' + i).style.marginTop = \'4px\';
            }
		}
	}
}
</script>
'; ?>

<!--*******************************************VUNG DIV CHUC NANG*****************************************-->
<div id="div_thuoctinh" class="ui-widget-content" style="display:none" onclick="javascript: change_Zindex('div_thuoctinh');">
    <div id="thuoctinh_main_cont">
        <!-- Tab bar -->
        <div id="thuoctinh_tab_bar_tit">Quản lý thuộc tính</div>
        <div id="thuoctinh_tab_bar_icon">
            <a href="javascript: void(0);" onClick="min_size_thuoctinh();" style="text-decoration:none">
            <img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_thu_gon.png" class="img_all" title="Ẩn/hiện"></a>
            <a href="javascript: void(0);" onClick="max_size_thuoctinh();" style="text-decoration:none">
            <img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_mo_rong.png" class="img_all" title="Mở rộng/thu nhỏ"></a>
            <a href="javascript: void(0);"  onClick="javascript: document.getElementById('div_thuoctinh').style.display='none'; change_style_user(1)" style="text-decoration:none">
            <img src="<?php echo $this->_tpl_vars['css_path']; ?>
icon_dong.png" class="img_all" title="Đóng lại"></a>
        </div>
        <!-- Menu -->
        <div id="thuoctinh_menu">
            <div style="width:10px; float:left">&nbsp;</div>
            <a href="javascript: void(0)" onclick="change_style_thuoctinh(1)" id="a_menu_thuoctinh_1"><div class="c_menu_thuoctinh" id="c_menu_thuoctinh_1" style="width:70px; border-left:1px solid #99bbe8; border-bottom:1px solid #dfe8f6; background-color:#dfe8f6; height:25px; margin-top:0px">Chủng loại</div></a>
            <a href="javascript: void(0)" onclick="change_style_thuoctinh(2)" id="a_menu_thuoctinh_2"><div class="c_menu_thuoctinh" id="c_menu_thuoctinh_2" style="width:110px;">Lĩnh vực - Khu vực</div></a>
            <a href="javascript: void(0)" onclick="change_style_thuoctinh(3)" id="a_menu_thuoctinh_3"><div class="c_menu_thuoctinh" id="c_menu_thuoctinh_3" style="width:110px;">Độ khẩn - Độ mật</div></a>
            <a href="javascript: void(0)" onclick="change_style_thuoctinh(4)" id="a_menu_thuoctinh_4"><div class="c_menu_thuoctinh" id="c_menu_thuoctinh_4" style="width:240px;">Chức vụ - Người ký - Người ký liên ngành</div></a>
            <a href="javascript: void(0)" onclick="change_style_thuoctinh(5)" id="a_menu_thuoctinh_5"><div class="c_menu_thuoctinh" id="c_menu_thuoctinh_5" style="width:80px;">Nơi gửi/nhận</div></a>
            <a href="javascript: void(0)" onclick="change_style_thuoctinh(6)" id="a_menu_thuoctinh_6"><div class="c_menu_thuoctinh" id="c_menu_thuoctinh_6" style="width:65px;">Hạn xử lý</div></a>
        </div>
        <div style="float:left; height:26px; width:100%"></div>
        <!-- Content -->
        <div id="thuoctinh_content_outsign">
        	<!-- Main -->
            <div id="thuoctinh_content_main"></div>
            <div id="thuoctinh_content_main_small_1" style="display:none"></div>
            <div id="thuoctinh_content_main_small_2" style="display:none"></div>
            <div id="thuoctinh_content_main_small_3" style="display:none"></div>
            <div style="float:left; width:100%; height:1px; background-color:#FFF"></div>
            <div id="thuoctinh_content_main_small_4" style="display:none"></div>
            <div id="thuoctinh_content_main_small_5" style="display:none"></div>
            <!-------####---------->
        </div>
    </div>
</div>

<?php echo '
    <script language="javascript">
        $("#thuoctinh_content_outsign").mouseover( function () {
            $( "#div_thuoctinh" ).draggable({ disabled: true });
        });

        $("#thuoctinh_content_outsign").mouseout( function () {
            $( "#div_thuoctinh" ).draggable({ disabled: false });
        });

        $("#a_menu_thuoctinh_1").click( function () {
            document.getElementById(\'thuoctinh_content_main_small_1\').style.display=\'none\';
            document.getElementById(\'thuoctinh_content_main_small_2\').style.display=\'none\';
            document.getElementById(\'thuoctinh_content_main_small_3\').style.display=\'none\';
            document.getElementById(\'thuoctinh_content_main_small_4\').style.display=\'none\';
            document.getElementById(\'thuoctinh_content_main_small_5\').style.display=\'none\';
            $("#thuoctinh_content_main_small_1").load("index.php?nothingPage");
            $("#thuoctinh_content_main_small_2").load("index.php?nothingPage");
            $("#thuoctinh_content_main_small_3").load("index.php?nothingPage");
            $("#thuoctinh_content_main_small_4").load("index.php?nothingPage");
            $("#thuoctinh_content_main_small_5").load("index.php?nothingPage");

            document.getElementById(\'thuoctinh_content_main\').style.display=\'block\';
            $("#thuoctinh_content_main").load("index.php?listDocCat&mod=docs");

        });
        $("#a_menu_thuoctinh_2").click( function () {
            document.getElementById(\'thuoctinh_content_main\').style.display=\'none\';
            document.getElementById(\'thuoctinh_content_main_small_3\').style.display=\'none\';
            document.getElementById(\'thuoctinh_content_main_small_4\').style.display=\'none\';
            document.getElementById(\'thuoctinh_content_main_small_5\').style.display=\'none\';
            $("#thuoctinh_content_main").load("index.php?nothingPage");
            $("#thuoctinh_content_main_small_3").load("index.php?nothingPage");
            $("#thuoctinh_content_main_small_4").load("index.php?nothingPage");
            $("#thuoctinh_content_main_small_5").load("index.php?nothingPage");

            document.getElementById(\'thuoctinh_content_main_small_1\').style.display=\'block\';
            document.getElementById(\'thuoctinh_content_main_small_2\').style.display=\'block\';
            $("#thuoctinh_content_main_small_1").load("index.php?listDocField&mod=docs");
            $("#thuoctinh_content_main_small_2").load("index.php?listDocLevel&mod=docs");
        });
        $("#a_menu_thuoctinh_3").click( function () {
            document.getElementById(\'thuoctinh_content_main\').style.display=\'none\';
            document.getElementById(\'thuoctinh_content_main_small_3\').style.display=\'none\';
            document.getElementById(\'thuoctinh_content_main_small_4\').style.display=\'none\';
            document.getElementById(\'thuoctinh_content_main_small_5\').style.display=\'none\';
            $("#thuoctinh_content_main").load("index.php?nothingPage");
            $("#thuoctinh_content_main_small_3").load("index.php?nothingPage");
            $("#thuoctinh_content_main_small_4").load("index.php?nothingPage");
            $("#thuoctinh_content_main_small_5").load("index.php?nothingPage");

            document.getElementById(\'thuoctinh_content_main_small_1\').style.display=\'block\';
            document.getElementById(\'thuoctinh_content_main_small_2\').style.display=\'block\';
            $("#thuoctinh_content_main_small_1").load("index.php?listImportant&mod=importants");
            $("#thuoctinh_content_main_small_2").load("index.php?listSecret&mod=secrets");
        });
        $("#a_menu_thuoctinh_4").click( function () {
            document.getElementById(\'thuoctinh_content_main_small_1\').style.display=\'none\';
            document.getElementById(\'thuoctinh_content_main_small_2\').style.display=\'none\';
            document.getElementById(\'thuoctinh_content_main\').style.display=\'none\';
            $("#thuoctinh_content_main_small_1").load("index.php?nothingPage");
            $("#thuoctinh_content_main_small_2").load("index.php?nothingPage");
            $("#thuoctinh_content_main").load("index.php?nothingPage");

            document.getElementById(\'thuoctinh_content_main_small_3\').style.display=\'block\';
            document.getElementById(\'thuoctinh_content_main_small_4\').style.display=\'block\';
            document.getElementById(\'thuoctinh_content_main_small_5\').style.display=\'block\';
            $("#thuoctinh_content_main_small_3").load("index.php?listSignObj&mod=signobjs");
            $("#thuoctinh_content_main_small_4").load("index.php?listSignPer&mod=signpers");
            $("#thuoctinh_content_main_small_5").load("index.php?listInterdisci&mod=interdiscis");
        });
        $("#a_menu_thuoctinh_5").click( function () {
            document.getElementById(\'thuoctinh_content_main_small_1\').style.display=\'none\';
            document.getElementById(\'thuoctinh_content_main_small_2\').style.display=\'none\';
            document.getElementById(\'thuoctinh_content_main_small_3\').style.display=\'none\';
            document.getElementById(\'thuoctinh_content_main_small_4\').style.display=\'none\';
            document.getElementById(\'thuoctinh_content_main_small_5\').style.display=\'none\';
            $("#thuoctinh_content_main_small_1").load("index.php?nothingPage");
            $("#thuoctinh_content_main_small_2").load("index.php?nothingPage");
            $("#thuoctinh_content_main_small_3").load("index.php?nothingPage");
            $("#thuoctinh_content_main_small_4").load("index.php?nothingPage");
            $("#thuoctinh_content_main_small_5").load("index.php?nothingPage");

            document.getElementById(\'thuoctinh_content_main\').style.display=\'block\';
            $("#thuoctinh_content_main").load("index.php?listUnit&mod=units");
        });
        $("#a_menu_thuoctinh_6").click( function () {
            document.getElementById(\'thuoctinh_content_main_small_1\').style.display=\'none\';
            document.getElementById(\'thuoctinh_content_main_small_2\').style.display=\'none\';
            document.getElementById(\'thuoctinh_content_main_small_3\').style.display=\'none\';
            document.getElementById(\'thuoctinh_content_main_small_4\').style.display=\'none\';
            document.getElementById(\'thuoctinh_content_main_small_5\').style.display=\'none\';
            $("#thuoctinh_content_main_small_1").load("index.php?nothingPage");
            $("#thuoctinh_content_main_small_2").load("index.php?nothingPage");
            $("#thuoctinh_content_main_small_3").load("index.php?nothingPage");
            $("#thuoctinh_content_main_small_4").load("index.php?nothingPage");
            $("#thuoctinh_content_main_small_5").load("index.php?nothingPage");

            document.getElementById(\'thuoctinh_content_main\').style.display=\'block\';
            $("#thuoctinh_content_main").load("index.php?listDocday&mod=daydocs");
        });
    </script>
'; ?>

<!--****************************************HET VUNG DIV CHUC NANG****************************************-->
