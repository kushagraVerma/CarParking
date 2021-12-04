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
<%! int x=0;int b=0;%>
<%
		response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
		response.setHeader("Pragma","no-cache");
		response.setHeader("Expires","0");
	
		Admin a = (Admin) session.getAttribute("admin");
		if(a==null){
			response.sendRedirect("admlogin.jsp");
			return;
		}
		String c =(String)session.getAttribute("check");
		
			
		
		if(c!=null || b==0){
			response.sendRedirect("AdmLocLoad3");
			session.removeAttribute("check");
			b++;
			return;
		}
		
		int d=0;
		
		if(session.getAttribute("Parkadded")==null)
		{
			d=0;
		}
		else
		{
			d=(int)session.getAttribute("Parkadded");
		}
		
		if(d!=0 && d==1)
		{
			x=1;
			session.setAttribute("Parkadded",2);
		}
	

%>

<form action = "addnewlocpark" method ="post">
			Enter New Location:<input type="text" name="newloc" maxlength="128" required>
		<input type="submit" name="val" value="Add parking">
</form>

	

<form action = "addnewlocpark" method ="post">
		<ul style="list-style-type:none;">
			<li>Choose Existing Location
			<select name="newloc" required >
			<c:forEach items="${locList3}" var="location">
				<option value="${location}" > ${location} </option>
			</c:forEach>
			</select>  
		<input type = "submit" value="Add parking">
	</form>
<h1>
	<%
	     if(x==1)
	     {
	    	 out.println("Parking Added");
	     }
	
	%>
	</h1>	
			

</body>
</html>