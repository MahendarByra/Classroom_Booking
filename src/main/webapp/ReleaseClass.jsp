<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
		<%@page import = "java.sql.Connection" %>
		<%@page import = "java.sql.DriverManager" %>
		<%@page import = "java.sql.Statement" %>
		<%@page import = "java.sql.ResultSet" %>
		<%@page import = "java.sql.SQLException" %>
		
		<%
		String url = "jdbc:mysql://localhost:3306/classroombooking";
		String usr = "mahendar";
		String pass = "Medha@2020";
		
		String cid  = request.getParameter("class_name");
		String date = request.getParameter("date_name");
		String t1 =  request.getParameter("fromTime_name");
		String t2 = request.getParameter("toTime_name");
		
		try(Connection con = DriverManager.getConnection(url,usr,pass);)
		{
			
			String query = "delete from  classroom_member_booking where Member_id = '"+session.getAttribute("user_id")
							+"' and Type = '"+session.getAttribute("user_type")
							+"' and Classroom_id = '"+cid
							+"' and date = '"+date
							+"' and fromTime = "+t1+" and toTime = "+t2+";";
			Statement s1 = con.createStatement();
			s1.executeUpdate(query);
			out.print("<h3>Released successfully</h3>");
			con.close();
		}catch(SQLException ex) 
		{
			out.print("<h1>Connection Error"+ex+"</h1>");
		}
		%>
</body>
</html>