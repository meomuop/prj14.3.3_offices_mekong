// JavaScript Document
function fsPosX(obj)
{
	var curleft = 0;
	if(obj.offsetParent)
		while(1) 
		{
		  curleft += obj.offsetLeft;
		  if(!obj.offsetParent)
			break;
		  obj = obj.offsetParent;
		}
	else if(obj.x)
		curleft += obj.x;
	return curleft;
}

function fsPosY(obj)
{
	var curtop = 0;
	if(obj.offsetParent)
		while(1)
		{
		  curtop += obj.offsetTop;
		  if(!obj.offsetParent)
			break;
		  obj = obj.offsetParent;
		}
	else if(obj.y)
		curtop += obj.y;
	return curtop;
}
showtime = 0;
function changtab(id,count,clear){
	for(i=1;i<=count;i++){
		document.getElementById('tab_'+i).className='tab_t_nomal';
	}
	document.getElementById('tab_'+id).className='tab_t_select';
	//document.getElementById('tab_content').innerHTML = document.getElementById('content_'+id).innerHTML;
	if(clear==1) clearInterval(showtime);
}
function mouseout(id,count){
	showtime = setInterval(function() {changtab(id,count,1)},3000);
}
function tabdetail(id,count){
	for(i=1;i<=count;i++){
		try{
			document.getElementById('detail_'+i).className='tab_nomal';
			document.getElementById('description_'+i).style.display='none';
		}
		catch(e){}			
	}
	document.getElementById('detail_'+id).className='tab_select';
	document.getElementById('description_'+id).style.display='block';
}
function start(id){
		for(i=1;i<=10;i++){
			if(i<=id){
				document.write('<img src="/images/star1.gif" border="0" />');
			}else{
				document.write('<img src="/images/star0.gif" border="0" />');
			}
		}
}
var delay = 2000;
var ie4=document.all&&!document.getElementById;
var DOM2=document.getElementById;
var index=0;

//function to change content
function changecontent(lengarray){
  if (index>=lengarray)
    index=0
  if (DOM2){
    document.getElementById("fscroller").innerHTML=document.getElementById("content_"+index).innerHTML;
  }
  else if (ie4)
    document.all.fscroller.innerHTML=eval('document.all.fscroller_'+index+'.innerHTML');
  	index++
	setTimeout("changecontent("+lengarray+")", delay);
}
function showmenu(mnname,mnlink,mnulever){
	if(mnulever==2){
		stm_aix("p2i0","p0i0",[1,mnname,"","",-1,-1,0,mnlink,"","","","","",0,0,0,"","",0,0,0,0,0,"#00A650",0,"#D91102",0,"","",0,0,1,1,"#FFFFFF","#ffffff","#ffffff","#FFFFFF","12px Arial","12px Arial",0,0],130);
	}else{
		stm_bm(["",400,"","/images/space.gif",0,"","",0,0,140,0,20,0,0,0,""],this);
		stm_bp("p0",[1,0,0,0,0,0,0,0,100,"",-2,"",-2,0,0,0,"","","",0,0,0,""]);
		stm_ai("p0i0",[1,"<a href='"+mnlink+"'>"+mnname+"</a>","","",-1,-1,0,"","","","","","",0,0,0,"","",0,0,0,0,1,"#FFFFF7",1,"#B5BED6",1,"","",0,0,0,0,"#FFFFF7","#000000","#FFFFFF","#FFCC00","11px Bold Tahoma","11px Bold Tahoma",0,0]);
		stm_bpx("p1","p0",[1,4,0,0,0,3,0,0,100,"",-2,"",-2,100,0,0,"#999999","#FFFFF7","",3,0,0]);
	}
}
function closemenu(){
	stm_ep();
	stm_ep();
	stm_sc(1,["transparent","transparent","","",3,3,0,0,"#FFFFF7","#000000","","",7,9,0,"","",7,9,0,0,200]);
	stm_em();
}

function fromtopsubmit(id){
		if(document.getElementById("keyword_top").value=='Từ khóa'){
			document.getElementById("keyword_top").value='';
			document.formtopsearch.submit();
			//alert("Bạn chưa nhập từ khóa tìm kiếm");
			return;
		}
		document.formtopsearch.submit();
		return;
		keyword = document.getElementById('keyword_top').value;
		cat_id  = document.getElementById('top_iCat').value;
		keyword = keyword.replace('/',' ');
		keyword = keyword.replace('/',' ');
		keyword = keyword.replace('/',' ');
		keyword = keyword.replace('/',' ');
		keyword = keyword.replace('/',' ');
		keyword = keyword.replace('/',' ');
		keyword = keyword.replace('_',' ');
		keyword = keyword.replace('_',' ');
		keyword = keyword.replace('_',' ');
		keyword = keyword.replace('_',' ');
		if(cat_id != 0){
			urlreturn ='/'+cat_id+'/'+(keyword)+'.html';
		}else{
			urlreturn ='/'+(keyword)+'.html';
		}
		window.location.href=urlreturn;
}
function check_quantity(url){
	window.location.href=url;
}
var div_id = 0;
function addCommas(nStr){
nStr += ''; x = nStr.split('.');x1 = x[0];x2 = x.length > 1 ? '.' + x[1] : '';
var rgx = /(\d+)(\d{3})/;
while (rgx.test(x1)) {x1 = x1.replace(rgx, '$1' + '.' + '$2');}
return x1;
}
function formatCurrency(div_id,str_number){
	/*Convert tu 1000->1.000*/
	var mynumber=1000;
	str_number = str_number.toString();
	str_number = str_number.replace(/\./g,"");
	
	document.getElementById(div_id).innerHTML = addCommas(str_number);
}

function show_left_menu(id){
	object = document.getElementById("div_sub2_" + id);
	try{
		document.getElementById("div_sub2_"+div_id).style.display = 'none';
		//document.getElementById("div_left_"+div_id).className = 'div_left_0';
	}
	catch(e){}

if (object != undefined) {
		if (object.style.display == "none") {
			object.style.display = "block";
			//alert(object.style.display);
			//document.getElementById("div_left_"+id).className = 'div_left_1';
			div_id = id;
		}
		else {
			object.style.display = "none";
		}
	}
	else return;
}
function showhidden(id,img){
		mydiv = document.getElementById(id);
		if(mydiv.style.display == 'none'){
			mydiv.style.display = 'block';
			document.getElementById(img).src = '/images/close.gif';
		}else{
			mydiv.style.display = 'none';	
			document.getElementById(img).src = '/images/open.gif';
		}
}
function load_data(obj_response,file_action){
	makeRequest(file_action, obj_response, 'GET', '')
}
function makeRequest(url, obj_response, method, parameters) {
	var http_request	= false;
	var show_id			= document.getElementById(obj_response);
	if (!show_id) {
		//alert('Cannot find object response data !');	
		return false;
	}
	if(url == ""){
		return false;
	}
	show_id.innerHTML	= 'Searching...';
	if (window.XMLHttpRequest) { // Mozilla, Safari,...
		http_request	= new XMLHttpRequest();
		if (http_request.overrideMimeType) {
			//set type accordingly to anticipated content type
			http_request.overrideMimeType('text/html');
		}
	} else if (window.ActiveXObject) { // IE
		try {
			http_request = new ActiveXObject('Msxml2.XMLHTTP');
		} catch (e) {
			try {
				http_request = new ActiveXObject('Microsoft.XMLHTTP');
			} catch (e) {}
		}
	}
	if (!http_request) {
		alert('Cannot create XMLHTTP instance');
		return false;
	}
	
	http_request.onreadystatechange=	function(){
	if (http_request.readyState == 4) {
		if (http_request.status == 200) {
			//alert(http_request.responseText);
			show_id.innerHTML = http_request.responseText;     
		} else {
			//alert('There was a problem with the request.');
			return false;
		}
	}
	}
	if(method == 'GET'){
		http_request.open('GET', url, true);
		http_request.send('');
	}
	else if(method == 'POST'){
		http_request.open('POST', url, true);
		http_request.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
		http_request.setRequestHeader('Content-length', parameters.length);
		http_request.setRequestHeader('Connection', 'close');
		http_request.send(parameters);
	}
}

// ---- added by Leanhvan
function set_focus(curobj,obj){
	if(document.getElementById(curobj).value.length == 1)
	document.getElementById(obj).focus();
}

function alert_error(obj){
	if(obj == 1)
	alert('Bạn không được cấp quyền để thao tác tại vị trí này');
}

var dates = {
    convert:function(d) {
        // Converts the date in d to a date-object. The input can be:
        //   a date object: returned without modification
        //  an array      : Interpreted as [year,month,day]. NOTE: month is 0-11.
        //   a number     : Interpreted as number of milliseconds
        //                  since 1 Jan 1970 (a timestamp) 
        //   a string     : Any format supported by the javascript engine, like
        //                  "YYYY/MM/DD", "MM/DD/YYYY", "Jan 31 2009" etc.
        //  an object     : Interpreted as an object with year, month and date
        //                  attributes.  **NOTE** month is 0-11.
        return (
            d.constructor === Date ? d :
            d.constructor === Array ? new Date(d[0],d[1],d[2]) :
            d.constructor === Number ? new Date(d) :
            d.constructor === String ? new Date(d) :
            typeof d === "object" ? new Date(d.year,d.month,d.date) :
            NaN
        );
    },
    compare:function(a,b) {
        // Compare two dates (could be of any type supported by the convert
        // function above) and returns:
        //  -1 : if a < b
        //   0 : if a = b
        //   1 : if a > b
        // NaN : if a or b is an illegal date
        // NOTE: The code inside isFinite does an assignment (=).
        return (
            isFinite(a=this.convert(a).valueOf()) &&
            isFinite(b=this.convert(b).valueOf()) ?
            (a>b)-(a<b) :
            NaN
        );
    },
    inRange:function(d,start,end) {
        // Checks if date in d is between dates in start and end.
        // Returns a boolean or NaN:
        //    true  : if d is between start and end (inclusive)
        //    false : if d is before start or after end
        //    NaN   : if one or more of the dates is illegal.
        // NOTE: The code inside isFinite does an assignment (=).
       return (
            isFinite(d=this.convert(d).valueOf()) &&
            isFinite(start=this.convert(start).valueOf()) &&
            isFinite(end=this.convert(end).valueOf()) ?
            start <= d && d <= end :
            NaN
        );
    }
}