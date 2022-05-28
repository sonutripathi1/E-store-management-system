<%@page import="java.sql.*" %>
<%@include file="DConnection.jsp" %>
<%@include file="asession.jsp" %>

<%
	
	 String bcode = request.getParameter("bcode");
	 String bname = request.getParameter("bname");
	 String badd = request.getParameter("badd");
	
	 
	 if(bcode!=""&&bname!=""&&badd!=""){
	 	DConnection db = new DConnection();
	 	String q;
		q="update branch_detail set b_name='"+bname+"', b_address='"+badd+"' where b_code='"+bcode+"'";
		
	 	db.setData(q);
		response.sendRedirect("updateuser.jsp?msg=Update sucessful");
	 }
	else{
		response.sendRedirect("updateuser.jsp?msg=Update Unsucessful");
	}
%>