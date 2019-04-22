package package2;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

@SuppressWarnings("serial")
public class SelectedUserServlet extends HttpServlet
{
	public Connection con;
	public void init() throws ServletException
	{
		con = DBConnection.getCon();
	}
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		String name = req.getParameter("uname");
		ServletContext sct = this.getServletContext();
		try
		{
			PreparedStatement ps = con.prepareStatement("select * from userdata1 where Name = ?");
			ps.setString(1, name);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				sct.setAttribute("Name", rs.getString(1));
				sct.setAttribute("EmailId", rs.getString(2));
				sct.setAttribute("credit", rs.getInt(3));
			}
		}
		catch(Exception e) {e.printStackTrace();}
		RequestDispatcher rd = req.getRequestDispatcher("SelectedUser.jsp");
		rd.forward(req, res);
		
	}

}
