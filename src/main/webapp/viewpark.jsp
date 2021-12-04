<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.carpark.model.Admin"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Parking Spaces</title>
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

	if (session.getAttribute("locList") == null) {
		session.setAttribute("redirLoc", "viewpark.jsp");
		System.out.println(session.getAttribute("redirLoc"));
		response.sendRedirect("LocLoad");
		return;
	}
	%>
	<form action="ViewParkspaces" method="get">
		<select name="Location" required>
			<c:forEach items="${locList}" var="location">
				<c:choose>
					<c:when test="${location.equals(loc) }">
						<option value="${location}" selected>
					</c:when>
					<c:otherwise>
						<option value="${location}">
					</c:otherwise>
				</c:choose>
				${location}</option>
			</c:forEach>
		</select>* <input type="submit">
	</form>
	<c:choose>
		<c:when test="${Spaces!=null && Spaces.size()>0}">
			<table border="1px solid black">
				<tr>
					<th>Parking ID</th>
					<th>Bookings</th>
					<th>Parkspace</th>
				</tr>

				<c:forEach items="${Spaces}" var="space">
					<tr>
						<td>${space.getPID()}</td>
						<c:choose>
							<c:when test="${space.getEmt()==1}">
								<td>No Bookings</td>
							</c:when>
							<c:otherwise>
								<td><button onClick="viewT(${space.getPID()})">VIEW</button></td>
							</c:otherwise>
						</c:choose>
						<td><button onClick="removeP(${space.getPID()})">DELETE</button></td>
					</tr>
				</c:forEach>
			</table>
		</c:when>
		<c:otherwise>
			No parking spaces loaded
		</c:otherwise>
	</c:choose>
	
	<form name="viewTime" action="Timeview" method="post">
		<input name="pid" type="hidden">
	</form>
	<form name="removeSpace" action="RemoveParkspace" method="post">
		<input name="pid" type="hidden">
	</form>
	<script>
		function viewT(Pid){
			document.viewTime.pid.value = Pid;
			document.viewTime.submit();
		}
		function removeP(Pid){
			if(confirm("Are you sure you want to remove this parking?")){
				document.removeSpace.pid.value = Pid;
				document.removeSpace.submit();
			}
		}

	</script>
	<form name="homeForm" action="admhome.jsp"></form>
   <button onclick="document.homeForm.submit()">Home</button>
	<form action="AdmLogout" method="post">
		<input type="submit" value="SIGN OUT">
	</form>
	
	<%
	session.removeAttribute("Pid");
	session.removeAttribute("location");
	session.removeAttribute("Dates");
	session.removeAttribute("Spaces");
	session.removeAttribute("locList");
	%>
</body>
</html>