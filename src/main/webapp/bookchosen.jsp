<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.carpark.model.Park" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>TEST</title>
</head>
<body>
	<%
	Park slot = (Park) session.getAttribute("Slot");
	if(slot==null){
		response.sendRedirect("home.jsp");
		return;
	}
	%>
	<h2>Booking Summary</h2>
	Location: <%= slot.getLoc() %><br>
	Check-in Datetime: <%= slot.getDTin() %><br>
	Check-out Datetime: <%= slot.getDTout() %><br>
	Total cost: <%= slot.getCost() %><br>
	<form action="AddBooking" method="post">
		<input type="submit" value="BOOK">
	</form>
</body>
</html>