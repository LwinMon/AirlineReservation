<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
String age=request.getParameter("age");
if(age.equalsIgnoreCase("Above")){
	
	request.getRequestDispatcher("booking.jsp").include(request, response);
}
else{
	request.getRequestDispatcher("booking2.jsp").include(request, response);
}

%>
</body>
</html>