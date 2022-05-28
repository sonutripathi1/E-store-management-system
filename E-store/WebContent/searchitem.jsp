<%@page import="java.sql.*" %>
<%@include file="DConnection.jsp" %>
<%@include file="asession.jsp" %>

<html>
<head>

		<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
		<title>Product Home</title>
		
		<link rel="stylesheet" href="css/validationEngine.jquery.css" type="text/css" media="screen" title="no title" charset="utf-8" />
		<link rel="stylesheet" href="images/Refresh.css" type="text/css" />

		
		<script src="js/jquery.min.js" type="text/javascript"></script>
		<script src="js/jquery.validationEngine-en.js" type="text/javascript"></script>
		<script src="js/jquery.validationEngine.js" type="text/javascript"></script>
		
		<script>	
		$(document).ready(function() {
			$("#formID").validationEngine()
		});
	</script>
    
    	<script type="text/javascript">
function loadXMLDoc()
{
	
	for (var i=0; i < document.srch.selected.length; i++)
   		{
   			if (document.srch.selected[i].checked)
      		{
      			var rad_val = document.srch.selected[i].value;
				var tex = document.srch.pname.value;
				var url = 'sitemdata.jsp?pname='+tex+'&select='+rad_val;
      		}
		}
	
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
    }
  }
xmlhttp.open("GET",url,true);
xmlhttp.send();
}
</script>


</head>

<body>
<!-- wrap starts here -->
<div id="wrap">
	<%@ include file="menu/header.jsp" %>
	<%@ include file="menu/apmenu.jsp" %>	
	<div id="content-wrap">
		<%@ include file="menu/apsidemenu.jsp" %>
		
		<!-- write your code here -->
		<div id="main">
        
        <h1>Search Product </h1>
				
		<center>
<%
	String msg="";
	msg = request.getParameter("msg");
	if(msg!=null)
		out.println("<br><h3>"+msg+"</h3>");
%></center>

<form id="formID" method="get" action="" name="srch">
        <table width="560px" border="0" bgcolor="#9999FF" align="center" >
        <tr height="40px" align="center">
        <td>
        <td><input type="radio" name="selected" value="i_code" checked="checked">ID</td>
		<td><input type="radio" name="selected" value="i_name"> Name</td>
		<td><input type="radio" name="selected" value="i_company"> Company</td>
        </td>
			<td><input class="validate[required,custom[noSpecialCaracters],length[0,20],ajax[ajaxUser]]" onKeyUp="loadXMLDoc()" type="text" name="pname" id="pname" /></td>
            
            
             <td align="left">
			<input class="submit" type="button" onClick="loadXMLDoc()" value="search"/>
			
            </td>
            </tr>
          </table>
		</form>
 		<div id="myDiv"><h2>Let AJAX change this text</h2></div>        	
		</div>
	</div>
	<%@ include file="menu/footer.jsp" %>
</div>
</body>
</html>
