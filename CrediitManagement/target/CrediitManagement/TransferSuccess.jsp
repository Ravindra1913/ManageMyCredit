<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Transfer Success!!</title>
</head>
<body>
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
<div style="text-align: right">
<a align = "right" href = "selecteduser?uname=<%= application.getAttribute("Name") %>">
<input type="button" value="Back to <%= application.getAttribute("Name") %> Home"></a>
</div>
<p>Credits Transferred Successfully!!!!</p>
</body>
</html>