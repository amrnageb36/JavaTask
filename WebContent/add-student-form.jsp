<!DOCTYPE html>

<html>

<head>
	<title>Add Student</title>
	
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link  rel="stylesheet" href="css/style.css">
	
</head>

<body>
	<script type="bootstrap.bundle.min.js"></script>
	<script src="js/main.js"></script>

	<div >
		<div class="container text-center "  >
			<h1 class="bg-secondary text-light"><b><i>FooBar University</i></b></h1>
			
		</div>
	</div>
	<div class="container " >
		<hr class="border border-primary border-2 opacity-50">
	
		<h3 ><b><i>Add Student form</i></b></h3>
		<hr class="border border-primary border-2 opacity-50">
		</div>
		<div class="container">
		<form action="StudentControllerServlet" method="GET" >
			
			<input type="hidden" name="command" value="ADD">
			
					<div class="form-group">
						<label>First name:</label>
						<input class="form-control" type="text" name="firstName" placeholder="First name">
					</div>
					<div>
						<label>Last name:</label>
						<input class="form-control" type="text" name="lastName" placeholder="Last name">
					</div>
					<div>
						<label>Email :</label>
						<input class="form-control" type="text" name="email" placeholder="Email">
					</div>
					
					
			
			
			<hr>
			<br>
			<input type="submit" value="Save" name="save" class="btn btn-success">
			
		</form>
	</div>
</body>






</html>