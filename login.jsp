<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String email = request.getParameter("email");
session.setAttribute("SESSIONS_USER",email);
String password = request.getParameter("pass");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/simpleave", "root","");
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("select * from users where email='" + email + "' and password='" + password + "'");
try {
 rs.next();
 if (rs.getString("password").equals(password) && rs.getString("email").equals(email)) {
    response.sendRedirect("dashboard.jsp");
 } else {
  out.println("Invalid password or username.");
 }
} catch (Exception e) {
 e.printStackTrace();
}
%>