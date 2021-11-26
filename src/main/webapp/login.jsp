<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login | Car Parking Solutions</title>
	<!-- <script src="JS/GLogin.js"></script> -->
   <script src="https://apis.google.com/js/platform.js" async defer></script>
   <meta name="google-signin-client_id" content="304993750427-lhfj72u0qff5qfjg7hhiqh4v2n32ud83.apps.googleusercontent.com">
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
   <script type="text/javascript">
      function onSignIn(googleUser) {
      	  //window.location.href='home.jsp';
    	  var profile = googleUser.getBasicProfile();
    	  document.FormNonCr.loginw.value = "G";
    	  document.FormNonCr.fname.value = profile.getGivenName();
    	  document.FormNonCr.lname.value = profile.getFamilyName();
    	  document.FormNonCr.email.value = profile.getEmail();
    	  document.FormNonCr.submit();
	}
   </script>
   <script>
      function myFunction() {
	      gapi.auth2.getAuthInstance().disconnect();
	      FB.logout(function(response){});
	      location.reload();
	   }
   </script><br>
<script>

  function statusChangeCallback(response) {  // Called with the results from FB.getLoginStatus().
    //console.log('statusChangeCallback');
    //console.log(response);                   // The current login status of the person.
    if (response.status === 'connected') {   // Logged into your webpage and Facebook. 
      //window.location.href='home.jsp?access_token='+response.authResponse.accessToken; 
  	  testAPI();
    }
  }


  function checkLoginState() {               // Called when a person is finished with the Login Button.
    FB.getLoginStatus(function(response) {   // See the onlogin handler
      statusChangeCallback(response);
    });
  }


  window.fbAsyncInit = function() {
    FB.init({
      appId      : '300478212005443',
      cookie     : true,                     // Enable cookies to allow the server to access the session.
      xfbml      : true,                     // Parse social plugins on this webpage.
      version    : 'v12.0'           // Use this Graph API version for this call.
    });


    FB.getLoginStatus(function(response) {   // Called after the JS SDK has been initialized.
      statusChangeCallback(response);        // Returns the login status.
    });
  };
  
  
 
  function testAPI() {                      // Testing Graph API after login.  See statusChangeCallback() for when this call is made.
    FB.api('/me/?fields=id,first_name,last_name,email', function(response) {
    	document.FormNonCr.loginw.value = "FB";
    	//console.log('Welcome!  Fetching your information.... ');
    	document.FormNonCr.fname.value = response.first_name;
    	document.FormNonCr.lname.value = response.last_name;
    	document.FormNonCr.email.value = response.email;
    	document.FormNonCr.submit();
    });
  }

</script>


<!-- The JS SDK Login Button -->

<fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
</fb:login-button>

<div id="status">
</div>

<!-- Load the JS SDK asynchronously -->
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js"></script>
</body>
</html>