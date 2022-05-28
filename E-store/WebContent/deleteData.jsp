<%@page import="java.sql.*" %>
<%@include file="DConnection.jsp" %>
<%@include file="asession.jsp" %>

<%
 		String pc="";
		pc = request.getParameter("pc");
		if(pc!=null){
 		 	 DConnection db = new DConnection();
			 String sq="delete from item_detail where i_code='"+pc+"'";
			 db.setData(sq);
			 sq="delete from branch_item where i_code='"+pc+"'";
			 db.setData(sq);
			 response.sendRedirect("deleteitem.jsp?msg=Deleted Sucessfully");
		}
 %>
 