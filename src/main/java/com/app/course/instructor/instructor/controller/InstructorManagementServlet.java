package com.app.course.instructor.instructor.controller;

import com.app.course.instructor.instructor.dao.InstructorDAO;
import com.app.course.instructor.instructor.model.Instructor;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.*;
import java.nio.file.Paths;

@WebServlet("/manageInstructor")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,  // 1MB
        maxFileSize = 1024 * 1024 * 5,    // 5MB
        maxRequestSize = 1024 * 1024 * 10 // 10MB
)
public class InstructorManagementServlet extends HttpServlet {
    private InstructorDAO instructorDAO;

    @Override
    public void init() {
        String path = getServletContext().getRealPath("/") + "data/instructors.txt";
        instructorDAO = new InstructorDAO(path);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        Instructor instructor = (Instructor) session.getAttribute("instructor");

        if (instructor == null) {
            response.sendRedirect("instructorLogin.jsp");
            return;
        }

        if ("delete".equals(action)) {
            request.getRequestDispatcher("confirmDelete.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Instructor instructor = (Instructor) session.getAttribute("instructor");
        String action = request.getParameter("action");

        if (instructor == null) {
            response.sendRedirect("instructorLogin.jsp");
            return;
        }

        if ("update".equals(action)) {
            try {
                // Handle profile update
                instructor.setFirstName(request.getParameter("firstName"));
                instructor.setLastName(request.getParameter("lastName"));
                instructor.setDob(request.getParameter("dob"));
                instructor.setPhone(request.getParameter("phone"));
                instructor.setQualification(request.getParameter("qualification"));
                instructor.setSpecialization(request.getParameter("specialization"));
                instructor.setExperience(Integer.parseInt(request.getParameter("experience")));
                instructor.setDepartment(request.getParameter("department"));
                instructor.setDesignation(request.getParameter("designation"));

                // Handle file upload
                Part filePart = request.getPart("profilePicture");
                if (filePart != null && filePart.getSize() > 0) {
                    String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                    String uploadPath = getServletContext().getRealPath("/") + "uploads";
                    File uploadDir = new File(uploadPath);
                    if (!uploadDir.exists()) {
                        uploadDir.mkdir();
                    }
                    filePart.write(uploadPath + File.separator + fileName);
                    instructor.setProfilePicture(fileName);
                }

                if (instructorDAO.updateInstructor(instructor)) {
                    session.setAttribute("instructor", instructor);
                    response.sendRedirect("instructorDashboard?success=Profile updated successfully");
                } else {
                    response.sendRedirect("instructorDashboard?error=Failed to update profile");
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("instructorDashboard?error=Error processing request");
            }
        } else if ("delete".equals(action)) {
            // Handle account deletion
            if (instructorDAO.deleteInstructor(instructor.getEmail())) {
                session.invalidate();
                response.sendRedirect("instructorLogin.jsp?msg=Account deleted successfully");
            } else {
                response.sendRedirect("instructorDashboard?error=Failed to delete account");
            }
        }
    }
}