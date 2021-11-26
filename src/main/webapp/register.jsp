<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.carpark.model.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register | Car Parking Solutions</title>
</head>
<body>
	<%! String fn=""; String ln=""; String un=""; String pw=""; String ad=""; String em=""; String ph=""; String cr=""; %>
	<%
	User u = (User) session.getAttribute("new-user");
	if(u!=null){
		if(u.getFn()!=null) fn = u.getFn();
		if(u.getLn()!=null) ln = u.getLn();
		if(u.getUn()!=null) un = u.getUn();
		if(u.getPw()!=null) pw = u.getPw();
		if(u.getAddr()!=null) ad = u.getAddr();
		if(u.getEmail()!=null) em = u.getEmail();
		if(u.getPhno()!=null) ph = u.getPhno();
		if(u.getCarno()!=null) cr = u.getCarno();
	}
	%>
	<form action="RegCred" method="post">
		Enter first name: <input type="text" name="fname" value='<%= fn %>' maxlength="128" required>*<br>
		Enter last name: <input type="text" name="lname" value='<%= ln %>' maxlength="128"><br>
		Enter username: <input type="text" name="uname" value='<%= un %>' maxlength="128" required>*<br>
		Enter password: <input type="password" name="pass" value='<%= pw %>' maxlength="64" required>*<br>
		Confirm password: <input type="password" name="passCon" value="" maxlength="64" required>*<br>
		Enter residential address: <input type="text" name="address" value='<%= ad %>' maxlength="1024"><br>
		Enter email ID: <input type="email" name="email" value='<%= em %>' maxlength="64" required>*<br>
		Enter mobile no.: <input type="tel" name="phno" value='<%= ph %>' maxlength="10" required>*<br>
		Enter car registration no.: <input type="text" name="carno" value='<%= cr %>' maxlength="16" required>*<br>
		<c:choose>
		    <c:when test="${OTP!=null}">
		    </c:when>    
		    <c:otherwise>
			    <c:choose>
				    <c:when test="${validated!=null}">
						<input type="submit" name="emlOTP" value="EMAIL OTP">
						<input type="submit" name="smsOTP" value="SMS OTP">
				    </c:when>    
				    <c:otherwise>
						<input type="submit" name="val" value="VALIDATE">
				    </c:otherwise>
				</c:choose>	
		    </c:otherwise>
		</c:choose>		
	</form>
	<c:choose>
		    <c:when test="${OTP!=null}">
		    	<br>OTP has been sent!<br>
		    	<form action="VerifyOTP" method="post">
		    		<input type="text" name="uOTP">
		    		<input type="submit" value="VERIFY OTP">
		    	</form>
		    </c:when>
		</c:choose>
	<div><%
		String inval = (String) session.getAttribute("invalid-reg");
		if(inval!=null){
			out.println(inval);
			session.removeAttribute("invalid-reg");
		}
	%></div><br>

</body>
</html>