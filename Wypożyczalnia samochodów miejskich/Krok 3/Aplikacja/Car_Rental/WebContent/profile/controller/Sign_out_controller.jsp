<%
session.removeAttribute("user_session");
session.removeAttribute("admin_session");
session.setAttribute("login_message", "Sign out Successfull");
%>
<script type="text/javascript">
window.location.href="http://localhost:10080/Car_Rental/index.jsp";
</script>