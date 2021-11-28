<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login | Car Parking Solutions</title>
   <script src="JS/loginScr.js"></script>
   <script src="https://apis.google.com/js/platform.js" async defer></script>
   <meta name="google-signin-client_id" content="304993750427-lhfj72u0qff5qfjg7hhiqh4v2n32ud83.apps.googleusercontent.com">
   <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js"></script>
</head>
<body>
	<form action="LoginCred" method="post">
		Enter username: <input type="text" name="uname"><br>
		Enter password: <input type="password" name="pass"><br>
		<input type="submit" value="LOGIN">
	</form><br>
	<div><%
		String inval = (String) session.getAttribute("invalid-login");
		if(inval!=null){
			out.println(inval);
			session.removeAttribute("invalid-login");
		}
	%></div><br>
	----OR----<br>
	<form name="FormNonCr" action="LoginNonCred" method="post">
    	<input type="hidden" name="loginw">
    	<input type="hidden" name="fname">
    	<input type="hidden" name="lname">
    	<input type="hidden" name="email">
	</form>
   <div class="g-signin2" data-onsuccess="onSignIn" id="myP"></div>
   <fb:login-button scope="public_profile,email" onlogin="checkLoginState();"></fb:login-button>
</body>
</html>