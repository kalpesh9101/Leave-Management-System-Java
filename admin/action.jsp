<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="java.lang.*"%>
<%
String a=request.getParameter("btn");
String aa=request.getParameter("leave_id");
int leave_id=Integer.parseInt(aa);
out.println(a+" "+leave_id);
if(a.equals("Approve"))
{    
   try
   { 
	 Class.forName("com.mysql.jdbc.Driver");
	 java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/simpleave","root","");
	 PreparedStatement psmt = con.prepareStatement("UPDATE leaves SET status='2' WHERE id = (?)");
     psmt.setInt(1,leave_id);
	 int cnt = psmt.executeUpdate();
	 if(cnt>0)
	 {
		response.sendRedirect("pending.jsp");
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
else
{    
    try
    { 
      Class.forName("com.mysql.jdbc.Driver");
      java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/simpleave","root","");
      PreparedStatement psmt = con.prepareStatement("UPDATE leaves SET status='2' WHERE id = (?)");
      psmt.setInt(1,leave_id);
      int cnt = psmt.executeUpdate();
      if(cnt>0)
      {
         response.sendRedirect("pending.jsp");
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


