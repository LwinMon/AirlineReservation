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
</head>
<body>
<%

String fid=request.getParameter("flight_id");
String fcity=request.getParameter("from_city");
String tcity=request.getParameter("to_city");
String date=request.getParameter("date");
String dtime=request.getParameter("dtime");
String atime=request.getParameter("atime");
String eco=request.getParameter("eco");
String busi=request.getParameter("busi");
String fir=request.getParameter("fir");


Connection con;
Statement stmt;
ResultSet rs;

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost/javatest", "root", "root");

    String sql="insert into flightest (fromcity,tocity,date,dtime,atime,economy,business,first) values('"+fcity+"','"+tcity+"','"+date+"','"+dtime+"','"+atime+"','"+eco+"','"+busi+"','"+fir+"')";
    stmt = con.createStatement();
    int i = stmt.executeUpdate(sql);
    if(i>0){
    	if(session.getAttribute("uname")!=null){
        	response.sendRedirect("flightReport.jsp");

    	}
    }
 
}
	catch(Exception e){
		out.println(e);
	}


%>
</body>
</html>