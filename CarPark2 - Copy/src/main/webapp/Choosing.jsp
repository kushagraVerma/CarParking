<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "com.carpark.model.Park" import = "java.util.ArrayList"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Waiting List and Choosing Parking Spot</title>
</head>
<body>
	<h1>Choose your Parking Spot</h1>
	<% String Loc = (String)session.getAttribute("Location"); %>
	<% String CiDT = (String)session.getAttribute("DateTimeIn"); %>
	<% String CoDT = (String)session.getAttribute("DateTimeOut"); %>
	<h3>Your Current Details:</h3>
	<ul style="list-style-type:none;">
		<li>Location: <%=Loc %></li>
		<li>Check-in Date and Time: <%= CiDT %></li>
		<li>Check-out Date and Time: <%= CoDT %></li>
	</ul>
	<%-- <form>
	<c:forEach items="${ParkingList}" var="u">
		<input type = "button">
		${s} <br>
		</input >
	</c:forEach>
	</form> --%>
</body>
</html>