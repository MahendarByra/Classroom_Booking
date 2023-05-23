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
				String cid = request.getParameter("cid");
				String url = "jdbc:mysql://localhost:3306/classroombooking";
				String usr = "mahendar";
				String pass = "Medha@2020";
		
				try(Connection con = DriverManager.getConnection(url,usr,pass);)
				{
						String query = "select * from "+cid.toLowerCase()+";";
						Statement s = con.createStatement();
						ResultSet r = s.executeQuery(query);
						if(r.next())
						{
								
								out.print("<br><br><div style = 'margin: auto; padding: 50px; width: 600px; height: 300px; text-align: center;'>");
								out.print("<pre>										   <button id='redButton' onclick = 'listRooms()'>X</button></pre>");	
								out.print("<div style = 'margin: auto; padding: 30px; width: 600px; height: 250px; border: 2px solid black;'>");
								out.print("<h1>"+cid+"</h1>");
								out.print("<table>");
								out.print("<tr><th>Day</th><th>9am-10am</th>");
								out.print("<th>10am-11am</th>");
								out.print("<th>11am-12pm</th>");
								out.print("<th>12pm-1pm</th>");
								out.print("<th>2pm-3pm</th>");
								out.print("<th>3pm-4pm</th>");
								out.print("<th>4pm-5pm</th>");
								out.print("<th>5pm-6pm</th></tr>");
								
								do{
										out.print("<tr>");
										out.print("<td>"+r.getString(1)+"</td>");
										out.print("<td>"+r.getString(2)+"</td>");
										out.print("<td>"+r.getString(3)+"</td>");
										out.print("<td>"+r.getString(4)+"</td>");
										out.print("<td>"+r.getString(5)+"</td>");
										out.print("<td>"+r.getString(6)+"</td>");
										out.print("<td>"+r.getString(7)+"</td>");
										out.print("<td>"+r.getString(8)+"</td>");
										out.print("<td>"+r.getString(9)+"</td>");
										out.print("</tr>");
								}while(r.next());
								out.print("</table>");
								out.print("</div>");
								out.print("</div>");
						}
				}
				catch(SQLException ex) 
				{
						out.print("<h1>Connection Error"+ex+"</h1>");
				}
		
		%>
</body>
</html>