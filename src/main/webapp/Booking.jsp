<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page import="com.carpark.model.User" import = "java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booking</title>
   <script src="JS/logoutScr.js"></script>
   <script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
   <meta name="google-signin-client_id" content="304993750427-lhfj72u0qff5qfjg7hhiqh4v2n32ud83.apps.googleusercontent.com">
   <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js"></script>
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</head>
<body>
	<%
		response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
		response.setHeader("Pragma","no-cache");
		response.setHeader("Expires","0");
	
		User u = (User) session.getAttribute("user");
		if(u==null){
			response.sendRedirect("login.jsp");
			return;
		}
		if(session.getAttribute("locList")==null){
			session.setAttribute("redirLoc","Booking.jsp");
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
          <form class="form-sigin" action="BookingDetails" method="get">
            <img class="mb-1 img-fluid" src="images/kasa-Logo.png" alt="" width="150px" height="150px">
            <h3 class="mb-3 font-weight-bolder">Car Parking Solutions</h3>
            <hr color="black">
            <h4 class="mb-3">Booking</h4>
            
            <select class="form-select form-select-lg mb-3 btn btn-lg btn-block" aria-label=".form-select-lg example" name="Location" required >
			<c:forEach items="${locList}" var="location">
				<option value="${location}" > ${location} </option>
			</c:forEach>
            </select>
            <label class="form-label" for="typeuname">Location</label>
	        
	        <div class="form-outline mb-3">
              <input type="date" class="form-control form-control-lg" name="Date" required/>
              <label class="form-label" for="typedate" >Date</label>
            </div> 
            <div class="form-outline mb-3">
              <select type="time" id="TIn" class="form-control form-control-lg" name="TIn"/></select>
              <label class="form-label" for="typedate" >From</label>
            </div> 
	        <div class="form-outline mb-3">
              <select type="time" id="TOut" class="form-control form-control-lg" name="TOut"/></select>
              <label class="form-label" for="typedate" >To</label>
            </div> 
	        <input class="btn btn-primary btn-lg btn-block" type="submit" value="View Availability">
            <hr class="my-4">
            </form>
            
	<div><%
	if(session.getAttribute("invalid-dt")!=null){
		out.println(session.getAttribute("invalid-dt"));
	}
	session.removeAttribute("invalid-dt");
	%></div><br>
	<script>
	function addTimeOpt(selID,time){
		if(time.length<5){
			time = "0"+time;
		}
		let opt = document.createElement('option');
		opt.value = time;
		opt.innerHTML = time;
		document.getElementById(selID).add(opt);
	}
	for(let i = 8; i < 24; i++){
		addTimeOpt("TIn",i+":00");
		addTimeOpt("TIn",i+":30");
		addTimeOpt("TOut",i+":00");
		addTimeOpt("TOut",i+":30");
	}
	</script>
	<% session.removeAttribute("locList"); %>
	<form name="homeForm" action="home.jsp"></form>
    <button class="btn btn-primary btn-lg btn-block" onclick="document.homeForm.submit()" type="submit" value="Home">Home</button><br>
	<form name="logoutForm" action="Logout" method="post"></form>
	<button class="btn btn-primary btn-lg btn-block" onclick="myFunction()" type="submit" value="Sign Out">Sign Out</button>

        </div>
        </div>
      </div>
    </div>
  </div>
</section>
	
</body>
</html>