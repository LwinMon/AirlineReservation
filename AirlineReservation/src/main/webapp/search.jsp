<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <jsp:include page="navbar.html"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="bookingStyle.css">
<style>
span{
	  
    color:white;
    text-shadow:1px 1px 2px black,0 0 25px blue,0 0 5px darkblue;
  }

.searchcontainer{
	
        margin: 0;
        padding: 0;
        
        display:flex;
        flex-direction:column;
     	justify-content:center;
        align-items:center;
        background-color: white;

}

#searchform{
	width:100%;
	max-width:980px;
	background-image: url('cloud11.jpg');
	padding:20px;
	border-radius:8px;
}
</style>
</head>

<body id="searchbody">
<h2 class="fw-bolder"><span>Search Flights</span></h2>

<div class="nav nav-underline navbar-expend-lg">
<div class="nav-item ms-4"><button class="nav-link fs-3 fw-bold" id="but" onclick="roundtrip()">Round Trip</button></div>
<div class="nav-item ms-5"><button class="nav-link fs-3 fw-bold" id="but" onclick="oneway()">One Way</button></div>
</div>
<br>

<div class="searchcontainer">
<form id="searchform" action="searchFlight.jsp" method="post">

    <div class="d-flex flex-row justify-content-around">
	   <div>
	   		<h3>From</h3><br>
	   		<select class="from" name="from" required>
	   			<option value="city">Choose City...</option>
	   			<option value="Yangon">Yangon</option>
	   			<option value="Seoul">Seoul</option>
	   			<option value="Singapore">Singapore</option>
	   			<option value="Bangkok">Bangkok</option>
	   		</select>
	   </div>
	   <div>
	   		<h3>Destination</h3><br>
			<select class="to" name="to" required>
				<option value="city">Choose City...</option>
	   			<option value="Yangon">Yangon</option>
	   			<option value="Seoul">Seoul</option>
	   			<option value="Singapore">Singapore</option>
	   			<option value="Bangkok">Bangkok</option>
	   		</select>	   </div>
	</div>
	   <br><br><hr><br>
	   <div id="dd">
	  	 <div class="d-flex flex-row justify-content-around">
	  		<div><label class="fs-4">Start Date</label>&nbsp;<input type="date" name="d1" id="dd1" required></div>
	   		<div><label class="fs-4">End Date</label>&nbsp;<input type="date" name="d2" id="dd2" required></div>
	   		</div>
	   	</div>
	   	<br><br><br>
	   
<button class="sub" type="submit">Search</button>
</form>
</div>
<br><br><br>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous">
</script>
<script>
function oneway(){
	var one = document.getElementById("dd");
	one.innerHTML = "<div class='d-flex flex-row justify-content-around'><div><label class='fs-4'>Date&nbsp;</label><input type='date' id='dd3' name='d1' required></div></div>";
	document.getElementById("dd3").min=new Date().toISOString().split("T")[0];
}
function roundtrip(){
	var round = document.getElementById("dd");
	round.innerHTML = "<div class='d-flex flex-row justify-content-around'><div><label class='fs-4'>Start Date</label>&nbsp;<input type='date' name='d1' id='dd4' required></div><div><label class='fs-4'>End Date</label>&nbsp;<input type='date' name='d2' id='dd5' required></div></div>";
	document.getElementById("dd4").min=new Date().toISOString().split("T")[0];
	document.getElementById("dd5").min=new Date().toISOString().split("T")[0];
 }
document.getElementById("dd1").min=new Date().toISOString().split("T")[0];
document.getElementById("dd2").min=new Date().toISOString().split("T")[0];

</script>

</body>
</html>