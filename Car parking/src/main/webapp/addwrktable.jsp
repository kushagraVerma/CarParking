<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page import="com.carpark.model.Park" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List</title>
</head>
<body>
<%! String loc="";String first="";String last=""; int num=1;%>

<%
	loc = (String)session.getAttribute("Location");
	first = (String)session.getAttribute("fname");
	last = (String)session.getAttribute("lname");
%>
<h1>Location: <% out.println(loc); %> </h1>
<h1> Worker: <%out.println(first + " " + last); %></h1>

<table border="1px solid black" >
  <tr>
    <th><h1>&emsp; Number &emsp;</h1></th>
    <th><h1>&emsp; Add &emsp;</h1></th>
  </tr>
	
	<c:forEach items="${Info}" var="slot">
	<tr>
	<td><h1> &emsp; &emsp; ${num=num+1} </h1> </td>
	
	<c:choose>
		  <c:when test="${slot.getEmt().equals(\"0\")}" >
			<td>&emsp;&emsp;<input type="button" value="Add here"></td>
		  </c:when>
		  <c:otherwise>
			<td>&emsp;&emsp;<input type="button" value="Add here"></td>
		  </c:otherwise>
		</c:choose>
	
	
	</tr>
	</c:forEach>
	</table>


</body>
</html>