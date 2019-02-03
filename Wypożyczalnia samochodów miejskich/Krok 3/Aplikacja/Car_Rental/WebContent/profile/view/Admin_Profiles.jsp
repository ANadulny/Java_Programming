<!DOCTYPE html>
<%@page import="bean.Login_Bean"%>
<%@page import="bean.common"%>
<%@page import="bean.image"%>
<%@page import="modal.Admin_Modal"%>
<%@page import="bean.Admin_Bean"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

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
						<h2> Admin Profiles Table</h2>
					</div>
				</div>
				<!-- /. ROW  -->
				<hr />
				
				<div class="row">
					<div class="col-lg-12 ">
						<!-- <button>add</button>
						<button>delete</button>
						<button>next page</button>
						</br> -->
						</br>
							
                        <table class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Name</th>
                                    <th>Login</th>
                                    <th>Permissions</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<%  
									Admin_Modal am = new Admin_Modal();

									List<Admin_Bean> list = am.give_admin_profiles();
									for(Admin_Bean type: list){
				
						            //while(resultset.next()){ 
					        	%>
								
                               <tr>
                                    <td> <%= type.getId() %> </td>
                   					<td> <%= type.getName() %> </td>
                   					<td> <%= type.getLogin() %> </td>
                                    <td></td>
                                </tr>
                               <% 
						            } 
						        %> 
                            </tbody>
                        </table>
                        </br>
                        <!-- <button>next page</button> -->
					</div>
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
