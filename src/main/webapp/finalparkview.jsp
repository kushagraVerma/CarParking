<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page import="com.carpark.model.Park" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
	
	<h1>Location: <% out.println(loc); %> </h1>
	<h1>Date: <% out.println(date); %> </h1>
	<h1>Time: <% out.println(time); %> </h1>
	
	<table border="1px solid black" >
  <tr>
    <th><h1>&emsp; Number &emsp;</h1></th>
    <th><h1>&emsp; Status &emsp;</h1></th>
    <th><h1>&emsp; Color &emsp;</h1></th>
    <th><h1>&emsp; Booking &emsp;</h1></th>
    <th><h1>&emsp; Parkspace &emsp;</h1></th>
  </tr>
	
	<c:forEach items="${Info}" var="slot">
	<tr>
	<td><h1> &emsp; &emsp; ${num=num+1} </h1> </td>

	<c:choose>
		  <c:when test="${slot.getEmt().equals(\"1\")}" >
			<td bgcolor= "Green"><h1>&emsp; Empty</h1></td>
		  </c:when>
		  <c:otherwise>
			<td bgcolor= "Red"><h1>&emsp; Filled</h1></td>
		  </c:otherwise>
	</c:choose>
	
	<c:choose>
		  <c:when test="${slot.getEmt().equals(\"1\")}" >
			<td>&emsp;&emsp;&emsp;&emsp;<button disabled>DELETE</button></td>
		  </c:when>
		  <c:otherwise>
			<td>&emsp;&emsp;&emsp;&emsp;<button>DELETE</button></td>
		  </c:otherwise>
		</c:choose>
	
	<c:choose>
		  <c:when test="${slot.getEmt().equals(\"1\")}" >
			<td>&emsp;&emsp;&emsp;&emsp;<button>DELETE</button></td>
		  </c:when>
		  <c:otherwise>
			<td>&emsp;&emsp;&emsp;&emsp;<button disabled>DELETE</button></td>
		  </c:otherwise>
		</c:choose>
	
	
	</tr>
	</c:forEach>
	</table>
	<script>
	function delBook(cout){
		
	}
	</script>
	
	


</body>
</html>