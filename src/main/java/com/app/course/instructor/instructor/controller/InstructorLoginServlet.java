package com.app.course.instructor.instructor.controller;

import com.app.course.instructor.instructor.dao.InstructorDAO;
import com.app.course.instructor.instructor.model.Instructor;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.*;

@WebServlet("/instructorLogin")
public class InstructorLoginServlet extends HttpServlet {
    private InstructorDAO instructorDAO;

    @Override
    public void init() {
        String path = getServletContext().getRealPath("/") + "data/instructors.txt";
        instructorDAO = new InstructorDAO(path);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Instructor instructor = instructorDAO.validateLogin(email, password);

        if (instructor != null) {
            HttpSession session = request.getSession();
            session.setAttribute("instructor", instructor);
            response.sendRedirect("instructorDashboard.jsp");
        } else {
            response.sendRedirect("instructorLogin.jsp?error=Invalid credentials");
        }
    }
}
