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
		
		String date = request.getParameter("booked_date");
		
		try(Connection con = DriverManager.getConnection(url,usr,pass);)
		{
			String query = "select * from classroom_member_booking where Member_id = '"+ session.getAttribute("user_id") 
							+"' and Type = '"+session.getAttribute("user_type")+"' and date = '"+date+"';";
			Statement s = con.createStatement();
			ResultSet r = s.executeQuery(query);
			int n = 0;
			if(r.next())
			{
				out.print("<table>");
				out.print("<tr><th>Classroom</th><th>Date</th><th>From</th><th>To</th><th>Release</th></tr>");
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
		
				out.print("<td>");
				out.print("<input type = 'hidden' id = 'class_id' class='class_name' value= '"+ r.getString(3)+"'>");
				out.print("<input type = 'hidden' id = 'date_id'  class = 'date_name' value= '"+ r.getString(4)+"'>");
				out.print("<input type = 'hidden' id = 'fromTime_id' class = 'fromTime_name' value= '"+ r.getInt(5)+"'>");
				out.print("<input type = 'hidden' id = 'toTime_id' class = 'toTime_name' value= '"+ r.getInt(6)+"'>");
				out.print("<button type = 'submit' onclick = 'releaseRoom(\""+r.getString(3)+"\",\""+r.getString(4)+"\",\""+r.getString(5)+"\",\""+r.getString(6)+"\")'>Release</button>");
				out.print("</td></tr>");
			}while(r.next());
				out.print("</table>");
			}else	
			{
				out.print("You have not booked any classrooms");
			}
			con.close();
		}catch(SQLException ex) 
		{
				out.print("<h1>Connection Error"+ex+"</h1>");
		}
		
		%>
</body>
</html>