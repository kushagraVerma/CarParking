<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.carpark.model.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register | Car Parking Solutions</title>
</head>
<body>
	<%! String fn=""; String ln=""; String un=""; String ad=""; String em=""; String ph=""; String cr=""; %>
	<%
	User u = (User) session.getAttribute("new-user");
	if(u!=null){
		if(u.getFn()!=null) fn = u.getFn();
		if(u.getLn()!=null) ln = u.getLn();
		if(u.getUn()!=null) un = u.getUn();
		if(u.getAddr()!=null) ad = u.getAddr();
		if(u.getEmail()!=null) em = u.getEmail();
		if(u.getPhno()!=null) ph = u.getPhno();
		if(u.getCarno()!=null) cr = u.getCarno();
	}
	%>
	<form action="CredentialRegister" method="post">
		Enter first name: <input type="text" name="fname" value="${fn}" required>*<br>
		Enter last name: <input type="text" name="lname" value="${ln}"><br>
		Enter username: <input type="text" name="uname" value="${un}" required>*<br>
		Enter password: <input type="password" name="pass" required>*<br>
		Confirm password: <input type="password" name="passCon" required>*<br>
		Enter residential address: <input type="text" name="address" value="${ad}"><br>
		Enter email ID: <input type="email" name="email" value="${em}" required>*<br>
		Enter mobile no.: <input type="tel" name="phno" value="${ph}" required>*<br>
		Enter car registration no.: <input type="text" name="carno" value="${cr}" required>*<br>
		<input type="submit" name="emlOTP" value="EMAIL OTP"><input type="submit" name="smsOTP" value="SMS OTP">
	</form><br>
	<%
		if(session.getAttribute("pw-mismatch")!=null){
			out.println("Passwords do not match!");
			session.removeAttribute("pw-mismatch");
		}
		if(session.getAttribute("wrong-ph")!=null){
			out.println("Mobile number enterred incorrectly!");
			session.removeAttribute("wrong-ph");
		}
	%><br>
	----OR----<br>
	//Register with social media
	<!-- Register with Facebook -->
	<!-- Register with Gmail -->
	<!-- Register with Instagram -->
	<!-- Register with LinkedIn -->
</body>
</html>