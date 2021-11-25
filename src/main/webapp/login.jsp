<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login | Car Parking Solutions</title>
</head>
<body>
	<form action="LoginCred" method="post">
		Enter username: <input type="text" name="uname"><br>
		Enter password: <input type="password" name="pass"><br>
		<input type="submit" value="LOGIN">
	</form><br>
	<%
		String inval = (String) session.getAttribute("invalid-login");
		if(inval!=null){
			out.println(inval);
			session.removeAttribute("invalid-login");
		}
	%><br>
</body>
</html>