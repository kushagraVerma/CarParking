<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page import="com.carpark.model.Worker" import = "java.util.ArrayList"%>
<%@ page import="com.carpark.model.Admin"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Workers</title>
</head>
<body>
	<%
	response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
	response.setHeader("Pragma","no-cache");
	response.setHeader("Expires","0");

	Admin a = (Admin) session.getAttribute("admin");
	if(a==null){
		response.sendRedirect("admlogin.jsp");
		return;
	}
	if(session.getAttribute("wlist")==null){
		response.sendRedirect("LoadWorkers");
	}
	%>
	<table border="1px solid black">
		<tr>
			<th>Name</th>
			<th>Parking Slot ID</th>
			<th>User Rating</th>
			<th>Date Joined</th>
			<th></th>
		</tr>
	<c:forEach items="${wlist}" var="worker">
		<tr>
			<th>${worker.getFname()}</th>
			<th>${worker.getPid()}</th>
			<c:choose>
				<c:when test="${worker.getRateCount()>0}">
					<th>${worker.getRating()}</th>
				</c:when>
				<c:otherwise>
					<th>No ratings</th>
				</c:otherwise>
			</c:choose>
			<th>${worker.getJoined()}</th>
			<th><button onClick="removeW(${worker.getWid()})">REMOVE</button></th>
		</tr>
	</c:forEach>
	</table>
	<form name="removeForm" action="RemoveWorker" method="post">
		<input name="wid" type="hidden">
	</form>
	<script>
		function removeW(Wid){
			if(confirm("Are you sure you want to remove this worker?")){
				document.removeForm.wid.value = Wid;
				document.removeForm.submit();
			}
		}
	</script>
</body>
</html>