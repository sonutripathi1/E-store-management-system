<%@page import="java.sql.*" %>
<%@include file="DConnection.jsp" %>
<%@include file="asession.jsp" %>

<%
	
	 String bcode = request.getParameter("bcode");
	 String icode = request.getParameter("pcode");
	 String qun = request.getParameter("pqun");
	
	 
	 if(qun!=""){
	 	DConnection db = new DConnection();
	 	String q;
		//out.println(" "+bcode+" "+bname+" "+qun);
		q="update branch_item set i_quantity= i_quantity + "+qun+" where b_code = '"+bcode+"' and i_code = '"+icode+"'";
		
	    db.setData(q);
		response.sendRedirect("updatestock.jsp?msg=Update sucessful");
	 }
	else{
		response.sendRedirect("updatestock.jsp?msg=Update Unsucessful");
	}
%>