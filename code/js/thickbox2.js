var tb_pathToImage="images/loadingAnimation.gif";
jQuery(document).ready(function(){jQuery.noConflict();tb_init("a.thickbox, area.thickbox, input.thickbox");imgLoader=new Image();imgLoader.src=tb_pathToImage;});function tb_init(a){jQuery(a).click(function(){var c=this.title||this.name||null;var b=this.href||this.alt;var d=this.rel||false;tb_show(c,b,d);this.blur();return false;});}function tb_show(j,b,h){try{if(typeof document.body.style.maxHeight==="undefined"){jQuery("body","html").css({height:"100%",width:"100%"});jQuery("html").css("overflow","hidden");if(document.getElementById("TB_HideSelect")===null){jQuery("body").append("<iframe id='TB_HideSelect'></iframe><div id='TB_overlay'></div><div id='TB_window'></div>");jQuery("#TB_overlay").click(tb_remove);}}else{if(document.getElementById("TB_overlay")===null){jQuery("body").append("<div id='TB_overlay'></div><div id='TB_window'>");jQuery("#TB_overlay").click(tb_remove);}}if(j===null){j="";}jQuery("body").append("<div id='TB_load'><img src='"+imgLoader.src+"' /></div>");jQuery("#TB_load").show();var c;if(b.indexOf("?")!==-1){c=b.substr(0,b.indexOf("?"));}else{c=b;}var f=/\.jpg|\.jpeg|\.png|\.gif|\.bmp/g;var k=c.toLowerCase().match(f);if(k==".jpg"||k==".jpeg"||k==".png"||k==".gif"||k==".bmp"){TB_PrevCaption="";TB_PrevURL="";TB_PrevHTML="";TB_NextCaption="";TB_NextURL="";TB_NextHTML="";TB_imageCount="";TB_FoundURL=false;if(h){TB_TempArray=jQuery("a[@rel="+h+"]").get();for(TB_Counter=0;((TB_Counter<TB_TempArray.length)&&(TB_NextHTML===""));TB_Counter++){var g=TB_TempArray[TB_Counter].href.toLowerCase().match(f);if(!(TB_TempArray[TB_Counter].href==b)){if(TB_FoundURL){TB_NextCaption=TB_TempArray[TB_Counter].title;TB_NextURL=TB_TempArray[TB_Counter].href;TB_NextHTML="<span id='TB_next'>&nbsp;&nbsp;<a href='#'>Next &gt;</a></span>";}else{TB_PrevCaption=TB_TempArray[TB_Counter].title;TB_PrevURL=TB_TempArray[TB_Counter].href;TB_PrevHTML="<span id='TB_prev'>&nbsp;&nbsp;<a href='#'>&lt; Prev</a></span>";}}else{TB_FoundURL=true;TB_imageCount="Image "+(TB_Counter+1)+" of "+(TB_TempArray.length);}}}imgPreloader=new Image();imgPreloader.onload=function(){imgPreloader.onload=null;var n=tb_getPageSize();var l=n[0]-150;var q=n[1]-150;var m=imgPreloader.width;var e=imgPreloader.height;if(m>l){e=e*(l/m);m=l;if(e>q){m=m*(q/e);e=q;}}else{if(e>q){m=m*(q/e);e=q;if(m>l){e=e*(l/m);m=l;}}}TB_WIDTH=m+30;TB_HEIGHT=e+60;jQuery("#TB_window").append("<a href='' id='TB_ImageOff' title='Close'><img id='TB_Image' src='"+b+"' width='"+m+"' height='"+e+"' alt='"+j+"'/></a><div id='TB_caption'>"+j+"<div id='TB_secondLine'>"+TB_imageCount+TB_PrevHTML+TB_NextHTML+"</div></div><div id='TB_closeWindow'><a href='#' id='TB_closeWindowButton' title='Close'>close</a> or Esc Key</div>");jQuery("#TB_closeWindowButton").click(tb_remove);if(!(TB_PrevHTML==="")){function p(){if(jQuery(document).unbind("click",p)){jQuery(document).unbind("click",p);}jQuery("#TB_window").remove();jQuery("body").append("<div id='TB_window'></div>");tb_show(TB_PrevCaption,TB_PrevURL,h);return false;}jQuery("#TB_prev").click(p);}if(!(TB_NextHTML==="")){function o(){jQuery("#TB_window").remove();jQuery("body").append("<div id='TB_window'></div>");tb_show(TB_NextCaption,TB_NextURL,h);return false;}jQuery("#TB_next").click(o);}document.onkeydown=function(r){if(r==null){keycode=event.keyCode;}else{keycode=r.which;}if(keycode==27){tb_remove();}else{if(keycode==190){if(!(TB_NextHTML=="")){document.onkeydown="";o();}}else{if(keycode==188){if(!(TB_PrevHTML=="")){document.onkeydown="";p();}}}}};tb_position();jQuery("#TB_load").remove();jQuery("#TB_ImageOff").click(tb_remove);jQuery("#TB_window").css({display:"block"});};imgPreloader.src=b;}else{var a=b.replace(/^[^\?]+\??/,"");var d=tb_parseQuery(a);TB_WIDTH=(d.width*1)+30||630;TB_HEIGHT=(d.height*1)+40||440;ajaxContentW=TB_WIDTH-30;ajaxContentH=TB_HEIGHT-45;if(b.indexOf("TB_iframe")!=-1){urlNoQuery=b.split("TB_");jQuery("#TB_window").append("<div id='TB_title'><div id='TB_ajaxWindowTitle'>"+j+"</div><div id='TB_closeAjaxWindow'><a href='#' id='TB_closeWindowButton' title='Close'>close</a> or Esc Key</div></div><iframe frameborder='0' hspace='0' src='"+urlNoQuery[0]+"' id='TB_iframeContent' name='TB_iframeContent' style='width:"+(ajaxContentW+29)+"px;height:"+(ajaxContentH+17)+"px;' onload='tb_showIframe()'> </iframe>");}else{if(jQuery("#TB_window").css("display")!="block"){if(d.modal!="true"){jQuery("#TB_window").append("<div id='TB_title'><div id='TB_ajaxWindowTitle'>"+j+"</div><div id='TB_closeAjaxWindow'><a href='#' id='TB_closeWindowButton'>close</a> or Esc Key</div></div><div id='TB_ajaxContent' style='width:"+ajaxContentW+"px;height:"+ajaxContentH+"px'></div>");}else{jQuery("#TB_overlay").unbind();jQuery("#TB_window").append("<div id='TB_ajaxContent' class='TB_modal' style='width:"+ajaxContentW+"px;height:"+ajaxContentH+"px;'></div>");}}else{jQuery("#TB_ajaxContent")[0].style.width=ajaxContentW+"px";jQuery("#TB_ajaxContent")[0].style.height=ajaxContentH+"px";jQuery("#TB_ajaxContent")[0].scrollTop=0;jQuery("#TB_ajaxWindowTitle").html(j);}}jQuery("#TB_closeWindowButton").click(tb_remove);if(b.indexOf("TB_inline")!=-1){jQuery("#TB_ajaxContent").html(jQuery("#"+d.inlineId).html());tb_position();jQuery("#TB_load").remove();jQuery("#TB_window").css({display:"block"});}else{if(b.indexOf("TB_iframe")!=-1){tb_position();if(frames.TB_iframeContent===undefined){jQuery("#TB_load").remove();jQuery("#TB_window").css({display:"block"});jQuery(document).keyup(function(m){var l=m.keyCode;if(l==27){tb_remove();}});}}else{jQuery("#TB_ajaxContent").load(b+="&random="+(new Date().getTime()),function(){tb_position();jQuery("#TB_load").remove();tb_init("#TB_ajaxContent a.thickbox");jQuery("#TB_window").css({display:"block"});});}}}if(!d.modal){document.onkeyup=function(l){if(l==null){keycode=event.keyCode;}else{keycode=l.which;}if(keycode==27){tb_remove();}};}}catch(i){}}function tb_showIframe(){jQuery("#TB_load").remove();jQuery("#TB_window").css({display:"block"});}function tb_remove(){jQuery("#TB_imageOff").unbind("click");jQuery("#TB_overlay").unbind("click");jQuery("#TB_closeWindowButton").unbind("click");jQuery("#TB_window").fadeOut("fast",function(){jQuery("#TB_window,#TB_overlay,#TB_HideSelect").remove();});jQuery("#TB_load").remove();if(typeof document.body.style.maxHeight=="undefined"){jQuery("body","html").css({height:"auto",width:"auto"});jQuery("html").css("overflow","");}document.onkeydown="";return false;}function tb_position(){jQuery("#TB_window").css({marginLeft:"-"+parseInt((TB_WIDTH/2),10)+"px",width:TB_WIDTH+"px"});if(!(jQuery.browser.msie&&typeof XMLHttpRequest=="function")){jQuery("#TB_window").css({marginTop:"-"+parseInt((TB_HEIGHT/2),10)+"px"});}}function tb_parseQuery(d){var e={};if(!d){return e;}var a=d.split(/[;&]/);for(var c=0;c<a.length;c++){var g=a[c].split("=");if(!g||g.length!=2){continue;}var b=unescape(g[0]);var f=unescape(g[1]);f=f.replace(/\+/g," ");e[b]=f;}return e;}function tb_getPageSize(){var c=document.documentElement;var a=window.innerWidth||self.innerWidth||(c&&c.clientWidth)||document.body.clientWidth;var b=window.innerHeight||self.innerHeight||(c&&c.clientHeight)||document.body.clientHeight;arrayPageSize=[a,b];return arrayPageSize;}
