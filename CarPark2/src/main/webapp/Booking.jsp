<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booking</title>
</head>
<body>
<% String userid = request.getParameter("uname"); %>
	<h1>Welcome, <%=userid %>!</h1>
	<form action = "BookingDetails" method ="post">
		<ul style="list-style-type:none;">
			<li>Location 
			<input type="range" id="Location" name="Location" min="1" max="5" step="1"></input>
	        </li><br>
    	    <li>Check-in Date and Time		<!-- Add only future dates -->
			<input type ="datetime-local" name="DateTimeIn" required></input></li><br>
			<li>Check-out Date and Time
			<input type ="datetime-local" name="DateTimeOut" required></input></li><br>
			<input type="submit">
		</ul>
	</form type = "submit" >
</body>
</html>