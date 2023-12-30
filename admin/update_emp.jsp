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

String btn=request.getParameter("btn");
String a=request.getParameter("apply");
String name=request.getParameter("name");
String email1= request.getParameter("email");
String pass= request.getParameter("pass");
String aa=request.getParameter("emp_id");
int emp_id=Integer.parseInt(aa);

try
{ 
  	Class.forName("com.mysql.jdbc.Driver");
  	con = DriverManager.getConnection(connectionUrl+dbName, userId, password);
	statement = con.createStatement();
	 PreparedStatement psmt1 = con.prepareStatement("SELECT * FROM users where id=?");
	 psmt1.setInt(1,emp_id);
 	resultSet = psmt1.executeQuery();
	 resultSet.next();
}
catch(Exception e)
{
   out.println("rtr"+e);
}
%>



<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="css/font-awesome.min.css">
  <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="css/style.css">
  <title>Leave Management</title>
</head>
<body>
	
	<!-- Designed and developed by Kalpesh shewale -->
	<nav class="navbar navbar-toggleable-sm navbar-inverse bg-inverse p-0">
		<div class="container">
			<button class="navbar-toggler toggler-right" data-target="#mynavbar" data-toggle="collapse">
				<span class="navbar-toggler-icon"></span>
			</button>
			<a href="#" class="navbar-brand mr-3">Leave Management</a>
			<div class="collapse navbar-collapse" id="mynavbar">
				
				<ul class="navbar-nav ml-auto">
					<li class="nav-item dropdown mr-3">
						
						<li class="nav-item">
							<a href="logout.jsp" class="nav-link"><i class="fa fa-power-off"></i> Logout</a>
						</li>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<!--This Is Header-->
	<header id="main-header" class="bg-danger py-2 text-white">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<h1><i class="fa fa-user-secret"></i> Admin Panel</h1>
				</div>
			</div>
		</div>
	</header>
	<!--This is section-->
	<!-- Designed and developed by Kalpesh shewale -->
	<section id="sections" class="py-4 mb-4 bg-faded">
		<div class="container">
			<div class="row">
				<div class="col-md"></div>
				<div class="col-md-2">
					<a href="pending.jsp" class="btn btn-warning btn-block" style="border-radius:0%;" ><i class="fa fa-spinner"></i> Pending Leaves</a>
				</div>
				<div class="col-md-2">
					<a href="Approved.jsp" class="btn btn-success btn-block" style="border-radius:0%;" ><i class="fa fa-check"></i> Approved</a>
				</div>
				<div class="col-md-2">
					<a href="total.jsp" class="btn btn-primary btn-block" style="border-radius:0%;" ><i class="fa fa-th"></i> Total Leaves</a>
				</div>
				<div class="col-md-2">
					<a href="add_emp.jsp" class="btn btn-danger btn-block" style="border-radius:0%;" ><i class="fa fa-users"></i> Add Employees</a>
				</div>
				<div class="col-md-2">
					<a href="view_emp.jsp" class="btn btn-info btn-block" style="border-radius:0%;" ><i class="fa fa-eye"></i> View Employees</a>
				</div>
				<div class="col-md"></div>
			</div>
		</div>
	
	</section>
<div class=" " id="">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header bg-primary text-white">
					<div class="modal-title">
						<h5>Add Employee</h5>
					</div>
				</div>
				<div class="modal-body">
					<form action="update.jsp" method="post">
						<div class="form-group">
							<label class="form-control-label">Email</label>
							<input type="hidden" name="emp_id" value="<%=resultSet.getString("id") %>"  class="form-control" >
							<input type="text" name="email"  value="<%=resultSet.getString("email") %>" class="form-control"></input>
						</div>

						<div class="form-group">
							<label class="form-control-label">Name</label>
							<input type="text" name="name" value="<%=resultSet.getString("name") %>"  class="form-control">
						</div>
						
						<div class="form-group">
							<label class="form-control-label">Password</label>
							<input type="text" name="pass" value="<%=resultSet.getString("password") %>"  class="form-control">
						</div>
				</div>
				
				<div class="modal-footer">
					<input type="submit" class="btn btn-success" style="border-radius:0%;" name="apply"  value="Update">
				</div>
			</form>
			</div>
		</div>
	</div>