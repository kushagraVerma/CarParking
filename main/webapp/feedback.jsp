<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Feedback</title>
</head>
<body>
	<%
	if(session.getAttribute("Wid")==null){
		response.sendRedirect("home.jsp");
	}
	%>
	<form action="UpdateRating" method="post">
		Please rate your overall experience: 
	  <input type="radio" name="Rating" value="1"> <label for="1">1</label>
	  <input type="radio" name="Rating" value="2"> <label for="2">2</label>
	  <input type="radio" name="Rating" value="3"> <label for="3">3</label>
	  <input type="radio" name="Rating" value="4"> <label for="4">4</label>
	  <input type="radio" name="Rating" value="5"> <label for="5">5</label>
	<br>
	Additional feedback: <br> <textarea style="resize: none;" cols=50 rows=4 name="Addnl"></textarea><br>
	<input type="submit" value="SUBMIT">
	</form>
</body>
</html>