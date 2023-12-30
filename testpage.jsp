
<%@page language="java"%>
<%
String user = request.getParameter("user");
user = (user == null ? (String)session.getAttribute("SESSIONS_USER") : user);
session.setAttribute("SESSIONS_USER",user);
%>
<html><head></head><body>
<%=user %>
<form method="post" action="testpage2.jsp">
User:<input name="user" value="">
<input type="submit" value="send">
</form>
</body></html>