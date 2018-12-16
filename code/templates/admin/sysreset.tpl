{literal}
<style type="text/css">
#sysreset_div{
	font-family:Arial, Helvetica, sans-serif;
	font-size:12px;
}
#sysreset_div a{
	text-decoration:none;
}
#sysreset_div a.hover{
	text-decoration:none;
	color:#F00;
}
</style>
{/literal}
<div id="sysreset_div" style="float:left; width:235px; height:380px">
    <div style="float:left; width:225px; line-height:20px; padding:2px; border:1px solid #ccd8e7">
    - <a href="javascript: void(0)" onClick="window.location='?sysreset&khoiphuc=1'">Tiến hành làm mới hệ thống phần mềm</a>
    </div>
    <div style="float:left; width:225px; height:2px"></div>
    <div style="float:left; width:225px; height:365px; padding:2px; border:1px solid #ccd8e7; overflow-y:scroll">
    	Quá trình xử lý:<br>
        <hr size="1" width="100%" color="#000000"><br>
        {if $khoiphuc eq 1}
            <b>Bước 1:</b><br>
            -&nbsp;{$msg_doc}<br><br>
            -&nbsp;{$msg_kdl}<br><br>
            -&nbsp;{$msg_tnvb}<br><br>
            {if $rs_doc eq 2}<b>Chú ý:</b>&nbsp;{$msg_doc_end_fol}<br>{/if}
            {if $rs_kdl eq 2}<b>Chú ý:</b>&nbsp;{$msg_kdl_end_fol}<br>{/if}
            {if $rs_tnvb eq 2}<b>Chú ý:</b>&nbsp;{$msg_tnvb_end_fol}<br>{/if}
            <hr size="1" width="100%" color="#000000"><br>
            <b>Bước 2:</b>&nbsp;{$msg1}<br><br>
            {if $msg2}-&nbsp;{$msg2}<br><br>{/if}
            {if $msg_constrains}-&nbsp;{$msg_constrains}<br><br>{/if}
            {if $msg_view}-&nbsp;{$msg_view}<br><br>{/if}
            {if $msg_truncate}-&nbsp;{$msg_truncate}<br><br>{/if}
            <hr size="1" width="100%" color="#000000"><br>
            <b>Kết quả:</b>&nbsp;
            {if $rs_doc eq 1 and $rs_kdl eq 1 and $rs_tnvb eq 1 and $rs_02 eq 1}
            <font style="color:#00F; font-weight:bold">Hệ thống được thiết lập lại thành công hoàn toàn và sẵn sàng phục vụ!</font>
            {elseif $rs_doc eq 1 and $rs_kdl eq 1 and $rs_tnvb eq 1 and $rs_02 eq 2}
            <font style="color:#F00; font-weight:bold"><b>Bước 1</b> thành công nhưng <b>Bước 2</b> thất bại, hệ thống không thể hoạt động được!</font>
            {elseif ($rs_doc eq 1 or $rs_kdl eq 1 or $rs_tnvb eq 1) and $rs_02 eq 1}
            <font style="color:#990; font-weight:bold"><b>Bước 1</b> thất bại nhưng <b>Bước 2</b> thành công, hệ thống hoạt động được những không thể nhận tập tin đính kèm!</font>
            {elseif $rs_doc eq 2 and $rs_kdl eq 2 and $rs_tnvb eq 2 and $rs_02 eq 2}
            <font style="color:#F00; font-weight:bold"> Quá trình thiết lập lại hệ thống thất bại hoàn toàn! Liên hệ kỹ thuật để được trợ giúp.</font>
            {/if}
        {/if}
    </div>
</div>