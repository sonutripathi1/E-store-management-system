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


</head>

<body>
<!-- wrap starts here -->
<div id="wrap">
	<%@ include file="menu/header.jsp" %>
	<%@ include file="menu/aumenu.jsp" %>	
	<div id="content-wrap">
		<%@ include file="menu/ausidemenu.jsp" %>
		
		<!-- write your code here -->
		<div id="main">
        
        <h1>Change Password </h1>
				
		<center>
<%
	String msg="";
	msg = request.getParameter("msg");
	if(msg!=null)
		out.println("<br><h3>"+msg+"</h3>");
%></center>

<form id="formID" method="get" action="">
        <table width="560px" border="0" bgcolor="#9999FF" align="center" >
        <tr height="40px">
        <td width="200px" align="center"> Branch ID :
        	</td>
			<td width="152"><input class="validate[required,custom[noSpecialCaracters],length[0,20],ajax[ajaxUser]]" type="text" name="bcode" id="bcode" /></td>
            
            
             <td  width="150px" align="left">
			<input class="submit" type="submit" value="search"/>
            </td>
            </tr>
          </table>
		</form>
 <%
 		String id="";
		id = request.getParameter("bcode");
		if(id!=null){
			 DConnection db = new DConnection();
	 		 ResultSet rs1=null;
	 		 String qry = "select * from login where u_id = '"+id+"'";
	 		 rs1 = db.getData(qry);
	         String pc="";
			 
			 out.println("<table border='0'  align='center' width='590px'><tr align='center' bgcolor='#CC99FF' height='50px'><td><b>Password</b></td><td><b>New Password</b></td><td></td></tr>");
	         while(rs1.next()){
				 pc=rs1.getString("pwd");
			 }
				%>
			<tr align='center' bgcolor="#CCCCCC">
                 <form id="formID" method='post' action='changepwd.jsp?bc=<%=id %>'>
		<td><% out.println(pc); %></td>
		
        <td><input type="text" class="validate[required,custom[noSpecialCaracters],length[0,20],ajax[ajaxUser]]"  size="11" name="npwd" id="npwd" ></td>
        	
		<td><input type="submit" value="Change"></td>
              </form>
                </tr>
		   <%  
		   if(pc.equals("")){
				 response.sendRedirect("changepwd.jsp?msg=ID Not Found");
			 }
			 out.println("</table>");
	 }
		
 %> 
		</div>
	</div>
	<%@ include file="menu/footer.jsp" %>
</div>
</body>
</html>
<%
 		String pw="";
		pw = request.getParameter("npwd");
		if(pw!=null){
 		 	 DConnection db = new DConnection();
			 String id1 = request.getParameter("bc");
			 String sq="update login set pwd ='"+pw+"' where u_id='"+id1+"'";
			 db.setData(sq);
			 response.sendRedirect("changepwd.jsp?msg=Password Changed Sucessfully");
		}
 %>