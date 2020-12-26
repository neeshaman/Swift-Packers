<%@page import="com.SwiftPackers.util.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*" %>
<%@page import="com.SwiftPackers.bean.*"%>

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

<link rel="stylesheet" href="css/lightbox.css">
<!-- portfolio-CSS -->

<!-- css files -->
<link rel="stylesheet" href="css/bootstrap.css">
<!-- Bootstrap-Core-CSS -->
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<!-- Style-CSS -->
<link rel="stylesheet" href="css/font-awesome.css">
<!-- Font-Awesome-Icons-CSS -->
<!-- //css files -->
<!--table--->

<%
	UserBean userBean = (UserBean) session.getAttribute("UserBean");%>


<!--table--->
<!-- web-fonts -->
<link
	href="//fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&amp;subset=latin-ext"
	rel="stylesheet">
<link
	href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese"
	rel="stylesheet">
<!-- //web-fonts -->
</head>
<body>

	<%
	UserBean userbean = (UserBean) request.getAttribute("UserBean");
	HaulageBean haulagebean = (HaulageBean) request.getAttribute("HaulageBean");
	ArrayList<H_VehicleBean> vehiclelist = (ArrayList<H_VehicleBean>) request.getAttribute("VehicleList");
	
	ArrayList<H_HouseholdBean> houselist= (ArrayList<H_HouseholdBean>) request.getAttribute("HouseList");
	
	ArrayList<H_Office_removalsBean> officelist = (ArrayList<H_Office_removalsBean>) request.getAttribute("OfficeList");
	%>
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
					<a href="UserHome.jsp"><img src="imagesA/logo.png"></a>
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
					<li><a href="SearchVendors.jsp" class="hvr-underline-from-center">Search</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="ShowRequestServlet" class="hvr-underline-from-center">My Shipments</a></li>
					<li><a href="ShowVenProfileServlet?userId=<%=userBean.getUserId()%>" class="hvr-underline-from-center">My Profile</a></li>
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
				<li>Vendor</li>
			</ul>
		</div>
	</div>
	<!-- portfolio-inner-page -->
	<div id="portfolio" class="portfolio">
		<div class="heading">
			<h3>Haulage Shipment</h3>
		</div>
		<div class="container">
			<div class="sap_tabs">
				<div id="horizontalTab">
					<ul class="resp-tabs-list">
						<li class="resp-tab-item"><span>Customer Detials</span></li>
					</ul>
					<div class="clearfix"></div>
					<div class="resp-tabs-container">
						<div class="tab-1 resp-tab-content">
							<div class="col-lg-12 portfolio-grids portfolio-grid1">
								
								<table class="table">
									<thead>
										<tr>
											<th>Sr.no</th>
											<th>Customer Information/Haulage</th>
											<th colspan="2">Details</th>
										</tr>
									</thead>
									<tbody>
									<%int cnt=1; %>
										<tr>
											<td><%=cnt %></td>
											<td>Customer Name</td>
											<td><%=userbean.getUserName() %></td>
										<%cnt++; %>
										</tr>
										<tr>
											<td><%=cnt %></td>
											<td>Customer Email Id</td>
											<td><%=userbean.getUserEmail() %></td>
										<%cnt++; %>
										</tr>
										<tr>
											<td><%=cnt %></td>
											<td>Customer Phone_No</td>
											<td><%=userbean.getPhoneNo() %></td>
										<%cnt++; %>
										</tr>
										
										<%
										H_VehicleBean vehiclebean=new H_VehicleBean();
										for(int i=0;i<vehiclelist.size();i++)
										{
											vehiclebean=vehiclelist.get(i);
										%>
										<tr>
											<td><%=cnt %></td>
											<td>Vehicle</td>
											<td><%=vehiclebean.getVehicleCategory() %></td>
											<td><%=vehiclebean.getVehicleType() %></td>
										<%cnt++; %>
										</tr>
										<%} %>
										
										<% 
										H_Office_removalsBean officebean=new H_Office_removalsBean();
										for(int i=0;i<officelist.size();i++)
										{
											officebean=officelist.get(i);
										%>
										<tr>
										<tr>
											<td><%=cnt%></td>
											<td>Office Removals</td>
											<td><%=officebean.getOfficeType() %></td>
											<td><%=officebean.getDescription() %></td>
										<%cnt++; %>
										</tr>
										<%} %>
										
										<% 
										H_HouseholdBean housebean=new H_HouseholdBean();
										for(int i=0;i<houselist.size();i++)
										{
											housebean=houselist.get(i);
										%>
										<tr>
											<td><%=cnt %></td>
											<td>Household</td>
											<td><%=housebean.getHouseType() %></td>
										<%cnt++; %>
										</tr>
										<%} %>
										<tr>
											<td><%=cnt %></td>
											<td>Date of Shipment</td>
											<td><%=haulagebean.getBookingDate() %></td>
											<%cnt++; %>
										</tr>
										
<%
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String serviceType="";
		try {
			con = DbConnection.getConnection();
			stmt = con.createStatement();
			String selectQ = "select * from service where service_id="+haulagebean.getServiceId();
			rs = stmt.executeQuery(selectQ);
			if(rs.next())
				serviceType=rs.getString("service_type");

		} catch (Exception e) {
			System.out.println("Error Details_vendor.jsp::in select service");
			e.printStackTrace();
		}
	%>										

										<tr>
											<td><%=cnt %></td>
											<td>Service Taken</td>
											<td><%=serviceType %></td>
											<%cnt++; %>
										</tr>
										<tr>
											<td><%=cnt %></td>
											<td>Pick Up Location</td>
											<td><%=haulagebean.getPickupLoc() %></td>
											<%cnt++; %>
										</tr>
										<tr>
											<td><%=cnt %></td>
											<td>Delivery Location</td>
											<td><%=haulagebean.getDeliveryLoc() %></td>
										</tr>

									</tbody>
								</table>
								
							</div>
							<div class="clearfix"></div>
						</div>
											</div>
				</div>
			</div>
				</div>
			</div>
	</div>
	<!-- //portfolio-inner-page -->

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

	<!--script for portfolio-->
	<script src="js/lightbox-plus-jquery.min.js">
		
	</script>
	<script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#horizontalTab').easyResponsiveTabs({
				type : 'default', //Types: default, vertical, accordion           
				width : 'auto', //auto or any width like 600px
				fit : true
			// 100% fit in a container
			});
		});
	</script>
	<!--//script for portfolio-->


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