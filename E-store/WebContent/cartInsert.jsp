<%@page import="java.sql.*" %>
<%@page import="java.util.Vector" %>
<%@include file="DConnection.jsp" %>
<%@include file="CartData.jsp" %>
<%@include file="csession.jsp" %>


<html>
<head>

		<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
		<title>User Home</title>
		
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
	<%@ include file="menu/ccmenu.jsp" %>	
	<div id="content-wrap">
		<%@ include file="menu/csidemenu.jsp" %>
		
		<!-- write your code here -->
		<div id="main">
					


<%
			String del1="";
			del1=request.getParameter("del1");
			try{
			if(del1!=null){		
				String a = request.getParameter("pqun");
				if(a!=""){
					
 		 		Vector v ;
		 		v = (Vector) session.getAttribute("Data");
		 		CartData d;
         		int f=1;
		 		String cart = request.getParameter("cart");
		 		if(cart!=null){
			 
		 			String pcode = request.getParameter("pcode");
	 	 			String pname = request.getParameter("pname");
	 	 			String pcompany = request.getParameter("pcompany");
           
           			int pprice = Integer.parseInt(request.getParameter("pprice"));
	 	 			int pquantity = Integer.parseInt(request.getParameter("pquantity"));
					int pqun = Integer.parseInt(request.getParameter("pqun"));
			
					if(pquantity<pqun){
						response.sendRedirect("cart.jsp?msg=Quantity high");
					}
					else{

						int i;
	
						for(i=0;i<v.size();i++){
				
						d = new CartData();
						d = (CartData) v.get(i);
		
						if(pcode.equals(d.getCode())){
							pqun = pqun + d.getQuantity();
				    
							if(pqun<pquantity){							
                    	  	d.setQuantity(pqun);
						  	v.set(i,d);
						  //v.setElementAt(d,i);
						  	session.removeAttribute("Data");
						  	session.setAttribute("Data",v);
						  
						  	f=0;
						  	break;
							}else{
								f=0;
								response.sendRedirect("cart.jsp?msg=Quantity high");
							}
						}else{
							f=1;	
						}	
						}
						if(f==1){
							d = new CartData();
                			d.setData(pcode,pname,pcompany,pprice,pqun);
                			v.add(d);
							session.setAttribute("Data",v);
						}
		  			}
	    		 }
			   }else{ response.sendRedirect("cart.jsp?msg=Enter Quantity"); }
			}
		}catch(Exception e){
			response.sendRedirect("cart.jsp?msg=Enter Number");
		}
 %>
 
 
 
 <%
	     String del2="";
		 del2=request.getParameter("del1");
		 if(del2!=null){
		out.println("<h1>Cart Data</h1>");
		 Vector v1;
		 v1 = (Vector) session.getAttribute("Data");
		 CartData d1 = new CartData();
		 int j=0;
		 int total=0;
		  out.println("<table border='0'  align='center' width='590px'><tr align='center' bgcolor='#CC99FF' height='50px'><td><b>ID</b></td><td><b>Name</b></td><td><b>Company</b><td><b>Price</b></td><td><b>Quantity</b></td><td></td></tr>");
		 for(j=0;j<v1.size();j++){
			 d1 = (CartData) v1.get(j); 
		%>
			 
			 <form id="formID" method='post' action='cartInsert.jsp?delete=delete&code=<%=j %>' name="srch">
                <tr align='center' bgcolor="#CCCCCC">
                	<td><% out.println(d1.getCode()); %></td>
                    <td><% out.println(d1.getName()); %></td>
                    <td><% out.println(d1.getCompany()); %></td>
                    <td><% out.println(d1.getPrice()*d1.getQuantity()); %></td>
                    <td><% out.println(d1.getQuantity()); %></td>
                   <td><input type="submit" value="Delete" ></td>
              </form>
                </tr>
                <% total = total + (d1.getPrice() * d1.getQuantity()); 
				 
		    
		 }
		 %>
		 <tr bgcolor="#9933FF" align="center">
		 <td>Total</td><td></td><td></td><td><% out.println(total); %></td><td></td>
         </tr>
         <%
		 out.println("</table>");%>
		 <a href="cart.jsp" ><h3>Add More Product</h3></a>
		<a href="cartInsert.jsp?check=checkout" ><h3>Checkout </h3></a><%
		 
		 }
 %>
 
 <%
	String del = "";
	int c;
	
	del=request.getParameter("delete");
	Vector vc = new Vector();
	if(del!=null){
		c = Integer.parseInt(request.getParameter("code"));
		vc = (Vector) session.getAttribute("Data");
		 vc.removeElementAt(c);
		 session.removeAttribute("Data");
		session.setAttribute("Data",vc);
		response.sendRedirect("cart.jsp?msg=New Cart");
	}
 %>
 
 
<%
		 String check="";
		 check = request.getParameter("check");
		 if(check!=null){
		 Vector v2;
		 v2 = (Vector) session.getAttribute("Data");
		 CartData d2 = new CartData();

			DConnection r = new DConnection();
			ResultSet rq = null;
					 
		 	String nb = "Select count(bill_no)'No' from bill";
			rq = r.getData(nb);
			int b_no=0;
			while(rq.next()){
				b_no = rq.getInt("No")+1;	
			}
			
		 	String user = (String)session.getAttribute("username");
		 
		 int k=0;
		 int total1=0;
		 out.println("<h1>Your Bill</h1>");
		  out.println("<table border='0'  align='center' width='590px'><tr align='center' bgcolor='#CC99FF' height='50px'><td><b>ID</b></td><td><b>Name</b></td><td><b>Company</b><td><b>Price</b></td><td><b>Quantity</b></td></tr>");
		 for(k=0;k<v2.size();k++){
			 d2 = (CartData) v2.get(k); 
		%>
                <tr align='center' bgcolor="#CCCCCC">
                	<td><% out.println(d2.getCode()); %></td>
                    <td><% out.println(d2.getName()); %></td>
                    <td><% out.println(d2.getCompany()); %></td>
                    <td><% out.println(d2.getPrice()*d2.getQuantity()); %></td>
                    <td><% out.println(d2.getQuantity()); %></td>
                   
                </tr>
           <%
		    total1 = total1 + (d2.getPrice() * d2.getQuantity()); 
			String q1 = "update branch_item set i_quantity = i_quantity - "+d2.getQuantity()+" where i_code = '"+d2.getCode()+"' and b_code = '"+user+"'";
			r.setData(q1);
			String q2 = "insert into bill_detail values('"+b_no+"','"+d2.getCode()+"',"+d2.getQuantity()+")";
			r.setData(q2);
				 
		 }
		 
		 if(total1!=0){
		 	String qry1 = "insert into bill values('"+b_no+"','"+user+"',NOW(),"+total1+")";
		 	r.setData(qry1);
			v2.removeAllElements();
			session.removeAttribute("user");
			session.setAttribute("Data", v2);
		 }else{
			 response.sendRedirect("cindex.jsp?msg=Create new cart");
		 }
		 %>
		 <tr bgcolor="#9933FF" align="center">
		 <td>Total</td><td></td><td></td><td><% out.println(total1); %></td><td></td>
         </tr>
         <%
		 out.println("</table>"); %>
		 <a href="cart.jsp" ><h3>New Cart</h3></a>
		<%
		 }
 %>
 
 
</div>
	</div>
	<%@ include file="menu/footer.jsp" %>
</div>
</body>
</html>