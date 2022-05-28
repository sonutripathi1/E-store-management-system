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
        
        <h1>Search Branch </h1>
				
              
              		<center>
<%
	String msg="";
	msg = request.getParameter("msg");
	if(msg!=null)
		out.println("<br><h3>"+msg+"</h3>");
%></center>

<form id="formID" method="get" action="">
        <table width="560px" border="0" bgcolor="#9999FF" align="center" >
        <tr height="40px" align="center">
        
        <td>
        <select name="select">
        	<option value="b_name" selected="selected">Name</option>
        	<option value="b_code" >ID</option>
        </select>
        </td>
        
			<td width="152"><input class="validate[required,custom[noSpecialCaracters],length[0,20],ajax[ajaxUser]]" type="text" name="bname" id="bname" /></td>
            
            
             <td  width="150px" align="left">
			<input class="submit" type="submit" value="search"/>
            </td>
            </tr>
          </table>
		</form>
 <%
 		String id="";
		id = request.getParameter("bname");
		if(id!=null){
			 String type =request.getParameter("select"); 
			 DConnection db = new DConnection();
	 		 ResultSet rs1=null;
	 		 String qry = "select * from branch_detail where "+type+" LIKE '"+id+"%'";
	 		 rs1 = db.getData(qry);
	         String pc="",pn="",pcom="";
			 int pp=0,pq=0;
			 out.println("<table border='0'  align='center' width='590px'><tr align='center' bgcolor='#CC99FF' height='50px'><td><b>Branch ID</b></td><td><b>Name</b></td><td><b>Address</b><td></td></tr>");
	         while(rs1.next()){
				pc = rs1.getString("b_code");
				pn = rs1.getString("b_name");
				pcom = rs1.getString("b_address");
				%>
				
                <tr align='center' bgcolor="#CCCCCC">
                	<td><% out.println(pc); %></td>
                    <td><% out.println(pn); %></td>
                    <td><% out.println(pcom); %></td>
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