<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.carpark.model.User" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Promo Codes</title>
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
		if(session.getAttribute("Promos")==null){
			response.sendRedirect("GetPromos");
			return;
		}
	%>
	<c:choose>
		<c:when test="${Promos.length()>0}">
			You have a promo code!
			<h3>${Promos}</h3>
			Use it while booking to get a 20% discount!
		</c:when>
		<c:otherwise>
			No promo codes yet...
		</c:otherwise>
	</c:choose>
	<form name="homeForm" action="home.jsp"></form>
   <button onclick="document.homeForm.submit()">Home</button>
	<form name="logoutForm" action="Logout" method="post"></form>
   <button onclick="myFunction()">Sign Out</button>
   <% session.removeAttribute("Promos"); %>
</body>
</html>