<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*, java.util.*, java.text.SimpleDateFormat" %>
<jsp:include page="adminNavbar.html"/>
<% if (session.getAttribute("uname") == null) { %>
    <% response.sendRedirect("LoginFirst.jsp"); %>
<% } %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Display Data from Database</title>
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
    <h1><span>Registration Report</span></h1><br>
    <table class="table table-responsive table-success table-striped table-hover">
        <thead>
            <tr>
                <th class="fs-5 text-danger">User ID</th>
                <th class="fs-5 text-danger">First Name</th>
                <th class="fs-5 text-danger">Last Name</th>
                <th class="fs-5 text-danger">Email</th>
                <th class="fs-5 text-danger">User Name</th>
                <th class="fs-5 text-danger">Password</th>   
                <th class="fs-5 text-danger">Registered Date and Time</th>        
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
                    String sql="select * from Users";
                    pstmt = con.prepareStatement(sql);
                    rs = pstmt.executeQuery();

                    // Iterating over the result set and displaying data in the table
                    while(rs.next()) {
                        %>
                        <tr>
                            <td><%= rs.getInt("userid") %></td>
                            <td><%= rs.getString("firstname") %></td>
                            <td><%= rs.getString("lastname") %></td>
                            <td><%= rs.getString("email") %></td>
                            <td><%= rs.getString("username") %></td>
                            <td><%= rs.getString("password") %></td>
                            <td><%= rs.getString("date") %></td>
                        	
                        </tr>
                        <%
		                    }
                    
                    	%>
                    	
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
		            %>
        </tbody>
    </table>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
