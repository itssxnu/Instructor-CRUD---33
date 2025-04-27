package com.app.course.instructor.instructor.controller;

import com.app.course.instructor.instructor.model.Course;
import com.app.course.instructor.instructor.model.Instructor;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.*;
import java.util.*;

@WebServlet("/instructorDashboard")
public class InstructorDashboardServlet extends HttpServlet {

    private String coursesPath;
    private String enrollmentsPath;

    @Override
    public void init() {
        String base = getServletContext().getRealPath("/") + "data\\";
        coursesPath = base + "courses.txt";
        enrollmentsPath = base + "enrollments.txt";

        // Create files if they don't exist
        try {
            new File(coursesPath).createNewFile();
            new File(enrollmentsPath).createNewFile();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        Instructor instructor = (Instructor) session.getAttribute("instructor");

        if (instructor == null) {
            response.sendRedirect("instructorLogin.jsp");
            return;
        }

        List<Course> courses = new ArrayList<>();
        Map<String, Integer> studentCountMap = new HashMap<>();

        // Read all courses by this instructor
        try (BufferedReader br = new BufferedReader(new FileReader(coursesPath))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] tokens = line.split("\\|");
                if (tokens.length >= 6 && tokens[5].equals(instructor.getEmail())) {
                    courses.add(new Course(
                            tokens[0],  // courseId
                            tokens[1],  // title
                            tokens[2],  // description
                            tokens[3],  // startDate
                            tokens[4],  // endDate
                            tokens[5]   // instructorEmail
                    ));
                    studentCountMap.put(tokens[0], 0); // init count
                }
            }
        }

        // Count students enrolled for each course
        try (BufferedReader br = new BufferedReader(new FileReader(enrollmentsPath))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] tokens = line.split("\\|");
                if (tokens.length == 2) {
                    String courseId = tokens[1];
                    if (studentCountMap.containsKey(courseId)) {
                        studentCountMap.put(courseId, studentCountMap.get(courseId) + 1);
                    }
                }
            }
        }

        // Build list of counts in same order as course list
        List<Integer> studentCounts = new ArrayList<>();
        for (Course course : courses) {
            studentCounts.add(studentCountMap.get(course.getCourseId()));
        }

        request.setAttribute("courses", courses);
        request.setAttribute("studentCounts", studentCounts);

        RequestDispatcher dispatcher = request.getRequestDispatcher("instructorDashboard.jsp");
        dispatcher.forward(request, response);
    }
}
