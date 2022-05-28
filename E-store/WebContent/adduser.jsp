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
        
        <h1>Add New Branch </h1>
				
                <center>
<%
	String msg="";
	msg = request.getParameter("msg");
	if(msg!=null)
		out.println("<br><h3>"+msg+"</h3>");
%></center>
<form id="formID" method="get" action="">
        <table width="80%" border="0" align="center">
        <tr height="60px">
        <td width="136" align="center"> Branch ID:
        	</td>
			<td width="152"><input class="validate[required,custom[noSpecialCaracters],length[2,20],ajax[ajaxUser]]" type="text" name="bcode" id="bcode" /></td>
            </tr>
            <tr height="60px"><td width="136" align="center">Branch Name : </td>
            <td>
			<input class="validate[required,custom[noSpecialCaracters],length[0,20],ajax[ajaxUser]]" type="text" name="bname" id="bname" />			</td></tr>
             <tr height="60px"><td width="136" align="center">Branch Address : </td>
            <td>
			<input class="validate[required,custom[noSpecialCaracters],length[0,30],ajax[ajaxUser]]" type="text" name="badd" id="badd" />			</td></tr>
            <tr height="60px"><td width="136" align="center">Password </td>
            <td>
			<input class="validate[required,custom[noSpecialCaracters],length[4,11]] text-input"  type="text" name="pwd" id="pwd" />			</td></tr>
              
            
             <tr height="60px"><td colspan="2" align="center">
			<input class="submit" type="submit" value="Submit"/>
            </td>
            </tr>
          </table>
		</form>
        
        <%
	
	 String bcode="";
	 bcode = request.getParameter("bcode");
	 if(bcode!=null){
	 	String bname = request.getParameter("bname");
		String badd = request.getParameter("badd");
	 	String pwd = request.getParameter("pwd");

			 
	 	DConnection db = new DConnection();
	 	ResultSet rs1=null;
	 	String qry = "select * from branch_detail where b_code='"+bcode+"'";
	 	rs1 = db.getData(qry);
	 	String pc="";
	 	while(rs1.next()){
			pc = rs1.getString("b_code");	
		}
		if(pc.equals("")){
			String q,qry1;
			q="insert into branch_detail values('"+bcode+"','"+bname+"','"+badd+"')";
			db.setData(q);
			qry1 = "insert into login values('"+bcode+"','"+pwd+"','c')";
			db.setData(qry1);
			response.sendRedirect("adduser.jsp?msg=Branch Added Sucessfully");
		}
		else{
			response.sendRedirect("adduser.jsp?msg=Branch Already Exists");
		}
	 }
%>
                	
		</div>
	</div>
	<%@ include file="menu/footer.jsp" %>
</div>
</body>
</html>