<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>

<!DOCTYPE html>
<html>

<head>
	<title>Student Tracker App</title>	
	<link rel="stylesheet" href="css/bootstrap.min.css">
	
	<link  rel="stylesheet" href="css/style.css">
	
</head>



<body>
	<script type="bootstrap.bundle.min.js"></script>
	<script src="js/main.js"></script>

	<div class="container text-center" >
		<div class="row">
			<h2 class="bg-secondary text-light" >FooBar University</h2>
			<br>
		</div>
	</div>

	<div class="container">
	
		<div class="row">
		
		<hr>

			<table border="1" class="table table-secondary table-striped" >
			
				<tr class="table table-dark">
					<th>id</th>
					<th>First Name</th>
					<th>Last Name</th>	
					<th>Email</th>
					<th>Action</th>
					
				</tr>
				
				<c:forEach var="tempStudent" items="${STUDENT_LIST }">
					<c:url var="tempLink" value="StudentControllerServlet">
						<c:param name="command" value="LOAD"/>
						<c:param name="studentId" value="${tempStudent.id }"/>
					</c:url>
					<c:url var="deleteLink" value="StudentControllerServlet">
						<c:param name="command" value="DELETE"/>
						<c:param name="studentId" value="${tempStudent.id }"/>
					</c:url>
					
					<tr>
						<td> ${ tempStudent.id } </td>
						<td> ${ tempStudent.firstName } </td>
						<td> ${ tempStudent.lastName } </td>
						<td> ${ tempStudent.email } </td>
						<td><a href="${tempLink}" class="link link-info">Update</a>
						    |
						    <a href="${deleteLink}" class="link link-danger">Delete</a>
						</td>
						
					</tr>
				
				</c:forEach>
				
			</table>
		
		</div>
		<hr>
		<br>
	<a href="add-student-form.jsp" class="alert alert-dark">Add Student</a>
	</div>
</body>


</html>








