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
		if(session.getAttribute("locList")==null){
			session.setAttribute("redirLoc","Booking.jsp");
			System.out.println(session.getAttribute("redirLoc"));
			response.sendRedirect("LocLoad");
			return;
		}
	%>
	<form action = "BookingDetails" method ="get">
			Location: 
			<select name="Location" >
			<c:forEach items="${locList}" var="location">
				<option value="${location}" > ${location} </option>
			</c:forEach>
			</select><br>  
			Date: <input type="date" name="Date" required><br>
			From: <select type="time" id="TIn" name="TIn"></select>
			To: <select type="time" id="TOut" name="TOut"></select><br>
		<input type = "submit" value="VIEW AVAILABILITY">
	</form>
	<div><%
	if(session.getAttribute("invalid-dt")!=null){
		out.println(session.getAttribute("invalid-dt"));
	}
	session.removeAttribute("invalid-dt");
	%></div><br>
	<script>
	function addTimeOpt(selID,time){
		if(time.length<5){
			time = "0"+time;
		}
		let opt = document.createElement('option');
		opt.value = time;
		opt.innerHTML = time;
		document.getElementById(selID).add(opt);
	}
	for(let i = 8; i < 24; i++){
		addTimeOpt("TIn",i+":00");
		addTimeOpt("TIn",i+":30");
		addTimeOpt("TOut",i+":00");
		addTimeOpt("TOut",i+":30");
	}
	</script>
	<% session.removeAttribute("locList"); %>
	<form name="homeForm" action="home.jsp"></form>
   <button onclick="document.homeForm.submit()">Home</button>
	<form name="logoutForm" action="Logout" method="post"></form>
   <button onclick="myFunction()">Sign Out</button>
</body>
</html>