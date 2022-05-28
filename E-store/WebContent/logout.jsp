<%
	session.removeAttribute("username");
	session.removeAttribute("type");
	session.removeAttribute("Data");
	response.sendRedirect("index.jsp");
%>