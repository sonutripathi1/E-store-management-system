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
        
        <h1>Add Product in Branch</h1>

               
<%
	String msg="";
	msg = request.getParameter("msg");
	if(msg!=null)
		out.println("<center><br><h3>"+msg+"</h3></center>");
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
			 String type = request.getParameter("select");
			 DConnection db = new DConnection();
	 		 ResultSet rs1=null;
	 		 String qry = "select * from item_detail where "+type+" LIKE '"+id+"%'";
	 		 rs1 = db.getData(qry);
	         String pc="",pn="",pcom="";
			 int pp=0,pq=0;
			 out.println("<table border='0'  align='center' width='590px'><tr align='center' bgcolor='#CC99FF' height='50px'><td><b>Item ID</b></td><td><b>Name</b></td><td><b>Item Company</b><td><b>Price</b></td><td></td></tr>");
	         while(rs1.next()){
				pc = rs1.getString("i_code");
				pn = rs1.getString("i_name");
				pcom = rs1.getString("i_company");
				pp = rs1.getInt("i_price");
				%>
				
                <tr align='center' bgcolor="#CCCCCC">
                	<td><% out.println(pc); %></td>
                    <td><% out.println(pn); %></td>
                    <td><% out.println(pcom); %></td>
                    <td><% out.println(pp); %></td>
                </tr>
		   <%  }
			 out.println("</table>");
	 }
		
 %> 
        
        
        
        
				
<form id="formID" method="get" action="">
        <table width="80%" border="0" align="center">
        <tr height="60px">
        <td width="136" align="center"> Product ID:
        	</td>
			<td width="152"><input class="validate[required,custom[noSpecialCaracters],length[0,20],ajax[ajaxUser]]" type="text" name="pid" id="pid" /></td>
            </tr>
           <tr height="60px"><td width="136" align="center">Product Quantity : </td>
            <td>
			<input class="validate[required,custom[onlyNumber],length[0,5]] text-input"  type="text" name="pq" id="pq" />			</td></tr>
          
          <tr height="60px"><td width="136" align="center">Select Branch : </td>
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
             </td></tr>  
            
             <tr height="60px"><td colspan="2" align="center">
			<input class="submit" type="submit" value="Submit"/>
            </td>
            </tr>
          </table>
		</form>
        
        <%
	
	 String pcd="";
	 pcd = request.getParameter("pid");
	 if(pcd!=null){
		String pquan = request.getParameter("pq");
		String b = request.getParameter("select");
		
		if(pquan.equals("")){
			response.sendRedirect("addbranch.jsp?msg=Enter Quantity");
		}
	 	DConnection db = new DConnection();
	 	ResultSet rs3=null;
	 	String qry3 = "select * from item_detail where i_code='"+pcd+"'";
	 	rs3 = db.getData(qry3);
	 	String pc1="";
	 	while(rs3.next()){
			pc1 = rs3.getString("i_code");	
		}
		if(!pc1.equals("")){
			String qry1 = "insert into branch_item values('"+b+"','"+pcd+"',"+pquan+")";
			db.setData(qry1);
			
			response.sendRedirect("addbranch.jsp?msg=Product Quantity Added Sucessfully");
		}
		else{
			response.sendRedirect("addbranch.jsp?msg=Product Already in Store");
		}
	 }
%>
                	
		</div>
	</div>
	<%@ include file="menu/footer.jsp" %>
</div>
</body>
</html>
