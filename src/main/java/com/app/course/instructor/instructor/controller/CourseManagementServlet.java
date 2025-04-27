package com.app.course.instructor.instructor.controller;

import com.app.course.instructor.instructor.dao.CourseDAO;
import com.app.course.instructor.instructor.model.Course;
import com.app.course.instructor.instructor.model.Instructor;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.*;
import java.util.*;

@WebServlet("/manageCourse")
public class CourseManagementServlet extends HttpServlet {
    private CourseDAO courseDAO;

    @Override
    public void init() {
        String basePath = getServletContext().getRealPath("/") + "data/";
        String coursesPath = basePath + "courses.txt";
        String enrollmentsPath = basePath + "enrollments.txt";
        courseDAO = new CourseDAO(coursesPath, enrollmentsPath);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String courseId = request.getParameter("courseId");

        if ("viewStudents".equals(action) && courseId != null) {
            List<String> students = courseDAO.getEnrolledStudents(courseId);
            request.setAttribute("students", students);
            request.setAttribute("courseId", courseId);
            request.getRequestDispatcher("viewStudents.jsp").forward(request, response);
        } else if ("edit".equals(action) && courseId != null) {
            // Find the course to edit
            List<Course> courses = courseDAO.getCoursesByInstructor(
                    ((Instructor)request.getSession().getAttribute("instructor")).getEmail());
            Course courseToEdit = courses.stream()
                    .filter(c -> c.getCourseId().equals(courseId))
                    .findFirst()
                    .orElse(null);

            if (courseToEdit != null) {
                request.setAttribute("course", courseToEdit);
                request.getRequestDispatcher("editCourse.jsp").forward(request, response);
            } else {
                response.sendRedirect("instructorDashboard");
            }
        }
        else if ("select".equals(action)) {
            List<Course> predefinedCourses = courseDAO.getAllPredefinedCourses();
            request.setAttribute("predefinedCourses", predefinedCourses);
            request.getRequestDispatcher("selectCourses.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Instructor instructor = (Instructor) session.getAttribute("instructor");

        if (instructor == null) {
            response.sendRedirect("instructorLogin.jsp");
            return;
        }

        String action = request.getParameter("action");
        String courseId = request.getParameter("courseId");
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");

        if ("edit".equals(action)) {
            // Handle course update
            Course updatedCourse = new Course(
                    courseId,
                    title,
                    description,
                    startDate,
                    endDate,
                    instructor.getEmail()
            );

            if (courseDAO.updateCourse(updatedCourse)) {
                response.sendRedirect("instructorDashboard?success=Course updated successfully");
            } else {
                response.sendRedirect("instructorDashboard?error=Failed to update course");
            }
        } else if ("addPredefined".equals(action)) {
            String[] selectedCourseIds = request.getParameterValues("selectedCourses");
            if (selectedCourseIds != null && selectedCourseIds.length > 0) {
                List<Course> predefinedCourses = courseDAO.getAllPredefinedCourses();
                int successCount = 0;

                for (String courseID : selectedCourseIds) {
                    for (Course course : predefinedCourses) {
                        if (course.getCourseId().equals(courseID)) {
                            if (courseDAO.assignCourseToInstructor(course, instructor.getEmail())) {
                                successCount++;
                            }
                            break;
                        }
                    }
                }

                if (successCount > 0) {
                    response.sendRedirect("instructorDashboard?success=" + successCount + " courses added successfully");
                } else {
                    response.sendRedirect("instructorDashboard?error=Failed to add courses");
                }
            } else {
                response.sendRedirect("instructorDashboard?error=No courses selected");
            }
        } else {
            response.sendRedirect("instructorDashboard?error=Invalid action");
        }
    }
}
