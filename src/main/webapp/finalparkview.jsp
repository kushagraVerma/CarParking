<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page import="com.carpark.model.Park" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<title>Parking Details</title>
</head>
<body>
<%! String loc=""; String time=""; String date="";int num=1;%>
	<%
		loc = (String)session.getAttribute("Location");
		String t = (String)session.getAttribute("Time");
		
		int i=0;
		
		while(t.charAt(i)!='T')
		{	
			i++;
		}
		date=t.substring(0,i);
		i++;
		
		time=t.substring(i,t.length());
		
	%>
	<section class="vh-100" style="background-color: #508bfc;">
    <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-12">
        <div class="card shadow-2-strong" style="border-radius: 1rem;">
          <div class="card-body p-5 text-center">
           <img class="mb-1 img-fluid" src="images/kasa-Logo.png" alt="" width="150px" height="150px">
            <h3 class="mb-3 font-weight-bolder">Car Parking Solutions</h3>
            <hr color="black">
            <h2 class="mb-3">Parking Details</h2>
             <hr color="black">
            <h4 class="mb-3">Location: <% out.println(loc); %> </h4>
            <h4 class="mb-3">Date: <% out.println(date); %> </h4>
            <h4 class="mb-3">Time: <% out.println(time); %> </h4>
     
<table class="table table-bordered">
  <thead class="thead-dark">
    <tr>
      <th scope="col">Number</th>
      <th scope="col">Status</th>
      <th scope="col">Booking</th>
      <th scope="col">Parkspace</th>
    </tr>
  </thead>
  <tbody>
	<c:forEach items="${Info}" var="slot">
	<tr>
	<td class="align-middle"> ${slot.getPID()} </td>

	<c:choose>
		  <c:when test="${slot.getEmt()==1}" >
			<td bgcolor= "Green"></td>
		  </c:when>
		  <c:otherwise>
			<td bgcolor= "Red"></td>
		  </c:otherwise>
	</c:choose>
	
	<c:choose>
		  <c:when test="${slot.getEmt()==1}" >
			<td><input class="btn btn-secondary btn-lg" type="submit" value="Delete" disabled></td>
		  </c:when>
		  <c:otherwise>
		    <td><input class="btn btn-danger btn-lg" type="submit" value="Delete"></td>
		  </c:otherwise>
		</c:choose>
	
	<c:choose>
		  <c:when test="${slot.getEmt()==1}" >
			<td><input class="btn btn-danger btn-lg" type="submit" value="Delete"></td>
		  </c:when>
		  <c:otherwise>
			<td><input class="btn btn-secondary btn-lg" type="submit" value="Delete" disabled></td>
		  </c:otherwise>
		</c:choose>
	
	
	</tr>
	</c:forEach>
    
  </tbody>
</table>

          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</body>
</html>     
     