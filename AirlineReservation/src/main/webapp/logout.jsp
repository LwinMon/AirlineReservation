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
<jsp:include page="navbar.html"/>
</head>
<body>
<%
if(session.getAttribute("uname")!=null){
	session.invalidate();

	response.sendRedirect("index.jsp");
}

%>
</body>
</html>