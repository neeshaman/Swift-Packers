
<%@page import="com.SwiftPackers.util.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.SwiftPackers.bean.UserBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.SwiftPackers.bean.HaulageBean"%>
<%@page import="com.SwiftPackers.bean.QuotationBean"%>
<%@page import="javax.servlet.http.HttpSession" %>


<!DOCTYPE html>
<html lang="en">
<head>
<title>Swift Packers</title>
<!-- Meta tag Keywords -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Transporters web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webDesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web Designs" />
<script type="application/x-javascript"> 
	addEventListener("load", function()
		{ 
		setTimeout(hideURLbar, 0);
		}, false);
function hideURLbar()
	{ 
		window.scrollTo(0,1);
	}
	
</script>
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
	ArrayList<HaulageBean> list2 = (ArrayList<HaulageBean>) request.getAttribute("QuotationRequestList");
	ArrayList<QuotationBean> listQuot = (ArrayList<QuotationBean>) request.getAttribute("PendingQuotList");
	ArrayList<QuotationBean> list = (ArrayList<QuotationBean>) request.getAttribute("ApprovedQuotList");
	ArrayList<QuotationBean> deliverList = (ArrayList<QuotationBean>) request.getAttribute("DeliveredQuotList");
	
	HaulageBean haulageBean=null;
	QuotationBean quotBean=null;
%>
	
	
 
   <!-- HEADER INCLUDE -->
   <%@include file="header.jsp" %>
   
   <div class="banner1">
</div>

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
			<h3>Shipment</h3>
		</div>
		<div class="container">
			<div class="sap_tabs">			
				<div id="horizontalTab">
					<ul class="resp-tabs-list">
						<li class="resp-tab-item"><span>Quotation Request</span></li>
						<li class="resp-tab-item"><span>Sent Quotation</span></li>
						<li class="resp-tab-item"><span>Approved</span></li>
						<li class="resp-tab-item"><span>Delivered</span></li>
						
					</ul>	
					<div class="clearfix"> </div>	
					<div class="resp-tabs-container">
						<div class="tab-1 resp-tab-content">
							<div class="col-lg-12 portfolio-grids portfolio-grid1">
		
							  <table class="table" >
								<thead>
								<tr>
									<th>Sr.no</th>
									<th>Customer Name</th>
									<th>Details</th>
									<th>Quotation</th>
									
								</tr>
								</thead>
								<tbody>
								<%int cnt=1;
								for (int i = 0; i < list2.size(); i++)
								{
									haulageBean=list2.get(i);
								%>
								<tr>
									<td><%=cnt%></td>
									<td><%=haulageBean.getUserName()%></td>
									<td><a href="ShowUserDetailsServlet?haul_id=<%=haulageBean.getHaulId()%>"><input type="submit" value="View User Details" style="background-color: #ff8922;color: white;border: none;padding: 10px;"></a></td>
									<td><a href="PlaceQuotation.jsp?haul_id=<%=haulageBean.getHaulId()%>"><input type="submit" value="Place Quotation"></a></td>
								</tr>
								 <%cnt++;} %>
								</tbody>
							  </table>
								
							</div>
						
							<div class="clearfix"> </div>
						</div>		
						<div class="tab-1 resp-tab-content">
							<div class="col-lg-12 portfolio-grids portfolio-grid1">
                            
							<table class="table" >
								<thead>
								<tr>
									<th>Sr.no</th>
									<th>Customer Name</th>
									<th>Haulage Details</th>
									<th>Your Quotation</th>
									<th>Status</th>
								</tr>
								</thead>
								<tbody>
								<%int cnt1=1;
								for (int i = 0; i < listQuot.size(); i++)
								{
									
									//haulageBean=list2.get(i);
									quotBean=listQuot.get(i);
								%>
								<tr>
									<td><%=cnt1%></td>
									<td><%=quotBean.getUserName()%></td>
									<td><a href="ShowUserDetailsServlet?haul_id=<%=quotBean.getHaulId()%>"><input type="submit" value="View User Details" style="background-color: #ff8922;color: white;border: none;padding: 10px;"></a></td>
									<td><%=quotBean.getQuotPrice()%></td>
									<td><%=quotBean.getIsApproved()%></td>
								 </tr>
								  <% cnt1++;} %>
								 
								</tbody>
							  </table>
							  				</div>
							              
						<div class="clearfix"> </div>
						</div>
						<div class="tab-1 resp-tab-content">

							<div class="col-lg-12 portfolio-grids portfolio-grid1">
                            
								<table class="table" >
								<thead>
								<tr>
									<th>Sr.no</th>
									<th>Customer Name</th>
									<th>Haulage Detials</th>
									<th>Delivery Date</th>
									<th>Quotation</th>
									<th>Payment Status</th>
									
								</tr>
								</thead>
								<tbody>
								<%int cnt2=1;
								for (int i = 0; i < list.size(); i++)
								{
									
									//haulageBean=list2.get(i);
									quotBean=list.get(i);
								%>
								<tr>
									<td><%=cnt2%></td>
									<td><%=quotBean.getUserName()%></td>
									<td><a href="ShowUserDetailsServlet?haul_id=<%=quotBean.getHaulId()%>"><input type="submit" value="View User Details" style="background-color: #ff8922;color: white;border: none;padding: 10px;"></a></td>
									<td><%=quotBean.getDeliveryDate() %></td>
									<td><%=quotBean.getQuotPrice() %></td>
									<td>Received Successfully</td>
									<td><a href="UpdateDelStatusServlet?delStatus=delivered&haulId=<%=quotBean.getHaulId()%>"><button>delivered</button></a></td>
								 	<td>
								 </tr>
								 <%cnt2++;} %>
								</tbody>
							  </table>
								
							</div>
						<div class="clearfix"> </div>
						</div>
						<div class="tab-1 resp-tab-content">
							<div class="col-lg-12 portfolio-grids portfolio-grid1">
                           
								<table class="table" >
								<thead>
								<tr>
									<th>Sr.no</th>
									<th>Customer Name</th>
									<th>Haulage Detials</th>
									<th>Shipment Date</th>
									<th>Quotation</th>
									<th>Shipment Status</th>
									<th>Mark</th>
								</tr>
								</thead>
								<tbody>
								<%int cnt3=1;
								for (int i = 0; i < deliverList.size(); i++)
								{
									quotBean=deliverList.get(i);
								%>
								<tr>
									<td><%=cnt3%></td>
									<td><%=quotBean.getUserName()%></td>
									<td><a href="ShowUserDetailsServlet?haul_id=<%=quotBean.getHaulId()%>"><input type="submit" value="View User Details"></a></td>
									<td><%=quotBean.getDeliveryDate() %></td>
									<td><%=quotBean.getQuotPrice() %></td>
									<td>Delivered Successfully</td>
									<td><a href="UpdateDelStatusServlet?delStatus=Notdelivered&haulId=<%=quotBean.getHaulId()%>"><button>Not delivered</button></a></td>
								 <%} %>
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