<%@page import="java.util.Vector" %>
<%@page import="java.sql.*" %>
<%@include file="DConnection.jsp" %>

<%
	String user = request.getParameter("user");
    String pwd = request.getParameter("password");
    String type = request.getParameter("type");
	
	out.println("<br>"+user);
	out.println("<br>"+pwd);
	out.println("<br>"+type);
	
	DConnection db = new DConnection();
	ResultSet rs1=null;
	String qry = "select * from login where u_id='"+user+"' and u_type ='"+type+"' and pwd ='"+pwd+"'";
	rs1 = db.getData(qry);
	String u="",p="";
	while(rs1.next()){
		u = rs1.getString("u_id");
		out.println("<br>"+u);
		p = rs1.getString("pwd");
		out.println("<br>"+p);	
	}
	if(u.equals(""))
		response.sendRedirect("index.jsp?msg=User Name or PassWord Worng");
	else if(!u.equals("") && type.equals("c")){
		session.setAttribute("username",u);
		session.setAttribute("type",type);

		Vector v = new Vector();
		session.setAttribute("Data", v);
		response.sendRedirect("cindex.jsp");
	}
	else {
		session.setAttribute("username",u);
		session.setAttribute("type",type);
		response.sendRedirect("aindex.jsp");
	}
%>