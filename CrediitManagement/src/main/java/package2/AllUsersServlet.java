package package2;
import java.sql.*;
import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

@SuppressWarnings("serial")
public class AllUsersServlet extends HttpServlet
{
	public Connection con = null;
	public void init() throws ServletException
	{
		con = DBConnection.getCon();
	}
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		try
		{
			PreparedStatement ps = con.prepareStatement("select Name from userdata1");
			ResultSet rs = ps.executeQuery();
			ServletContext sct = this.getServletContext();
			ArrayList<String> al = new ArrayList<String>();
			while(rs.next())
			{
				al.add(rs.getString(1));
			}
			sct.setAttribute("userlist", al);
			RequestDispatcher rd = req.getRequestDispatcher("UserList.jsp");
			rd.forward(req, res);
		}
		catch(Exception e) {e.printStackTrace();}
		
	}

}
