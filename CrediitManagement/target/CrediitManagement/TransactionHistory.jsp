<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.sql.*, package2.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Transaction History</title>
</head>
<body>
<%
	String name = (String)application.getAttribute("Name");
	Connection con = DBConnection.getCon();
	PreparedStatement ps = con.prepareStatement("select date(Date),Statement,Trans_credits from transactiondata1 where Name = ?");
	ps.setString(1, name);
	ResultSet rs = ps.executeQuery();
%>
<h1 align="center">Credit Management</h1>
<br><hr>
<table width = 50%>
<tr>
	<th align="left"><a  href="HomePage.html"><input type = "button" value = "Home"></a></th>
	<th align="left"><a  href="dballusers"><input type = "button" value = "View all Users"></a></th>
<tr>
</table>
<hr>
<p>Welcome <%= application.getAttribute("Name") %><br>
<h3>Transaction History:</h3>
<div style="text-align: right">
<a align = "right" href = "SelectedUser.jsp">
<input type="button" value="Back to <%= application.getAttribute("Name") %> Home"></a>
</div>
<br>
<table align = "center" width = "70%" border = 2>
	<tr>
		<th>Date</th>
		<th>Transaction Details</th>
		<th>Amount</th>
	</tr>
	<% if(rs.next() == false)
	   {	%>
		<tr>
			<td colspan=3 align = "center">No transactions yet!</td>
	    </tr>
    <% } 
	   else
	   {
		   do{%>
			   <tr align = "center">	
				<td><%= rs.getDate(1) %></td>
				<td><%= rs.getString(2) %></td>	
				<td><%= rs.getInt(3) %></td>
			</tr>	
			   
		  <% } while(rs.next());
	   } %>   
	  
	  	
</table>
</body>
</html>