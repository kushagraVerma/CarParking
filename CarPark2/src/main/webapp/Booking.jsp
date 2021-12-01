<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page import="com.carpark.model.User" import = "java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booking</title>
   <script src="JS/logoutScr.js"></script>
   <script src="https://apis.google.com/js/platform.js?onload=onLoad" async></script>
   <meta name="google-signin-client_id" content="304993750427-lhfj72u0qff5qfjg7hhiqh4v2n32ud83.apps.googleusercontent.com">
   <script async src="https://connect.facebook.net/en_US/sdk.js" crossorigin="anonymous"></script>
</head>
<body>
	<%
		response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
		response.setHeader("Pragma","no-cache");
		response.setHeader("Expires","0");
	
		User u = (User) session.getAttribute("user");
		if(u==null){
			response.sendRedirect("login.jsp");
		}else{
			
		}
		if(session.getAttribute("locList")==null){
			response.sendRedirect("LocLoad");
		}
	%>
	<h1>Welcome, <%=u.getFn() %>!</h1>
	<form action = "BookingDetails" method ="get">
		<ul style="list-style-type:none;">
			<li>Location 
			<label> Select Location </label>  
			<select name="Location" >
			<c:forEach items="${locList}" var="location">
				<option value="${location}" > ${location} </option>
			</c:forEach>
			</select>  
	        </li>
    	    <li>Check-in Date and Time		<!-- Add only future dates -->
			<input type ="datetime-local" name="DateTimeIn" required></input></li>
			<li>Check-out Date and Time
			<input type ="datetime-local" name="DateTimeOut" required></input></li>
		</ul>
		<input type = "submit">
	</form>
	<% session.removeAttribute("locList"); %>
	<form name="logoutForm" action="Logout" method="post"></form>
   <button onclick="myFunction()">Sign Out</button>
</body>
</html>