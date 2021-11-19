<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Verify Email | Car Parking Solutions</title>
</head>
<body>
	<form action="VerifyOTP" method="post">
		<input type="number" name="inotp">
		<input type="submit" value="Verify OTP">
	</form>
	<%
		if(session.getAttribute("wrong-otp")!=null){
			out.println("Incorrect OTP enterred");
			session.removeAttribute("wrong-otp");
		}
	%><br>
</body>
</html>