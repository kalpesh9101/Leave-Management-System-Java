<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection,java.util.*"%>
<%
String email=(String)session.getAttribute("SESSIONS_USER");  
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
String leavedate=request.getParameter("leavedate");
String reason= request.getParameter("reason");
if(a!=null)
{
   try
   { 
	 Class.forName("com.mysql.jdbc.Driver");
	 con = DriverManager.getConnection(connectionUrl+dbName, userId, password);
	 PreparedStatement psmt = con.prepareStatement("insert into leaves (email,leavedate,reason) values (?,?,?)");

	 psmt.setString(1,email);
	 psmt.setString(2,leavedate);
	 psmt.setString(3,reason);
	 int cnt = psmt.executeUpdate();
	 if(cnt>0)
	 {
		response.sendRedirect("dashboard.jsp");
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
				<ul class="navbar-nav">
					<li class="nav-item px-2"><a href="#" class="nav-link active">Logged in as <%=email %></a></li>
					
				</ul>
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
	<!-- Designed and developed by Kalpesh shewale -->
	<header id="main-header" class="bg-primary py-2 text-white">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<h1><i class="fa fa-tachometer"></i> Dashboard</h1>
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
				<div class="col-md-3">
					<a href="#" class="btn btn-primary btn-block" style="border-radius:0%;"><i class="fa fa-plus"></i> Apply Leave</a>
				</div>
				<div class="col-md-3">
					<a href="pending.jsp" class="btn btn-warning btn-block" style="border-radius:0%;"  data-target="#addCateModal"><i class="fa fa-spinner"></i> Pendings</a>
				</div>
				<div class="col-md-3">
					<a href="Approved.jsp" class="btn btn-success btn-block" style="border-radius:0%;"  data-target="#addUsertModal"><i class="fa fa-check"></i> Approved Leaves</a>
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
						<h5>Apply Leave</h5>
					</div>
				</div>
				<div class="modal-body">
					<form action="" method="post">
						<div class="form-group">
							<label class="form-control-label">Email</label>
			
							<input type="text" name="email" class="form-control" value="<%=email %>" disabled>
						</div>
						
						<div class="form-group">
							<label class="form-control-label">Leave Date</label>
							<input type="date" name="leavedate" class="form-control" />
						</div>
						<div class="form-group">
							<label>Reason For Leave</label>
							<textarea name="reason" class="form-control"></textarea>
						</div>
				</div>
				<div class="modal-footer">
					<input type="hidden" name="status" value="0">
					<input type="submit" class="btn btn-success" style="border-radius:0%;" name="apply"  value="Apply">
				</div>
			</form>
			</div>
		</div>
	</div>