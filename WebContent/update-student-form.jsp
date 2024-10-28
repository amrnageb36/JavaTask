<!DOCTYPE html>

<html>

<head>
	<title>Update Student</title>
	
	<link rel="stylesheet" href="css/bootstrap.min.css">
	
	<link  rel="stylesheet" href="css/style.css">
	
</head>

<body>
	<script type="bootstrap.bundle.min.js"></script>
	<script src="js/main.js"></script>

	<div class="container text-center ">
		<div >
			<h1 class="bg-secondary text-light"><i><b>FooBar University</b></i></h1>
		</div>
	</div>

	<div class="container ">
		<hr class="border border-primary border-2 opacity-50">
		<h3><b><i>Update Student form</i></b></h3>
		<hr class="border border-primary border-2 opacity-50">
	</div>
	<div class="container ">
		<form  action="StudentControllerServlet" method="GET">
			
			<input type="hidden" name="command" value="UPDATE">
			
			<input type="hidden" name="studentId" value="${THE_STUDENT.id }">
			
			
					<div class="form-group" >
						<label>First name:</label>
						<input class="form-control" type="text" name="firstName" value="${THE_STUDENT.firstName }">
					</div>
					<div class="form-group">
						<label >Last name:</label>
						<input class="form-control" type="text" name="lastName" value="${THE_STUDENT.lastName }">
					</div>
					<div class="form-group">
						<label >email: </label>
						<input class="form-control" type="text" name="email" value="${THE_STUDENT.email }">
					</div>
					
					
			
			
			<hr>
			<br>
			<input type="submit" value="Save" name="save" class="btn btn-success ">
			
		</form>
		</div>
</body>






</html>