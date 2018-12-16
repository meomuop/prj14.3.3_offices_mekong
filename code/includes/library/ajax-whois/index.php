<?php 
/*************************************************
 * SOFT64 PhpAjaxWhois
 *
 * Version: 1.1
 * Date: 1/29/2008
 *
 ****************************************************/
require_once("AjaxWhois.php"); 
$whois = new AjaxWhois();

?>

	<link href="style/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="js/mootools.js"></script>
	<script type="text/javascript" language="javascript">
   var http_request = false;
   function makeRequest(url, parameters) {
      http_request = false;
      if (window.XMLHttpRequest) { // Mozilla, Safari,...
         http_request = new XMLHttpRequest();
         if (http_request.overrideMimeType) {
         	// set type accordingly to anticipated content type
            //http_request.overrideMimeType('text/xml');
            http_request.overrideMimeType('text/html');
         }
      } else if (window.ActiveXObject) { // IE
         try {
            http_request = new ActiveXObject("Msxml2.XMLHTTP");
         } catch (e) {
            try {
               http_request = new ActiveXObject("Microsoft.XMLHTTP");
            } catch (e) {}
         }
      }
      if (!http_request) {
         alert('Cannot create XMLHTTP instance');
         return false;
      }
	  
      http_request.onreadystatechange = alertContents;
      http_request.open('GET', url + parameters, true);
      http_request.send(null);
   }

   function alertContents() {
     if (http_request.readyState == 4) {
         if (http_request.status == 200) {
            //alert(http_request.responseText);
            result = http_request.responseText;
            document.getElementById('log_res').innerHTML = result;            
         } else {
            alert('There was a problem with the request.');
         }
      }
   }
   function hidenDIV(){
  	 document.getElementById("tldListShow").style.display='none';
   }
   function reCheck(){
   		location.reload(true);
   }
</script>


		   <form id="whois" action="whois.php" method="post" >     
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
                
                      <tr>
                        <td  style="padding-left:20px; font-family:arial; font-size:12px"><strong>Ki&#7875;m tra t&#234;n mi&#7873;n</strong>	 </td>
                      </tr>
                      <tr>
                        <td nowrap="nowrap"><input type="text" name="domain" size="30" id="domain" class="input"/> &nbsp;<input name="Submit" type="image" src="images/check.gif" align="absmiddle" value="Search" onclick="hidenDIV()" />	 </td>
                      </tr>
                      <tr>
                        <td>
                        	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                            <td valign="top">
                            <div id="tldListShow">
                               <?php $whois->tldList();?>
                            </div>
                         <div id="log"><div id="log_res" align="center"><!-- search results --></div></div>
                            </td>
                            </tr>
                        </table>
                        </td>
                      </tr>
                      <tr>
                        <td></td>
                      </tr>
                   <tr>
                        <td height="25">&nbsp;</td>
                      </tr>
                    </table>
   </form> 
		
