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
	<%@ include file="menu/abmenu.jsp" %>	
	<div id="content-wrap">
		<%@ include file="menu/absidemenu.jsp" %>
		
		<!-- write your code here -->
		<div id="main">
        
        <h1>Update Product In Branch</h1>

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
              <td>
        <select name="type">
        	<option value="i_name" selected="selected">Name</option>
        	<option value="i_code" >ID</option>
            <option value="i_company" >Company</option>
        </select>
        </td>
            
            <td width="152"><input class="validate[required,custom[noSpecialCaracters],length[0,20],ajax[ajaxUser]]" type="text" name="pname" id="pname" /></td>
            
             <td colspan="2" align="center">
			<input class="submit" type="submit" value="Search"/>
            </td>
            </tr>
          </table>
		</form>
        <%
			String value = request.getParameter("pname");
			if(value!=null){
				String br = request.getParameter("select");
				String type = request.getParameter("type");
				
				String qry1 = "SELECT b.i_code,i.i_name,i.i_company,b.i_quantity from branch_item b,item_detail i where b.i_code=i.i_code and b.b_code='"+br+"' and i."+type+" LIKE '"+value+"%'";
				
				 DConnection d1 = new DConnection();
	 		 	 ResultSet r1=null;
				 
				 r1 = d1.getData(qry1);
				 String pc="",pn="",pcom="";
			 	 int pq=0;
				 
				  out.println("<table border='0'  align='center' width='590px'><tr align='center' bgcolor='#CC99FF' height='50px'><td><b>ID</b></td><td><b>Name</b></td><td><b>Company</b><td><b>Quantity</b></td><td><b>Add Qun</b></td><td></td></tr>");
				 
				 while(r1.next()){
					 pc=r1.getString("b.i_code");
					 pn=r1.getString("i.i_name");
					 pcom=r1.getString("i.i_company");
					 pq=r1.getInt("b.i_quantity");
					
					%>
					  <form id="formID" method='post' action='updatestockData.jsp?pcode=<%=pc %>&bcode=<%=br %>'>
					 <tr align='center' bgcolor="#CCCCCC">
                	<td><% out.println(pc); %></td>
                    <td><% out.println(pn); %></td>
                    <td><% out.println(pcom); %></td>
                    <td><% out.println(pq); %></td>
                    <td><input type="text" class="validate[required,custom[onlyNumber],length[0,5]] text-input" size="11" name="pqun" id="pqun"></td>
                    <td><input type="submit" value="UPDATE"></td>
              </form>
                </tr>
					
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
