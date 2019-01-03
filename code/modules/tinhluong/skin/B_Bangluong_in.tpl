{literal}
<style type="text/css">
.error { color:#FF0000;font-weight:bold; margin-left:5px; height:20px; line-height:20px}
.msg{ color:#00F; font-weight:bold; margin-left:5px; height:20px; line-height:20px}
.tbl_tit_inluong{
float:left; line-height:25px; border-right:1px solid #99bbe8; font-size: 13px;
}
.tbl_cont_inluong{
float:left; line-height:50px; border-right:1px solid #99bbe8; border-bottom:1px solid #99bbe8;
	background:#F2FFEC; font-size: 13px
}
.tbl_cont2_inluong{
float:left; line-height:50px; border-right:1px solid #99bbe8; border-bottom:1px solid #99bbe8;
	background:#FFF; font-size: 13px
}
</style>
{/literal}
<div id="tinhluong_content_insign">
	<div style="float:left; margin-top: 20px;">
		<div style="float:left; height:303px; width:899px; text-align: center; height:40px; font-size: 18px; font-weight: bold">
			BẢNG LƯƠNG THÁNG {$smarty.now|date_format:"%m NĂM %Y"}
			<input type="hidden" name="thangluong" id="thangluong" value="{$thangluong}">
		</div>
		<div style="float:left; height:50px; width:899px; border-top:1px solid #99bbe8; border-bottom:1px solid #99bbe8 ">
			<div class="tbl_tit_inluong" style="width:30px; text-align:center;"><b>STT<br>&nbsp;</b></div>
			<div class="tbl_tit_inluong" style="width:154px; text-align: center"><B>&nbsp;Họ tên nhân viên<br>&nbsp;</B></div>
			<div class="tbl_tit_inluong" style="width:75px; text-align: center"><B>&nbsp;Mã nhân viên<br>&nbsp;</B></div>
			<div class="tbl_tit_inluong" style="width:100px; text-align: center"><B>&nbsp;Lương tháng&nbsp;<br>&nbsp;</B></div>
			<div class="tbl_tit_inluong" style="width:65px; text-align: center"><B>&nbsp;Số ngày&nbsp;<br>tính</B></div>
			<div class="tbl_tit_inluong" style="width:65px; text-align: center"><B>&nbsp;Số ngày&nbsp;<br> công</B></div>
			<div class="tbl_tit_inluong" style="width:100px; text-align: center"><B>&nbsp;Lương tháng&nbsp;<br>&nbsp;</B></div>
			<div class="tbl_tit_inluong" style="width:100px; text-align: center"><B>&nbsp;Phụ cấp&nbsp;<br>&nbsp;</B></div>
			<div class="tbl_tit_inluong" style="width:100px; text-align: center"><B>&nbsp;Tổng số&nbsp;<br>được nhận</B></div>
			<div class="tbl_tit_inluong" style="width:100px; text-align: center"><B>&nbsp;Chữ kỹ&nbsp;<br>&nbsp;</B></div>
		</div>
		<div style="float:left; width:899px">
			{section name=pi loop=$obj_list}
				{if $smarty.section.pi.index is not div by 2}
					{assign var="class_td" value="tbl_cont_inluong"}
				{else}
					{assign var="class_td" value="tbl_cont2_inluong"}
				{/if}
				{math z=$smarty.section.pi.index t=1 equation="z+t" assign=stt}
				<div class="{$class_td}" style="width:30px; text-align:center;">{$stt}</div>
				<div class="{$class_td}" style="width:154px; white-space:nowrap; ">&nbsp;{$obj_list[pi]->user_fullname}</div>
				<div class="{$class_td}" style="width:75px; white-space:nowrap; ">&nbsp;{$obj_list[pi]->user_name}</div>
				<div class="{$class_td}" style="width:100px; text-align: right">{$obj_list[pi]->cc_luong|price_format}&nbsp;</div>
				<div class="{$class_td}" style="width:65px; text-align: center">{$obj_list[pi]->cc_songaycong}&nbsp;</div>
				<div class="{$class_td}" style="width:65px; text-align: center">{$obj_list[pi]->cc_songaydilam}&nbsp;</div>
				<div class="{$class_td}" style="width:100px;; text-align: right">{$obj_list[pi]->cc_luongthang|price_format}&nbsp;</div>
				<div class="{$class_td}" style="width:100px; text-align: right">{$obj_list[pi]->cc_phucap|price_format}&nbsp;</div>
				{math a=$obj_list[pi]->cc_phucap b=$obj_list[pi]->cc_luongthang equation="a+b" assign=tongthunhap}
				<div class="{$class_td}" style="width:100px; text-align: right">{$tongthunhap|price_format}&nbsp;</div>
				<div class="{$class_td}" style="width:100px; text-align: right">&nbsp;</div>
			{/section}
		</div>
		<div style="float:left; height:303px; width:899px; text-align: center; height:80px; font-size: 13px; font-weight: bold">
			<div style="float:left; width: 50%; text-align: center; line-height: 25px">KẾ TOÁN TRƯỞNG<br>(Ký tên)</div>
			<div style="float:left; width: 50%; text-align: center; line-height: 25px">GIÁM ĐỐC<br>(Ký tên)</div>
		</div>
	</div>
</div>