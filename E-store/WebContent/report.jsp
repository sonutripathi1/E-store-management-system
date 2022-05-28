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
	<%@ include file="menu/armenu.jsp" %>	
	<div id="content-wrap">
		<%@ include file="menu/sidemenu.jsp" %>
		
		<!-- write your code here -->
		<div id="main">
        
        <h1>Report Branch</h1>

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
        
        			<td width="136" align="center">Select Branch : </td>
           <td>
             <%
             DConnection db1 = new DConnection();
	 		 ResultSet rs2=null;
	 		 String r = "select * from login where u_type='c'";
	 		 rs2 = db1.getData(r);
			 out.println("<select name='select' id='select'>");
			 int z=0;
	         while(rs2.next()){
				String s=rs2.getString("u_id");
				if(z==0){
				out.println("<option value='"+s+"' selected='selected'> "+s+" </option>");
				z=1;
				 }
				else{ 
					out.println("<option value="+s+"> "+s+" </option>");
				}
		    }
			
			 out.println("</select>");
			 %>
             </td>
             <td colspan="2" align="center">
             <input type="hidden" value="id" name="id" />
			<input class="submit" type="submit" value="Submit"/>
            </td>
        
         </tr>
          </table>
		</form>	
        
        
         <%
 		String id="";
		id = request.getParameter("id");
		if(id!=null){
			 String type = request.getParameter("select");
			 DConnection db = new DConnection();
	 		 ResultSet rs1=null;
	 		 String qry = "select * from bill where b_code = '"+type+"' and DATEDIFF(CURdATE(),date) < 29";
	 		 rs1 = db.getData(qry);
	         String bno="",date="";
			 int total=0;
			 int tl=0;
			 out.println("<h1>Report of Store " +type+ "</h1><br>");
			 out.println("<table border='0'  align='center' width='590px'><tr align='center' bgcolor='#CC99FF' height='50px'><td><b>Bill No</b></td><td><b>Date</b></td><td ><b>Amount</b></tr>");
	         while(rs1.next()){
				bno = rs1.getString("bill_no");
				date = rs1.getString("date");
				total = rs1.getInt("total");
				tl = tl + total;
				%>
				
                <tr align='center' bgcolor="#CCCCCC">
                	<td><% out.println(bno); %></td>
                    <td><% out.println(date); %></td>
                    <td align="right"><% out.println(total); %></td>
                </tr>
		   <%  } %>
           <tr bgcolor="#33CCFF">
           	<td><b>Total</b></td><td></td><td align="right"><% out.println(tl); %></td>
           </tr>
           <%
					   
			 out.println("</table>");
	 }
		
 %>         	
		</div>
	</div>
	<%@ include file="menu/footer.jsp" %>
</div>
</body>
</html>