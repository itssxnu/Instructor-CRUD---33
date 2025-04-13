package com.app.course.instructor.instructor.controller;

import com.app.course.instructor.instructor.model.Instructor;
import com.app.course.instructor.instructor.dao.InstructorDAO;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.UUID;

@WebServlet("/InstructorSignupServlet")
public class InstructorSignupServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = UUID.randomUUID().toString();  // Generate unique ID

        Instructor instructor = new Instructor(
                id,
                request.getParameter("firstName"),
                request.getParameter("lastName"),
                request.getParameter("dob"),
                request.getParameter("gender"),
                request.getParameter("nationality"),
                request.getParameter("nic"),
                request.getParameter("profilePic"),  // You might need file upload logic if it's a real image
                request.getParameter("phone"),
                request.getParameter("qualification"),
                request.getParameter("expertise"),
                Integer.parseInt(request.getParameter("experience")),
                request.getParameter("department"),
                request.getParameter("designation"),
                request.getParameter("email"),
                request.getParameter("password")
        );

        InstructorDAO dao = new InstructorDAO();
        dao.saveInstructor(instructor);

        response.sendRedirect("instructor-list.jsp");  // or dashboard
    }
}

