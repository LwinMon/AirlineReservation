<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>

<% if (session.getAttribute("uname") == null) { %>
    <% response.sendRedirect("LoginFirst.jsp"); %>
<% } %>
    <jsp:include page="adminNavbar.html"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<style>

 span{
	  font-size: 40px;
	  color:white;
    text-shadow:1px 1px 2px black,0 0 25px blue,0 0 5px darkblue;
  }
</style>

</head>
<body>
<br>
<h1><span>Booking Information Report</span></h1><br>

<table class="table table-responsive table-success table-striped table-hover">
    <thead>
        <tr>
            <th class="fs-5 text-danger">Booking ID</th>
            <th class="fs-5 text-danger">First Name</th>
            <th class="fs-5 text-danger">Last Name</th>
            <th class="fs-5 text-danger">Email</th>
            <th class="fs-5 text-danger">Gender</th>
            <th class="fs-5 text-danger">Nationality</th>
            <th class="fs-5 text-danger">ID Type</th>
            <th class="fs-5 text-danger">ID Number</th>
            <th class="fs-5 text-danger">Ticket Quanity</th>
            <th class="fs-5 text-danger">Cabin Class</th>
            <th class="fs-5 text-danger">Booked Date</th>
       
        </tr>
    </thead>
    <tbody>
    
        <% 
        
            Connection con = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
            	Class.forName("com.mysql.cj.jdbc.Driver");
                // Establishing database connection
                con = DriverManager.getConnection("jdbc:mysql://localhost/javatest", "root", "root");

                // SQL query to select flight information
                String sql="select * from booking";
                pstmt = con.prepareStatement(sql);
                rs = pstmt.executeQuery();

                // Iterating over the result set and displaying data in the table
                while(rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getInt("bookingid") %></td>
                        <td><%= rs.getString("firstname") %></td>
                        <td><%= rs.getString("lastname") %></td>
                        <td><%= rs.getString("email") %></td>
                        <td><%= rs.getString("gender") %></td>
                        <td><%= rs.getString("nationality") %></td>
                        <td><%= rs.getString("idtype") %></td>
                        <td><%= rs.getInt("idnumber") %></td>
                        <td><%= rs.getInt("ticket") %></td>
                        <td><%= rs.getString("class") %></td>
                        <td><%= rs.getString("date") %></td>
                    	<td>
        <form action="clearData.jsp" method="post">
            <input type="hidden" name="bookid" value="<%= rs.getInt("bookingid") %>">
            <button type="submit" class="btn btn-danger">Clear</button>
        </form>
    </td>
                    </tr>
                    <%
	                    
                }
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
	            %>
    </tbody>
</table>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>