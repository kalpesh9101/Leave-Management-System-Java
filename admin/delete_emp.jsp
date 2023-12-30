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
String aa=request.getParameter("emp_id");
int emp_id=Integer.parseInt(aa);
   try
   { 
	 Class.forName("com.mysql.jdbc.Driver");
	 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/simpleave","root","");
	 PreparedStatement psmt = con.prepareStatement("Delete from users WHERE id = (?)");
     psmt.setInt(1,emp_id);
	 int cnt = psmt.executeUpdate();
	 response.sendRedirect("view_emp.jsp");
   }
   catch(Exception e)
   {
	   out.println(""+e);
   }
%>