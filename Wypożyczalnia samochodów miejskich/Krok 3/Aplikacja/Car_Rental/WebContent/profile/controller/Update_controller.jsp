<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@page import="modal.Update_Modal"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="obj_Register_Bean" class="bean.Register_Bean"></jsp:useBean>
	<jsp:setProperty property="*" name="obj_Register_Bean" />

	<%
	Update_Modal obj_Update_Modal=new Update_Modal();
    int flag=obj_Update_Modal.register(obj_Register_Bean);
	
	    if(flag == 2){
	    	 session.setAttribute("update_message", "Changes saved");
    %>
		<script type="text/javascript">
		   window.location.href="http://localhost:10080/Car_Rental/user-profile";
	    </script>
	<%
	    }else if(flag == 3)
	    {
	    	 session.setAttribute("update_message", "Changes saved");
	    	    %>
	    			<script type="text/javascript">
	    			   window.location.href="http://localhost:10080/Car_Rental/settings";
	    		    </script>
	    		<%
	    }
	    else{
	    	session.setAttribute("update_message", "Saving failed.");
    %>
			<script type="text/javascript">
		   		window.location.href="http://localhost:10080/Car_Rental/user-profile";
		    </script>
    <%
	    }

 	%>
</body>
</html>