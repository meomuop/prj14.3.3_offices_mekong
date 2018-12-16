function checkResize(){
}

function findPosY(obj)
{
	var curtop = 0;
	var printstring = '';
	if (obj.offsetParent)
	{
		while (obj.offsetParent)
		{
			curtop += obj.offsetTop
			obj = obj.offsetParent;
		}
	}
	else if (obj.y)
		curtop += obj.y;
	return curtop;
}

function findPosX(obj)
{
	var curleft = 0;
	if (obj.offsetParent)
	{
		while (obj.offsetParent)
		{
			curleft += obj.offsetLeft
			obj = obj.offsetParent;
		}
	}
	else if (obj.x)
		curleft += obj.x;
	return curleft;
}

function addToFavorites(){
	if (window.external){
		window.external.Addfavorite('http://www.businesstravelvietnam.com','KienThanh Home Page');
	}
	else{
		alert('You are using a browser that does not support adding Favorites by script, please add it manually');
	}
}

function OpenChat(url){
		uploader = window.open(url,"upload","toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=1,width=800,height=800,left = 200,top = 100");
}	

function doUploadPic(url){
	uploader = window.open(url,"upload","toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=0,width=400,height=130,left = 0,top = 0");
}

function preview(id,dir){
	var img = document.getElementById(id).value;
	if(img!="")
	{
		var path = "../images/"+dir+"/"+document.getElementById(id).value;
		uploader = window.open(path);
	}
	else
	{
		alert("Please input image!");
	}
}

function addRoomType(url){
	uploader = window.open(url,"upload","toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=1,width=600,height=400,left = 200,top = 100");
}	
function OpenWindow(url){
	uploader = window.open(url,"upload","toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=1,width=600,height=400,left = 200,top = 100");
}	
function OpenWindowM(url){
	uploader = window.open(url,"upload","toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=1,width=600,height=650,left = 200,top = 100");
}
function OpenWindowAdmin(url){
	uploader = window.open(url,"upload","toolbar=0,scrollbars=1,location=0,statusbar=0,menubar=0,resizable=1,width=550,height=650,left = 200,top = 100");
}		

function docheck(status,from_)
{
	var alen=document.frmList.elements.length;
	alen=(alen>5)?document.frmList.chkid.length:0;
	if (alen>0)
	{
		for(var i=0;i<alen;i++)
		document.frmList.chkid[i].checked=status;
	}
	else
	{
		document.frmList.chkid.checked=status;
	}
	if(from_>0)
		document.frmList.chkall.checked=status;
	}
	
function docheckone()
{
	var alen=document.frmList.elements.length;
	var isChecked=true;
	alen=(alen>4)?document.frmList.chkid.length:0;
	if (alen>0)
	{
		for(var i=0;i<alen;i++)
			if(document.frmList.chkid[i].checked==false)
				isChecked=false;
	}else
	{
		if(document.frmList.chkid.checked==false)
			isChecked=false;
	}				
	document.frmList.chkall.checked=isChecked;
}
function calculatechon()
{			
	var strchon="";
	var alen=document.frmList.elements.length;				
	alen=(alen>5)?document.frmList.chkid.length:0;
	if (alen>0)
	{
		for(var i=0;i<alen;i++)
			if(document.frmList.chkid[i].checked==true)
				strchon+=document.frmList.chkid[i].value+",";
	}else
	{
		if(document.frmList.chkid.checked==true)
			strchon=document.frmList.chkid.value;
	}
	document.frmList.chon.value=strchon;
}
 function Search(){
	 var alen=document.frmList.elements.length;
	if(document.frmList.KeyWord.value == ""){
			alert("Nhap tu khoa muon tim kiem");
			document.frmList.KeyWord.focus();
			return false
	}else {
		
		//return true;
		document.frmList.submit();
	}
	
}  
function checkInput()
{
	var alen=document.frmList.elements.length;
	var isChecked=false;
	alen=(alen>5)?document.frmList.chkid.length:0;
	if (alen>0)
	{
		for(var i=0;i<alen;i++)
			if(document.frmList.chkid[i].checked==true)
				isChecked=true;
	}else
	{
		if(document.frmList.chkid.checked==true)
			isChecked=true;
	}
	if (!isChecked)											
		alert("Please select admin to delete!");
	else
	{
		calculatechon();
		msg = "Are you sure do Delete?\n";
		choice = confirm(msg);
		if(choice != true)	isChecked=false;
	}
	return isChecked;
} 