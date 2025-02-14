package com.task;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;



/**
 * Servlet implementation class StudentControllerServlet
 */
@WebServlet("/StudentControllerServlet")
public class StudentControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private StudentDbUtil studentDbUtil;
	
	@Resource(name="jdbc/studentsdata")
	private DataSource dataSource;
	
	
	@Override
	public void init() throws ServletException {
		super.init();
		try {
		studentDbUtil = new StudentDbUtil(dataSource);
			}
		catch(Exception exc){
			throw new ServletException(exc);
			}
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// list the students
		try {
			
			//read command parameter
			String theCommand=request.getParameter("command");
			
			if (theCommand==null) {
				theCommand="LIST";
			}
			
			//route the appropriate method
			switch (theCommand) {
			case "LIST":
				listStudents(request,response);
				break;
			case "ADD":
				addStudent(request,response);
				break;
			case "LOAD":
				loadStudent(request,response);
				break;
			case "UPDATE":
				updateStudent(request,response);
				break;
			case "DELETE":
				deleteStudent(request,response);
				default:
					listStudents(request,response);
			}
		}
		catch(Exception exc){
			throw new ServletException(exc);
			
		}
		
	}
		
		
	private void deleteStudent(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//read student info
				int  id = Integer.parseInt(request.getParameter("studentId"));
				String firstName =request.getParameter("firstName");
				String lastName =request.getParameter("lastName");
				String email =request.getParameter("email");
				
				Student theStudent=new Student(id,firstName,lastName,email);
				
				studentDbUtil.deleteStudent(theStudent);
				
				listStudents(request,response);

			}		



	private void updateStudent(HttpServletRequest request, HttpServletResponse response)throws Exception {
		
		//read student info
		int  id = Integer.parseInt(request.getParameter("studentId"));
		String firstName =request.getParameter("firstName");
		String lastName =request.getParameter("lastName");
		String email =request.getParameter("email");
		
		Student theStudent=new Student(id,firstName,lastName,email);
		
		studentDbUtil.updateStudent(theStudent);
		
		listStudents(request,response);

	}


	private void loadStudent(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//read student id from form
		String theStudentId=request.getParameter("studentId");
		
		//get student from database
		Student theStudent=studentDbUtil.getStudent(theStudentId);
		
		//place student in the request attribute
		request.setAttribute("THE_STUDENT", theStudent);
		
		//display jsp 
		RequestDispatcher dispatcher=request.getRequestDispatcher("update-student-form.jsp");
		dispatcher.forward(request, response);
	}


	private void addStudent(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
			//read the student from form
			String firstName=request.getParameter("firstName");
			String lastName=request.getParameter("lastName");
			String email=request.getParameter("email");

			
			//create new object
			Student theStudent=new Student(firstName,lastName,email);
			
			//add the student to the database
			studentDbUtil.addStudent(theStudent);
			
			//send back to the main page
			listStudents(request,response);
		}



	private void listStudents(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List<Student>students=studentDbUtil.getStudents();
		
		request.setAttribute("STUDENT_LIST", students);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("list_students.jsp");
		
		dispatcher.forward(request, response);
	}

}
