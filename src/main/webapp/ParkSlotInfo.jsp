<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.carpark.model.Admin"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Slots</title>
</head>
<body>
	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");

	Admin a = (Admin) session.getAttribute("admin");
	if (a == null) {
		response.sendRedirect("admlogin.jsp");
		return;
	}

	if (session.getAttribute("Dates") == null) {
		response.sendRedirect("viewpark.jsp");
		return;
	}
	%>
	<h1>Parking ID : ${Pid}</h1>
	<form action="ViewSlots" method="get">
		Select a date: <select name="Dt" required>
			<c:forEach items="${Dates}" var="date">
				<c:choose>
					<c:when test="${date.equals(dt) }">
						<option value="${date}" selected>
					</c:when>
					<c:otherwise>
						<option value="${date}">
					</c:otherwise>
				</c:choose>
				${date}</option>
			</c:forEach>
		</select>* <input type="submit">
	</form>

	<c:choose>
		<c:when test="${Slots!=null && Slots.size()>0}">
			<table border="1px solid black">
				<tr>
					<th>Start Time</th>
					<th>End Time</th>
					<th>Remove Slot</th>
				</tr>

				<c:forEach items="${Slots}" var="time">
					<tr>
						<td>${time.getDTin()}</td>
						<td>${time.getDTout()}</td>
						<td>
							<button onClick="TimeR('${time.getDTout()}',${Pid})">Remove</button>
						</td>
					</tr>
				</c:forEach>
			</table>
		</c:when>
		<c:otherwise>
			No slots loaded
		</c:otherwise>
	</c:choose>





	<form name="TimeRem" action="RemovingTime" method="post">
		<input name="pid" type="hidden"> <input name="time"
			type="hidden">
	</form>
	<script>
		function TimeR(time,pid){
				if(confirm("Remove This slot?")){
					document.TimeRem.pid.value = pid;
					document.TimeRem.time.value = time;
					document.TimeRem.submit();
				}
			}
		

	</script>
	<form name="homeForm" action="admhome.jsp"></form>
   <button onclick="document.homeForm.submit()">Home</button>
	<form action="AdmLogout" method="post">
		<input type="submit" value="SIGN OUT">
	</form>
<%
	session.removeAttribute("Slots");
	session.removeAttribute("dt");
%>







</body>
</html>