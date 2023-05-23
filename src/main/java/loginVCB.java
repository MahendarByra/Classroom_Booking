import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;

@WebServlet("/loginVCB")
public class loginVCB extends HttpServlet 
{
		private static final long serialVersionUID = 1L;
		public static String msg = "";
		public static String Name = "";
		public loginVCB() 
		{
				super();
		}
	
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
		{
		
				String member_Id = request.getParameter("Mid");
				String password = request.getParameter("Mpass");
				String type = request.getParameter("Mtype");
				
				HttpSession session = request.getSession();
				boolean isValid = Login(member_Id,password,type);
				if(isValid)
				{
						session.setAttribute("user_id", member_Id);
						session.setAttribute("user_pass", password);
						session.setAttribute("user_type", type);
						session.setAttribute("user_name", Name);
					
						if(type.equals("Faculty"))
						{
								response.sendRedirect("FacultyHome.jsp");
						}
						else if(type.equals("Office Member"))
						{
								response.sendRedirect("OfficeMemberHome.jsp");
						}
						else
						{
								response.sendRedirect("DataBaseManagerHome.jsp");
						}
				}
				else
				{
						session.setAttribute("loginMsgVCB", msg);
						response.sendRedirect("loginVCB.jsp");
				}
				
		}
		
		public static boolean Login(String mid, String pass, String type)
		{
				String url = "jdbc:mysql://localhost:3306/classroombooking";
				String usr = "mahendar";
				String password = "Medha@2020";
			
				try(Connection con = DriverManager.getConnection(url,usr,password);)
				{
						String query = "select * from users where id = '"+mid+"' and password = '"+pass+"' and type = '"+type+"';";
						Statement s = con.createStatement();
						ResultSet r = s.executeQuery(query);
				
						if(r.next())
						{
								Name = r.getString(3);
								msg = "User found !";
								return true;
						}
						else
						{
								msg = "*Invalid member Id or password";
								return false;
						}
				}catch(SQLException e) 
				{
						msg = "*Connection Error" + e;
						return false;
				}
		}
		
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
		{
				doGet(request, response);
		}

}
