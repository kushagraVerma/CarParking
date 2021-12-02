<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page import="com.carpark.model.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Raise Request</title>
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
		}else if(session.getAttribute("locList")==null){
			session.setAttribute("redirLoc","raiserequest.jsp");
			System.out.println(session.getAttribute("redirLoc"));
			response.sendRedirect("LocLoad");
			return;
		}
	%>
	Raise a request for a parking slot suitable for your car model:<br>
	<form>
			Location: 
			<select>
			<c:forEach var="location" items="${locList}" >
				<option value="${location}" > ${location} </option>
			</c:forEach>
			</select><br>
			Your car model: <input type="text">
	</form>
	<button onclick="gotRequest()">SUBMIT REQUEST</button>
	<form name="homeForm" action="home.jsp"></form>
	<script>
		function gotRequest(){
			alert("Your request has been submitted!");
			document.homeForm.submit();
		}
	</script>
	<form name="logoutForm" action="Logout" method="post"></form>
   <button onclick="myFunction()">Sign Out</button>
</body>
</html>