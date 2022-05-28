<%@page import="java.sql.*" %>
<%@include file="DConnection.jsp" %>
<%@include file="csession.jsp" %>

<html>
<head>

		<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
		<title>User Home</title>
		
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
	<%@ include file="menu/ccmenu.jsp" %>	
	<div id="content-wrap">
		<%@ include file="menu/csidemenu.jsp" %>
		
		<!-- write your code here -->
		<div id="main">
					
                    
                    
<%
	String msg="";
	msg = request.getParameter("msg");
	if(msg!=null)
		out.println("<br><h3>"+msg+"</h3>");
%>

<form id="formID" method="get" action="">
        <table width="560px" border="0" bgcolor="#9999FF" align="center" >
        <tr height="40px" align="center">
        <td>
        <select name="select">
        	<option value="i_name" selected="selected">Name</option>
        	<option value="i_code" >ID</option>
            <option value="i_company" >Company</option>
        </select>
        </td>
			<td width="152"><input type="text" name="value" id="value" /></td>
            
            
             <td  width="150px" align="left">
			<input class="submit" type="submit" value="search"/>
            </td>
            </tr>
          </table>
		</form>
 <%
 		String id="";
		id = request.getParameter("value");
		if(id!=null){
			 String type = request.getParameter("select");
			 String user = (String) session.getAttribute("username");
			 
	 		String qry1 = "SELECT b.i_code,i.i_name,i.i_company,b.i_quantity,i.i_price from branch_item b,item_detail i where b.i_code=i.i_code and b.b_code='"+user+"' and i."+type+" LIKE '"+id+"%'";
				
				 DConnection d1 = new DConnection();
	 		 	 ResultSet r1=null;
				 
				 r1 = d1.getData(qry1);
				 String pc="",pn="",pcom="";
			 	 int pq=0,pp=0;
				 
				  out.println("<table border='0'  align='center' width='590px'><tr align='center' bgcolor='#CC99FF' height='50px'><td><b>ID</b></td><td><b>Name</b></td><td><b>Company</b><td><b>Price</b></td><td><b>A Quan</b></td><td><b>Quantity</b></td><td></td></tr>");
				 
				 while(r1.next()){
					 pc=r1.getString("b.i_code");
					 pn=r1.getString("i.i_name");
					 pcom=r1.getString("i.i_company");
					 pq=r1.getInt("b.i_quantity");
					pp=r1.getInt("i.i_price");
					%>
					 <form id="formID" method='post' action='cartInsert.jsp?pcode=<%=pc %>&pname=<%=pn %>&pcompany=<%=pcom %>&pprice=<%=pp %>&cart=cart&del1=del' name="srch">
					 <tr align='center' bgcolor="#CCCCCC">
                	<td><% out.println(pc); %></td>
                    <td><% out.println(pn); %></td>
                    <td><% out.println(pcom); %></td>
                    <td><% out.println(pp); %></td>
                    <td><% out.println(pq); %></td>
                    <input type="hidden" value="<%=pq %>" name="pquantity" />
                <td><input type="text" class="validate[required,custom[onlyNumber],length[0,5]] text-input" name="pqun" id="pqun" size="5"></td>
                   <td><input type="submit" value="Add to Cart"></td>
                </tr>
					</form>
				<%	
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