<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%


String a=request.getParameter("btn");
String name=request.getParameter("name");
String email=request.getParameter("email");
String phone_no=request.getParameter("phone_no");
String pass= request.getParameter("pass");

if(a!=null)
{
   try
   { 
	 Class.forName("com.mysql.jdbc.Driver");
	 java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/leave_manage","root","");
	 PreparedStatement psmt = con.prepareStatement("insert into employee (name,email,phone_no,pass) values (?,?,?,?)");
 
	 psmt.setString(1,name);
	 psmt.setString(2,email);
	 psmt.setString(3,phone_no);
	 psmt.setString(4,pass);
	 

	 int cnt = psmt.executeUpdate();
	 if(cnt>0)
	 {
		response.sendRedirect("index.jsp");
	 }
	 else
	 {
		 out.println("Record not inserted ");
	 }
   }
   catch(Exception e)
   {
	   out.println(""+e);
   }
}
%>


