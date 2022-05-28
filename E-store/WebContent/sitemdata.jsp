<%@page import="java.sql.*" %>
<%@include file="DConnection.jsp" %>
<%@include file="asession.jsp" %>


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