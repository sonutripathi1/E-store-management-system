<%
	String ses[] = session.getValueNames();
	
	for(int le=0;le<ses.length;le++){
		if(ses[le].equals("type")){
			if(session.getAttribute("type").equals("c")){
				response.sendRedirect("cindex.jsp");
			}
			else if(session.getAttribute("type").equals("a")){
				response.sendRedirect("aindex.jsp");
			}
		}
	}
%>
<html>
<head>

		<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
		<title>Home Page</title>
		
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


</head>
<body>
<!-- wrap starts here -->
<div id="wrap">
	<%@ include file="menu/header.jsp" %>
	<%@ include file="menu/menu.jsp" %>	
	<div id="content-wrap">
		
		
		<!-- write your code here -->
		<div id="main">
		
        
        
        <center>
		<%
			String msg="";
			msg = request.getParameter("msg");
			if(msg!=null)
				out.println("<br>"+msg);
		%>
		<BR><BR>
		<form id="formID" method="get" action="logcheck.jsp">
        <table width="350px" border="0">
        <tr height="60px">
        <td width="136" align="center"> User Name:
        	</td>
			<td width="152"><input class="validate[required,custom[noSpecialCaracters],length[0,20],ajax[ajaxUser]]" type="text" name="user" id="user" /></td>
            </tr>
            <tr height="60px"><td width="136" align="center">PassWord : </td>
            <td>
			<input class="validate[required,length[2,11]]" type="password" name="password" id="firstname" />			</td>
            <tr align="center" height="50px">
            <td>
					<span>User </span>
					<input class="validate[required] radio" type="radio" name="type" id="radio2"  value="c"/>
                    </td>
            
            <td>
            <span>Admin</span>
					<input class="validate[required] radio" type="radio" name="type"  id="radio1" value="a">
                    
                </td></tr>
             <tr height="60px"><td colspan="2" align="center">
			<input class="submit" type="submit" value="Log In"/>
            </td>
            </tr>
          </table>
		</form>
        <br>
</center>
        
        
        			
		</div>
        
	</div>
	<%@ include file="menu/footer.jsp" %>
</div>
</body>
</html>