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
   <!-- HEADER INCLUDE -->
   <%@include file="header.jsp" %>
   
<div class="banner1"> </div>
<div class="about-breadcrumb">
		<div class="container">
			<ul>
				<li><a href="UserHome.jsp">Home</a><i>></i></li>
				<li>Customer</li>
			</ul>
		</div>
</div>


<% String HaulageError=(String)request.getAttribute("HaulageError"); %>

<!-- Customer-->
<div class="w3ls-banner" style="min-height:80vh;">
	<div class="heading">
		<h1 style="    color: black;">Customer Details</h1>
	</div>
	<div class="container" style="border:5px double white;">
		<div class="heading">
			<p>Choose the haulage type?</p>
		</div>
		<div class="agile-form">
		<form action="Customer2Servlet" method="post">
				<div class="field-list">
					<%=HaulageError==null?" ":HaulageError %>
								<table align="center">
									<tr><td><input type="checkbox" name="vehicle" value="vehicle" >&nbsp;&nbsp;&nbsp;&nbsp;</td><td align="left">VEHICLE</td><br>
									<tr><td> <input type="checkbox" name="household" value="household" >&nbsp;&nbsp;&nbsp;&nbsp;</td><td align="left">HOUSEHOLD</td><br>
									<tr><td><input type="checkbox" name="office" value="office" >&nbsp;&nbsp;&nbsp;&nbsp;</td><td align="left">OFFICE REMOVALS</td><br>
								</table>
				</div>
				
					
				
				<div class="submit_btn">
					<input type="submit" value="Next">
				</div>
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