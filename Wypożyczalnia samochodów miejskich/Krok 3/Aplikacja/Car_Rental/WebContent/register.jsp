<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Flat HTML5/CSS3 Register Form</title>
<link rel="stylesheet" href="css_files/style2.css">
</head>

<body>
	<div class="register-page">
		<div class="form">
			 <form class="register-form" 
				action="profile/controller/Register_controller.jsp" method="post"> 

				<input type="email" placeholder="e-mail" name="email" required/>
				<input type="text" placeholder="username" name="user_name" required/> 
				<input type="password" placeholder="password" name="password"  pattern=".{8,}" title="Minimum 8 znakow" required/>
				<input type="text" placeholder="name" name="name" required/>
				<input type="text" placeholder="surename" name="surename" required/>
				<input type="tel" placeholder="PESEL" name="pesel" pattern="[0-9]{11}" title="Dokladnie 11 cyfr" required/>
				<input type="tel" placeholder="Phone number" name="phone_number" pattern="[0-9]{9}" title="Np. 123456789" required/>
       
					
				<button>Sign Up</button>
				<%
					String register_message = (String) session.getAttribute("register_message");

					if (register_message != null) {
						out.println(register_message);
						session.removeAttribute("register_message");
					}
				%>
			 </form> 
			 </br>
			<a href="index.jsp"><button>Back</button></a>
		</div>
	</div>
	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

	<script src="register_form_js/index.js"></script>
</body>
</html>