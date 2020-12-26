<%@ page import="java.sql.ResultSet" %>
<%@page import="com.SwiftPackers.util.DbConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Swift Packers</title>

<!-- Meta tag Keywords -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Transporters web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webDesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web Designs" />

<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--// Meta tag Keywords -->

<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="all"/>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"><link rel="stylesheet" href="css/bootstrap.css"> <!-- Bootstrap-Core-CSS -->
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" /> 
<link rel="stylesheet" href="css/font-awesome.css"> 
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

</head>
<body>


   
   <!-- HEADER INCLUDE -->
   <%@include file="header.jsp" %>
	<div class="banner1">
	</div>
	<div class="about-breadcrumb">
		<div class="container">
			<ul>
				<li><a href="UserHome.jsp">Home</a><i>></i></li>
				<li>Feedback</li>
			</ul>
		</div>
	</div>

	<%
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try 
		{
			con = DbConnection.getConnection();
			stmt = con.createStatement();
			String selectQ = "select * from user";
			rs = stmt.executeQuery(selectQ);

		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	%>


	<%
		String IsResponseError = (String) request.getAttribute("IsResponseError");
		String DescriptionError = (String) request.getAttribute("DescriptionError");
		String CustIdError = (String) request.getAttribute("CustIdError");
		String VenIdError = (String) request.getAttribute("VenIdError");
	%>
	<div class="w3ls_address_mail_footer_grids" style="padding: 6em;">
		<div class="container">
			<div class="col-md-12 contact-form" style="padding : 0 !important;">
				<h4 class="white-w3ls">Feedback <span>Form</span></h4>
				<form action="FeedbackFormServlet" method="post">
					<div class="styled-input agile-styled-input-top">
						<input type="text" name="name" required value="${IsResponseValue}">
						<label>Name</label>
						<%=IsResponseError == null ? "" : IsResponseError%>
						<span></span>
					</div>
					<div class="styled-input agile-styled-input-top">
						<textarea cols="30" name="description" rows="5" value="${DescriptionValue}"></textarea>
						<label>Message</label>
						<%=DescriptionError==null?" ":DescriptionError%>
						<span></span>
					</div>	 
					<input type="submit" value="SEND">
				
		 </form>
			</div>

	</div>
	</div>
	<!-- footer -->
		<%@include file="footer.jsp" %>
	<!-- //footer -->
<!-- js-scripts -->					
<!-- js -->
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script> <!-- Necessary-JavaScript-File-For-Bootstrap --> 
<!-- //js -->	
<!-- //js-scripts -->

<!-- start-smoth-scrolling -->
<script src="js/SmoothScroll.min.js"></script>
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
</script>
<!-- here stars scrolling icon -->
	<script type="text/javascript">
		$(document).ready(function() {
		$().UItoTop({ easingType: 'easeOutQuart' });
								
			});
	</script>
	<!-- //here ends scrolling icon -->
<!-- start-smoth-scrolling -->
</body>
</html>