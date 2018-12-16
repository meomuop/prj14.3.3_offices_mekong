// JavaScript Document
// Begin Check Images -----------------------------------------------
function validate_images(x_file){
	if (!/(\.(gif|jpg|jpeg|bmp|png))$/i.test(x_file)) {		
		return false;
	}
	return true;
}
// End Check Images -----------------------------------------------
// Begin Check TRIM -----------------------------------------------
function LTrim(str) {
   var whitespace = new String(" \t\n\r");
   var s = new String(str);
   if (whitespace.indexOf(s.charAt(0)) != -1) {
      var j=0, i = s.length;
      while (j < i && whitespace.indexOf(s.charAt(j)) != -1)
         j++;
      s = s.substring(j, i);
   }
   return s;
}

function RTrim(str) {
   var whitespace = new String(" \t\n\r");
   var s = new String(str);
   if (whitespace.indexOf(s.charAt(s.length-1)) != -1) {
      var i = s.length - 1;       // Get length of string
      while (i >= 0 && whitespace.indexOf(s.charAt(i)) != -1)
         i--;
      s = s.substring(0, i+1);
   }
   return s;
}

function Trim(str) {
   return RTrim(LTrim(str));
}
//==================================================================================================