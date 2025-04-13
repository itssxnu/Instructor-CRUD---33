package com.app.course.instructor.instructor.controller;

import com.app.course.instructor.instructor.dao.InstructorDAO;
import com.app.course.instructor.instructor.model.Instructor;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/InstructorListServlet")
public class InstructorListServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        InstructorDAO dao = new InstructorDAO();
        List<Instructor> instructors = dao.getAllInstructors();
        request.setAttribute("instructors", instructors);
        RequestDispatcher dispatcher = request.getRequestDispatcher("instructor-list.jsp");
        dispatcher.forward(request, response);
    }
}
