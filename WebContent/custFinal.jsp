<%@ page import="com.SwiftPackers.bean.UserBean" %>
<%@page import="com.SwiftPackers.bean.QuotationBean" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.sql.ResultSet" %>
<%@page import="com.SwiftPackers.util.DbConnection"%>
<%@page import=" java.util.ArrayList"%>;
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
	UserBean userBean = (UserBean) session.getAttribute("UserBean");
	String userId = userBean.getUserId();
	
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try 
		{
			con = DbConnection.getConnection();
			stmt = con.createStatement();
			String selectQ ="select * from haulage where cust_id="+userId;
			rs = stmt.executeQuery(selectQ);
		
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
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
						<h1 style="height: 4rem;"><a href="UserHome.jsp"><img src="imagesA/logo.png"></a></h1>
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
							<li><a href="CustFinalServlet"	class="hvr-underline-from-center ">My Shipments</a></li>
							<li><a	href="ShowProfileServlet?userId=<%=userBean.getUserId()%>"
								class="hvr-underline-from-center">My Profile</a></li>
							<li><a href="LogoutServlet" class="hvr-underline-from-center">Logout</a></li>
						</ul>
					</div>

					<div class="clearfix"> </div>	
				</nav>
	
	</div>		
<div class="banner1">
</div>

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
						<li class="resp-tab-item"><span>Haulage List</span></li>
						<li class="resp-tab-item"><span>Vendors Quotation</span></li>
						<li class="resp-tab-item"><span>Approved</span></li>
						<li class="resp-tab-item"><span>Delivered</span></li>
					</ul>	
					
					<div class="clearfix"> </div>	
					<div class="resp-tabs-container">
						<div class="tab-1 resp-tab-content">
							<div class="col-lg-12 portfolio-grids portfolio-grid1">
								<!--<a href="images/g1.jpg" data-lightbox="example-set" data-title="Lorem Ipsum is simply dummy the when an unknown galley of type and scrambled it to make a type specimen.">-->
								<!--<img src="images/g1.jpg" class="img-responsive zoom-img" alt=""/>-->
        
							  <table class="table" >
								<thead>
								<tr>
									<th>Sr.no</th>
									<th>Haulage title</th>
									<th>Details</th>
								</tr>
								</thead>
								<tbody>
								<% int cnt=1; 
								while(rs.next()){
									String id=rs.getString("haul_id");
									%>
								<tr>
									<td><%=cnt%></td>
									<td><%=rs.getString("haul_title")%></td>
									<td><a href="Details.jsp?haul_id=<%=id%>"><input type="submit" value="View Haulage Details" style="background-color: #ff8922;color: white;border: none;padding: 10px;"></a></td>
								</tr>
								<% cnt++;} %>
								</tbody>
							  </table>
									<!--<div class="b-wrapper">
										<h2>Transport Area</h2>
									</div>
									</a>-->
							</div>
							<!--<div class="col-md-4 col-sm-4 portfolio-grids portfolio-grid2">
								<a href="images/g4.jpg" data-lightbox="example-set" data-title="Lorem Ipsum is simply dummy the when an unknown galley of type and scrambled it to make a type specimen.">
									<img src="images/g4.jpg" class="img-responsive zoom-img" alt=""/>
									<div class="b-wrapper">
										<h5>Transport Area</h5>
									</div>
								</a>
							</div>
							<div class="col-md-4 col-sm-4 portfolio-grids portfolio-grid3">
								<a href="images/g3.jpg" data-lightbox="example-set" data-title="Lorem Ipsum is simply dummy the when an unknown galley of type and scrambled it to make a type specimen.">
									<img src="images/g3.jpg" class="img-responsive zoom-img" alt=""/>
									<div class="b-wrapper">
										<h5>Transport Area</h5>
									</div>
								</a>
							</div>
							<div class="col-md-4 col-sm-4 portfolio-grids portfolio-grid4">
								<a href="images/g7.jpg" data-lightbox="example-set" data-title="Lorem Ipsum is simply dummy the when an unknown galley of type and scrambled it to make a type specimen.">
									<img src="images/g7.jpg" class="img-responsive zoom-img" alt=""/>
									<div class="b-wrapper">
										<h5>Transport Area</h5>
									</div>
								</a>
							</div>
							<div class="col-md-4 col-sm-4 portfolio-grids portfolio-grid5">
								<a href="images/g5.jpg" data-lightbox="example-set" data-title="Lorem Ipsum is simply dummy the when an unknown galley of type and scrambled it to make a type specimen.">
									<img src="images/g5.jpg" class="img-responsive zoom-img" alt=""/>
									<div class="b-wrapper">
										<h5>Transport Area</h5>
									</div>
								</a>
							</div>-->
							<!--<div class="col-md-4 col-sm-4 portfolio-grids portfolio-grid6">
								<a href="images/g6.jpg" data-lightbox="example-set" data-title="Lorem Ipsum is simply dummy the when an unknown galley of type and scrambled it to make a type specimen.">
									<img src="images/g6.jpg" class="img-responsive zoom-img" alt=""/>
									<div class="b-wrapper">
										<h5>Transport Area</h5>
									</div>
								</a>
							</div>
							<div class="col-md-4 col-sm-4 portfolio-grids portfolio-grid6">
								<a href="images/g1.jpg" data-lightbox="example-set" data-title="Lorem Ipsum is simply dummy the when an unknown galley of type and scrambled it to make a type specimen.">
									<img src="images/g1.jpg" class="img-responsive zoom-img" alt=""/>
									<div class="b-wrapper">
										<h5>Transport Area</h5>
									</div>
								</a>
							</div>
							<div class="col-md-4 col-sm-4 portfolio-grids portfolio-grid6">
								<a href="images/g3.jpg" data-lightbox="example-set" data-title="Lorem Ipsum is simply dummy the when an unknown galley of type and scrambled it to make a type specimen.">
									<img src="images/g3.jpg" class="img-responsive zoom-img" alt=""/>
									<div class="b-wrapper">
										<h5>Transport Area</h5>
									</div>
								</a>
							</div>
							<div class="col-md-4 col-sm-4 portfolio-grids portfolio-grid6">
								<a href="images/g2.jpg" data-lightbox="example-set" data-title="Lorem Ipsum is simply dummy the when an unknown galley of type and scrambled it to make a type specimen.">
									<img src="images/g2.jpg" class="img-responsive zoom-img" alt=""/>
									<div class="b-wrapper">
										<h5>Transport Area</h5>
									</div>
								</a>
							</div>-->
							<div class="clearfix"> </div>
						</div>		
						<div class="tab-1 resp-tab-content">
							<div class="col-lg-12 portfolio-grids portfolio-grid1">
                           
<%ArrayList<QuotationBean> list1 = (ArrayList<QuotationBean>) request.getAttribute("VendorQuotation");%>
							<table class="table" >
								<thead>
								<tr>
									<th>Sr.no</th>
									<th>haulage Title</th>
									<th>Vendor</th>
									<th>Quotation</th>
									<th>Delivery date</th>
									<th>Payment<th>
								</tr>
								</thead>
								<tbody>
								<%QuotationBean qBean=null;
								int cnt1=1;
								int flag=1;
								for(int i=0;i<list1.size();i++){%>
								<tr>
									<%flag=0;
									qBean=list1.get(i); %>
									<td><%=cnt1%></td>
									<td><%=qBean.getHaulTitle() %>
									<td><%=qBean.getVen_companyName() %></td>
									<td><%=qBean.getQuotPrice() %></td>
									<td><%=qBean.getDeliveryDate() %></td>
									<td><a href="CreditCard.jsp?amount=<%=qBean.getQuotPrice()%>&haul_id=<%=qBean.getHaulId()%>&Quot_id=<%=qBean.getQuotId()%>&ven_id=<%=qBean.getVenId()%>&deliveryDate=<%=qBean.getDeliveryDate()%>">
										<input  type="submit" value="Book" style="background-color: #ff8922;color: white;border: none;padding: 10px;"></a></td>
								</tr>
								<%cnt1++;
								}
								
								if(flag==1)
								{%>
								<tr><center><p><h4>Within 24 hours Vendors will give you the quotations of your haulage order.</h4> </p></center></tr>	
								<%}
								
								%>
							  
							 
								</tbody>
							  </table>
								<!--<a href="images/ship1.jpg" data-lightbox="example-set" data-title="Lorem Ipsum is simply dummy the when an unknown galley of type and scrambled it to make a type specimen.">
									<img src="images/ship1.jpg" class="img-responsive zoom-img" alt=""/>-
            
-->									<!--<div class="b-wrapper">
										<h5>Ship Transport</h5>
									</div>
								</a>-->
							</div>
							<!--<div class="col-md-4 col-sm-4 portfolio-grids portfolio-grid2">
								<a href="images/ship2.jpg" data-lightbox="example-set" data-title="Lorem Ipsum is simply dummy the when an unknown galley of type and scrambled it to make a type specimen.">
								<img src="images/ship2.jpg" class="img-responsive zoom-img" alt=""/>
									<div class="b-wrapper">
										<h5>Ship Transport</h5>
				</div>
								</a>
							</div>-->
							<!--<div class="col-md-4 col-sm-4 portfolio-grids portfolio-grid3">
								<a href="images/ship3.jpg" data-lightbox="example-set" data-title="Lorem Ipsum is simply dummy the when an unknown galley of type and scrambled it to make a type specimen.">
									<img src="images/ship3.jpg" class="img-responsive zoom-img" alt=""/>
									<div class="b-wrapper">
										<h5>Ship Transport</h5>
									</div>
								</a>
							</div>-->
								<!--<div class="col-md-4 col-sm-4 portfolio-grids portfolio-grid4">
								<a href="images/ship4.jpg" data-lightbox="example-set" data-title="Lorem Ipsum is simply dummy the when an unknown galley of type and scrambled it to make a type specimen.">
									<img src="images/ship4.jpg" class="img-responsive zoom-img" alt=""/>
									<div class="b-wrapper">
										<h5>Ship Transport</h5>
									</div>
								</a>
							</div>-->
							<!--<div class="col-md-4 col-sm-4 portfolio-grids portfolio-grid5">
								<a href="images/ship5.jpg" data-lightbox="example-set" data-title="Lorem Ipsum is simply dummy the when an unknown galley of type and scrambled it to make a type specimen.">
									<img src="images/ship5.jpg" class="img-responsive zoom-img" alt=""/>
									<div class="b-wrapper">
										<h5>Ship Transport</h5>
									</div>
								</a>
							</div>
-->                            
              
                            
						<div class="clearfix"> </div>
						</div>
						<div class="tab-1 resp-tab-content">

							<div class="col-lg-12 portfolio-grids portfolio-grid1">
 
								<table class="table" >
								<thead>
								<tr>
									<th>Sr.no</th>
									<th>haulage title</th>
									<th>Vendor</th>
									<th>Quotation</th>
									<th>Payment Status<th>
								</tr>
								</thead>
								<tbody>
<%ArrayList<QuotationBean> list2 = (ArrayList<QuotationBean>) request.getAttribute("ApprovedQuotation");
								int cnt2=1;
								for(int i=0;i<list2.size();i++){%>
								<tr>
									<%qBean=list2.get(i); %>
									<td><%=cnt2%></td>
									<td><%=qBean.getHaulTitle()%></td>
									<td><%=qBean.getVen_companyName() %></td>
									<td><%=qBean.getQuotPrice()%></td>
									<td>Successfully Done</td>
								 </tr>
								 <%cnt2++;} %>
								</tbody>
							  </table>
								<!--<a href="images/train1.jpg" data-lightbox="example-set" data-title="Lorem Ipsum is simply dummy the when an unknown galley of type and scrambled it to make a type specimen.">
								<img src="images/train1.jpg" class="img-responsive zoom-img" alt=""/>

								<div class="b-wrapper">
										<h5>Truck Transport</h5>
									</div>
								</a>-->
							</div>
							<!--<div class="col-md-4 col-sm-4 portfolio-grids  portfolio-grid2">
								<a href="images/train2.jpg" data-lightbox="example-set" data-title="Lorem Ipsum is simply dummy the when an unknown galley of type and scrambled it to make a type specimen.">
									<img src="images/train2.jpg" class="img-responsive zoom-img" alt=""/>
									<div class="b-wrapper">
										<h5>Truck Transport</h5>
									</div>
								</a>
							</div>
							<div class="col-md-4 col-sm-4 portfolio-grids  portfolio-grid3">
								<a href="images/truck3.jpg" data-lightbox="example-set" data-title="Lorem Ipsum is simply dummy the when an unknown galley of type and scrambled it to make a type specimen.">
									<img src="images/truck3.jpg" class="img-responsive zoom-img" alt=""/>
									<div class="b-wrapper">
										<h5>Truck Transport</h5>
									</div>
								</a>
							</div>-->
							<!--<div class="col-md-4 col-sm-4 portfolio-grids portfolio-grid1">
								<a href="images/truck4.jpg" data-lightbox="example-set" data-title="Lorem Ipsum is simply dummy the when an unknown galley of type and scrambled it to make a type specimen.">
									<img src="images/truck4.jpg" class="img-responsive zoom-img" alt=""/>
									<div class="b-wrapper">
										<h5>Truck Transport</h5>
									</div>
								</a>
							</div>
							
							<div class="col-md-4 col-sm-4 portfolio-grids portfolio-grid2">
								<a href="images/truck5.jpg" data-lightbox="example-set" data-title="Lorem Ipsum is simply dummy the when an unknown galley of type and scrambled it to make a type specimen.">
									<img src="images/truck5.jpg" class="img-responsive zoom-img" alt=""/>
									<div class="b-wrapper">
										<h5>Truck Transport</h5>
									</div>
								</a>
							</div>-->
							<div class="clearfix"> </div>
						</div>
						<div class="tab-1 resp-tab-content">
							<div class="col-lg-12 portfolio-grids portfolio-grid1">
<%ArrayList<QuotationBean> list3 = (ArrayList<QuotationBean>) request.getAttribute("DeliveredQuotation");%>                           
								<table class="table" >
								<thead>
								<tr>
									<th>Sr.no</th>
									<th>Haulage Title</th>
									<th>Vendor</th>
									<th>Date of Delivery</th>
									<th>Haulage Status</th>
									<th>Feedback</th>
								</tr>
								</thead>
								<tbody>
								<% int cnt3=1;
								for(int i=0;i<list3.size();i++){%>
								<tr>
									<%qBean=list3.get(i); %>
									<td><%=cnt3%></td>
									<td><%=qBean.getHaulTitle()%></td>
									<td><%=qBean.getVen_companyName() %></td>
									<td><%=qBean.getDeliveryDate()%></td>
									<td><%=qBean.getHaulStatus()%></td>
									<td><a href="FeedbackForm.jsp"><input type="submit" value="Write feedback"></a></td>
								 </tr>
								 <%cnt3++;} %>
								</tbody>
							  </table>
								<!--<a href="images/flight1.jpg" data-lightbox="example-set" data-title="Lorem Ipsum is simply dummy the when an unknown galley of type and scrambled it to make a type specimen.">
									<img src="images/flight1.jpg" class="img-responsive zoom-img" alt=""/>
									<div class="b-wrapper">
										<h5>Flight Transport</h5>
									</div>
								</a>-->
							</div>
							<!--
							<div class="col-md-4 col-sm-4 portfolio-grids portfolio-grid2">
								<a href="images/flight2.jpg" data-lightbox="example-set" data-title="Lorem Ipsum is simply dummy the when an unknown galley of type and scrambled it to make a type specimen.">
									<img src="images/flight2.jpg" class="img-responsive zoom-img" alt=""/>
									<div class="b-wrapper">
										<h5>Flight Transport</h5>
									</div>
								</a>
							</div>
							<div class="col-md-4 col-sm-4 portfolio-grids  portfolio-grid3">
								<a href="images/flight3.jpg" data-lightbox="example-set" data-title="Lorem Ipsum is simply dummy the when an unknown galley of type and scrambled it to make a type specimen.">
									<img src="images/flight3.jpg" class="img-responsive zoom-img" alt=""/>
									<div class="b-wrapper">
										<h5>Flight Transport</h5>
									</div>
								</a>
							</div>
							<div class="col-md-4 col-sm-4 portfolio-grids portfolio-grid4">
								<a href="images/flight4.jpg" data-lightbox="example-set" data-title="Lorem Ipsum is simply dummy the when an unknown galley of type and scrambled it to make a type specimen.">
									<img src="images/flight4.jpg" class="img-responsive zoom-img" alt=""/>
									<div class="b-wrapper">
										<h5>Flight Transport</h5>
									</div>
								</a>
							</div>
							<div class="col-md-4 col-sm-4 portfolio-grids portfolio-grid4">
								<a href="images/flight5.jpg" data-lightbox="example-set" data-title="Lorem Ipsum is simply dummy the when an unknown galley of type and scrambled it to make a type specimen.">
									<img src="images/flight5.jpg" class="img-responsive zoom-img" alt=""/>
									<div class="b-wrapper">
										<h5>Flight Transport</h5>
									</div>
								</a>
							</div>--><!--
							<div class="col-md-4 col-sm-4 portfolio-grids portfolio-grid4">
								<a href="images/flight6.jpg" data-lightbox="example-set" data-title="Lorem Ipsum is simply dummy the when an unknown galley of type and scrambled it to make a type specimen.">
									<img src="images/flight6.jpg" class="img-responsive zoom-img" alt=""/>
									<div class="b-wrapper">
										<h5>Flight Transport</h5>
									</div>
								</a>
							</div>-->
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