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
		<%@page import = "java.time.LocalDate" %>	
		<%@page import = "java.sql.PreparedStatement" %>
		<%@page import = "java.time.LocalDate" %>
		
		
		<%
		String url = "jdbc:mysql://localhost:3306/classroombooking";
		String usr = "mahendar";
		String pass = "Medha@2020";
		
		String date = request.getParameter("Date");
		String time1 = request.getParameter("fromTime");
		String time2 = request.getParameter("toTime");
		String cid = request.getParameter("Cid");
		 
		LocalDate dt = LocalDate.parse(date);
		String week = dt.getDayOfWeek() +"";
		char c = week.charAt(0);
		week = week.toLowerCase();
		week = c + week.substring(1) +"";
		int t1 = Integer.parseInt(time1.substring(0,2));
		int t2 = Integer.parseInt(time2.substring(0,2));
		
		
		
		try(Connection con = DriverManager.getConnection(url,usr,pass);)
		{
				String query = "select * from classrooms where Class_id = '"+ cid +"';";
				Statement s = con.createStatement();
				ResultSet r = s.executeQuery(query);
				if(r.next())
				{
						boolean isAvailable = true;
						int f1 = t1;
						while(f1<t2)
						{
								int f2 = f1+1;
								String q = "select * from "+ cid.toLowerCase() +" where Day = '"+week+"' and "+f1+"to"+f2+" = 'Available';";
								ResultSet r2 = s.executeQuery(q);
								if(!r2.next())
								{
										isAvailable = false;
								}
								f1++;
						}
						if(isAvailable)
						{
								f1 = t1;
								boolean isNotBooked = true;
								while(f1<t2)
								{
										int f2 = f1+1;
										String q2 = "select * from classroom_member_booking where Classroom_id = '"+cid+"' and date = '"+date
													+"' and fromTime = "+f1+" and toTime = "+f2+";";
										ResultSet r3 = s.executeQuery(q2);
										if(r3.next())
										{
												isNotBooked = false;
										}
										f1++;
								}
								if(isNotBooked)
								{
									f1 = t1;
									while(f1<t2)
									{
				
										int f2 = f1+1;
										String template = "INSERT INTO classroom_member_booking (Member_id,Type,Classroom_id,date,fromTime,toTime)   values(?,?,?,?,?,?)";
										PreparedStatement  ins = con.prepareStatement(template);
						
										
										ins.setString(1,(String)session.getAttribute("user_id"));
										ins.setString(2,(String)session.getAttribute("user_type"));
										ins.setString(3,cid);
										ins.setString(4,date);
										ins.setInt(5,f1);
										ins.setInt(6,f2);
										ins.executeUpdate();
										f1++;
									}
									con.close();
									out.print("<h2>Booked successfully</h2>");
								}
								else
								{
									out.print("<h2>Classroom is already Booked by other person !</h2>");
								}
						}
						else
						{
							out.print("<h2>Classroom Not Available !");
						}
				}
				else
				{
					out.print("<h2>Classroom not found</h2>");
				}
		}catch(SQLException ex) 
		{
				out.print("<h1>Connection Error"+ex+"</h1>");
		}
		
		%>
</body>
</html>