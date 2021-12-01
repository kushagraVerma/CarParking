<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.carpark.model.Admin" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Parking</title>
</head>
<body>
	
	<%
		response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
		response.setHeader("Pragma","no-cache");
		response.setHeader("Expires","0");
	
		Admin a = (Admin) session.getAttribute("admin");
		if(a!=null){
			response.sendRedirect("admlogin.jsp");
		}else{
			
		}
		
		if(session.getAttribute("locList")==null){
			response.sendRedirect("AdmLocLoad");
		}
		else
		{
		}
		
		
	%><br>
	
	<form action = "viewparkdetails" method ="get">
		<ul style="list-style-type:none;">
			<li>Location
			<select name="Location" required >
			<c:forEach items="${locList}" var="location">
				<option value="${location}" > ${location} </option>
			</c:forEach>
			</select>  
			*
	        </li>
	        <li>Date and Time		<!-- Add only future dates -->
			<input type ="datetime-local" name="DateTimeIn" required>*</li>
			</ul>
	        
		<input type = "submit">
	</form>
	

	


</body>
</html>