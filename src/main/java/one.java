import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import java.time.*;
import java.sql.PreparedStatement;

public class one{

	public static void main(String[] args)
	{
		
		/*String url = "jdbc:mysql://localhost:3306/company";
		String usr = "root";
		String pass = "mahi@1122";
		
		int memberId = 50;
		String Password = "Mahi@1122";
		String type = "Faculty";
		
		try(Connection con = DriverManager.getConnection(url,usr,pass);)
		{
				System.out.println("in try");
				String query = "select * from employee where Dno = "+ memberId +";";
				Statement s = con.createStatement();
				ResultSet r = s.executeQuery(query);
				if(r.next())
				{
					System.out.println("<h1>found</h1>");
					String msg = "1";
					session.setAttribute("loginMsg", msg);
					session.setAttribute("id", memberId);
					session.setAttribute("pass", Password);
					session.setAttribute("type", type);
					session.setAttribute("email", r.getString(3));
				}
				else
				{
					System.out.println("<h1>not found </h1>");
					String msg = "0";
					//session.setAttribute("loginMsg", msg);
				}
		}catch(SQLException ex) 
		{
				System.out.println("<h1>Connection Error"+ex+"</h1>");
		}*/
	}
}
