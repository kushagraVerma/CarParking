<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Slots</title>
</head>
<body>
<%
	String date=(String)session.getAttribute("date");
	String pid=(String)session.getAttribute("pid");
	session.setAttribute("pid", pid);
	
%>

<h1>Date : ${date}</h1>
<h1>Parking ID : ${pid}</h1>



<table border="1px solid black" >
  <tr>
    <th><h1>&emsp; Start Time &emsp;</h1></th>
    <th><h1>&emsp; End Time &emsp;</h1></th>
    <th><h1>&emsp; Remove Slot&emsp;</h1></th>
  </tr>
	
	<c:forEach items="${Slots}" var="time">
	<tr>
	<td><h1> &emsp; &emsp;&emsp; ${time.getDTin()} </h1> </td>
	<td><h1> &emsp; &emsp;&emsp; ${time.getDTout()} </h1> </td>
	<td>&emsp;&emsp;&emsp;&emsp;<button onClick="TimeR('${time.getDTout()}','${pid}')">Remove</button></td>
		  
	
	</tr>
	</c:forEach>
	</table>
	
	
	
	
<form name="TimeRem" action="RemovingTime" method="post">
	<input name="pid" type="hidden">
	<input name="time" type="hidden">
	</form>
	<script>
	function TimeR(time,pid){
			
			if(confirm("Remove This slot?"))
			{
				document.TimeRem.pid.value = pid;
				document.TimeRem.time.value = time;
				document.TimeRem.submit();
			}
		}
		

	</script>








</body>
</html>