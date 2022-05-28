<%@page import="java.sql.*" %>
<%@include file="DConnection.jsp" %>
<%@include file="asession.jsp" %>

<%
	
	 String pcode = request.getParameter("pcode");
	 String pname = request.getParameter("pname");
	 String pcompany = request.getParameter("pcompany");
	 String pprice = request.getParameter("pprice");
	
	 
	 if(pcode!=""&&pname!=""&&pcompany!=""&&pprice!=""){
	 	DConnection db = new DConnection();
	 	String qry1="update item_detail set i_name='"+pname+"',i_company='"+pcompany+"',i_price="+pprice+" where i_code='"+pcode+"'";
	 	db.setData(qry1);
		response.sendRedirect("updateitem.jsp?msg=Update sucessful");
	 }
	else{
		response.sendRedirect("updateitem.jsp?msg=Update Unsucessful");
	}
%>