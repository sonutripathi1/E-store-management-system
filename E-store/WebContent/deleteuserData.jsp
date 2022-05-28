<%@page import="java.sql.*" %>
<%@include file="DConnection.jsp" %>
<%@include file="asession.jsp" %>

<%
 		String pc="";
		pc = request.getParameter("pc");
		if(pc!=null){
 		 	 DConnection db = new DConnection();
			 String sq="delete from branch_detail where b_code='"+pc+"'";
			 db.setData(sq);
			 sq="delete from branch_item where b_code='"+pc+"'";
			 db.setData(sq);
			 sq="delete from login where u_id='"+pc+"'";
			 db.setData(sq);
			 response.sendRedirect("deleteuser.jsp?msg=Branch Deleted Sucessfully");
		}
 %>
 