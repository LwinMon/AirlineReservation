<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

String firname=request.getParameter("fname");
String lasname=request.getParameter("lname");
String email=request.getParameter("email");
String name=request.getParameter("uname");
String pwd=request.getParameter("psw");


Connection con;
Statement stmt;
ResultSet rs;

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost/javatest", "root", "root");

    String sql="insert into Users (firstname,lastname,email,username,password) values ('"+firname+"','"+lasname+"','"+email+"','"+name+"','"+pwd+"');";
    stmt = con.createStatement();
   int i=stmt.executeUpdate(sql);
   if(i>0){
	   session.setAttribute("uname",name);
	   response.sendRedirect("search.jsp");
	   
   }
   
}
	catch(Exception e){
		out.println(e);
	}



%>
</body>
</html>