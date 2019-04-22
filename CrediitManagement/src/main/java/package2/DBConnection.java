package package2;
import java.sql.*;

public class DBConnection 
{
	private static Connection con;
	private DBConnection() {}
	static
	{
		String driver = "com.mysql.cj.jdbc.Driver";
		String dburl = "jdbc:mysql://ctgplw90pifdso61.cbetxkdyhwsb.us-east-1.rds.amazonaws.com:3306/s786a7ombsews2qi";
		String username = "u37v4z4rq8naaat5";
		String password = "i56hlw7pevu5yk0v";
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(dburl,username,password);
		}
		catch(Exception e) {e.printStackTrace();}	
	}
	public static Connection getCon()
	{
		return con;
	}

}
