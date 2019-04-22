<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Credits Transfer</title>
</head>
<body>
<h1 align="center">Credit Management</h1>
<br><hr>
<table width = 50% >
<tr>
	<th align = "left"><a  href="HomePage.html"><input type = "button" value = "Home"></a></th>
	<th align = "left"><a  href="dballusers"><input type = "button" value = "View all Users"></a></th>
<tr>
</table>
<hr>
<p>Welcome <%= application.getAttribute("Name") %><br>
<h3>Transfer Your Credits</h3>
<div style="text-align: right">
<a align = "right" href = "SelectedUser.jsp">
<input type="button" value="Back to <%= application.getAttribute("Name") %> Home"></a>
</div>

<form action="transfer" method="post">
<table align="center" width=40% border=0>
<tr>
	<th align ="left">Current Credit Balance </th>
	<th align="left">:  <%= application.getAttribute("credit") %></th>
</tr>
<tr>
	<td>Credits to Transfer</td>
	<td>:  <input type="number" name="amount" min = 0 max = <%= application.getAttribute("credit") %> required ></td>
<tr>
	<td>Transfer to</td>
	<td>:  <select name="toacc">
	<% ArrayList<String> al = (ArrayList<String>)application.getAttribute("userlist");
	   for(String ob : al)
	   {
		   if(!ob.equals(application.getAttribute("Name")))
		   { %>
			   <option value="<%= ob%>"><%= ob%></option>
		   <% }
	   }%>
	    </select></td>
</tr>
</table>
<br>
<table align = "center">
<tr>
	<td colspan=2 align="center"><input type="submit" value="Transfer"></td>
</tr>
</table>
</form>
</body>
</html>