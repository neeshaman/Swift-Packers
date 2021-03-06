<%@ page import="com.SwiftPackers.bean.UserBean"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Swift Packers</title>
<!-- Meta tag Keywords -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<meta name="keywords"
	content="Transporters web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webDesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web Designs" />
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
function hideURLbar(){ window.scrollTo(0,1); } 
</script>

<!--// Meta tag Keywords -->
<%
	UserBean userBean = (UserBean) session.getAttribute("UserBean");
%>
<!-- css files -->
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/font-awesome.css">
<link rel="stylesheet" href="cssl/fontl-awesome.min.css" />
<link href="csss/style.css" rel='stylesheet' type='text/css' media="all">
<link href="//fontsl.googleapis.com/css?family=Roboto:300,400,500" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&amp;subset=latin-ext"
	rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese"
	rel="stylesheet">


</head>
<body>
	<div class="header">
		<nav class="navbar navbar-default">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<h1>
					<a href="UserHome.jsp">   <img alt="" src="imagesA/logo.png">	</a>
				</h1>
			</div>

			<!-- navbar-header -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-left">
					<li><a class="hvr-underline-from-center active"
						href="UserHome.jsp">Home</a></li>
					<li><a href="services.jsp" class="hvr-underline-from-center">Services</a></li>

					<li><a href="gallery.jsp" class="hvr-underline-from-center">Gallery</a></li>


					<li><a href="contact.jsp" class="hvr-underline-from-center">Contact</a>
					<li><a href="SearchVendors.jsp" class="hvr-underline-from-center">Search</a>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="CustFinalServlet"
						class="hvr-underline-from-center ">My Shipments</a></li>
					<li><a	href="ShowProfileServlet?userId=<%=userBean.getUserId()%>"
						class="hvr-underline-from-center">My Profile</a></li>
					<li><a href="LogoutServlet" class="hvr-underline-from-center">Logout</a></li>

				</ul>
			</div>

			<div class="clearfix"></div>
		</nav>

	</div>
	 <div class="banner1"></div> 
	<div class="about-breadcrumb">
		<div class="container">
			<ul>
				<li><a href="UserHome.jsp">Home</a><i>></i></li>
				<li>Customer</li>
			</ul>
		</div>
	</div>
	<!-- Customer-->
	<div class="w3ls-banner" style="min-height:80vh;">
		<div class="heading">
			<h1>Customer Details</h1>
		</div>
		<div class="container" style="border:5px double white;">
			<div class="heading">
				<br>
				<br>
				<p>Where do you want to shift??</p>
			</div>
			<div class="agile-form">
			
				<form action="customer1.jsp" method="post">
			
					<div class="field-list">
						<div class="form-input add">
							<center>
								&nbsp;&nbsp;<input type="radio" name="area" value="within" required>&nbsp;&nbsp;&nbsp;&nbsp;Within
								the city<br> 
								&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="area"
									value="outside" required>&nbsp;&nbsp;&nbsp;&nbsp;Outside the city
							</center>
						</div>
					</div>
					<br>
					<div class="submit_btn">
						<input type="submit" value="Next">
					</div>
					<br><br>
				</form>
			</div>
		</div>
	</div>
		
<!-- Customer-->
	<!-- footer -->
			<%@include file="footer.jsp" %>
		<!-- //footer -->
	


		<!-- js-scripts -->
		<!-- js -->
		<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.js"></script>
		<!-- Necessary-JavaScript-File-For-Bootstrap -->
		<!-- //js -->
		<!-- //js-scripts -->

		<!-- start-smoth-scrolling -->
		<script src="js/SmoothScroll.min.js"></script>
		<script type="text/javascript" src="js/move-top.js"></script>
		<script type="text/javascript" src="js/easing.js"></script>
		<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event) {
					event.preventDefault();
					$('html,body').animate({
						scrollTop : $(this.hash).offset().top
					}, 1000);
				});
			});
		</script>
		<!-- here stars scrolling icon -->
		<script type="text/javascript">
			$(document).ready(function() {
			$().UItoTop({
					easingType : 'easeOutQuart'
				});

			});
		</script>
		<!-- //here ends scrolling icon -->
		<!-- start-smoth-scrolling -->
</body>
</html>