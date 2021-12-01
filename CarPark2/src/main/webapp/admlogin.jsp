<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login</title>
</head>
<body>
	<form action="AdmLogin" method="post">
		Enter username: <input type="text" name="uname"><br>
		Enter password: <input type="password" name="pass"><br>
		<input type="submit" value="LOGIN">
	</form><br>
	<div><%
		String inval = (String) session.getAttribute("invalid-admlogin");
		if(inval!=null){
			out.println(inval);
			session.removeAttribute("invalid-admlogin");
		}
	%></div>
</body>
</html>