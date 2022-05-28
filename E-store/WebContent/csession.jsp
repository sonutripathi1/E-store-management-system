<%
	String ses[] = session.getValueNames();
	
	if(ses.length==0)
		response.sendRedirect("index.jsp");
	
	for(int le=0;le<ses.length;le++){
		if(ses[le].equals("type")){
			if(session.getAttribute("type").equals("a"))
				response.sendRedirect("aindex.jsp");
		}
	}
%>