<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.carpark.model.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Fill Details | Car Parking Solutions</title>
   <script src="JS/logoutScr.js"></script>
   <script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
   <meta name="google-signin-client_id" content="304993750427-lhfj72u0qff5qfjg7hhiqh4v2n32ud83.apps.googleusercontent.com">
   <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js"></script>
</head>
<body>
	<%! String ad=""; String ph=""; String cr=""; %>
	<%
	User u = (User) session.getAttribute("new-user-re");
	if(u!=null){
		if(u.getAddr()!=null) ad = u.getAddr();
		if(u.getPhno()!=null) ph = u.getPhno();
		if(u.getCarno()!=null) cr = u.getCarno();
	}else{
		session.removeAttribute("new-user-re");
		response.sendRedirect("register.jsp");
	}
	%>
	Your profile is almost complete, please fill the following details
	<form action="RegNonCred" method="post">
		Enter residential address: <input type="text" name="address" value='<%= ad %>' maxlength="1024"><br>
		Enter mobile no.: <input type="tel" name="phno" value='<%= ph %>' maxlength="10" required>*<br>
		Enter car registration no.: <input type="text" name="carno" value='<%= cr %>' maxlength="16" required>*<br>
		<input type="submit" value="SUBMIT">
	</form>
	<div><%
		String inval = (String) session.getAttribute("invalid-fill");
		if(inval!=null){
			out.println(inval);
			session.removeAttribute("invalid-fill");
		}
	%></div><br>
	<form name="logoutForm" action="Logout" method="post"></form>
   <button onclick="myFunction()">Sign Out</button>
</body>
</html>