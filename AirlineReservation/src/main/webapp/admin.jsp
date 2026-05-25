<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <% if (session.getAttribute("uname") == null) { %>
    <% response.sendRedirect("LoginFirst.jsp"); %>
<% } %>
    
<jsp:include page="adminNavbar.html"/>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Flight Booking Form</title>
<style>
    .adminbody {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-image:url('plane3.jpg');
	    background-repeat:no-repeat;
	   	background-size:cover;
    }
	 .container2 {
		width: 50%;
        margin: 50px auto;
        padding: 20px;
        border-radius:30px;
        background:transparent;
    	backdrop-filter:blur(20px);
    	box-shadow: 0 2px 4px rgba(0,0,0,0.5);
    	margin-bottom:100px;
    }
    form{
    	width:100%;
    	
    }
     span{
	  	font-size: 40px;
	  	color:white;
    	text-shadow:1px 1px 2px black,0 0 25px blue,0 0 5px darkblue;
  }
    .form-group {
        margin-bottom: 20px;
    }
    .form-group label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
    }
    .form-group input[type="text"],
    .form-group input[type="date"],
    .form-group input[type="time"] {
        width: 100%;
        padding: 10px;
    background:transparent;
    border:none;
    outline:none;
    border-bottom:1px solid gray;
    }
    .form-group select {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }
    .form-group::after {
        content: "";
        display: table;
        clear: both;
    }
    input{
    background:transparent;
    border:none;
    outline:none;
   border-bottom:1px solid gray;
    }
    .btn {
        background-color:  rgb(0, 128, 192);
        color: white;
        padding: 14px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        width: 100%;
    }
    .btn:hover {
        background-color: rgb(0,128,220);
    }
    @media screen and (max-width: 600px) {
        .container {
            width: 90%;
        }
    }
</style>
</head>
<body class="adminbody">
<div class="container2">
    <form id="ff" action="adminFlight.jsp" method="post">
		    <h2><span>Set Flights</span></h2><br>
        <div class="form-group">
            <label for="from_city">From City:</label>
            <input type="text" id="from_city" name="from_city" required>
        </div>
        <div class="form-group">
            <label for="to_city">To City:</label>
            <input type="text" id="to_city" name="to_city" required>
        </div>
        <div class="form-group">
            <label for="date">Date:</label>
            <input type="date" id="date" name="date" required>
        </div>
        <div class="form-group">
            <label for="time">Depecture Time:</label>
            <input type="time" id="time" name="dtime" required>
        </div>
        <div class="form-group">
            <label for="time">Arrival Time:</label>
            <input type="time" id="time" name="atime" required>
        </div>
                <div class="form-group">
            <label for="to_city">Economy Class</label>
            <input type="text" name="eco" required>
        </div>
                <div class="form-group">
            <label for="to_city">Business Class</label>
            <input type="text" name="busi" required>
        </div>
                <div class="form-group">
            <label for="to_city">First Class</label>
            <input type="text" name="fir" required>
        </div>
        
        <button type="submit" class="btn">Submit</button>
    </form>
</div>
</body>
</html>