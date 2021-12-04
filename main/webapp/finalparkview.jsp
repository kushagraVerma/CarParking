<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page import="com.carpark.model.Park" %>
<%@ page import="com.carpark.model.Admin" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Parking Details</title>
</head>
<body>
<%! String loc=""; String time=""; String date="";int num=1;%>
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
		String t = (String)session.getAttribute("Time");
		int i=0;
		
		while(t.charAt(i)!='T')
		{	
			i++;
		}
		date=t.substring(0,i);
		session.setAttribute("Date", date);
		i++;
		
		
		time=t.substring(i,t.length());
		
	%>

	<h1>Location: <% out.println(loc); %> </h1>
	<h1>Date: <% out.println(date); %> </h1>
	<h1>Time: <% out.println(time); %> </h1>
	
	<table border="1px solid black" >
  <tr>
    <th><h1>&emsp; Parking ID &emsp;</h1></th>
    <th><h1>&emsp; Status &emsp;</h1></th>
    <th><h1>&emsp; Color &emsp;</h1></th>
    <th><h1>&emsp; Booking &emsp;</h1></th>
    <th><h1>&emsp; Parkspace &emsp;</h1></th>
  </tr>
	
	<c:forEach items="${Info}" var="slot">
	<tr>
	<td><h1> &emsp; &emsp;&emsp; ${slot.getPID()} </h1> </td>

	<c:choose>
		  <c:when test="${slot.getEmt()==1}" >
			<td><h1>&emsp; Empty</h1></td>
		  </c:when>
		  <c:otherwise>
			<td><h1>&emsp; Filled</h1></td>
		  </c:otherwise>
	</c:choose>
	
	<c:choose>
		  <c:when test="${slot.getEmt()==1}" >
			<td bgcolor= "Green"></td>
		  </c:when>
		  <c:otherwise>
			<td bgcolor= "Red"></td>
		  </c:otherwise>
	</c:choose>
	
	<c:choose>
		  <c:when test="${slot.getDTin()==null}" >
			<td>&emsp;&emsp;&emsp;&emsp;<button disabled>VIEW</button></td>
		  </c:when>
		  <c:otherwise>
			<td>&emsp;&emsp;&emsp;&emsp;<button onClick="viewT(${slot.getPID()},'${Date}')">VIEW</button></td>
		  </c:otherwise>
		</c:choose>
	
	
	
		<td>&emsp;&emsp;&emsp;&emsp;<button onClick="removeP(${slot.getPID()})">DELETE</button></td>
	
	
	</tr>
	</c:forEach>
	</table>
	
	<form name="removeSlot" action="RemoveParkspace" method="post">
		<input name="pid" type="hidden">
	</form>
	<script>
		function removeP(Pid){
			if(confirm("Are you sure you want to remove this parking?")){
				document.removeSlot.pid.value = Pid;
				document.removeSlot.submit();
			}
		}

	</script>
	
	<form name="viewTime" action="Timeview" method="post">
	<input name="pid" type="hidden">
	<input name="date" type="hidden">
	</form>
	<script>
		function viewT(Pid,date){
			if(confirm("viewing")){
			document.viewTime.pid.value = Pid;
			document.viewTime.date.value = date;
			document.viewTime.submit();
			}
			}
		

	</script>


</body>
</html>