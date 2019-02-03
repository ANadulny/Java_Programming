<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@page import="modal.Rental_modal"%>
<%@page import="bean.Rental_bean"%>
<%@page import="bean.Login_Bean"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="obj_Rental_bean" class="bean.Rental_bean"></jsp:useBean>
	<jsp:setProperty property="*" name="obj_Rental_bean" />
	
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
		Rental_modal obj_Rental_modal=new Rental_modal();
	    String value = obj_Rental_modal.rental_filtr_conditions(obj_Rental_bean);
	    if(value != ""){
	    	session.setAttribute("rental_data_display", value);
	    	%>
	    <%
	    } else {
	    	session.removeAttribute("rental_data_display");
	    }
	 %> 
	 	
	   <script type="text/javascript">
		   window.location.href="http://localhost:10080/Car_Rental/check-data";
	    </script>



</body>
</html>