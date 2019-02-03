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
						<h2>New Issues</h2>
					</div>
				</div>
				<!-- /. ROW  -->
				<hr />
				<table class="table">
				  <h3>List</h3>
				  <thead>
				    <tr>
				      <th><span class="glyphicon glyphicon-envelope"></span></th>
				      <th>From</th>
				      <th>Assigned to</th>
				      <th>Subject</th>
				      <th>Text</th>
				    </tr>
				  </thead>
				  <tbody>
				  
				  
				  <tr>
                      <th>1</th>
                      <th>Adrian</th>
                      <th>Darek</th>
                      <th>User</th>
                      <th>Dodanie wyswietlania danych usera w zakladce profil. Mowa o wyswietleniu danych uzytkownika</br>
                      	  i danych konta dla tego uzytkownika.</th>
                  </tr>
                  <tr>
                      <th>2</th>
                      <th>Adrian</th>
                      <th>Darek</th>
                      <th>Admin</th>
                      <th>Dodanie wyswietlania danych administratora w zakladce settings. Mowa o wyswietleniu danych konta</br>
                      	  administratora.</th>
                  </tr>
                  <tr>
                      <th>3</th>
                      <th>Adrian</th>
                      <th>Tomek</th>
                      <th>Admin</th>
                      <th>Poprawienie wyswietlania kolumn przy zakladkach dla check data i dodanie odpowiednich modeli do</br>
                      	  wyswietlania w odpowiednich tablicach danych z naszej lokalnej bazy danych.</th>
                  </tr>
                  <tr>
                      <th>4</th>
                      <th>Adrian</th>
                      <th>Adrian</th>
                      <th>Admin</th>
                      <th>Dodanie w zakladce dla check data filtru jako funkcjonalnosc do wyswietlania danych w tabelach.</th>
                  </tr>
                  <tr>
                      <th>5</th>
                      <th>Adrian</th>
                      <th>Szymon</th>
                      <th>Admin</th>
                      <th>Dodanie w zakladce check data - ograniczenia do wyswietlania danych w tablicach, np. na otwartej stronie</br>
                      	  max 20 rekordow moze zostac wyswietlonych.</th>
                  </tr>
				  
				  
				  <!-- Do dalszego rozwijania projektu o maile przychodzace do administratora od uzytkownikow -->
				  
				   <%--  <c:forEach items="${messages}" var="message">
				      <tr class="${message.isRead == true ? '' : 'info'}">
				        <td>
				          <c:if test="${message.isRead == false}">
				            <span class="glyphicon glyphicon-envelope"></span>
				          </c:if>
				        </td>
				        <td><c:out value="${message.from.emailAddress.name}" /></td>
				        <td><c:out value="${message.subject}" /></td>
				        <td><c:out value="${message.receivedDateTime}" /></td>
				        <td><c:out value="${message.bodyPreview}" /></td>
				      </tr>
				    </c:forEach> --%>
				    
				    
				    
				  </tbody>
				</table>
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
