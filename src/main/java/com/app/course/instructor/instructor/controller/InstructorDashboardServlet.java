package com.app.course.instructor.instructor.controller;

import com.app.course.instructor.instructor.dao.CourseDAO;
import com.app.course.instructor.instructor.model.Course;
import com.app.course.instructor.instructor.model.Instructor;
import com.app.course.instructor.instructor.model.Student;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.*;
import java.util.*;

@WebServlet("/instructorDashboard")
public class InstructorDashboardServlet extends HttpServlet {
    private CourseDAO courseDAO;

    @Override
    public void init() {
        String base = getServletContext().getRealPath("/") + "data\\";
        courseDAO = new CourseDAO(base + "courses.txt", base + "enrollments.txt");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Instructor instructor = (Instructor) session.getAttribute("instructor");

        if (instructor == null) {
            response.sendRedirect("instructorLogin.jsp");
            return;
        }

        List<Course> courses = courseDAO.getAllCourses();
        List<Student> students = courseDAO.getAllStudents();

        request.setAttribute("courses", courses);
        request.setAttribute("students", students);

        request.getRequestDispatcher("instructorDashboard.jsp")
                .forward(request, response);
    }
}