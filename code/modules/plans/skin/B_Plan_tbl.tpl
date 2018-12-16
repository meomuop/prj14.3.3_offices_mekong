{literal}
<style type="text/css">
.error { color:#FF0000;font-weight:bold; margin-left:5px; height:20px; line-height:20px}
.plan{ color:#00F; font-weight:bold; margin-left:5px; height:20px; line-height:20px}
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
<div id="plan_content_insign">
	<form method="post" name="frmList_Plan" action="?listPlan{$vars.arg}" id="frmList_Plan">
    <!------------------------------------NOI DUNG KE HOACH---------------------------------------------->
    <div style="float:left">
    	<div style="float:left; height:4px; width:100%"></div>
        <div style="float:left; height:502px; width:635px; border:1px solid #99bbe8; margin-left:2px">
        	<iframe id="calendar" src="{$http_root}/calendar/json.php?bld={$bld}&user_ld={$user_ld}" class="alliframe" width="635px" height="502px" scrolling="no"></iframe>
        </div>
    </div>
    </form>
</div>
{literal}
<script language="javascript">	
	
	function search_me_Plan(){
		var keyword = document.getElementById('keyword').value;
		if (keyword == ""){
			return false;
		}
		
		$.post('?listPlan&mod=msgs&outbox=1',
			{keyword:keyword},
			function(data){
				$('#plan_content_main').html(data);
				$("#plan_content_main").show();
			}
		);
	}
	
	function delete_plan(delStr,bld,user_ld){
		if(!confirm("THÔNG BÁO: \n\tBẠN CÓ CHẮC CHẮN MUỐN XÓA?")){
			return false;
		}	
				
		var dataString = "dlStr=" + delStr +"";
			//alert (dataString);
		$.ajax({
			type: "POST",
			url: 'index.php?mainPlan&mod=plans',
			data: dataString,
			success: function(data) {
				$('#plan_content_main').load('index.php?mainPlan&mod=plans&bld='+bld+'&user_ld='+user_ld).fadeIn("fast");
				$('#show_plan').hide();
			}
		});
	}
		
	function reloadPage_Plan(processurl){
		var numresult_Plan,order_Plan,cur_pos;
		numresult = $("#numresult_Plan").val();
		order = $("#order_Plan").val();
		cur_pos = 0;
		$("#plan_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&cur_pos="+cur_pos);
	}
	
	function gotoPage_Plan(processurl,page){
		var numresult_Plan,order_Plan,cur_pos;
		numresult = $("#numresult_Plan").val();
		order = $("#order_Plan").val();
		//alert(processurl+'-'+page+'-'+numresult+'-'+order);
		$("#plan_content_main").load(processurl+"&numresult="+numresult+"&order="+order+"&curpage="+page);
	}
				
	$("#a_ref_Plan").click( function () { 
			$('#plan_content_main').hide();
			$('#plan_content_main').fadeOut('fast').load('?listPlan&mod=msgs&outbox=1').fadeIn("fast");
	});
	
</script>
{/literal}