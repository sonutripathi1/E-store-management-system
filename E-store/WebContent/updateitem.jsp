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
	<%@ include file="menu/apmenu.jsp" %>	
	<div id="content-wrap">
		<%@ include file="menu/apsidemenu.jsp" %>
		
		<!-- write your code here -->
		<div id="main">
        
			<h1>Update Item</h1>
            
            
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
        <td width="200px" align="center"> Product Name :
        	</td>
			<td width="152"><input class="validate[required,custom[noSpecialCaracters],length[0,20],ajax[ajaxUser]]" type="text" name="pname" id="pname" /></td>
            
            
             <td  width="150px" align="left">
			<input class="submit" type="submit" value="search"/>
            </td>
            </tr>
          </table>
		</form>
 <%
 		String id="";
		id = request.getParameter("pname");
		if(id!=null){
			 DConnection db = new DConnection();
	 		 ResultSet rs1=null;
	 		 String qry = "select * from item_detail where i_name LIKE '"+id+"%'";
	 		 rs1 = db.getData(qry);
	         String pc="",pn="",pcom="";
			 int pp=0;
			 out.println("<table border='0'  align='center' width='590px'><tr align='center' bgcolor='#CC99FF' height='50px'><td><b>Item ID</b></td><td><b>Name</b></td><td><b>Company</b><td><b>Price</b></td><td></td></tr>");
	         while(rs1.next()){
				pc = rs1.getString("i_code");
				pn = rs1.getString("i_name");
				pcom = rs1.getString("i_company");
				pp = rs1.getInt("i_price");
				%>
                
                <tr align='center' bgcolor="#CCCCCC">
                 <form id="formID" method='post' action='updateData.jsp?pcode=<%=pc %>'>
		<td><% out.println(pc); %></td>
		<td><input type="text" class="validate[required,custom[noSpecialCaracters],length[0,20],ajax[ajaxUser]]"  size="11" value="<%=pn%>" name="pname" id="pname" ></td>
        <td><input type="text" class="validate[required,custom[noSpecialCaracters],length[0,20],ajax[ajaxUser]]" size="11" value="<%=pcom%>" name="pcompany" id="pcompny"></td>
		<td><input type="text" class="validate[required,custom[onlyNumber],length[0,5]] text-input" value="<%=pp%>" size="11" name="pprice" id="pprice"></td>
		<td><input type="submit" value="UPDATE"></td>
              </form>
                </tr>
		   <%  }
			 out.println("</table>");
	 }
		
 %> 
               	
		</div>
	</div>
	<%@ include file="menu/footer.jsp" %>
</div>
</body>
</html>
