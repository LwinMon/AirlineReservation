<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*, java.util.*" %>

<jsp:include page="navbar.html"/>

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
    <h1><span>Flight Information</span></h1><br>
    <table class="table table-responsive table-success table-striped table-hover">
        <thead>
            <tr>
                <th class="fs-5 text-danger">Flight ID</th>
                <th class="fs-5 text-danger">From</th>
                <th class="fs-5 text-danger">To</th>
                <th class="fs-5 text-danger">Date</th>
                <th class="fs-5 text-danger">Departure Time</th>
                <th class="fs-5 text-danger">Arrival Time</th>
                <th class="fs-5 text-danger">Economy Class</th>
                <th class="fs-5 text-danger">Business Class</th>
                <th class="fs-5 text-danger">First Class</th>
            </tr>
        </thead>
        <tbody>
            <% 
            String fromcity = request.getParameter("from");
            String tocity = request.getParameter("to");
            String dd = request.getParameter("d1");
            
            Connection con = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost/javatest", "root", "root");

                String sql = "SELECT * FROM flightest WHERE fromcity = ? AND tocity = ? AND date = ?";
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1, fromcity);
                pstmt.setString(2, tocity);
                pstmt.setString(3, dd);
                rs = pstmt.executeQuery();

                boolean flightsFound = false;

                while (rs.next()) {
                    flightsFound = true;
                    %>
                    <tr>
                        <td><%= rs.getString("flightID") %></td>
                        <td><%= rs.getString("fromcity") %></td>
                        <td><%= rs.getString("tocity") %></td>
                        <td><%= rs.getDate("date") %></td>
                        <td><%= rs.getString("dtime") %></td>
                        <td><%= rs.getString("atime") %></td>
                        <td><%= rs.getString("economy") %></td>
                        <td><%= rs.getString("business") %></td>
                        <td><%= rs.getString("first") %></td>
                                            	<td>
        <form action="saveFlight.jsp" method="post">
            <input type="hidden" name="flightID" value="<%= rs.getString("flightID") %>">
            <button type="submit" class="btn btn-success">Book</button>
        </form>
    </td>

                    </tr>
                    <%
                }

                if (!flightsFound) {
                    %>
                    <tr>
                        <td colspan="9"><h1 class="text-center fw-bold text-danger">No Flights Available!</h1></td>
                    </tr>
                    <%
                }
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            } finally {
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
