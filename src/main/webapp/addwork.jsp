<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.carpark.model.Worker" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Worker</title>
</head>
<body>
<%! String fn=""; String ln=""; String un=""; String pw=""; String ad=""; String em=""; String ph=""; String cr=""; %>

<%
		response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
		response.setHeader("Pragma","no-cache");
		response.setHeader("Expires","0");
	
		Worker a = (Worker) session.getAttribute("Worker");
		if(a!=null){
			response.sendRedirect("admlogin.jsp");
			return;
		}		
		if(session.getAttribute("locList2")==null){
			response.sendRedirect("AdmLocLoad2");
			return;
		}		
	%>


<form action="addingworker" method="post">
		Enter first name: <input type="text" name="fname"  maxlength="128" required>*<br>
		Enter last name: <input type="text" name="lname" maxlength="128" required>*<br>
		Enter email ID: <input type="email" name="email" maxlength="64" ><br>
		Enter mobile no.: <input type="tel" name="phno" maxlength="10"><br>
		<ul style="list-style-type:none;">
			<li>Location
			<select name="Location" required >
			<c:forEach items="${locList2}" var="location">
				<option value="${location}" > ${location} </option>
			</c:forEach>
			</select>  
			*
	        </li>
	        <li>Date Of Joining
 	        <input type="date" name="birthday">
	     </li>
	     </ul>
	     
	 	 <input type ="submit">
		</form>

</body>
</html>