<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Flat HTML5/CSS3 Login Form</title>
<link rel="stylesheet" href="css_files/style.css">
</head>

<body>
	<div class="login-page">
		<div class="form">
			<form class="login-form"
				action="profile/controller/Sign_in_controller.jsp" method="post">


				<input type="text" placeholder="username" name="user_name" /> 
				<input type="password" placeholder="password" name="password" />
				
				<button>login</button></br></br>
				</form>
				<a href="register.jsp"><button>register</button></a>
				<%
					String login_message = (String) session.getAttribute("login_message");

					if (login_message != null) {
						out.println(login_message);
						session.removeAttribute("login_message");
					}
				%>
		</div>
	</div>
	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

	<script src="login_form_js/index.js"></script>
</body>
</html>