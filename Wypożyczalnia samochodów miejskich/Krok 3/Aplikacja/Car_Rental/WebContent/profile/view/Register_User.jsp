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
<link rel="stylesheet" href="css_files/style3.css">
</head>
<body>
	<%
	Login_Bean obj_Login_Bean=(Login_Bean)session.getAttribute("admin_session");
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
						<span class="icon-bar"></span>
						 <span class="icon-bar"></span>
						 <span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#"> <img
						src="<%=image.url %>\logo.png" />
					</a>
				</div>

				<span class="logout-spn"> 
				<a href="<%=common.url %>/sign-out-controller" style="color: #fff;">LOGOUT</a>
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
				</ul>
			</div>
		</nav>
		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-lg-12">
						<h2> Register new User</h2>
					</div>
				</div>
				<!-- /. ROW  -->
				<hr />
				<div class="form">
					<form class="register-form" 
						action="profile/controller/Register_controller.jsp" method="post"> 
						<div class="row">
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
								<div class="input-group">
								  <span class="input-group-addon">@</span>
								  <input type="text" class="form-control" placeholder="username" name="user_name" required/> 
								</div>
								<br />
								
								<div class="input-group">
								  <span class="input-group-addon">@</span>
								  <input type="password" class="form-control" placeholder="password" name="password"  pattern=".{8,}" title="Minimum 8 znakow" required/>
								</div>
								<br />
								
								<div class="input-group">
								  <span class="input-group-addon">@</span>
								  <input type="email" class="form-control" placeholder="e-mail" name="email" required/>
								</div>
								<br />
							</div>
							
							
							<div class="col-lg-6 col-md-6">
								<div class="input-group">
								  <span class="input-group-addon">@</span>
								  <input type="text" class="form-control" placeholder="name" name="name" required/>
								</div>
								<br />
								
								<div class="input-group">
								  <span class="input-group-addon">@</span>
								  <input type="text" class="form-control" placeholder="surename" name="surename" required/>
								</div>
								<br />
								
								<div class="input-group">
								  <span class="input-group-addon">@</span>
								  <input type="tel" class="form-control" placeholder="PESEL" name="pesel" pattern="[0-9]{11}" title="Dokladnie 11 cyfr" required/>
								</div>
								<br />
								
								<div class="input-group">
								  <span class="input-group-addon">@</span>
								  <input type="tel" class="form-control" placeholder="Phone number" name="phone_number" pattern="[0-9]{9}" title="Np. 123456789" required/>
								</div>
								<br />
							</div>
						</div>
						
						<button>Sign Up</button></br>
						
						<%
							String register_message = (String) session.getAttribute("register_message");
		
							if (register_message != null) {
								out.println(register_message);
								session.removeAttribute("register_message");
							}
						%>
						</form>
					</div>
				
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
