<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "com.carpark.model.Park" import = "java.util.ArrayList"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page import="com.carpark.model.User" %>
<%@ page import="com.carpark.model.Worker" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Waiting List and Choosing Parking Spot</title>
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
		if(session.getAttribute("ParkingList")==null){
			response.sendRedirect("Booking.jsp");
			return;
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
	<table border="1px solid black">
		<tr>
			<th>Parking Space</th>
			<th>Cost</th>
			<th>Waiting Time</th>
			<th>Rating</th>
			<th>Services</th>
			<th>Availability</th>
		</tr>
		<c:forEach items="${ParkingList}" var="pspace">
			<c:choose>
		  	<c:when test="${pspace.getEmt()==0}" >
				<tr style = "background-color : red">
					<td>${pspace.getPID()}</td>
					<td>${pspace.getCost()}</td>
					<td>${pspace.getWaitingTime()}</td>
					<td>
						<c:choose>
							<c:when test="${pspace.getRating()>=0 }">
								${pspace.getRating() }
							</c:when>
							<c:otherwise>
								-
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<c:forEach var="i" begin="1" end="3">
							<c:choose>
								<c:when test="${pspace.getServStr().charAt(i)=='1'}">
									<c:out value="${Worker.servNames[i]}"></c:out>
								</c:when>
							</c:choose>
						</c:forEach>
					</td>
					<td><button disabled>Unavailable</button></td>
				</tr>
		  	</c:when>
		 	<c:otherwise>
				<tr style = "background-color : green">
					<td>${pspace.getPID()}</td>
					<td>${pspace.getCost()}</td>
					<td>0</td>
					<td>
						<c:choose>
							<c:when test="${pspace.getRating()>=0 }">
								${pspace.getRating() }
							</c:when>
							<c:otherwise>
								-
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<c:forEach var="i" begin="0" end="3">
							<c:choose>
								<c:when test="${pspace.getServStr().charAt(i)-'0'>48}">
									<c:out value="${Worker.servNames[i]}"></c:out>
									<br>
								</c:when>
							</c:choose>
						</c:forEach>
					</td>
					<td><button onclick="clickAvailable(${pspace.getPID()})">Available</button></td>
				</tr>
		  	</c:otherwise>
			</c:choose>
		</c:forEach>
	</table>
	<%
		if(session.getAttribute("showWaiting")!=null){
			out.println("Join waiting list: <button onclick=\"toWaiting()\">JOIN</button>");
			session.removeAttribute("showWaiting");
		}
	%>
	<form name="payForm" action="GoToPay" method="post">
		<input type="hidden" name="Pid">
	</form>
	<form name="waitForm" action="AddWaiting" method="post">
	</form>
	<script>
		function clickAvailable(Psp){
			console.log(Psp);
			document.payForm.Pid.value = Psp;
			document.payForm.submit()
		}
		function toWaiting(){
			document.waitForm.submit()
		}
	</script>
	<form name="homeForm" action="home.jsp"></form>
   <button onclick="document.homeForm.submit()">Home</button>
	<form name="logoutForm" action="Logout" method="post"></form>
   <button onclick="myFunction()">Sign Out</button>
</body>
</html>