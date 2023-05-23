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
				
				try(Connection con = DriverManager.getConnection(url,usr,pass);)
				{
						boolean isFound = false;
						String query = "select * from classrooms where Class_id Like 'LHC1%';";
						Statement s = con.createStatement();
						ResultSet r = s.executeQuery(query);
						if(r.next())
						{
								isFound = true;
								out.print("<div style='width: 400px;'>");
								out.print("<h2>LHC1</h1>");
								out.print("<table>");
								out.print("<tr><th>Room Id</th><th>Availability</th></tr>");
								do{
									out.print("<tr><td>"+r.getString(1)+"</td>");
									out.print("<td>");
									out.print("<button onclick= showAvailability('"+r.getString(1)+"')>Show Availability</button></td></tr>");
								}while(r.next());
								out.print("</table>");
								out.print("</div>");
						}
						String query2 = "select * from classrooms where Class_id Like 'LHC2%';";
						ResultSet r2 = s.executeQuery(query2);
						if(r2.next())
						{
								isFound = true;
								out.print("<div style='width: 400px;'>");
								out.print("<h2>LHC2</h1>");
								out.print("<table>");
								out.print("<tr><th>Room Id</th><th>Availability</th></tr>");
								do{
										out.print("<tr><td>"+r2.getString(1)+"</td>");
										out.print("<td>");
										out.print("<button onclick= showAvailability('"+r2.getString(1)+"')>Show Availability</button></td></tr>");
								}while(r2.next());
								out.print("</table>");
								out.print("</div>");
						}
						
						String query3 = "select * from classrooms where Class_id Like 'SCIS%';";
						ResultSet r3 = s.executeQuery(query3);
						out.print("<div style='width: 400px;'>");
						out.print("<h2>SCIS</h1>");
						if(r3.next())
						{
								isFound = true;
								
								
								out.print("<table>");
								out.print("<tr><th>Room Id</th><th>Availability</th></tr>");
								do{
										out.print("<tr><td>"+r3.getString(1)+"</td>");
										out.print("<td>");
										out.print("<button onclick= showAvailability('"+r3.getString(1)+"')>Show Availability</button></td></tr>");
								}while(r3.next());
								out.print("</table>");
								
						}
						
						out.print("</div>");
						if(!isFound)
						{
								out.print("<h2>No Classrooms Found !</h2>");
						}
				}
				catch(SQLException ex) 
				{
						out.print("<h1>Connection Error"+ex+"</h1>");
				}
			
		%>

</body>
</html>