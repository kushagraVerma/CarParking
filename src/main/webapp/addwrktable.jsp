<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page import="com.carpark.model.Park" %>
<%@ page import="com.carpark.model.Admin"%>
<%@ page import="com.carpark.dao.ParkDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List</title>
</head>
<body>
<%! String loc="";String first="";String last=""; int num=1;%>

<%
	response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
	response.setHeader("Pragma","no-cache");
	response.setHeader("Expires","0");
	
	Admin a = (Admin) session.getAttribute("admin");
	if(a==null){
		response.sendRedirect("admlogin.jsp");
		return;
	}
	
	loc = (String)session.getAttribute("Location");
	first = (String)session.getAttribute("fname");
	last = (String)session.getAttribute("lname");
%>
<h1>Location: <% out.println(loc); %> </h1>
<h1> Worker: <%out.println(first + " " + last); %></h1>
<table border="1px solid black" >
  <tr>
    <th><h1>&emsp; Parking Number &emsp;</h1></th>
    <th><h1>&emsp; Add &emsp;</h1></th>
  </tr>
	
	<c:forEach items="${Info}" var="slot">
	<tr>
	<td><h1> &emsp; &emsp; ${slot.getPID()} </h1> </td>
	<c:choose>
		  <c:when test="${ParkDAO.checkWid(slot.getPID())}" >
			<td>&emsp;&emsp;<button disabled>Add here</button></td>
		  </c:when>
		  <c:otherwise>
			<td>&emsp;&emsp;<button onclick="assW(${slot.getPID()})">Add here</button></td>
		  </c:otherwise>
		</c:choose>
	</tr>
	</c:forEach>
	</table>
<form name="assForm" method="get" action = "addtosql">
<input type="hidden" name="pid">
</form>
	<script>
		function assW(Pid){
			document.assForm.pid.value = Pid;
			document.assForm.submit();
		}
	</script>
	
	<form name="homeForm" action="admhome.jsp"></form>
   <button onclick="document.homeForm.submit()">Home</button>
	<form action="AdmLogout" method="post">
		<input type="submit" value="SIGN OUT">
	</form>
	
</body>
</html>