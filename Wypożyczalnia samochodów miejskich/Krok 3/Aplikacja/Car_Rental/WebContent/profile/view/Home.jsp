<!DOCTYPE html>
<%@page import="bean.Login_Bean"%>
<%@page import="bean.common"%>
<%@page import="bean.image"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Car Rental Application</title>
<!-- BOOTSTRAP STYLES-->
<link href="<%=common.url %>/assets/css/bootstrap.css" rel="stylesheet" />
<!-- FONTAWESOME STYLES-->
<link href="<%=common.url %>/assets/css/font-awesome.css"
	rel="stylesheet" />
<!-- CUSTOM STYLES-->
<link href="<%=common.url %>/assets/css/custom.css" rel="stylesheet" />
<!-- GOOGLE FONTS-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
<!-- GOOGLE MAPS-->
<link href="<%=common.url %>/assets/css/maps.css"
	rel="stylesheet" />
	
</head>
<body>
	<%
	int flag = 1; // 1 - admin, 2 - user
	Login_Bean obj_Login_Bean=(Login_Bean)session.getAttribute("admin_session");
	if(obj_Login_Bean==null){
		obj_Login_Bean=(Login_Bean)session.getAttribute("user_session");
		flag = 2;
	}
	if(obj_Login_Bean==null){
		session.setAttribute("login_message", "Please login first");
	%>
	<script type="text/javascript">
		    window.location.href="http://localhost:10080/Car_Rental/index.jsp";
		</script>
	<%	
	} 
	%>
		
	<div id="wrapper">
		<div class="navbar navbar-inverse navbar-fixed-top">
			<div class="adjust-nav">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".sidebar-collapse">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#"> <img src="<%=image.url %>\logo.png" />
					</a>

				</div>

				<span class="logout-spn"> <a
					href="<%=common.url %>/sign-out-controller" style="color: #fff;">LOGOUT</a>
				</span>
			</div>
		</div>
		<!-- /. NAV TOP  -->
		<nav class="navbar-default navbar-side" role="navigation">
			<div class="sidebar-collapse">
				<ul class="nav" id="main-menu">

					<li class="active-link"><a
						href="<%=common.url %>/user-home-page"><i
							class="fa fa-desktop "></i>Home </a></li>
					<% 
						if(flag == 1) {
					%>				
					<li class="active-link"><a
						href="<%=common.url %>/check-data"><i
							class="fa fa-table "></i>Check Data </a></li>
					<li class="active-link"><a
						href="<%=common.url %>/mail-box"><i
							class="fa fa-qrcode "></i>Mail Box </a></li>
					<li class="active-link"><a
						href="<%=common.url %>/statistic-generator"><i
							class="fa fa-bar-chart-o "></i>Statistic </a></li>
					<li class="active-link"><a
						href="<%=common.url %>/notification"><i
							class="fa  fa-edit "></i>Notification </a></li>
					<li class="active-link"><a
						href="<%=common.url %>/admin-profiles"><i
							class="fa fa-table "></i>Admin </a></li>
					<li class="active-link"><a
						href="<%=common.url %>/settings"><i
							class="fa fa-edit "></i>Settings </a></li>				
					
					<%
						} else {
					%>
					<li class="active-link"><a
						href="<%=common.url %>/user-profile"><i
							class="fa fa-desktop "></i>Profile </a></li>
					<% 
						}
					%>
				</ul>
			</div>
		</nav>
		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-lg-12">
						<h2>
							Welcome <%=obj_Login_Bean.getUser_name() %></h2>
					</div>
				</div>
				<%	
					if(flag == 1) {
				%>
				<!-- /. ROW  -->
				<hr />
				<div class="row">
					<div class="col-lg-12 ">
						<div class="alert alert-info">
							<strong>Welcome <%=obj_Login_Bean.getUser_name() %> !
							</strong> You Have No pending Task For Today.
						</div>

					</div>
				</div>
				<!-- /. ROW  -->
				<div class="row text-center pad-top">
					<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
						<div class="div-square">
							<a href="<%=common.url %>/mail-box"> <i class="fa fa-circle-o-notch fa-5x"></i>
								<h4>Mail Box</h4>
							</a>
						</div>
					</div>
					
					<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
						<div class="div-square">
							<a href="<%=common.url %>/new-issues"> <i class="fa fa-lightbulb-o fa-5x"></i>
								<h4>New Issues</h4>
							</a>
						</div>
					</div>
					<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
						<div class="div-square">
							<a href="<%=common.url %>/statistic-generator"> <i class="fa fa-users fa-5x"></i>
								<h4>Statistic</h4>
							</a>
						</div>
					</div>
					<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
						<div class="div-square">
							<a href="<%=common.url %>/admin-profiles"> <i class="fa fa-key fa-5x"></i>
								<h4>Admin</h4>
							</a>
						</div>
					</div>
					
					<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
						<div class="div-square">
							<a href="<%=common.url %>/support"> <i class="fa fa-comments-o fa-5x"></i>
								<h4>Support</h4>
							</a>
						</div>
					</div>
				</div>
				<!-- /. ROW  -->
				<div class="row text-center pad-top">
					<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
						<div class="div-square">
							<a href="<%=common.url %>/settings"> <i class="fa fa-gear fa-5x"></i>
								<h4>Settings</h4>
							</a>
						</div>
					</div>
					<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
						<div class="div-square">
							<a href="<%=common.url %>/live-talk"> <i class="fa fa-wechat fa-5x"></i>
								<h4>Live Talk</h4>
							</a>
						</div>
					</div>
					<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
						<div class="div-square">
							<a href="<%=common.url %>/notification"> <i class="fa fa-bell-o fa-5x"></i>
								<h4>Notifications</h4>
							</a>
						</div>
					</div>
					<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
						<div class="div-square">
							<a href="<%=common.url %>/register-user"> <i class="fa fa-user fa-5x"></i>
								<h4>Register User</h4>
							</a>
						</div>
					</div>
					<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
						<div class="div-square">
							<a href="<%=common.url %>/check-data"> <i class="fa fa-circle-o-notch fa-5x"></i>
								<h4>Check Data</h4>
							</a>
						</div>
					</div>
				</div>
				</div>
				<!-- /. ROW  -->
				<div class="row">
					<div class="col-lg-12 ">
						<br />
						<div class="alert alert-danger">
							<strong>Want More Icons Free ? </strong> Checkout fontawesome website and use any icon <a target="_blank"
								href="http://fortawesome.github.io/Font-Awesome/icons/">Click Here</a>.
						</div>
					</div>
				</div>
				<%	
					} 
					else {
				%>
				
				<dir class="google-maps">
					<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d156371.4523545158!2d20.949931506212916!3d52.237862740879095!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x471ecc669a869f01%3A0x72f0be2a88ead3fc!2sWarszawa!5e0!3m2!1spl!2spl!4v1547926991252" 
					width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>">
				</dir>
				
				<%	
					} 
				%>
				<!-- /. ROW  -->
			</div>
			<!-- /. PAGE INNER  -->
		</div>
		<!-- /. PAGE WRAPPER  -->
	</div>
	<div class="footer">


		<div class="row">
			<div class="col-lg-12">
				&copy; 2014 yourdomain.com | Design by: <a
					href="http://binarytheme.com" style="color: #fff;" target="_blank">www.binarytheme.com</a>
			</div>
		</div>
	</div>


	<!-- /. WRAPPER  -->
	<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
	<!-- JQUERY SCRIPTS -->
	<script src="<%=common.url %>/assets/js/jquery-1.10.2.js"></script>
	<!-- BOOTSTRAP SCRIPTS -->
	<script src="<%=common.url %>/assets/js/bootstrap.min.js"></script>
	<!-- CUSTOM SCRIPTS -->
	<script src="<%=common.url %>/assets/js/custom.js"></script>


</body>
</html>