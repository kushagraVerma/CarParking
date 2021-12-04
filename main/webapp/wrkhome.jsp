<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page import="com.carpark.model.Worker" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Worker Home | Car Parking Solutions</title>
</head>
<body>
	<%! boolean servs[] = new boolean[4]; %>
	<%
		response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
		response.setHeader("Pragma","no-cache");
		response.setHeader("Expires","0");
	
		Worker w = (Worker) session.getAttribute("worker");
		if(w==null){
			response.sendRedirect("wrklogin.jsp");
			return;
		}else{
			servs = Worker.servFromStr(w.getServices());
		}
	%><br>
	Hello <% out.println(w.getFname()); %>!<br>
	Your parking space: <% out.println(w.getPid()); %><br>
	Services you provide:<br>
	<form action="UpdateServices" method="post">
		<c:forEach var="i" begin="0" end="3">
			<label for="Serv${i}">${Worker.servNames[i]}</label>
			<c:choose>
				<c:when test="${worker.getServices().charAt(i)-'0'>48}">
					<input type="checkbox" name="Serv${i}" value="Serv${i}" checked>
				</c:when>
				<c:otherwise>
					<input type="checkbox" name="Serv${i}" value="Serv${i}">
				</c:otherwise>
			</c:choose>
			<br>
		</c:forEach>
		<br>
		<input type="submit" value="UPDATE">
	</form>
	<form action="WrkLogout" method="post">
		<input type="submit" value="SIGN OUT">
	</form>
</body>
</html>