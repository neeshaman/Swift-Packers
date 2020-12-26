<%@ page import="com.SwiftPackers.bean.UserBean" %>
<%@ page import="com.SwiftPackers.util.*" %>
<%@ page import="java.sql.*" %>

<% UserBean userBean = (UserBean) session.getAttribute("UserBean");
   System.out.print("hiii ==>> " + userBean); %> 

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
						<%if(userBean==null) {%>
						<ul class="nav navbar-nav navbar-right">
							<li><a href="login.jsp" class="hvr-underline-from-center">Login</a></li>
							<li><a href="Signup.jsp" class="hvr-underline-from-center">SignUp</a></li>
						</ul>
						<%} else {%>
						<ul class="nav navbar-nav navbar-right">
							<%if(userBean.getUserTypeId().equals("3")){%>
							<li><a href="Customer2Servlet" class="hvr-underline-from-center">NeedService</a></li>
							<li><a href="CustFinalServlet" class="hvr-underline-from-center">My Shipments</a></li>
							<li><a href="ShowProfileServlet?userId=<%=userBean.getUserId()%>" class="hvr-underline-from-center">My Profile</a></li>
							<%}
							else if(userBean.getUserTypeId().equals("2")){%>
							<li><a href="ShowRequestServlet" class="hvr-underline-from-center">My Shipments</a></li>
							<li><a href="ShowVenProfileServlet?userId=<%=userBean.getUserId()%>" class="hvr-underline-from-center">My Profile</a></li>
							<%}%>
							<li><a href="LogoutServlet" class="hvr-underline-from-center">Logout</a></li>
						</ul>
						<%} %>
					</div>
				</nav>
	</div>
	
