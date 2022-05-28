<%@include file="asession.jsp" %>

<html>
<head>

		<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
		<title>Admin Home</title>
		
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
	<%@ include file="menu/amenu.jsp" %>	
	
	<div id="content-wrap">
		<%@ include file="menu/asidemenu.jsp" %>
		
		<!-- write your code here -->
		<div id="main">
					<h1> Welcome To Admin </h1>
					<%@ include file="slider.html" %>
                    
                    <br><br>
		</div>
	</div>
	<%@ include file="menu/footer.jsp" %>
</div>
</body>
</html>
