<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.carpark.model.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home | Car Parking Solutions</title>
   <script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
   <meta name="google-signin-client_id" content="304993750427-lhfj72u0qff5qfjg7hhiqh4v2n32ud83.apps.googleusercontent.com">
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
	%><br>
	<form name="logoutForm" action="Logout" method="post">
	</form>
   <button onclick="myFunction()">Sign Out</button>
   <script>
   		function onLoad() {
	      gapi.load('auth2', function() {
	        gapi.auth2.init();
	      });
	      window.fbAsyncInit = function() {
	    	    FB.init({
	    	      appId      : '300478212005443',
	    	      cookie     : true,                     // Enable cookies to allow the server to access the session.
	    	      xfbml      : true,                     // Parse social plugins on this webpage.
	    	      version    : 'v12.0'           // Use this Graph API version for this call.
	    	    });
	    	  };
	    }
      function myFunction() {
          var auth2 = gapi.auth2.getAuthInstance();
          auth2.signOut().then(function () {
            console.log('User signed out.');
          });
          FB.logout(function(response){});
	      document.logoutForm.submit();
	   }
   </script>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js"></script>

</body>
</html>