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
			<%@page import = "java.time.LocalDate" %>	
			
			<%
			String url = "jdbc:mysql://localhost:3306/classroombooking";
			String usr = "mahendar";
			String pass = "Medha@2020";
		
			String date = request.getParameter("Date");
			String time1 = request.getParameter("fromTime");
			String time2 = request.getParameter("toTime");
			String cid = request.getParameter("Cid");
			String hall = request.getParameter("lectureHall");
			
			LocalDate dt = LocalDate.parse(date);
			String week = dt.getDayOfWeek() +"";
			char c = week.charAt(0);
			week = week.toLowerCase();
			week = c + week.substring(1) +"";
			int t1 = Integer.parseInt(time1.substring(0,2));
			int t2 = Integer.parseInt(time2.substring(0,2));
			
			try(Connection con = DriverManager.getConnection(url,usr,pass);)
			{	
					String BookedBy = "";
					out.print("<table>");
					out.print("<tr><th>Name</th><th>Date</th><th>From</th><th>To</th><th>Availability</th></tr>");
					if(!cid.equals("null"))
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
														BookedBy = r3.getString(1);
														
												}
												f1++;
										}
										if(isNotBooked)
										{
											out.print("<tr>");
											out.print("<td>"+cid.toUpperCase()+"</td>");
											out.print("<td>"+date+"</td>");
											out.print("<td>"+time1+"</td>");
											out.print("<td>"+time2+"</td>");
											out.print("<td>Available</td>");
											out.print("</tr>");
											
										}
										else
										{
											String queryx = "select * from users where id = '"+BookedBy+"';";
											Statement sx = con.createStatement();
											ResultSet rx = s.executeQuery(queryx);
											rx.next();
											out.print("<tr>");
											out.print("<td>"+cid.toUpperCase()+"</td>");
											out.print("<td>"+date+"</td>");
											out.print("<td>"+time1+"</td>");
											out.print("<td>"+time2+"</td>");
											out.print("<td>Booked By :"+rx.getString(3)+"</td>");
											out.print("</tr>");
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
					}else if(!hall.equals("null"))
					{
							String query;
							
							if(hall.equals("ALL"))
							{
									query = "select * from classrooms;";
							}
							else
							{
									query = "select * from classrooms where Class_id Like '"+ hall +"%';";
							}
							Statement s = con.createStatement();
							ResultSet R1 = s.executeQuery(query);
							
						
							while(R1.next())
							{
									boolean isAvailable = true;
									String class_id = R1.getString(1).toLowerCase();
									int f1 = t1;
									while(f1<t2)
									{
											int f2 = f1+1;
											String q = "select * from "+ class_id +" where Day = '"+week+"' and "+f1+"to"+f2+" = 'Available';";
											Statement s2 = con.createStatement();
											ResultSet R2 = s2.executeQuery(q);
											if(!R2.next())
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
													String q2 = "select * from classroom_member_booking where Classroom_id = '"+class_id+"' and date = '"+date
																+"' and fromTime = "+f1+" and toTime = "+f2+";";
													Statement s3 = con.createStatement();
													ResultSet R3 = s3.executeQuery(q2);
													if(R3.next())
													{
															isNotBooked = false;
													}
													f1++;
											}
											
										
											if(isNotBooked)
											{
													out.print("<tr>");
													out.print("<td>"+class_id.toUpperCase()+"</td>");
													out.print("<td>"+date+"</td>");
													out.print("<td>"+time1+"</td>");
													out.print("<td>"+time2+"</td>");
													out.print("<td>Available</td>");
													out.print("</tr>");
											}
									}	
									
							}				
							
					}
					else
					{
							out.print("*Incorrect");		
					}
					out.print("</table>");
					con.close();
			}catch(SQLException ex) 
			{
					out.print("<h1>Connection Error"+ex+"</h1>");
			}
			%>
		 
</body>
</html>