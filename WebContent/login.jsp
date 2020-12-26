<%@ page import="java.sql.ResultSet" %>
<%@page import="com.SwiftPackers.util.DbConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

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
	<%
		String EmailError = (String) request.getAttribute("EmailError");
		String PasswordError = (String) request.getAttribute("PasswordError");
		//String UserTypeError=(String)request.getAttribute("UserTypeError");
		String LoginError=(String)request.getAttribute("LoginError");
	%>
   
   <!-- HEADER INCLUDE -->
   <%@include file="header.jsp" %>
   
<!-- login section -->
<!--<h1 class="header-w3ls">
		</h1>-->
	<div class="appointment-w3">
		<%=LoginError == null ? "" : LoginError%>
		<form action="LoginServlet" method="post">
			<h2 class="sub-heading-wthree">Login</h2>
			<div class="main">
				<div class="form-left-w3l">
					<input type="email" name="emailId" placeholder="Email" required value="${EmailValue}">
					<%=EmailError == null ? "" : EmailError%>
				</div>
				<div class="form-right-w3ls ">

					<input type="password" name="password" placeholder="Password" required>
					<%=PasswordError == null ? "" : PasswordError%>

				</div>
				<br>
				
				<div class="clearfix"></div>
			</div>

			<div class="btnn">
				<button type="submit">Login</button>
				<br>
				
				
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