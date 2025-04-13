package com.app.course.instructor.instructor.controller;

import com.app.course.instructor.instructor.dao.InstructorDAO;
import com.app.course.instructor.instructor.model.Instructor;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/DeleteInstructorServlet")
public class DeleteInstructorServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String idToDelete = request.getParameter("id");

        InstructorDAO dao = new InstructorDAO();
        List<Instructor> instructors = dao.getAllInstructors();
        instructors.removeIf(i -> i.getId().equals(idToDelete));
        dao.updateInstructors(instructors);

        response.sendRedirect("InstructorListServlet");
    }
}
