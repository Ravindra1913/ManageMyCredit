package package2;
import java.io.*;
import java.time.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

@SuppressWarnings("serial")
public class CreditTransferServlet extends HttpServlet
{
	public Connection con;
	public void init() throws ServletException
	{
		con = DBConnection.getCon();
	}
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		
		ServletContext sct = this.getServletContext();
		String toacc = req.getParameter("toacc");
		String fromacc = (String)sct.getAttribute("Name");
		int transcredits = Integer.parseInt(req.getParameter("amount"));
		try
		{
			PreparedStatement ps = con.prepareStatement("update userdata1 set Curr_credit = Curr_credit - ? where Name = ?");
			ps.setInt(1, transcredits);
			ps.setString(2, fromacc);
			int k = ps.executeUpdate();
			
			PreparedStatement ps1 = con.prepareStatement("update userdata1 set Curr_credit = Curr_credit + ? where Name = ?");
			ps1.setInt(1, transcredits);
			ps1.setString(2, toacc);
			int k1 = ps1.executeUpdate();
			
			LocalDate dt = LocalDate.now();
			Date date = Date.valueOf(dt);
			String transaction1 = "Transfered to "+toacc;
			String transaction2 = "Received from "+fromacc;
			String Name1 = fromacc;
			String Name2 = toacc;
						
			if(k>0 && k1>0)
			{
				PreparedStatement ps2 = con.prepareStatement("insert into transactiondata1 values(?,?,?,?)");
				ps2.setDate(1, date);
				ps2.setString(2, Name1);
				ps2.setString(3, transaction1);
				ps2.setInt(4, transcredits);
				ps2.addBatch();
				
				ps2.setDate(1, date);
				ps2.setString(2, Name2);
				ps2.setString(3, transaction2);
				ps2.setInt(4, transcredits);
				ps2.addBatch();
				ps2.executeBatch();
				ps2.clearBatch();
				
				RequestDispatcher rd = req.getRequestDispatcher("TransferSuccess.jsp");
				rd.include(req, res);
			}
			else
			{
				RequestDispatcher rd = req.getRequestDispatcher("TransferFailed.jsp");
				rd.forward(req, res);
			}
			
		}
		catch(Exception e) {e.printStackTrace();}
	}	

}
