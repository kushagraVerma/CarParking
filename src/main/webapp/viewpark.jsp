<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.carpark.model.Admin"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<title>View Parking Spaces</title>
</head>
<body>
	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");

	Admin a = (Admin) session.getAttribute("admin");
	if (a == null) {
		response.sendRedirect("admlogin.jsp");
		return;
	}

	if (session.getAttribute("locList") == null) {
		session.setAttribute("redirLoc", "viewpark.jsp");
		System.out.println(session.getAttribute("redirLoc"));
		response.sendRedirect("LocLoad");
		return;
	}
	%>
	
  <section class="vh-100" style="background-color: #508bfc;">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-12 col-md-8 col-lg-6 col-xl-5">
        <div class="card shadow-2-strong" style="border-radius: 1rem;">
          <div class="card-body p-5 text-center">
          <form class="form-sigin" action="ViewParkspaces" method="get">
            <img class="mb-1 img-fluid" src="images/kasa-Logo.png" alt="" width="150px" height="150px">
            <h3 class="mb-3 font-weight-bolder">Car Parking Solutions</h3>
            <hr color="black">
            <h4 class="mb-3">View Parking Spaces</h4>
            
            <select class="form-select form-select-lg mb-3 btn btn-lg btn-block" id="Location" aria-label=".form-select-lg example" name="Location" required >
			<c:forEach items="${locList}" var="location">
				<c:choose>
					<c:when test="${location.equals(loc) }">
						<option value="${location}" selected>
					</c:when>
					<c:otherwise>
						<option value="${location}">
					</c:otherwise>
				</c:choose>
				${location}</option>
			</c:forEach>
            <label class="form-label" for="Location">Location</label>
            <input class="btn btn-primary btn-lg btn-block" type="submit" value="Submit">
            </form>
	        <hr class="my-4">
	<c:choose>
		<c:when test="${Spaces!=null && Spaces.size()>0}">
		
		<table class="table table-bordered">
        <thead class="thead-dark">
        <tr>
        <th scope="col">Parking ID</th>
        <th scope="col">Bookings</th>
        <th scope="col">Parkspace</th>
        </tr>
        </thead>

				<c:forEach items="${Spaces}" var="space">
					<tr>
						<td class="align-middle">${space.getPID()}</td>
						<c:choose>
							<c:when test="${space.getEmt()==1}">
								<td class="align-middle">No Bookings</td>
							</c:when>
							<c:otherwise>
								<td class="align-middle"><button class="btn btn-success btn-lg" onClick="viewT(${space.getPID()})" >View</button></td>
							</c:otherwise>
						</c:choose>
						<td class="align-middle"><button class="btn btn-danger btn-lg" onClick="removeP(${space.getPID()})">Delete</button></td>
					</tr>
				</c:forEach>
			</table>
		</c:when>
		<c:otherwise>
		<h5 class="mb-3">No parking spaces loaded</h5>
			
		</c:otherwise>
	</c:choose>
	
	<form name="viewTime" action="Timeview" method="post">
		<input name="pid" type="hidden">
	</form>
	<form name="removeSpace" action="RemoveParkspace" method="post">
		<input name="pid" type="hidden">
	</form>
	<script>
		function viewT(Pid){
			document.viewTime.pid.value = Pid;
			document.viewTime.submit();
		}
		function removeP(Pid){
			if(confirm("Are you sure you want to remove this parking?")){
				document.removeSpace.pid.value = Pid;
				document.removeSpace.submit();
			}
		}

	</script>
	 
	<hr class="my-4">
	
    <form name="homeForm" action="admhome.jsp"></form>
    <button class="btn btn-primary btn-lg btn-block" onclick="document.homeForm.submit()" type="submit" value="Home">Home</button><br>
	<form name="AdmLogout" action="Logout" method="post">
	<input class="btn btn-primary btn-lg btn-block" type="submit" value="Sign Out"></form>

	<%
	session.removeAttribute("Pid");
	session.removeAttribute("location");
	session.removeAttribute("Dates");
	session.removeAttribute("Spaces");
	session.removeAttribute("locList");
	%>
	
        </div>
        </div>
      </div>
    </div>
  </div>
</section>	
	
</body>
</html>