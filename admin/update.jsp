<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection,java.util.*"%>
<%
String email=(String)session.getAttribute("SESSIONS_ADMIN");  
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "simpleave";
String userId = "root";
String password = "";
try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection con = null;
Statement statement = null;
ResultSet resultSet = null;

String a=request.getParameter("apply");
String name=request.getParameter("name");
String email1= request.getParameter("email");
String pass= request.getParameter("pass");
String aa= request.getParameter("emp_id");
int emp_id=Integer.parseInt(aa);
if(a!=null)
{
   try
   { 
	 Class.forName("com.mysql.jdbc.Driver");
	 con = DriverManager.getConnection(connectionUrl+dbName, userId, password);
	 PreparedStatement psmt = con.prepareStatement("UPDATE users SET name=?,email=?,password=?  where id=?");

	 psmt.setString(1,name);
	 psmt.setString(2,email1);
	 psmt.setString(3,pass);
	 psmt.setInt(4,emp_id);
	 int cnt = psmt.executeUpdate();
	 if(cnt>0)
	 {
		response.sendRedirect("view_emp.jsp");
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
