<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@page import="modal.Transaction_modal"%>
<%@page import="bean.Transaction_bean"%>
<%@page import="bean.Login_Bean"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="obj_Transaction_bean" class="bean.Transaction_bean"></jsp:useBean>
	<jsp:setProperty property="*" name="obj_Transaction_bean" />
	
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
		Transaction_modal obj_Transaction_modal=new Transaction_modal();
	    String value = obj_Transaction_modal.transaction_filtr_conditions(obj_Transaction_bean);
	    if(value != ""){
	    	session.setAttribute("transaction_data_display", value);
	    	%>
	    <%
	    } else {
	    	session.removeAttribute("transaction_data_display");
	    }
	 %> 
	 	
	   <script type="text/javascript">
		   window.location.href="http://localhost:10080/Car_Rental/check-data";
	    </script>



</body>
</html>