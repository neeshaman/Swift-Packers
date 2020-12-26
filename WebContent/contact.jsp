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
<%@ page import="com.SwiftPackers.bean.UserBean"%>
<!-- HEADER INCLUDE -->
   <%@include file="header.jsp" %>		
<div class="banner1">
</div>
<div class="about-breadcrumb">
	<div class="container">
		<ul>
			<li><a href="UserHome.jsp">Home</a><i>></i></li>
			<li>Contact</li>
		</ul>
	</div>
</div>

<%
	String NameError=(String)request.getAttribute("NameError");
	String DescriptionError=(String)request.getAttribute("DescriptionError");
	String SuccessMessage=(String)request.getAttribute("SuccessMessage");

%>

<div class="w3ls_address_mail_footer_grids">
	<div class="heading">
		<h2>locate us</h2>
	</div>
	<div class="container">
		<iframe width="450" height="600" frameborder="0" style="border:0" allowfullscreen src="https://maps.google.com/maps?width=450&height=600&hl=en&coord=23.188117599999998,72.62799703256835&q=DAIICT+(Daiict)&ie=UTF8&t=&z=14&iwloc=B&output=embed" ></iframe>
		
		<!-- <iframe src="https://www.google.com/maps/place/DA-IICT,+near,+DAIICT-campus,+Reliance+Cross+Rd,+Gandhinagar,+Gujarat+382007/@23.1885469,72.6290294,17z/data=!4m2!3m1!1s0x395c2a3c9618d2c5:0xc54de484f986b1fa" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe> -->
			<div class="col-md-6 contact-form">
				<center><%=SuccessMessage==null?" ":SuccessMessage%></center><br>
				<h4 class="white-w3ls">Contact <span>Form</span></h4>
				<form action="ContactFormServlet" method="post">
					<div class="styled-input agile-styled-input-top">
						<input type="text" name="name" required value="${NameValue}">
						<label>Name</label>
						<%=NameError==null?" ":NameError%>
						<span></span>
					</div>
					<div class="styled-input">
						<textarea name="description" value="${DescriptionValue}" required></textarea>
						<label>Message</label>
						<%=DescriptionError==null?" ":DescriptionError%>
						<span></span>
					</div>	 
					<input type="submit" value="SEND">
				</form>
			</div>
			<div class="col-md-6 contactright">
				<h3>Contact Address</h3>
				<div class="w3ls_footer_grid_left">
					<div class="wthree_footer_grid_left">
						<i class="fa fa-map-marker" aria-hidden="true"></i>
					</div>
					<p>Reliance circle,Gandhinagar <span> Gujarat,India.</span></p>
				</div>
				<div class="w3ls_footer_grid_left">
					<div class="wthree_footer_grid_left">
						<i class="fa fa-phone" aria-hidden="true"></i>
					</div>
					<p>+91(079)23297201 <span>+91(079)23297201</span></p>
				</div>
				<div class="w3ls_footer_grid_left">
					<div class="wthree_footer_grid_left">
						<i class="fa fa-envelope-o" aria-hidden="true"></i>
					</div>
						<p><a href="swiftpackers@gmail.com">swiftpackers@gmail.com</a> 
				</div>
			</div>
			<div class="clearfix"> </div>
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