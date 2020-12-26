<!--
	Author: W3layouts
	Author URL: http://w3layouts.com
	License: Creative Commons Attribution 3.0 Unported
	License URL: http://creativecommons.org/licenses/by/3.0/
-->

<%@ page import="java.sql.ResultSet" %>
<%@page import="com.SwiftPackers.util.DbConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*"%>
<%@ page import="com.SwiftPackers.bean.*" %>
<%@ page import="com.SwiftPackers.dao.*" %>
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

<link rel="stylesheet" href="css/lightbox.css"> <!-- portfolio-CSS -->

<!-- css files -->
<link rel="stylesheet" href="css/bootstrap.css"> <!-- Bootstrap-Core-CSS -->
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" /> <!-- Style-CSS --> 
<link rel="stylesheet" href="css/font-awesome.css"> <!-- Font-Awesome-Icons-CSS -->
<!-- //css files -->
<!--table--->

  
<!--table--->
  <!-- web-fonts -->
<link href="//fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&amp;subset=latin-ext" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese" rel="stylesheet">
<!-- //web-fonts -->
</head>
<body>


<%
	UserBean bean=(UserBean)session.getAttribute("UserBean");	
	String haulId=request.getParameter("haul_id");	
		
		UserBean userBean=null;
		HaulageBean haulageBean=null;
		
		HaulageDao haulageDao=new HaulageDao();
		haulageBean=haulageDao.getDataByPk(haulId);
		
		UserDao udao=new UserDao();
		userBean=udao.getDataByPk(haulageBean.getCustId());
		
		H_HouseholdDao h_dao=new H_HouseholdDao();
		ArrayList<H_HouseholdBean> houselist=(ArrayList<H_HouseholdBean>)h_dao.getDataByHaulId(haulId);
		
		/* H_FoodDao fooddao=new H_FoodDao();
		ArrayList<H_FoodBean> foodlist=(ArrayList<H_FoodBean>)fooddao.getDataByHaulId(haulId);
		
		H_AnimalDao animaldao=new H_AnimalDao();
		ArrayList<H_AnimalBean> animallist=(ArrayList<H_AnimalBean>)animaldao.getDataByHaulId(haulId);
		 */
		H_VehicleDao vehicledao=new H_VehicleDao();
		ArrayList<H_VehicleBean> vehiclelist=(ArrayList<H_VehicleBean>)vehicledao.getDataByHaulId(haulId);
		
		H_Office_removalsDao officedao=new H_Office_removalsDao();
		ArrayList<H_Office_removalsBean> officelist=(ArrayList<H_Office_removalsBean>)officedao.getDataByHaulId(haulId);
		

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
							<li><a href="Customer2Servlet" class="hvr-underline-from-center">NeedService</a></li>
							<li><a href="CustFinalServlet" class="hvr-underline-from-center ">My Shipments</a></li>
							<li><a	href="ShowProfileServlet?userId=<%=bean.getUserId()%>"	class="hvr-underline-from-center">My Profile</a></li>
							<li><a href="LogoutServlet" class="hvr-underline-from-center">Logout</a></li>
						</ul>
					</div>

					<div class="clearfix"> </div>	
				</nav>
	
	</div>		
<div class="banner1">
</div>

<%	
	//session.getAttribute("userBean");
	//userBean.getUserid();
	//con
	//stmt
	//String selectQ = "Select * from haulage where cust_id = "+userid

%>

<div class="about-breadcrumb">
	<div class="container">
		<ul>
			<li><a href="UserHome.jsp">Home</a><i>></i></li>
			<li>Customer</li>
		</ul>
	</div>
</div>
<!-- portfolio-inner-page -->
	<div id="portfolio" class="portfolio">
		<div class="heading">
			<h3>Your Haulage</h3>
		</div>
		<div class="container">
			<div class="sap_tabs">			
				<div id="horizontalTab">
					<ul class="resp-tabs-list">
						<li class="resp-tab-item"><span>Haulage Details</span></li>

					</ul>	
					<div class="clearfix"> </div>	
					<div class="resp-tabs-container">
						<div class="tab-1 resp-tab-content">
							<div class="col-lg-12 portfolio-grids portfolio-grid1">
								<table class="table" >
								<thead>
								<tr>
									<th>Sr.no</th>
									<th>Haulage</th>
									<th colspan="2">Details</th>
								</tr>
								</thead>
								<tbody>
								 <%
									int cnt=1;
									H_VehicleBean vehiclebean=new H_VehicleBean();
									for(int i=0;i<vehiclelist.size();i++)
									{
										vehiclebean=vehiclelist.get(i);
									%>
								<tr>
									<td><%=cnt%></td>
									<td>Vehicle</td>
									<td><%=vehiclebean.getVehicleCategory() %></td>
						
									
									
									
									<td><%=vehiclebean.getVehicleType() %></td>
								</tr>
								 <% cnt++;
								 } %>
								<% 
									H_HouseholdBean housebean=new H_HouseholdBean();
									for(int i=0;i<houselist.size();i++)
									{
										housebean=houselist.get(i);
									%>
								<tr>
									<td><%=cnt%></td>
									<td>Household</td>
									<td><%=housebean.getHouseType() %></td>
								</tr>
								<%cnt++;
								} %>
								
								<% 
									H_Office_removalsBean officebean=new H_Office_removalsBean();
									for(int i=0;i<officelist.size();i++)
									{
										officebean=officelist.get(i);
									%>
								 <tr>
									<td><%=cnt%></td>
									<td>Office Removals</td>
									<td><%=officebean.getOfficeType() %></td>
									<td><%=officebean.getDescription() %></td>
								 </tr>
								<%cnt++;
								} %>

							  <tr>
									<td><%=cnt%></td>
									<td>Date of Shipment</td>
									<td><%=haulageBean.getBookingDate()%></td>
							  </tr>
							  <%cnt++; %>
							  
	<% 	Connection con1 = null;
		ResultSet rs6=null;
		Statement stmt6=null;
		try
		{
			con1 = DbConnection.getConnection();
			stmt6=con1.createStatement();
			String serviceQ="select * from service where service_id="+haulageBean.getServiceId();
			rs6=stmt6.executeQuery(serviceQ);
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	%>
	<%if(rs6.next())
							{%>	
							  <tr>
									<td><%=cnt%></td>
									<td>Service Taken</td>
									<td><%=rs6.getString("Service_type")%></td>
							  </tr>
							<%}cnt++; %>
							  <tr>
									<td><%=cnt%></td>
									<td>Pick Up Location</td>
									<td><%=haulageBean.getPickupLoc()%></td>
							  </tr>
							  <%cnt++; %>
							  <tr>
									<td><%=cnt %></td>
									<td>Delivery Location</td>
									<td><%=haulageBean.getDeliveryLoc()%></td>
							  </tr>
						
							 
								</tbody>
							  </table>
							</div>
							
							<div class="clearfix"> </div>
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
	<script type="text/javascript" src="js/bootstrap.js"></script> <!-- Necessary-JavaScript-File-For-Bootstrap --> 
<!-- //js -->	
<!-- //js-scripts -->

	<!--script for portfolio-->
			<script src="js/lightbox-plus-jquery.min.js"> </script>
			<script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
			<script type="text/javascript">
				$(document).ready(function () {
					$('#horizontalTab').easyResponsiveTabs({
						type: 'default', //Types: default, vertical, accordion           
						width: 'auto', //auto or any width like 600px
						fit: true   // 100% fit in a container
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