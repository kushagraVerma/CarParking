<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.carpark.model.Worker" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Worker Home | Car Parking Solutions</title>
</head>
<body>
	<%
		response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
		response.setHeader("Pragma","no-cache");
		response.setHeader("Expires","0");
	
		Worker w = (Worker) session.getAttribute("worker");
		if(w==null){
			response.sendRedirect("wrklogin.jsp");
		}else{
			
		}
	%><br>
	<form action="WrkLogout" method="post">
		<input type="submit" value="SIGN OUT">
	</form>
</body>
</html>