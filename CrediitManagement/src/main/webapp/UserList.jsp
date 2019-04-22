<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Users</title>
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
<table align="center"  border=0>
	<tr align="center">
		<th colspan = 2><h3>List of Users<h3></h3></th>
	</tr>
</table>

<% ArrayList<String> al = (ArrayList<String>)application.getAttribute("userlist"); %>
<div align="center">
<table style="display: inline-block;"  >	
	<% for(int i=0;i<al.size()/2;i++)
	{ %>
		<tr align="center">
			<td><a href="selecteduser?uname=<%= al.get(i)%>"><%= al.get(i)%></a></td>
	    </tr>
	<% } %>	
</table>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<table style="display: inline-block;"  >	
	<% for(int i=al.size()/2;i<al.size();i++)
	{ %>
		<tr align="center">
			<td><a href="selecteduser?uname=<%= al.get(i)%>"><%= al.get(i)%></a></td>
	    </tr>
	<% } %>	
</table>
</div>

</body>
</html>