<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "com.carpark.model.Park" import = "java.util.ArrayList"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page import="com.carpark.model.User" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Waiting List and Choosing Parking Spot</title>
   <script src="JS/logoutScr.js"></script>
   <script src="https://apis.google.com/js/platform.js?onload=onLoad" async></script>
   <meta name="google-signin-client_id" content="304993750427-lhfj72u0qff5qfjg7hhiqh4v2n32ud83.apps.googleusercontent.com">
   <script async crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js"></script>
</head>
<body>
	<%
		response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
		response.setHeader("Pragma","no-cache");
		response.setHeader("Expires","0");
	
		User u = (User) session.getAttribute("user");
		if(u==null){
			response.sendRedirect("login.jsp");
		}
		else{
			
		}
	%>
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
	<h3>Following parking spaces are available:</h3><br>
	<form>
	<table>
		<c:forEach items="${ParkingList}" var="pspace">
			<c:choose>
		  	<c:when test="${pspace.getEmt().equals(\"0\")}" >
				<tr style = "background-color : red">
					<td>${pspace.getPID()}</td>
					<td>${pspace.getCost()}</td>
					<td>${pspace.getWaitingTime()}</td>
					<td><input type="button" value="Unavailable" disabled></td>
				</tr>
		  	</c:when>
		 	<c:otherwise>
				<tr style = "background-color : green">
					<td>${pspace.getPID()}</td>
					<td>${pspace.getCost()}</td>
					<td>0</td>
					<td><input type="button" value="Available"></td>
				</tr>
		  	</c:otherwise>
			</c:choose>
		</c:forEach>
	</table>
	</form>
	<form name="logoutForm" action="Logout" method="post"></form>
   <button onclick="myFunction()">Sign Out</button>
</body>
</html>