
<%@ page import="java.sql.ResultSet" %>
<%@page import="com.SwiftPackers.util.DbConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.SwiftPackers.bean.UserBean" %>
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

	<%
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try 
		{
			con = DbConnection.getConnection();
			stmt = con.createStatement();
			String selectQ = "select * from city";
			rs = stmt.executeQuery(selectQ);
		
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	%>



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

<%		
		session.getAttribute("UserBean");
	%>


	<%
	
		String AddressError = (String) request.getAttribute("AddressError");
		String MaxVehicleError = (String) request.getAttribute("MaxVehicleError");
		String LicenseError = (String) request.getAttribute("LicenseError");
		String CompanyNameError=(String)request.getAttribute("CompanyNameError");
		String StreetAddressError=(String)request.getAttribute("StreetAddressError");
		String CityError=(String)request.getAttribute("CityError");
		String CodeError=(String)request.getAttribute("CodeError");
	%>



<div class="header">
		<nav class="navbar navbar-default">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<h1><a href="UserHome.jsp"><img src="imagesA/logo.png"></a></h1>
					</div>
					
					<!-- navbar-header -->
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav navbar-left">
							<li><a class="hvr-underline-from-center active" href="UserHome.jsp">Home</a></li>
							<li><a href="services.jsp" class="hvr-underline-from-center">Services</a></li>
							
							<li><a href="gallery.jsp" class="hvr-underline-from-center">Gallery</a></li>
							
									
							<li><a href="contact.jsp" class="hvr-underline-from-center">Contact</a>
							<li><a href="SearchVendors.jsp" class="hvr-underline-from-center">Search</a></li>
						</ul>
						<ul class="nav navbar-nav navbar-right">
							<li><a href="login.jsp" class="hvr-underline-from-center">Login</a></li>
							<li><a href="Signup.jsp" class="hvr-underline-from-center">SignUp</a></li>
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
				<li><a href="UserHome.jsp">Home</a><i>></i></li>
				<li>SignUp</li>
			</ul>
		</div>
	</div>
<!-- signup section -->
<div class="w3ls-banner">
	<div class="heading">
		<h1>SignUp Form</h1>
	</div>
		<div class="container">
			<div class="heading">
				<p>Fill up few more details and submit.</p>
			</div>
			<div class="agile-form">
				<form action="Vendor_detailFormServlet" method="post" enctype="multipart/form-data">
					<ul class="field-list">
						<li> 
							<label class="form-label">Company name: <span class="form-required"> * </span></label>
							<div class="form-input">
								<input type="text" name="companyName" placeholder="Company name" required value="${CompanyNameValue}">
								<%=CompanyNameError==null?"": CompanyNameError %>
							</div>
						</li>
						
						<li> 
							<label class="form-label">
							   Office Address
							   <span class="form-required"> * </span>
							</label>
							<div class="form-input add">
								<span class="form-sub-label">
								<input type="text" name="streetAddress" placeholder="Street Address " required>
								</span>
								<span class="form-sub-label">
									<input type="text" name="landmark" placeholder="Area" required><%=StreetAddressError==null?" ":StreetAddressError%>
								</span>
								<span class="form-sub-label">
									<select  name="city" required>
											<option value="-1">Please select city</option>
											<%
												String id,name;
												while (rs.next()) {
													id = rs.getString("city_id");
													name = rs.getString("city_name");
											%>
											<option value="<%=name%>"><%=name%></option>
											<%
												}
											%>
									</select><%=CityError==null?" ":CityError%>
								</span>
								<br><br>							
								<span class="form-sub-label last">
									<input type="text" name="state"  value="Gujarat" disabled>
								</span>
								<span class="form-sub-label last">
									<input type="text" name="code" placeholder="Postal / Zip Code " required><%=CodeError==null?" ":CodeError%>
								</span>
								
							</div>
						</li>
						<li> 
							<label class="form-label"> Number of Vehicle(You have) <span class="form-required"> * </span></label>
							<div class="form-input">
								<input type="text" name="maxVehicle" placeholder="Number of Vehicles" required value="${MaxVehicleValue}">
								<%=MaxVehicleError==null?"": MaxVehicleError %>
							</div>
						</li>
						
											
					</ul>
					<div class="submit_btn">
						<input type="submit" value="SignUp">
					</div>
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
		$().UItoTop({ easingType: 'easeOutQuart' });
								
			});
	</script>
	<!-- //here ends scrolling icon -->
<!-- start-smoth-scrolling -->

</body>
</html>