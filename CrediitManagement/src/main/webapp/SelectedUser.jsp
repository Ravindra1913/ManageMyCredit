<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Home</title>
</head>
<body>
<h1 align="center">Credit Management</h1>
<br><hr>
<table width = 50%>
<tr>
	<th align="left"><a  href="HomePage.html"><input type = "button" value = "Home"></a></th>
	<th align = "left"><a  href="dballusers"><input type = "button" value = "View all Users"></a></th>
<tr>
</table>
<hr>
<p>Welcome <%= application.getAttribute("Name") %><br>
<table align = "center">
<tr>
	<th colspan = 2><h3>User Details</h3><br></th>
</tr>
<tr>
	<td>Name</td> 
	<td>:  <%= application.getAttribute("Name") %></td>
</tr>
<tr>
	<td>EmailId</td>
	<td>:  <%= application.getAttribute("EmailId") %></td>
</tr>
<tr>
	<td>Credit Balance</td>
	<td>:  <%= application.getAttribute("credit") %></td>
</tr>
</table>
<br>
<table align = "center">
<tr>
	<th><a href="CreditTransfer.jsp"><input type="button" value="Transfer Credit"></a></th>
	<th><a href="TransactionHistory.jsp"><input type="button" value="Transaction History"></a></th>
</tr>
</table>
</body>
</html>