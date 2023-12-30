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
	<nav class="navbar navbar-toggleable-sm navbar-inverse bg-inverse p-0">
		<div class="container">
			<button class="navbar-toggler toggler-right" data-target="#mynavbar" data-toggle="collapse">
				<span class="navbar-toggler-icon"></span>
			</button>
			<a href="index.jsp" class="navbar-brand mr-3">Leave Management System</a>
		</div>
	</nav>
	<header id="main-header" class="bg-primary py-2 text-white">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<h1><i class="fa fa-user"></i> User Login</h1>
				</div>
			</div>
		</div>
	</header>
	<section id="sections" class="py-4 mb-4 bg-faded">
		<div class="container">
			<div class="row">
				
				
			</div>
		</div>
	</section>
	<section id="post">
		<div class="container">
			<div class="row">
				<div class="col-md-6 offset-md-3">
					<div class="card">
						<div class="card-header">
							<h5>Employee Login</h5>
						</div>
						<div class="card-body p-3">
							<form action="login.jsp" method="POST">
								<label class="form-control-label">Email</label>
								<input type="email" name="email" class="form-control"  />
								<br />
								<label class="form-control-label">Password</label>
								<input type="password" name="pass" class="form-control"  />
								<br />
								<input type="submit" name="submit" class="btn btn-success" style="border-radius:0%;" value="Log In" />
                                <p>Are you Admin? <a href="http://localhost:8080/SimpleOnlineLeave//admin">login</a></p>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<br><br><br><br>
	<section id="main-footer" class="text-center text-white bg-inverse mt-4 p-4">
		<div class="container">
			<div class="row">
				<div class="col">
					<p class="lead">&copy; 2023 <a href="http://kalpeshshewale.tk">kalpeshshewale.tk</a></p>
				</div>
			</div>
		</div>
	</section>
</body>
</html>