<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.carpark.model.User" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Bookings</title>
   <script src="JS/logoutScr.js"></script>
   <script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
   <meta name="google-signin-client_id" content="304993750427-lhfj72u0qff5qfjg7hhiqh4v2n32ud83.apps.googleusercontent.com">
   <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js"></script>
</head>
<body>
	<%
		response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
		response.setHeader("Pragma","no-cache");
		response.setHeader("Expires","0");
		
		User u = (User) session.getAttribute("user");
		if(u==null){
			response.sendRedirect("login.jsp");
			return;
		}
		if(session.getAttribute("Bookings")==null){
			response.sendRedirect("GetBookings");
			return;
		}
		
	%>
	Your bookings:<br>
	<c:choose>
		<c:when test="${Bookings.size()==0 }">
			No bookings yet!
		</c:when>
		<c:otherwise>
			<table border="1px solid black">
			<tr>
				<th>Location</th>
				<th>Check-in Datetime</th>
				<th>Check-out Datetime</th>
				<th>Cost</th>
			</tr>
			<c:forEach items="${Bookings }" var="booking">
				<tr>
					<td>${booking.getLoc()}</td>
					<td>${booking.getDTin()}</td>
					<td>${booking.getDTout()}</td>
					<td>${booking.getCost() }</td>
				</tr>
			</c:forEach>
			</table>		
		</c:otherwise>
	</c:choose><br>
	
	
	<c:choose>
		<c:when test="${Waits.size()==0 }">
		</c:when>
		<c:otherwise>
			Waiting list:<br>
			<table border="1px solid black">
			<tr>
				<th>Location</th>
				<th>Check-in Datetime</th>
				<th>Check-out Datetime</th>
			</tr>
			<c:forEach items="${Waits }" var="wait">
				<tr>
					<td>${wait.getLoc()}</td>
					<td>${wait.getDTin()}</td>
					<td>${wait.getDTout()}</td>
				</tr>
			</c:forEach>
			</table>		
		</c:otherwise>
	</c:choose><br>
	<form name="logoutForm" action="Logout" method="post"></form>
   <button onclick="myFunction()">Sign Out</button>
	
</body>
</html>