<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@page import="modal.Register_Modal"%>
<%@page import="bean.Login_Bean"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="obj_Register_Bean" class="bean.Register_Bean"></jsp:useBean>
	<jsp:setProperty property="*" name="obj_Register_Bean" />

	<%
	Register_Modal obj_Register_Modal=new Register_Modal();
    int flag=obj_Register_Modal.register(obj_Register_Bean);
	
	Login_Bean obj_Login_Bean=(Login_Bean)session.getAttribute("admin_session");
	if(obj_Login_Bean==null){
	
	    if(flag == 2){
	    	 session.setAttribute("login_message", "Registration completed, please log in now");
    %>
		<script type="text/javascript">
		   window.location.href="http://localhost:10080/Car_Rental/index.jsp";
	    </script>
	<%
	    }else{
	    	session.setAttribute("register_message", "Registration Failed.");
    %>
			<script type="text/javascript">
		   		window.location.href="http://localhost:10080/Car_Rental/register.jsp";
		    </script>
    <%
	    }
 	} else { // for Register_User
 		
 		if(flag == 2){
 			session.setAttribute("register_message", "Registration completed");
 			 %>
 			<script type="text/javascript">
 			   window.location.href="http://localhost:10080/Car_Rental/register-user";
 		    </script>
 		<%
 		    }else{
 		    	session.setAttribute("register_message", "Registration Failed.");
 	    %>
 				<script type="text/javascript">
 			   		window.location.href="http://localhost:10080/Car_Rental/register-user";
 			    </script>
 	    <%
 		}
 	}
 	%>
</body>
</html>