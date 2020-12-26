<!--
	Author: W3layouts
	Author URL: http://w3layouts.com
	License: Creative Commons Attribution 3.0 Unported
	License URL: http://creativecommons.org/licenses/by/3.0/
-->


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
<link href="cssl/style.css" rel='stylesheet' type='text/css' media="all"><!-- login -->
<link href="//fontsl.googleapis.com/css?family=Roboto:300,400,500" rel="stylesheet"><!-- login -->
<!-- //css files -->

<!-- web-fonts -->
<link href="//fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&amp;subset=latin-ext" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese" rel="stylesheet">
<!-- //web-fonts -->
</head>
<body>
<div class="header">
		<nav class="navbar navbar-default">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<h1><a href="index.html"><img alt="" src="imagesA/logo.png">	</a></h1>
					</div>
					
					<!-- navbar-header -->
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav navbar-left">
							<li><a class="hvr-underline-from-center active" href="UserHome.jsp">Home</a></li>
							<li><a href="services.jsp" class="hvr-underline-from-center">Services</a></li>
							
							<li><a href="gallery.jsp" class="hvr-underline-from-center">Gallery</a></li>
							
									
							<li><a href="contact.jsp" class="hvr-underline-from-center">Contact</a>
						</ul>
						<ul class="nav navbar-nav navbar-right">
							<li><a href="login.jsp" class="hvr-underline-from-center">Login</a></li>
							<li><a href="Signup.jsp" class="hvr-underline-from-center">SignUp</a></li>
							
						</ul>
					</div>

					<div class="clearfix"> </div>	
				</nav>
	
	</div>		
	<%String EmailError=(String)request.getAttribute("EmailError");%>
<div class="banner1">
</div>
<div class="about-breadcrumb">
		<div class="container">
			<ul>
				<li><a href="UserHome.jsp">Home</a><i>></i></li>
				<li>Forget Password</li>
			</ul>
		</div>
	</div>
<!-- login section -->
<!--<h1 class="header-w3ls">
		</h1>-->
	<div class="appointment-w3">

		<form action="ForgetPasswordServlet" method="post">
			<h2 class="sub-heading-wthree">Forget Password</h2>
			<div class="main">
				<div class="form-left-w3l">
					<input type="email" name="emailId" placeholder="Your registered Email Id" required value="${EmailValue}">
					<%=EmailError == null ? "" : EmailError%> 
					
				</div>
				<div class="clearfix"></div>

			</div>
			<div class="btnn">
				<button type="submit">Recover me..!!</button><br>
				
				
				<div class="clear"></div>
			</div>


			
		</form>
	</div>


<!--login section close-->
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