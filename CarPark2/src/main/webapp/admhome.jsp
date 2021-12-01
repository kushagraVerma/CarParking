<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.carpark.model.Admin" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Home | Car Parking Solutions</title>
</head>
<body>
	<%
		response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
		response.setHeader("Pragma","no-cache");
		response.setHeader("Expires","0");
	
		Admin a = (Admin) session.getAttribute("admin");
		if(a==null){
			response.sendRedirect("admlogin.jsp");
		}else{
			
		}
	%><br>
	<form action="AdmLogout" method="post">
		<input type="submit" value="SIGN OUT">
	</form>
</body>
</html>