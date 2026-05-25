<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
   
    <jsp:include page="navbar.html"/>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Register Form</title>
<style>
  body {
    font-family: Arial, sans-serif;
	background-image:url('airplane2.jpg');
    background-repeat:no-repeat;
   	background-size:cover;
    margin: 0;
    padding: 0;
  }
  .regcontainer {
            width: 50%;
            margin: 50px auto;
            padding: 20px;
            border-radius:30px;
            background:transparent;
    		backdrop-filter:blur(20px);
    		box-shadow: 0 2px 4px rgba(0,0,0,0.5);
    		margin-bottom:100px;
        }
  span{
	  font-size: 40px;
	  color:white;
    text-shadow:1px 1px 2px black,0 0 25px blue,0 0 5px darkblue;
  }
  h2 {
    text-align: center;
    margin-bottom: 20px;
  }
  label {
    display: block;
    margin-bottom: 5px;
  }
  #myform5 input{
    width: 100%;
    padding: 8px;
    margin-bottom: 10px;
    background:transparent;
    border:none;
    outline:none;
    border-bottom:1px solid gray;
  }
  #reg {
    width: 100%;
    padding: 10px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 3px;
    cursor: pointer;
  }
  #reg:hover {
    background-color: #0056b3;
  }
</style>
</head>
<body>
<div class="regcontainer">
  <h2><span>Register Form</span></h2><br>
  <form id="myform5" action="registerForm.jsp" method="post">
    <label for="firstName">First Name:</label>
    <input type="text" id="firstName" name="fname" required maxlength="10" size="10">
    <label for="lastName">Last Name:</label>
    <input type="text" id="lastName" name="lname" required maxlength="10" size="10">
    <label for="email">Email:</label><div class="notice" style="color:red;"></div>
    <input type="email" id="email" name="email" required>
    <label for="username">Username:</label>
    <input type="text" id="username" name="uname" required maxlength="20" size="20">
    <label for="password">Password:</label>
    <input type="password" id="password" name="psw" required maxlength="10" size="10">
    <button id="reg" type="submit" onclick=" return valid_email()">Register</button>
  </form>
</div>

<script>
function valid_email() {
    let email = document.getElementById("email").value;
    let regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    let not = '';
    if (!regex.test(email)) {
        not = "Invalid email!";
        document.querySelector(".notice").innerText = not;
        return false; // Prevent form submission
    }
    return true; // Allow form submission
}


</script>
</body>
</html>
