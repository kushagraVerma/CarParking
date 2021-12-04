<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.carpark.model.Admin" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add new parking space</title>
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
			
		
		if(session.getAttribute("locList")==null){
			session.setAttribute("redirLoc","addparking.jsp");
			System.out.println(session.getAttribute("redirLoc"));
			response.sendRedirect("LocLoad");
			return;
		}
	

%>

<form action = "addnewlocpark" method ="post">
			Enter New Location:<input type="text" name="newloc" maxlength="128" required>
		<input type="submit" name="val" value="Add parking">
</form>

	

<form action = "addnewlocpark" method ="post">
			<select name="newloc" required >
			<c:forEach items="${locList}" var="location">
				<option value="${location}" > ${location} </option>
			</c:forEach>
			</select>  
		<input type = "submit" value="Add parking">
	</form>
	<%
	     if(session.getAttribute("Parkadded")!=null){
	    	 out.println("Parking Added");
	    	 session.removeAttribute("Parkadded");
	     }
		session.removeAttribute("locList");
	%>
			

</body>
</html>