<!--
	Author: W3layouts
	Author URL: http://w3layouts.com
	License: Creative Commons Attribution 3.0 Unported
	License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@ page import="java.sql.ResultSet" %>
<%@page import="com.SwiftPackers.util.DbConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.SwiftPackers.bean.*" %>
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

<!-- css files -->
<link rel="stylesheet" href="css/bootstrap.css"> <!-- Bootstrap-Core-CSS -->
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" /> <!-- Style-CSS --> 
<link rel="stylesheet" href="css/font-awesome.css"> <!-- Font-Awesome-Icons-CSS -->
<link rel="stylesheet" href="cssl/fontl-awesome.min.css" /><!-- login -->
<link href="csss/style.css" rel='stylesheet' type='text/css' media="all"><!-- login -->

	
<link href="//fontsl.googleapis.com/css?family=Roboto:300,400,500" rel="stylesheet"><!-- login -->
<!-- //css files -->

<!-- web-fonts -->
<link href="//fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&amp;subset=latin-ext" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese" rel="stylesheet">
<!-- //web-fonts -->
</head>
<body>
<% UserBean userBean1=(UserBean) session.getAttribute("UserBean");%>
<div class="header">
		<nav class="navbar navbar-default">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<h1><a href="ShowRequestServlet"><img alt="" src="imagesA/logo.png"></a></h1>
					</div>
<%
	UserBean userBean = (UserBean) session.getAttribute("UserBean");%>
					
					<!-- navbar-header -->
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav navbar-left">
							<li><a class="hvr-underline-from-center active" href="UserHome.jsp">Home</a></li>
							<li><a href="services.jsp" class="hvr-underline-from-center">Services</a></li>
							
							<li><a href="gallery.jsp" class="hvr-underline-from-center">Gallery</a></li>
							
									
							<li><a href="contact.jsp" class="hvr-underline-from-center">Contact</a>
						</ul>
						<ul class="nav navbar-nav navbar-right">
							<li><a href="ShowRequestServlet" class="hvr-underline-from-center">My Shipments</a></li>
							<li><a href="ShowVenProfileServlet?userId=<%=userBean.getUserId()%>" class="hvr-underline-from-center">My Profile</a></li>
							<li><a href="LogoutServlet" class="hvr-underline-from-center">Logout</a></li>
						</ul>
					</div>

					<div class="clearfix"> </div>	
				</nav>
	
	</div>		
<div class="banner1">
</div>
<div class="about-breadcrumb">
		<div class="container">
			<ul>
				<li><a href="ShowRequestServlet">Home</a><i>></i></li>
				<li>Place Quotation</li>
			</ul>
		</div>
	</div>
<!-- signup section -->


	<%
	String haulId=request.getParameter("haul_id");
	//String custId=request.getParameter("cust_id");	
	
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try 
		{
			con = DbConnection.getConnection();
			stmt = con.createStatement();
			String selectQ = "select * from haulage where haul_id="+haulId;
			rs = stmt.executeQuery(selectQ);

		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	%>


	<%
		//String haulId=request.getParameter("haul_id");
		//String custId=request.getParameter("cust_id");
		String HaulageTitleError = (String) request.getAttribute("HaulageTitleError");//null
		String DeliveryDateError = (String) request.getAttribute("DeliveryDateError");
		String QuotPriceError = (String) request.getAttribute("QuotPriceError");
		
	%>




<div class="w3ls-banner">
	<div class="heading">
		<h1>Place Quotation</h1>
	</div>
		<div class="container">
			
			<div class="agile-form">
				<form action="PlaceQuotationServlet" method="post">
					<ul class="field-list">
						<% if(rs.next())
		{
		%>
						<li>
							<input type="hidden" name="haulId" value=<%=haulId%>>
							<input type="hidden" name="custId" value=<%=rs.getString("cust_id")%>>
						</li>
						<li class="name">
							<label class="form-label"> Customer Haulage Title<span class="form-required"> </span></label>
							<div class="form-input">
								
									<input type="text" name="haulageTitle" value="<%=rs.getString("haul_title")%>" disabled/>
							</div>
						</li>
						<li>
							<label class="form-label"> Delivery Date<span class="form-required"> * </span></label>
							<div class="form-input">
								<input type="date" required min="<%=rs.getString("Booking_date")%>" max="2019-5-8" name="deliveryDate" value="${DeliveryDateValue}" />
								<%=DeliveryDateError == null ? "" : DeliveryDateError%>
							</div>
						</li>
						<li> 
							<label class="form-label"> Quotation Price <span class="form-required"></span></label>
							<div class="form-input">
								<input type="text"  required  name="quotPrice" value="${QuotationValue}" />
								<%=QuotPriceError == null ? "" : QuotPriceError%>
							</div>
						</li>
						
						<%} %>
						
						
						
					</ul>
					<div class="submit_btn">
						<input type="submit" value="Place Quotation">
					</div>
					<br>
				</form>	
			</div>
		</div>
<!--signup close>


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
			/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
			*/
								
			$().UItoTop({ easingType: 'easeOutQuart' });
								
			});
	</script>
	<!-- //here ends scrolling icon -->
<!-- start-smoth-scrolling -->

</body>
</html>