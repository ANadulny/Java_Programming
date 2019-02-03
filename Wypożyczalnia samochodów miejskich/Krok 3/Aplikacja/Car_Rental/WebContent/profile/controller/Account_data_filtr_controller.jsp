<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@page import="modal.Account_modal"%>
<%@page import="bean.Account_bean"%>
<%@page import="bean.Login_Bean"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="obj_Account_bean" class="bean.Account_bean"></jsp:useBean>
	<jsp:setProperty property="*" name="obj_Account_bean" />
	
	<%
		Login_Bean obj_Login_Bean=(Login_Bean)session.getAttribute("admin_session");
		if(obj_Login_Bean==null){
			session.setAttribute("login_message", "Registration completed, please log in now");
		    %>
				<script type="text/javascript">
				   window.location.href="http://localhost:10080/Car_Rental/check-data";
			    </script>
			<%
		}
		System.out.println("ASGSAGASGASGASGASGAGSGASG");
		Account_modal obj_Account_modal=new Account_modal();
	    String value = obj_Account_modal.Account_filtr_conditions(obj_Account_bean);
	    if(value != ""){
	    	session.setAttribute("account_data_display", value);
	    	%>
	    <%
	    } else {
	    	session.removeAttribute("account_data_display");
	    }
	 %> 
	 	
	   <script type="text/javascript">
		   window.location.href="http://localhost:10080/Car_Rental/check-data#Accounts";
	    </script>



</body>
</html>