<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@page import="modal.Login_Modal"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="obj_Login_Bean" class="bean.Login_Bean"></jsp:useBean>
	<jsp:setProperty property="*" name="obj_Login_Bean" />

	<%
    Login_Modal obj_Login_Modal=new Login_Modal();
    int flag=obj_Login_Modal.check_user_name(obj_Login_Bean);
    if(flag == 1){
     	session.setAttribute("admin_session", obj_Login_Bean);
    %>

	<script type="text/javascript">
       window.location.href="http://localhost:10080/Car_Rental/user-home-page/<%=obj_Login_Bean.getUser_name()%>";
    </script>
	<%
    }else if(flag == 2){
     	session.setAttribute("user_session", obj_Login_Bean);
    %>

	<script type="text/javascript">
       window.location.href="http://localhost:10080/Car_Rental/user-home-page/<%=obj_Login_Bean.getUser_name()%>";
    </script>
    <%
 }else{
 session.setAttribute("login_message", "Login Failed, User name and Password is Wrong");
  %>
	<script type="text/javascript">
   window.location.href="http://localhost:10080/Car_Rental/index.jsp";
   </script>
	<%
 }
 %>
</body>
</html>