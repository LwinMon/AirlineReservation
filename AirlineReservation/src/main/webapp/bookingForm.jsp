<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
    <% if (session.getAttribute("uname") == null) { %>
    <% response.sendRedirect("LoginFirst.jsp"); %>
<% } %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

String fname=request.getParameter("firstName");
String lname=request.getParameter("lastName");
String email=request.getParameter("email");
String gender=request.getParameter("gender");
String nation=request.getParameter("nationality");
String idtype=request.getParameter("idType");
String idnum=request.getParameter("idNumber");
String ticket=request.getParameter("noTickets");
String classes=request.getParameter("class");

String idnumber = idnum;
session.setAttribute("id",idnumber);

Connection con;
Statement stmt;
ResultSet rs;

try{
	
	Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost/javatest", "root", "root");

    String sql="insert into booking (firstname,lastname,email,gender,nationality,idtype,idnumber,ticket,class) values ('"+fname+"','"+lname+"','"+email+"','"+gender+"','"+nation+"','"+idtype+"','"+idnum+"','"+ticket+"','"+classes+"');";
    stmt = con.createStatement();
   int i=stmt.executeUpdate(sql);
   if(i>0){
			response.sendRedirect("payment.jsp");
			
	   
   }
   
}
	catch(Exception e){
		out.println(e);
	}



%>


%>
</body>
</html>