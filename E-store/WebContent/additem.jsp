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
        
        <h1>Add New Product </h1>
				
                
<%
	String msg="";
	msg = request.getParameter("msg");
	if(msg!=null)
		out.println("<center><br><h3>"+msg+"</h3></center>");
%>
<form id="formID" method="get" action="">
        <table width="80%" border="0" align="center">
        <tr height="60px">
        <td width="136" align="center"> Product ID:
        	</td>
			<td width="152"><input class="validate[required,custom[noSpecialCaracters],length[0,20],ajax[ajaxUser]]" type="text" name="pcode" id="pcode" /></td>
            </tr>
            <tr height="60px"><td width="136" align="center">Product Name : </td>
            <td>
			<input class="validate[required,custom[noSpecialCaracters],length[0,20],ajax[ajaxUser]]" type="text" name="pname" id="pname" />			</td></tr>
             <tr height="60px"><td width="136" align="center">Product Company : </td>
            <td>
			<input class="validate[required,custom[noSpecialCaracters],length[0,20],ajax[ajaxUser]]" type="text" name="pcompany" id="pcompany" />			</td></tr>
            <tr height="60px"><td width="136" align="center">Product Price : </td>
            <td>
			<input class="validate[required,custom[onlyNumber],length[0,5]] text-input"  type="text" name="pprice" id="pprice" />			</td></tr>
              
            
             <tr height="60px"><td colspan="2" align="center">
			<input class="submit" type="submit" value="Submit"/>
            </td>
            </tr>
          </table>
		</form>
        
        <%
	
	 String pcode="";
	 pcode = request.getParameter("pcode");
	 if(pcode!=null){
	 	String pname = request.getParameter("pname");
		String pcompany = request.getParameter("pcompany");
	 	String pprice = request.getParameter("pprice");

			 
	 	DConnection db = new DConnection();
	 	ResultSet rs1=null;
	 	String qry = "select * from item_detail where i_code='"+pcode+"'";
	 	rs1 = db.getData(qry);
	 	String pc="";
	 	while(rs1.next()){
			pc = rs1.getString("i_code");	
		}
		if(pc.equals("")){
			String qry1 = "insert into item_detail values('"+pcode+"','"+pname+"','"+pcompany+"',"+pprice+")";
			db.setData(qry1);
			
			response.sendRedirect("additem.jsp?msg=Product Added Sucessfully");
		}
		else{
			response.sendRedirect("additem.jsp?msg=Product Already In Store");
		}
	 }
%>
                	
		</div>
	</div>
	<%@ include file="menu/footer.jsp" %>
</div>
</body>
</html>
