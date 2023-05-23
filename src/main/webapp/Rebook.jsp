<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
		
		String previd  = request.getParameter("previd");
		String prevtype = request.getParameter("prevtype");
		String class_id =  request.getParameter("class_id");
		String date = request.getParameter("date");
		int t1 = Integer.parseInt((request.getParameter("fromTime")));
		int t2 = Integer.parseInt((request.getParameter("toTime")));
		
		try(Connection con = DriverManager.getConnection(url,usr,pass);)
		{
			
			String query = "update classroom_member_booking  set Member_id = '"+session.getAttribute("user_id")
							+"' , Type = '"+session.getAttribute("user_type")+"' where Member_id = '"+previd
							+"' and Type = '"+prevtype
							+"' and Classroom_id = '"+class_id
							+"' and date = '"+date
							+"' and fromTime = "+t1+" and toTime = "+t2+";";
			Statement s1 = con.createStatement();
			s1.executeUpdate(query);
			out.print("<h3>Rebooked successfully</h3>");
			con.close();
		}catch(SQLException ex) 
		{
			out.print("<h1>Connection Error"+ex+"</h1>");
		}
		%>
</body>
</html>