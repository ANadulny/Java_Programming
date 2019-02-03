<!DOCTYPE html>
<%@page import="bean.Login_Bean"%>
<%@page import="bean.common"%>
<%@page import="bean.image"%>
<%@page import="modal.User_modal"%>
<%@page import="bean.User_bean"%>
<%@page import="modal.Price_modal"%>
<%@page import="bean.Price_bean"%>
<%@page import="modal.Workshop_modal"%>
<%@page import="bean.Workshop_bean"%>
<%@page import="modal.Inspection_modal"%>
<%@page import="bean.Inspection_bean"%>
<%@page import="modal.Model_modal"%>
<%@page import="bean.Model_bean"%>
<%@page import="modal.Rental_modal"%>
<%@page import="bean.Rental_bean"%>
<%@page import="modal.Transaction_modal"%>
<%@page import="bean.Transaction_bean"%>
<%@page import="modal.Car_modal"%>
<%@page import="bean.Car_bean"%>
<%@page import="modal.Insurance_modal"%>
<%@page import="bean.Insurance_bean"%>
<%@page import="modal.Account_modal"%>
<%@page import="bean.Account_bean"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@page language="Java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" lang="pl-PL">
<head>
<meta charset="UTF-8" />
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
	
<link href="<%=common.url %>/css_files/table.css" rel="stylesheet" />
<link href="<%=common.url %>/css_files/dropdown.css" rel="stylesheet" />
</head>
<body onload="makeTableScroll();">
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
						<h2> Car Rental Data Base Management</h2>
					</div>
				</div>
				<!-- /. ROW  -->
				<hr />
				<div class="row">
					<div class="col-lg-12">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#user" data-toggle="tab">User</a>
                            </li>
                            <li class=""><a href="#car" data-toggle="tab">Car</a>
                            </li>
                            <li class=""><a href="#rental" data-toggle="tab">Rental</a>
                            </li>
                            <li class=""><a href="#transaction" data-toggle="tab">Transaction</a>
                            </li>    
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane fade active in" id="user">
                 
	                            <ul class="nav nav-tabs">
		                            <li class="active"><a href="#users" data-toggle="tab">Users</a>
		                            </li>
		                            <li class=""><a href="#accounts" data-toggle="tab">Accounts</a>
		                            </li>
		                            <li class=""><a href="#insurances" data-toggle="tab">Insurances</a>
		                            </li>
	                        	</ul>
	                        	
	                        	 <!-- TODO -->
	                        	
	                        	<form id="form1" runat='server'>		
						    	<input type="button" value="Print table data" onclick= 		"javascript:printDiv('sample')" />    
						    	</form>
						    	<div class='sample' id='sample'>
						    		<%  
													User_modal umm = new User_modal();
				                            		List<User_bean> user_list1;
				                            	
				                            		String user_data_display_message1 = (String) session.getAttribute("user_data_display");
				                            		if(user_data_display_message1 != null)
				                            		{
				                            			user_list1 = umm.give_user_profiles(user_data_display_message1);
				                						session.removeAttribute("user_data_display");

				                            		} else {
														user_list1 = umm.give_user_profiles();
				                            		}
				                            		
													for(User_bean type: user_list1){
														
													%>
														<div> <%= type.getId() %> </div>
														<div> <%= type.getName() %> </div>
														<div> <%= type.getSurename() %> </div>
														<div> <%= type.getPESEL() %> </div>
														<div> <%= type.getPhone() %> </div>
										            <% 
										            //while(resultset.next()){ 
										            }
									        	%>
									        	
						    	</div>
						     
						    <!--Javascript function to save data inside 'sample' div -->
						     
						        <script language="javascript" type="text/javascript">
						            function printDiv(divID) 
						    		{
						                var divElements = document.getElementById(divID).innerHTML;
						                var oldPage = document.body.innerHTML;
						     
						                document.body.innerHTML = 
						                  "<html><head><title></title></head><body>" + 
						                  divElements + "</body>";
						     
						                window.print();
						     
						                document.body.innerHTML = oldPage;
						            } 
						        </script>	
						        
	                        	<div class="tab-content">                      	
                            		<div class="tab-pane fade active in" id="users">
	                            		<h5>Users Table</h5>
				                        <table class="table table-striped table-bordered table-hover table-container">
				                            <thead>
				                                <tr>
				                                    <th>User ID</th>
				                                    <th>Name</th>
				                                    <th>Surename</th>
				                                    <th>PESEL</th>
				                                    <th>Phone</th>
				                                </tr>
				                            </thead>
				                            <tbody>
				                            	<%  
													User_modal um = new User_modal();
				                            		List<User_bean> user_list;
				                            	
				                            		String user_data_display_message = (String) session.getAttribute("user_data_display");
				                            		if(user_data_display_message != null)
				                            		{
				                            			user_list = um.give_user_profiles(user_data_display_message);
				                						session.removeAttribute("user_data_display");

				                            		} else {
														user_list = um.give_user_profiles();
				                            		}
				                            		
													for(User_bean type: user_list){
								
										            //while(resultset.next()){ 
									        	%>
												
				                               <tr>
				                   					<td> <%= type.getId() %> </td>
				                   					<td> <%= type.getName() %> </td>
				                   					<td> <%= type.getSurename() %> </td>
				                   					<td> <%= type.getPESEL() %> </td>
				                   					<td> <%= type.getPhone() %> </td>
				                                </tr>
				                               <% 
										            } 
									        %> 
				                            </tbody>
				                        </table>
				                        
				                        
				                        <form class="user-filtr" action="profile/controller/User_data_filtr_controller.jsp" method="post">
				                        
				                        <div class="dropdown">
											  <button class="dropbtn">Find</button>
											  <div class="dropdown-content" >
												<input type="text" placeholder="User ID" name="id" /> 
												<input type="text" placeholder="Name" name="name" />
												<input type="text" placeholder="Surename" name="surename" />
												<input type="text" placeholder="PESEL" name="PESEL" />
												<input type="text" placeholder="Phone" name="phone" />
											  </div>
										</div>
										<div class="dropdown">
											  <button class="dropbtn">Between</button>
											  <div class="dropdown-content">
											  	<b>User ID</b>
												<input type="text" placeholder="From" name="id_from" class="field1"/> 
												<input type="text" placeholder="To" name="id_to" class="field2"/> 
												<b>Name</b>
												<input type="text" placeholder="From" name="name_from" class="field1"/>
												<input type="text" placeholder="To" name="name_to" class="field2"/>
												<b>Surename</b>
												<input type="text" placeholder="From" name="surename_from" class="field1"/>
												<input type="text" placeholder="To" name="surename_to" class="field2"/>
												<b>PESEL</b>
												<input type="text" placeholder="From" name="PESEL_from" class="field1"/>
												<input type="text" placeholder="To" name="PESEL_to" class="field2"/>
												<b>Phone</b>
												<input type="text" placeholder="From" name="phone_from" class="field1"/>
												<input type="text" placeholder="To" name="phone_to" class="field2"/>
											  </div>
										</div>
										</form> 

                            		</div>
                            		<div class="tab-pane fade" id="accounts">
                            			<h5>Accounts Table</h5>
				                        <table class="table table-striped table-bordered table-hover table-container">
				                            <thead>
				                                <tr>
				                                    <th>Account ID</th>
				                                    <th>User Name</th>
				                                    <th>User Surename</th>
				                                    <th>Credit [PLN]</th>
				                                    <th>Login</th>
				                                    <th>Password</th>
				                                    <th>Email</th>
				                                </tr>
				                            </thead>
				                            <tbody>
				                            	<%  
													Account_modal acc = new Account_modal();
				                            		List<Account_bean> account_list;
				                            	
				                            		String account_data_display_message = (String) session.getAttribute("account_data_display");
				                            		if(account_data_display_message != null)
				                            		{
				                            			System.out.println(account_data_display_message);
				                            			account_list = acc.give_account_profiles(account_data_display_message); 
				                						session.removeAttribute("account_data_display");
				                            		} else {
														account_list = acc.give_account_profiles();
				                            		}
				                            		

													for(Account_bean acc_type: account_list){
								
										            //while(resultset.next()){ 
									        	%>
												
				                               <tr>
				                                    <td> <%= acc_type.getAccount_id() %> </td>
				                   					<td> <%= acc_type.getUser_name() %> </td>
				                   					<td> <%= acc_type.getUser_surename() %> </td>
				                   					<td> <%= acc_type.getCredit() %> </td>
				                   					<td> <%= acc_type.getLogin() %> </td>
				                   					<td> <%= acc_type.getPassword() %> </td>
				                   					<td> <%= acc_type.getMail() %> </td>
				                                </tr>
				                               <% 
										            } 
									        %> 
				                            </tb> 
										</div>
				                        </table>
				                        <form class="user-filtr" action="profile/controller/Account_data_filtr_controller.jsp" method="post">
					                        	<div class="dropdown">
												  <button class="dropbtn">Find</button>
												  <div class="dropdown-content" onclick="">
													<input type="text" placeholder="Account ID" name="account_id" /> 
													<input type="text" placeholder="User name" name="user_name" />
													<input type="text" placeholder="User surename" name="user_surename" />
													<input type="text" placeholder="Credit" name="credit_check" />
													<input type="text" placeholder="Login" name="login" />
													<input type="text" placeholder="Password" name="password" />
													<input type="text" placeholder="Email" name="mail" />
												  </div>
											</div>
											
											<div class="dropdown">
												  <button class="dropbtn">Between</button>
												  <div class="dropdown-content" onclick="">
												  	<b>Account ID</b>
													<input type="text" placeholder="From" name="account_id_from" class="field1"/> 
													<input type="text" placeholder="To" name="account_id_to" class="field2"/> 
													<b>User Name</b>
													<input type="text" placeholder="From" name="user_name_from" class="field1"/>
													<input type="text" placeholder="To" name="user_name_to" class="field2"/>
													<b>User Surename</b>
													<input type="text" placeholder="From" name="user_surename_from" class="field1"/>
													<input type="text" placeholder="To" name="user_surename_to" class="field2"/>
													<b>Credit</b>
													<input type="text" placeholder="From" name="credit_from_check" class="field1"/>
													<input type="text" placeholder="To" name="credit_to_check" class="field2"/>
													<b>Login</b>
													<input type="text" placeholder="From" name="login_from" class="field1"/>
													<input type="text" placeholder="To" name="login_to" class="field2"/>
													<b>Password</b>
													<input type="text" placeholder="From" name="password_from" class="field1"/>
													<input type="text" placeholder="To" name="password_to" class="field2"/>
													<b>Email</b>
													<input type="text" placeholder="From" name="mail_from" class="field1"/>
													<input type="text" placeholder="To" name="mail_to" class="field2"/>
												  </div>
											</div>
										</form>
                            		</div>
                            		<div class="tab-pane fade" id="insurances">
                            			<h5>Insurances Table</h5>
				                        <table class="table table-striped table-bordered table-hover table-container">
				                            <thead>
				                                <tr>
				                                    <th>ID</th>
				                                    <th>Account ID</th>
				                                    <th>User Name</th>
				                                    <th>User Surename</th>
				                                    <th>Expire date</th>
				                                </tr>
				                            </thead>
				                            <tbody>
			                            	<%  
													Insurance_modal icm = new Insurance_modal();
				                            		List<Insurance_bean> insurance_list;
				                            	
				                            		String insurance_data_display_message = (String) session.getAttribute("insurance_data_display");
				                            		System.out.println(insurance_data_display_message);
				                            		if(insurance_data_display_message != null)
				                            		{
				                            			System.out.println(insurance_data_display_message);
				                            			insurance_list = icm.give_insurance_profiles(insurance_data_display_message);
				                						session.removeAttribute("insurance_data_display");
				                            		} else {
														insurance_list = icm.give_insurance_profiles();
				                            		}
				                            		
													for(Insurance_bean icm_type: insurance_list){
								
										            //while(resultset.next()){ 
									        	%>
												
				                               <tr>
				                   					<td> <%= icm_type.getInsurance_id() %> </td>
				                   					<td> <%= icm_type.getAccount_id() %> </td>
				                   					<td> <%= icm_type.getUser_name() %> </td>
				                   					<td> <%= icm_type.getUser_surename() %> </td>
				                   					<td> <%= icm_type.getExpire_date() %> </td>
				                   					
				                                </tr>
				                               <% 
										            } 
									        %> 
				                                </tr>
				                            </tbody>
				                        </table>
				                        <form class="user-filtr" action="profile/controller/Insurance_data_filtr_controller.jsp" method="post">
				                        	<div class="dropdown">
											  <button class="dropbtn">Find</button>
											  <div class="dropdown-content" onclick="">
												<input type="text" placeholder="Insurance ID" name="insurance_id" /> 
												<input type="text" placeholder="Account_ID" name="account_id" />
												<input type="text" placeholder="User name" name="user_name" />
												<input type="text" placeholder="User surename" name="user_surename" />
												<input type="text" placeholder="Expiration date" name="expire_date_tmp" />
											  </div>
                            				</div>
                            				<div class="dropdown">
											  <button class="dropbtn">Between</button>
											  <div class="dropdown-content" onclick="">
											  	<b>Insurance ID</b>
												<input type="text" placeholder="From" name="insurance_id_from" class="field1"/> 
												<input type="text" placeholder="To" name="insurance_id_to" class="field2"/> 
												<b>Account ID</b>
												<input type="text" placeholder="From" name="account_id_from" class="field1"/>
												<input type="text" placeholder="To" name="account_id_to" class="field2"/>
												<b>User Name</b>
												<input type="text" placeholder="From" name="user_name_from" class="field1"/>
												<input type="text" placeholder="To" name="user_name_to" class="field2"/>
												<b>User Surename</b>
												<input type="text" placeholder="From" name="user_surename_from" class="field1"/>
												<input type="text" placeholder="To" name="user_surename_to" class="field2"/>
												<b>Expire date</b>
												<input type="text" placeholder="From" name="expire_date_from_tmp" class="field1"/>
												<input type="text" placeholder="To" name="expire_date_to_tmp" class="field2"/>
											  </div>
										</div>
										</form>
                            	</div>


                            </div>
                            </div>
                            <div class="tab-pane fade" id="car">
                            
                           		<ul class="nav nav-tabs">
		                            <li class="active"><a href="#cars" data-toggle="tab">Cars</a>
		                            </li>
		                            <li class=""><a href="#models" data-toggle="tab">Models</a>
		                            </li>
		                            <li class=""><a href="#pricelist" data-toggle="tab">Price list</a>
		                            </li>
		                            <li class=""><a href="#inspections" data-toggle="tab">Inspections</a>
		                            </li>
		                            <li class=""><a href="#workshops" data-toggle="tab">Workshops</a>
		                            </li>
	                        	</ul>
                             
                                <div class="tab-content">
                            		<div class="tab-pane fade active in" id="cars">
	                            		<h5>Cars Table</h5>
				                        <table class="table table-striped table-bordered table-hover table-container">
				                            <thead>
				                                <tr>
				                                    <th>#</th>
				                                    <th>Register number</th>
				                                    <th>Model ID</th>
				                                    <th>Mileage</th>
				                                    <th>Availability</th>
				                                </tr>
				                            </thead>
				                            <tbody>
				                            	<%  
													Car_modal ccm = new Car_modal();
				
													List<Car_bean> car_list = ccm.give_car_profiles();
													for(Car_bean ccm_type: car_list){
								
										            //while(resultset.next()){ 
									        	%>
												
				                               <tr>
				                                    <td> <%= ccm_type.getIndex() %> </td>
				                   					<td> <%= ccm_type.getRegister_number() %> </td>
				                   					<td> <%= ccm_type.getModel_id() %> </td>
				                   					<td> <%= ccm_type.getMileage() %> </td>
				                   					<td> <%= ccm_type.getAvailability() %> </td>
				                                </tr>
				                               <% 
										            } 
									        %> 
				                            </tbody>
				                        </table>
				                        	<div class="dropdown">
											  <button class="dropbtn">Find</button>
											  <div class="dropdown-content" onclick="">
												<input type="text" placeholder="Register number" name="Register_number" />
												<input type="text" placeholder="Model ID" name="Model_id" />
												<input type="text" placeholder="Mileage" name="Mileage" />
												<input type="text" placeholder="Availability" name="Availability" />
											  </div>
                            				</div>
                            				<div class="dropdown">
											  <button class="dropbtn">Between</button>
											  <div class="dropdown-content" onclick="">											  	
												<b>Register number</b>
												<input type="text" placeholder="From" name="Register_number_from" class="field1"/> 
												<input type="text" placeholder="To" name="Register_number_to" class="field2"/> 
												<b>Model ID</b>
												<input type="text" placeholder="From" name="Model_id_from" class="field1"/>
												<input type="text" placeholder="To" name="Model_id_to" class="field2"/>
												<b>Expire date</b>
												<input type="text" placeholder="From" name="Mileage_from" class="field1"/>
												<input type="text" placeholder="To" name="Mileage_to" class="field2"/>
											  </div>
										</div>
                            		</div>
                            		<div class="tab-pane fade" id="models">
                            			<h5>Models Table</h5>
				                        <table class="table table-striped table-bordered table-hover table-container">
				                            <thead>
				                                <tr>
				                                    <th>Model ID</th>
				                                    <th>Price per day [PLN]</th>
				                                    <th>Price per hour [PLN]</th>
				                                    <th>Producer</th>
				                                    <th>Model</th>
				                                    <th>Class</th>
				                                    <th>Fuel consumption</th>
				                                    <th>Gearbox</th>
				                                    <th>Transmission</th>
				                                </tr>
				                            </thead>
				                            <tbody>
				                            
				                            	<%  

													Model_modal mm = new Model_modal();
													List<Model_bean> model_list;
													String model_data_display_message = (String) session.getAttribute("model_data_display");
													if(model_data_display_message != null)
				                            		{
				                            			model_list = mm.give_model_profiles(model_data_display_message);
				                						session.removeAttribute("model_data_display");
				                            		} else {
				                            			model_list = mm.give_model_profiles();
				                            		}
													
													
													for(Model_bean mm_type: model_list){
									        	%>
												
				                               <tr>
				                   					<td> <%= mm_type.getId() %> </td>
				                   					<td> <%= mm_type.getPrice_day() %> </td>
				                   					<td> <%= mm_type.getPrice_hour() %> </td>
				                   					<td> <%= mm_type.getProducer() %> </td>
				                   					<td> <%= mm_type.getModel() %> </td>
				                   					<td> <%= mm_type.getCar_class() %> </td>
				                   					<td> <%= mm_type.getConsumption() %> </td>
				                   					<td> <%= mm_type.getGearbox() %> </td>
				                   					<td> <%= mm_type.getTransmission() %> </td>
				                                </tr>
				                               <% 
										            } 
									        %> 
				                            </tbody>
				                        </table>
				                        <form class="model-filtr" action="profile/controller/Model_data_filtr_controller.jsp" method="post">
				                        	<div class="dropdown">
											  <button class="dropbtn">Find</button>
											  <div class="dropdown-content" >
												<input type="text" placeholder="Model ID" name="id" />
												<input type="text" placeholder="Price per day" name="price_day" />
												<input type="text" placeholder="Price per hour" name="price_hour" />
												<input type="text" placeholder="Producer" name="producer" />
												<input type="text" placeholder="Model" name="model" />
												<input type="text" placeholder="Class" name="car_class" />
												<input type="text" placeholder="Fuel consumption" name="consumption" />
												<input type="text" placeholder="Gearbox" name="gearbox" />
												<input type="text" placeholder="Transmission" name="transmission" />
											  </div>
                            				</div>
                            				<div class="dropdown">
											  <button class="dropbtn">Between</button>
											  <div class="dropdown-content">											  	
												<b>Model ID</b>
												<input type="text" placeholder="From" name="model_id_from" class="field1"/> 
												<input type="text" placeholder="To" name="model_id_to" class="field2"/> 
												<b>Price per day</b>
												<input type="text" placeholder="From" name="price_per_day_from" class="field1"/>
												<input type="text" placeholder="To" name="price_per_day_to" class="field2"/>
												<b>Price per hour</b>
												<input type="text" placeholder="From" name="price_per_hour_from" class="field1"/>
												<input type="text" placeholder="To" name="price_per_hour_to" class="field2"/>
												<b>Producer</b>
												<input type="text" placeholder="From" name="producer_from" class="field1"/> 
												<input type="text" placeholder="To" name="producer_to" class="field2"/> 
												<b>Model</b>
												<input type="text" placeholder="From" name="model_from" class="field1"/> 
												<input type="text" placeholder="To" name="model_to" class="field2"/> 
												<b>Fuel consumption</b>
												<input type="text" placeholder="From" name="fuel_consumption_from" class="field1"/> 
												<input type="text" placeholder="To" name="fuel_consumption_to" class="field2"/> 
											  </div>
										</div>
										</form>
                            		</div>
                            		<div class="tab-pane fade" id="pricelist">
                            			<h5>Pricelist</h5>
				                        <table class="table table-striped table-bordered table-hover table-container">
				                            <thead>
				                                <tr>
				                                    <th>Price ID</th>
				                                    <th>Price per km [PLN]</th>
				                                    <th>Price per minute [PLN]</th>
				                                    <th>Price per hour [PLN]</th>
				                                    <th>Price per day [PLN]</th>
				                                    <th>Price per stand [PLN]</th>
				                                </tr>
				                            </thead>
				                            <tbody>
				                            	<%  

													Price_modal pm = new Price_modal();
													List<Price_bean> price_list;
													String price_data_display_message = (String) session.getAttribute("price_data_display");
													if(price_data_display_message != null)
				                            		{
				                            			price_list = pm.give_price_profiles(price_data_display_message);
				                						session.removeAttribute("price_data_display");
				                            		} else {
				                            			price_list = pm.give_price_profiles();
				                            		}

													for(Price_bean pm_type: price_list){

									        	%>
												
				                               <tr>
				                   					<td> <%= pm_type.getPrice_id() %> </td>
				                   					<td> <%= pm_type.getPrice_km() %> </td>
				                   					<td> <%= pm_type.getPrice_minute() %> </td>
				                   					<td> <%= pm_type.getPrice_hour() %> </td>
				                   					<td> <%= pm_type.getPrice_day() %> </td>
				                   					<td> <%= pm_type.getPrice_stand() %> </td>
				                                </tr>
				                               <% 
										            } 
									        %> 
				                            </tbody>
				                        </table>
				                        <form class="price-filtr" action="profile/controller/Price_list_data_filtr_controller.jsp" method="post">
				                		<div class="dropdown">
											  <button class="dropbtn">Find</button>
											  <div class="dropdown-content">
												<input type="text" placeholder="Price ID" name="price_id" />
												<input type="text" placeholder="Price per km" name="price_km" />
												<input type="text" placeholder="Price per minute" name="price_minute" />
												<input type="text" placeholder="Price per hour" name="price_hour" />
												<input type="text" placeholder="Price per day" name="price_day" />
												<input type="text" placeholder="Price per stand" name="price_stand" />
											  </div>
                            				</div>
                            				<div class="dropdown">
											  <button class="dropbtn">Between</button>
											  <div class="dropdown-content">
												<b>Price ID</b>
												<input type="text" placeholder="From" name="price_id_from" class="field1"/> 
												<input type="text" placeholder="To" name="price_id_to" class="field2"/> 
												<b>Price per km</b>
												<input type="text" placeholder="From" name="price_per_km_from" class="field1"/>
												<input type="text" placeholder="To" name="price_per_km_to" class="field2"/>
												<b>Price per minute</b>
												<input type="text" placeholder="From" name="price_per_minute_from" class="field1"/>
												<input type="text" placeholder="To" name="price_per_minute_to" class="field2"/>
												<b>Price per hour</b>
												<input type="text" placeholder="From" name="price_per_hour_from" class="field1"/> 
												<input type="text" placeholder="To" name="price_per_hour_to" class="field2"/> 
												<b>Price per day</b>
												<input type="text" placeholder="From" name="price_per_day_from" class="field1"/> 
												<input type="text" placeholder="To" name="price_per_day_to" class="field2"/> 
												<b>Price per stand</b>
												<input type="text" placeholder="From" name="price_per_stand_from" class="field1"/> 
												<input type="text" placeholder="To" name="price_per_stand_to" class="field2"/> 
											  </div>
											</div>   
											</form>     

                            		</div>
                            		<div class="tab-pane fade" id="inspections">
                            			<h5>Insurances Table</h5>
				                        <table class="table table-striped table-bordered table-hover table-container">
				                            <thead>
				                                <tr>
				                                    <th>Inspection ID</th>
				                                    <th>Register number</th>
				                                    <th>Workshop ID</th>
				                                    <th>Workshop name</th>
				                                    <th>Price [PLN]</th>
				                                    <th>Date</th>
				                                </tr>
				                            </thead>
				                            <tbody>
				                            	<%  
				                            		Inspection_modal im = new Inspection_modal();
													List<Inspection_bean> inspection_list;
													String inspection_data_display_message = (String) session.getAttribute("inspection_data_display");
													if(inspection_data_display_message != null)
				                            		{
														inspection_list = im.give_inspection_profiles(inspection_data_display_message);
				                						session.removeAttribute("inspection_data_display");
				                            		} else {
				                            			inspection_list = im.give_inspection_profiles();
				                            		}
	
													for(Inspection_bean im_type: inspection_list){
														

								
										            //while(resultset.next()){ 
									        	%>
												
				                               <tr>
				                   					<td> <%= im_type.getId() %> </td>
				                   					<td> <%= im_type.getRegister_number() %> </td>
				                   					<td> <%= im_type.getWorkshop_id() %> </td>
				                   					<td> <%= im_type.getWorkshop_name() %> </td>
				                   					<td> <%= im_type.getCost() %> </td>
				                   					<td> <%= im_type.getInspection_date() %> </td>
				                                </tr>
				                               <% 
										            } 
									        %> 
				                            </tbody>
				                        </table>
				                        
				                        <form class="inspection-filtr" action="profile/controller/Inspections_data_filtr_controller.jsp" method="post">
				                        <div class="dropdown">
											  <button class="dropbtn">Find</button>
											  <div class="dropdown-content" onclick="">
												<input type="text" placeholder="Inspection ID" name="id" />
												<input type="text" placeholder="Register number" name="register_number" />
												<input type="text" placeholder="Workshop ID" name="workshop_id" />
												<input type="text" placeholder="Workshop name" name="workshop_name" />
												<input type="text" placeholder="Price" name="cost" />
												<input type="text" placeholder="Date" name="inspection_date_tmp" />
											  </div>
                            				</div>
                            				<div class="dropdown">
											  <button class="dropbtn">Between</button>
											  <div class="dropdown-content" onclick="">											  	
												<b>Inspection ID</b>
												<input type="text" placeholder="From" name="inspection_id_from" class="field1"/> 
												<input type="text" placeholder="To" name="inspection_id_to" class="field2"/> 
												<b>Register number</b>
												<input type="text" placeholder="From" name="register_number_from" class="field1"/>
												<input type="text" placeholder="To" name="register_number_to" class="field2"/>
												<b>Workshop ID</b>
												<input type="text" placeholder="From" name="workshop_id_from" class="field1"/>
												<input type="text" placeholder="To" name="workshop_id_to" class="field2"/>
												<b>Workshop name</b>
												<input type="text" placeholder="From" name="workshop_name_from" class="field1"/>
												<input type="text" placeholder="To" name="workshop_name_to" class="field2"/>
												<b>Price</b>
												<input type="text" placeholder="From" name="price_from" class="field1"/> 
												<input type="text" placeholder="To" name="price_to" class="field2"/> 
												<b>Date</b>
												<input type="text" placeholder="From" name="date_from_tmp" class="field1"/> 
												<input type="text" placeholder="To" name="date_to_tmp" class="field2"/> 
											  </div>
										</div>
				                        </form>
				                        
                            		</div>
                            		<div class="tab-pane fade" id="workshops">
                            			<h5>Workshops Table</h5>
				                        <table class="table table-striped table-bordered table-hover table-container">
				                            <thead>
				                                <tr>
				                                    <th>Workshop ID</th>
				                                    <th>Name</th>
				                                    <th>ZIP code</th>
				                                    <th>Adress</th>
				                                </tr>
				                            </thead>
				                            <tbody>
				                            	<%  
													Workshop_modal wm = new Workshop_modal();
													
				                            	List<Workshop_bean> workshop_list;
				                            	
			                            		String workshop_data_display_message = (String) session.getAttribute("workshop_data_display");
			                            		if(workshop_data_display_message != null)
			                            		{
			                            			workshop_list = wm.give_workshop_profiles(workshop_data_display_message);
			                            			out.println(workshop_data_display_message);
			                						session.removeAttribute("workshop_data_display");
			                            		} else {
													workshop_list = wm.give_workshop_profiles();
			                            		}
			            			
													for(Workshop_bean wm_type: workshop_list){
								
										            //while(resultset.next()){ 
									        	%>
												
				                               <tr>
				                   					<td> <%= wm_type.getWorkshop_id() %> </td>
				                   					<td> <%= wm_type.getName() %> </td>
				                   					<td> <%= wm_type.getZIP_code() %> </td>
				                   					<td> <%= wm_type.getAdress() %> </td>
				                                </tr>
				                               <% 
										            } 
									        %> 
				                            </tbody>
				                        </table>
				                        <form class="user-filtr" action="profile/controller/Workshop_data_filtr_controller.jsp" method="post">
				                        	<div class="dropdown">
											  <button class="dropbtn">Find</button>
											  <div class="dropdown-content" onclick="">
												<input type="text" placeholder="Workshop ID" name="workshop_id" />
												<input type="text" placeholder="Name" name="name" />
												<input type="text" placeholder="ZIP Code" name="ZIP_code" />
												<input type="text" placeholder="Adress" name="adress" />
											  </div>
                            				</div>
                            				<div class="dropdown">
											  <button class="dropbtn">Between</button>
											  <div class="dropdown-content" onclick="">											  	
												<b>Workshop ID</b>
												<input type="text" placeholder="From" name="workshop_id_from" class="field1"/> 
												<input type="text" placeholder="To" name="workshop_id_to" class="field2"/> 
												<b>Name</b>
												<input type="text" placeholder="From" name="name_from" class="field1"/>
												<input type="text" placeholder="To" name="name_to" class="field2"/>
												<b>ZIP Code</b>
												<input type="text" placeholder="From" name="ZIP_code_from" class="field1"/>
												<input type="text" placeholder="To" name="ZIP_code_to" class="field2"/>
												<b>Adress</b>
												<input type="text" placeholder="From" name="adress_from" class="field1"/> 
												<input type="text" placeholder="To" name="adress_to" class="field2"/> 
											  </div>
										</div>
				                       </form>  
				                        
                            		</div>
                            	</div>

                            </div>
                            <div class="tab-pane fade" id="rental">
                                <h5>Rental Table</h5>
		                        <table class="table table-striped table-bordered table-hover table-container">
			                            <thead>
			                                <tr>
			                                    <th>Rental ID</th>
			                                    <th>Account ID</th>
			                                    <th>Register number</th>
			                                    <th>Rental date</th>
			                                    <th>Status</th>
			                                </tr>
			                            </thead>
		                            <tbody>
				                            	<%  
													Rental_modal rm = new Rental_modal();
				
													List<Rental_bean> rental_list;
				                            	
			                            		String rental_data_display_message = (String) session.getAttribute("rental_data_display");
			                            		if(rental_data_display_message != null)
			                            		{
			                            			rental_list = rm.give_rental_profiles(rental_data_display_message);
			                            			out.println(rental_data_display_message);
			                						session.removeAttribute("rental_data_display");
			                            		} else {
													rental_list = rm.give_rental_profiles();
			                            		}
													for(Rental_bean rm_type: rental_list){
								
										            //while(resultset.next()){ 
									        	%>
												
				                               <tr>
				                   					<td> <%= rm_type.getRental_id() %> </td>
				                   					<td> <%= rm_type.getAccount_id() %> </td>
				                   					<td> <%= rm_type.getRegister_number() %> </td>
				                   					<td> <%= rm_type.getRental_date() %> </td>
				                   					<td> <%= rm_type.getStatus() %> </td>
				                                </tr>
				                               <% 
										            } 
									        %> 
		                            </tbody>
		                        </table>
		                        	<form class="user-filtr" action="profile/controller/Rental_data_filtr_controller.jsp" method="post">
		                       			<div class="dropdown">
											  <button class="dropbtn">Find</button>
											  <div class="dropdown-content" onclick="">
												<input type="text" placeholder="Rental ID" name="rental_id" />
												<input type="text" placeholder="Account ID" name="account_id" />
												<input type="text" placeholder="Register number" name="register_number" />
												<input type="text" placeholder="Rental Date" name="rental_date" />
												<input type="text" placeholder="Status" name="status" />
											  </div>
                            				</div>
                            				<div class="dropdown">
											  <button class="dropbtn">Between</button>
											  <div class="dropdown-content" onclick="">											  	
												<b>Rental ID</b>
												<input type="text" placeholder="From" name="rental_id_from" class="field1"/> 
												<input type="text" placeholder="To" name="rental_id_to" class="field2"/> 
												<b>Account ID</b>
												<input type="text" placeholder="From" name="account_id_from" class="field1"/>
												<input type="text" placeholder="To" name="account_id_to" class="field2"/>
												<b>Register number</b>
												<input type="text" placeholder="From" name="register_number_from" class="field1"/>
												<input type="text" placeholder="To" name="register_number_to" class="field2"/>
												<b>Rental date</b>
												<input type="text" placeholder="From" name="rental_date_from" class="field1"/> 
												<input type="text" placeholder="To" name="rental_date_to" class="field2"/> 
												<b>Status</b>
												<input type="text" placeholder="From" name="status_from" class="field1"/> 
												<input type="text" placeholder="To" name="status_to" class="field2"/> 
											  </div>
											  </form>
										</div>
		                        
		                        
		                        

                            </div>
                            <div class="tab-pane fade" id="transaction">
                                <h5>Transaction Table</h5>
		                        <table class="table table-striped table-bordered table-hover table-container">
		                            <thead>
		                                <tr>
		                                    <th>Transaction ID</th>
		                                    <th>Rental ID</th>
		                                    <th>Price [PLN]</th>
		                                    <th>Duration</th>
		                                    <th>Stand time</th>
		                                    <th>Additional costs</th>
		                                </tr>
		                            </thead>
		                            <tbody>
			                            	<%  
				                            		Transaction_modal tm = new Transaction_modal();
				
											List<Transaction_bean> transaction_list;
			                            	
		                            		String transaction_data_display_message = (String) session.getAttribute("transaction_data_display");
		                            		if(transaction_data_display_message != null)
		                            		{
		                            			transaction_list = tm.give_transaction_profiles(transaction_data_display_message);
		                            			out.println(transaction_data_display_message);
		                						session.removeAttribute("transaction_data_display");
		                            		} else {
		                            			transaction_list = tm.give_transaction_profiles();
		                            		}
													for(Transaction_bean tm_type: transaction_list){
								
										            //while(resultset.next()){ 
									        	%>
												
				                               <tr>
				                   					<td> <%= tm_type.getTransaction_id() %> </td>
				                   					<td> <%= tm_type.getRental_id() %> </td>
				                   					<td> <%= tm_type.getValue() %> </td>
				                   					<td> <%= tm_type.getRental_time() %> </td>
				                   					<td> <%= tm_type.getStand_time() %> </td>
				                   					<td> <%= tm_type.getAdditional_costs() %> </td>
				                                </tr>
				                               <% 
										            } 
									        %> 
		                            </tbody>
		                        </table>
										<form class="user-filtr" action="profile/controller/Transaction_data_filtr_controller.jsp" method="post">
			                       			<div class="dropdown">
											  <button class="dropbtn">Find</button>
											  <div class="dropdown-content" onclick="">
												<input type="text" placeholder="Transaction ID" name="transaction_id" />
												<input type="text" placeholder="Rental ID" name="rental_id" />
												<input type="text" placeholder="Price" name="value" />
												<input type="text" placeholder="Duration" name="rental_time" />
												<input type="text" placeholder="Stand time" name="stand_time" />
												<input type="text" placeholder="Additional costs" name="additional_costs" />
											  </div>
                            				</div>
                            				<div class="dropdown">
											  <button class="dropbtn">Between</button>
											  <div class="dropdown-content" onclick="">											  	
												<b>Transaction ID</b>
												<input type="text" placeholder="From" name="transaction_id_from" class="field1"/> 
												<input type="text" placeholder="To" name="transaction_id_to" class="field2"/> 
												<b>Rental ID</b>
												<input type="text" placeholder="From" name="rental_id_from" class="field1"/>
												<input type="text" placeholder="To" name="rental_id_to" class="field2"/>
												<b>Price</b>
												<input type="text" placeholder="From" name="value_from" class="field1"/>
												<input type="text" placeholder="To" name="value_to" class="field2"/>
												<b>Duration</b>
												<input type="text" placeholder="From" name="rental_time_from" class="field1"/> 
												<input type="text" placeholder="To" name="rental_time_to" class="field2"/> 
												<b>Stand Time</b>
												<input type="text" placeholder="From" name="stand_time_from" class="field1"/> 
												<input type="text" placeholder="To" name="stand_time_to" class="field2"/> 
												<b>Additional Costs</b>
												<input type="text" placeholder="From" name="additional_costs_from" class="field1"/> 
												<input type="text" placeholder="To" name="additional_costs_to" class="field2"/> 
											  </div>
										</div>
										</form>



                            </div>
                            
                            
                            
                         </div>
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
