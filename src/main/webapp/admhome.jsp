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
			return;
		}
	%><br>
	
	
	<h1>Manage parking space</h1>		 
	<ul>	
	<li><a href="addparking.jsp">Add new parking space</a></li>
	<li><a href="viewpark.jsp">View parking spaces</a></li>
	</ul>
	
	
	<h1>Report of workers</h1>
	<ul>	
	<li><a href="addwork.jsp">Add a worker</a></li>
	<li><a href="viewwrk.jsp">view worker</a></li>
	</ul>
		
	
	
	<form action="AdmLogout" method="post">
		<input type="submit" value="SIGN OUT">
	</form>
</body>
</html>