<%@ page import="com.SwiftPackers.bean.UserBean"%>

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
<!-- //css files -->

<!-- web-fonts -->
<link href="//fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&amp;subset=latin-ext" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese" rel="stylesheet">
<!-- //web-fonts -->
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
				<li>Our Services</li>
			</ul>
		</div>
	</div>
<!-- services section -->
<div class="services" id="services">
		<div class="heading">
			<h2>Our Services</h2>
		</div>
	<div class="container">
		<div class="servicegrids">
			<div class="servicetopgrids">
				<div class="col-md-4 servicegrid1">
					<h5>01</h5>
					<h4>ONLY DRIVER</h4>
					<p>We provide an option ,
					if you have to transport your haulage without the workers and vehicle
					,only need the driver to shift the haulage.</p>
				</div>
				<div class="col-md-4 servicegrid1">
					<h5>02</h5>
					<h4>ONLY CAR</h4>
					<p>We provide an option ,
					if you have to transport your haulage without the workers and driver
					,only need the car to shift the haulage.</p>
				</div>
				<div class="col-md-4 servicegrid1">
					<h5>03</h5>
					<h4>MOVE ALONG WITH HAULAGE</h4>
					<p>We provide an option ,
					if you have to travel along with your haulage 
					,provide the car or as per the requirement.</p>
				</div>
				<div class="clearfix"></div>
			</div>
			
				
		</div>
	</div>
</div>
<!-- //services section -->



<!-- services bottom -->
<div class="Servicebottom">
	<div class="layer">
	<div class="col-md-5">
	</div>
	<div class="col-md-7 Servicebottomtext">
		<h3>Fast and Safe Transport Service</h3>
		<h3>Specialized heavy-Duty Vehicles</h3>
		<h3>Shipping Services & Logistics Management</h3>
		
		
		<h4><i class="fa fa-truck" aria-hidden="true"></i>Truck Logistics Service</h4>
	</div>
	<div class="clearfix"></div>
	</div>
</div>
<!-- //services bottom -->



	
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