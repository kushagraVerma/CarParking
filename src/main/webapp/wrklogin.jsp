<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Worker Login</title>
</head>
<body>
	<form action="WrkLogin" method="post">
		Enter username: <input type="text" name="uname"><br>
		Enter password: <input type="password" name="pass"><br>
		<input type="submit" value="LOGIN">
	</form><br>
	<div><%
		String inval = (String) session.getAttribute("invalid-wrklogin");
		if(inval!=null){
			out.println(inval);
			session.removeAttribute("invalid-wrklogin");
		}
	%></div>
</body>
</html>