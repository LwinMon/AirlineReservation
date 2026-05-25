<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <% if (session.getAttribute("uname") == null) { %>
    <% response.sendRedirect("LoginFirst.jsp"); %>
<% } %>
    
    <jsp:include page="adminNavbar.html"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>

.indexbody2{
background-image:url('cloud8.jpg');
background-repeat:norepeat;
background-size:cover;
}
h1{

font-size:85px;
font-weight:bold;
color:white;
margin-top:95px;
margin-left:50px;
}

#search a{
margin-left:50px;
text-decoration:none;
font-size:30px;
color:red;
}
#search a:hover{
clolr:green;

}

</style>
</head>
<body class="indexbody2">
<br><br>
<h1>Welcome Admin</h1><br>
<div id="search"><a href="admin.jsp">Set Flights >>></a></div>
</body>
</html>