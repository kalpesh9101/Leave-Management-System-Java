<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String email=(String)session.getAttribute("SESSIONS_USER");  
if(email==null)
{
	response.sendRedirect("index.jsp");
}
int count;
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
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
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
					<a href="ApplyLeave.jsp" class="btn btn-primary btn-block" style="border-radius:0%;"  ><i class="fa fa-plus"></i> Apply Leave</a>
				</div>
				<div class="col-md-3">
					<a href="pending.jsp" class="btn btn-warning btn-block" style="border-radius:0%;"  ><i class="fa fa-spinner"></i> Pendings</a>
				</div>
				<div class="col-md-3">
					<a href="#" class="btn btn-success btn-block" style="border-radius:0%;"  data-target="#addUsertModal"><i class="fa fa-check"></i> Approved Leaves</a>
				</div>
				<div class="col-md"></div>
			</div>
		</div>
	</section>
	<section id="post">
		<div class="container">
			<div class="row">
				<table class="table table-bordered table-hover table-striped">
					<thead>
						<th>#</th>
						<th>Leave Date</th>
						<th>Reason</th>
                        <th>Apply Date</th>
                        <th>Approve Date</th>
						<th>Status</th>
					</thead>
					<tbody>
						<%
						try{ 
							count=1;
							connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
							statement=connection.createStatement();
							String sql ="SELECT * FROM leaves WHERE email= '"+ email+"' and status=2 ";
							resultSet = statement.executeQuery(sql);
							while(resultSet.next()){
						%>
						<tr bgcolor="#DEB887">
							<td><%=count %></td>
							<td><%=resultSet.getString("leavedate") %></td>
							<td><%=resultSet.getString("Reason") %></td>
                            <td><%=resultSet.getString("apply_date") %></td>
                            <td><%=resultSet.getString("approve_date") %></td>
							<td>
								<% String status1=resultSet.getString("status");
									int no = Integer.parseInt(status1);
									if(no==3)
									{
								%>
									<span class='badge badge-danger'>Reject</span>
								<%
									}
									else if(no==2)
									{
								%>
									<span class='badge badge-success'>Approved</span>
								<%		
									}
									else if(no==1)
									{
								%>
									<span class='badge badge-warning'>Pending</span>
								<%		
									}
								%>	
								</td>
						</tr>
						<% 
                        count++;
						}

						} catch (Exception e) {
						e.printStackTrace();
						}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</section>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<!----Section3 footer ---->
	<section id="main-footer" class="text-center text-white bg-inverse mt-4 p-4">
		<div class="container">
			<div class="row">
				<div class="col">
					<p class="lead">&copy; 2023 <a href="http://kalpeshshewale.tk">kalpeshshewale.tk</a></p>
				</div>
			</div>
		</div>
	</section>
</div>
</body>
</html>