<script src="js/swfobjects/swfobject_modified.js" type="text/javascript"></script>
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
<div id="div_video_hdsd_content_insign">
    <fieldset style="width:502px; border:1px solid #99bbe8; margin-left:3px; margin-top:5px; height:388px">
    <legend class="legend_list_config">{$vars.hdsd_name}</legend>
    	<div style="float:left; width:100%; height:2px"></div>
    	<div style="float:left; width:498px; height:384px; padding:2px; background-color:transparent">
            <object id="FlashID" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="498" height="360">
                <param name="movie" value="{$vars.hdsd_path}" />
                <param name="quality" value="high" />
                <param name="wmode" value="opaque" />
                <param name="opacity" value="transparent" />
                <param name="swfversion" value="9.0.45.0" />
                <object type="application/x-shockwave-flash" data="{$vars.hdsd_path}" width="498" height="360">
                    <param name="quality" value="high" />
                    <param name="wmode" value="opaque" />
                    <param name="swfversion" value="9.0.45.0" />
                    <param name="expressinstall" value="{$vars.hdsd_path}" />
                </object>
            </object>
        </div>
    </fieldset>
</div>
<script type="text/javascript">
swfobject.registerObject("FlashID");
</script>
