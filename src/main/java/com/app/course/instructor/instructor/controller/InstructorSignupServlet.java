package com.app.course.instructor.instructor.controller;

import com.app.course.instructor.instructor.dao.InstructorDAO;
import com.app.course.instructor.instructor.model.Instructor;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.*;

@WebServlet("/instructorSignup")
@MultipartConfig
public class InstructorSignupServlet extends HttpServlet {
    private InstructorDAO instructorDAO;

    @Override
    public void init() {
        String path = getServletContext().getRealPath("/") + "data/instructors.txt";
        instructorDAO = new InstructorDAO(path);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Instructor instructor = new Instructor();

        instructor.setFirstName(request.getParameter("firstName"));
        instructor.setLastName(request.getParameter("lastName"));
        instructor.setDob(request.getParameter("dob"));
        instructor.setGender(request.getParameter("gender"));
        instructor.setNationality(request.getParameter("nationality"));
        instructor.setNic(request.getParameter("nic"));

        // File upload (Profile Picture)
        Part filePart = request.getPart("profilePicture");
        String fileName = filePart.getSubmittedFileName();
        String uploadPath = getServletContext().getRealPath("/") + "uploads/";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();
        filePart.write(uploadPath + fileName);

        instructor.setProfilePicture("uploads/" + fileName);
        instructor.setPhone(request.getParameter("phone"));
        instructor.setQualification(request.getParameter("qualification"));
        instructor.setSpecialization(request.getParameter("specialization"));
        instructor.setExperience(Integer.parseInt(request.getParameter("experience")));
        instructor.setDepartment(request.getParameter("department"));
        instructor.setDesignation(request.getParameter("designation"));
        instructor.setEmail(request.getParameter("email"));
        instructor.setPassword(request.getParameter("password"));

        boolean success = instructorDAO.registerInstructor(instructor);

        if (success) {
            response.sendRedirect("instructorLogin.jsp?msg=Registered successfully");
        } else {
            response.sendRedirect("instructorSignup.jsp?error=Registration failed");
        }
    }
}
