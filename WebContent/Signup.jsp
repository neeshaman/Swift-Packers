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
		Connection con = null;
		Statement stmt = null,stmt1=null;
		ResultSet rs = null, rs1 = null;
		try 
		{
			con = DbConnection.getConnection();
			stmt = con.createStatement();
			stmt1=con.createStatement();
			String selectQ = "select * from user_type where user_type_id != 1";
			String selectQ1= "select * from security_question";
			rs = stmt.executeQuery(selectQ);
			rs1 = stmt1.executeQuery(selectQ1);
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	%>


	<%
		//String NameValue= (String) request.getAttribute("NameValue");
		String NameError = (String) request.getAttribute("NameError");//null
		String EmailError = (String) request.getAttribute("EmailError");
		String PasswordError = (String) request.getAttribute("PasswordError");
		String PhoneNoError=(String)request.getAttribute("PhoneNoError");
		String UserTypeError=(String)request.getAttribute("UserTypeError");
		String Security_questionIdError = (String) request.getAttribute("Security_questionIdError");
		String AnswerError=(String)request.getAttribute("AnswerError");
//		String name[]=NameValue.split(" "); 
	%>

 <!-- HEADER INCLUDE -->
   <%@include file="header.jsp" %>
   	
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
				<p>Fill the SignUp form below and submit.</p>
			</div>
			<div class="agile-form">
				<form action="SignupServlet" method="post">
					<ul class="field-list">
						<li class="name">
							<label class="form-label"> Name <span class="form-required"> * </span></label>
							<div class="form-input add">
								<span class="form-sub-label">
									<input type="text" name="firstName" placeholder="First Name" required>
								</span>
								<span class="form-sub-label">
									<input type="text" name="lastName" placeholder="Last Name" required>
									<%=NameError == null ? "" : NameError%>
								</span>
							</div>
						</li>
						<li>
							<label class="form-label"> User Type<span class="form-required"> * </span></label>
							<div class="form-input">
								<select class="form-dropdown" name="userType" >
									<option value="-1">Please select User Type</option>
									<%
										String nm, id;
										while (rs.next()) {
											id = rs.getString("User_type_id");
											nm = rs.getString("User_type_name");
									%>

									<option value="<%=id%>"><%=nm%></option>
									<%
										}
									%>
								</select><%=UserTypeError == null ? "" : UserTypeError%>
							</div>
						</li>
						<li> 
							<label class="form-label"> E-Mail Address <span class="form-required"> * </span></label>
							<div class="form-input">
								<input type="email" name="emailId" placeholder="Mail@example.com" required value="${EmailValue}">
								<%=EmailError == null ? "" : EmailError%>
							
							</div>
						</li>
						<li> 
							<label class="form-label"> Phone Number <span class="form-required"> * </span></label>
							<div class="form-input">
								<input type="text" name="phoneNo" placeholder="Phone Number" required value="${PhoneNoValue}">
								<%=PhoneNoError==null?"": PhoneNoError %>
							</div>
						</li>
						<li> 
							<label class="form-label"> Create Password <span class="form-required"> * </span></label>
							<div class="form-input">
								<input type="password" name="password" placeholder="Create Password" required>
								<%=PasswordError == null ? "" : PasswordError%>
							</div>
						</li>
						<li>
							<label class="form-label"> Security Question<span class="form-required"> * </span></label>
							<div class="form-input">
								<select class="form-dropdown" name="security_questionId" required>
								<option value="-1">Please select Security Question</option>
								<%
									String q, j;
									while (rs1.next()) {
										j = rs1.getString("security_question_id");
										q = rs1.getString("security_question");
								%>

								<option value="<%=j%>"><%=q%></option>
								<%
									}
								%>
							</select> <%=Security_questionIdError == null ? "" : Security_questionIdError%>
							</div>
						</li>
						<li> 
							<label class="form-label"> Your Answer <span class="form-required"> * </span></label>
							<div class="form-input">
								<input type="text" name="answer" placeholder="Answer" required value="${AnswerValue}">
								<%=AnswerError == null ? "" : AnswerError%>
							</div>
						</li>
					
					</ul>
					<div class="submit_btn">
						<input type="submit" value="SignUp">
					</div>
					<br><br>
				</form>	
			</div>
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