<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<%@ page import="java.util.ArrayList" %>
<% if (session.getAttribute("uname") == null) { %>
    <% response.sendRedirect("LoginFirst.jsp"); %>
<% } %>
<jsp:include page="navbar.html"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
    <style>
    	body{
    		background-image:url('cloud11.jpg');
    		background-repeat:no-repeat;
    		background-size:cover;
    	
    	}
    	form{
    		background:transparent;
    		backdrop-filter:blur(20px);
    		box-shadow: 0 2px 4px rgba(0,0,0,0.5);
    		margin-bottom:100px;
    		border-radius:20px;
    	}
    
        label {
            font-weight: bold;
        }

        input[type="text"],
        input[type="number"],
        input[type="email"],
        select {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            background: transparent;
            border: none;
            outline: none;
            border-bottom: 1px solid gray;
        }

        #idNumber {
            border: 1px solid gray;
            border-radius: 20px;
        }

		.p-4{
			border:none;
			border-radius:20px;
			background-color:rgb(58, 197, 197);
			box-shadow: 0 2px 4px rgba(0,0,0,0.1);
			
			transition-delay: 0.5s ease;
		}
		.p-4:hover{
	  			background-color:rgb(37, 219, 218);
				
		}
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body style="margin-top:50px;">
<%

String fid=request.getParameter("flightID");

String sess=(String)session.getAttribute("uname");
    if(sess != null) {
    	
    	
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Establishing database connection
            con = DriverManager.getConnection("jdbc:mysql://localhost/javatest", "root", "root");

            // SQL query to select flight information
            String sql = "select economy,business,first from flightest where flightID='"+fid+"'";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();

          

%><div class="d-flex justify-content-center">
    <form id="myForm" class="d-flex flex-row justify-content-center w-50 border-0 p-5" action="bookingForm.jsp" method="post" onsubmit="return checkEmail();">
    <div class="card w-100 p-0 bg-transparent border-0">
    <div class="card-body p-0 d-flex flex-row justify-content-evenly bg-transparent">
    <div>
        <label for="firstName">First Name:</label><br>
        <input type="text" class="form-control" id="firstName" name="firstName" required maxlength="10" size="10"><br><br>

        <label for="lastName">Last Name:</label><br>
        <input type="text" class="form-control" id="lastName" name="lastName" required maxlength="10" size="10"><br><br>


		<label for="email">Email:</label><div class="notice" style="color:red;"></div>
        <input type="email" id="email" name="email" required><br><br>

        <label for="gender">Gender:</label><br>
        <select id="gender" class="form-control" name="gender" required>
            <option value="">Select Gender</option>
            <option value="male">Male</option>
            <option value="female">Female</option>
        </select><br><br>
        
        
	</div>
	<div>

		<label for="nationality">Nationality:</label><br>
        <input type="text" class="form-control" id="nationality" name="nationality" required placeholder="Enter your country name..."><br><br>

        <label for="idType">ID Type:</label><br>
        <select id="idType" class="form-control" name="idType" required>
            <option value="">Select ID Type</option>
            <option value="passport">Passport</option>
            <option value="driverLicense">Driver's License</option>
            <option value="nationalId">National ID</option>
        </select><br><br>
	
        <label for="idNumber">ID Number:</label><br>
        <input type="number" class="form-control" id="num" name="idNumber" required maxlength="6" min="0" max="999999" size="6"><br><br>
	
		<label for="noTickets">Number of tickets (max 5):</label><br>
        <input type="number" id="num" name="noTickets" required max="5" size="1"><br><br>
	
	</div>
	</div>
		<hr>

	<div class="card-body d-flex flex-row justify-content-between">
		<% while (rs.next()) { %>
		    <% String economy = rs.getString("economy"); %>
            <% String business = rs.getString("business"); %>
            <% String first = rs.getString("first"); %>
            <button type="submit" name="class" class="p-4 border-0" value="Economy Class" <% if ("Sold Out".equalsIgnoreCase(economy)) { %> disabled <% } %>>Book For<div class="fs-5">Economy Class</div><div class="text-danger">$100</div> per ticket</button>
            <button type="submit" name="class" class="p-4 border-0" value="Business Class" <% if ("Sold Out".equalsIgnoreCase(business)) { %> disabled <% } %>>Book For<div class="fs-5">Business Class</div><div class="text-danger">$200</div> per ticket</button>
            <button type="submit" name="class" class="p-4 border-0" value="First Class" <% if ("Sold Out".equalsIgnoreCase(first)) { %> disabled <% } %>>Book For<div class="fs-5">First Class</div><div class="text-danger">$300</div> per ticket</button>
		<% } %>
		
	</div>
	</div>
    </form>
</div>

<%    	
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Closing resources
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }	
    }
    else {
    	request.getRequestDispatcher("LoginFirst.jsp");
    	
    }
%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script>
function checkEmail() {
    let email = document.getElementById("email").value;
    let re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    let noti = '';
    if (!re.test(email)) {
        noti = "Invalid email!";
        document.querySelector(".notice").innerText = noti;
        return false; // Prevent form submission
    }
    return true; // Allow form submission
}
</script>
</body>
</html>
