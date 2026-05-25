<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
    <%@ page import="jakarta.servlet.http.HttpSession" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 

String name=request.getParameter("name");
String pwd=request.getParameter("psw");

Connection con;
Statement stmt;
ResultSet rs;
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost/javatest","root","root");
	String sql="select * from Users where username='" +name+ "'and password='"+pwd+"'";
	stmt=con.createStatement();
	rs=stmt.executeQuery(sql);
	if(rs.next()){
		if(name.equals("Admin") && pwd.equals("admin123")){
			
			session.setAttribute("uname",name);
			if(session.getAttribute("uname")!=null){
				response.sendRedirect("index2.jsp");

			}
			else{
				response.sendRedirect("LoginFirst.jsp");
			}
		}
		
		else
		{
			session.setAttribute("uname",name);
			if(session.getAttribute("uname")!=null){
				response.sendRedirect("index.jsp");

			}
			else{
				response.sendRedirect("LoginFirst.jsp");
			}
		}
		
	}
	else{
		
			response.sendRedirect("register.jsp");
			
	}
	
	
}
catch(Exception e)
{
	out.println(e);
}

%>

</body>
</html>