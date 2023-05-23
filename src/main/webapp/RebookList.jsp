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
		
		String date = request.getParameter("Date");
		String fromTime = request.getParameter("fromTime");
		String toTime = request.getParameter("toTime");
		
		int t1 = Integer.parseInt(fromTime.substring(0,2));
		int t2 = Integer.parseInt(toTime.substring(0,2));
		
		try(Connection con = DriverManager.getConnection(url,usr,pass);)
		{
			String query = "select * from classroom_member_booking where date = '"+ date 
							+"' and Type = 'Faculty' and (fromTime = "+t1+" or toTime = "+t2+");";
			Statement s = con.createStatement();
			ResultSet r = s.executeQuery(query);
			if(r.next())
			{
					out.print("<table>");
					out.print("<tr><th>Classroom</th><th>Date</th><th>From</th><th>To</th><th>Booked By</th><th>Rebook</th></tr>");
					do{
							out.print("<tr>");
							out.print("<td>"+r.getString(3)+"</td>");
							out.print("<td>"+ r.getString(4)+"</td>");
							if(r.getInt(5) < 12)
							{
									out.print("<td>"+ r.getInt(5)+" am</td>");
							}
							else
							{
									out.print("<td>"+ r.getInt(5)+" pm</td>");
							}
							if(r.getInt(6) < 12)
							{
									out.print("<td>"+ r.getInt(6)+" am</td>");
							}
							else
							{
									out.print("<td>"+ r.getInt(6)+" pm</td>");
							}
							String query2 = "select * from users where id = '"+r.getString(1)+"';";
							Statement s2 = con.createStatement();
							ResultSet r2 = s2.executeQuery(query2);
							if(r2.next())
							{
									out.print("<td>"+r2.getString(3)+"</td>");
							}else
							{
									out.print("<td>Unknown User</td>");
							}
							out.print("<td>");
							out.print("<button type = 'submit' onclick = 'Rebook(\""+r.getString(1)+"\",\""+r.getString(2)+"\",\""+r.getString(3)+"\",\""+r.getString(4)+"\",\""+r.getString(5)+"\",\""+r.getString(6)+"\")'>Rebook</button>");
							out.print("</td></tr>");
					}while(r.next());
					out.print("</table>");
			}
		}
		catch(SQLException ex) 
		{
				out.print("Connection Error"+ex);
		}
		%>
</body>
</html>