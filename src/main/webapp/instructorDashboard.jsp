<%--
  Created by IntelliJ IDEA.
  User: sanus
  Date: 4/24/2025
  Time: 3:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.app.course.instructor.instructor.model.Instructor" %>
<%@ page import="com.app.course.instructor.instructor.model.Course" %>
<%@ page import="java.util.List" %>
<%
    Instructor instructor = (Instructor) session.getAttribute("instructor");
    List<Course> courses = (List<Course>) request.getAttribute("courses");
    List<Integer> studentCounts = (List<Integer>) request.getAttribute("studentCounts");

    if (instructor == null) {
        response.sendRedirect("instructorLogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Instructor Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gradient-to-r from-indigo-100 to-purple-100 min-h-screen">
<% String success = request.getParameter("success"); %>
<% String error = request.getParameter("error"); %>

<% if (success != null) { %>
<div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative mb-4" role="alert">
    <span class="block sm:inline"><%= success %></span>
</div>
<% } %>

<% if (error != null) { %>
<div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative mb-4" role="alert">
    <span class="block sm:inline"><%= error %></span>
</div>
<% } %>

<div class="container mx-auto p-6">
    <div class="flex justify-between items-center mb-8 bg-white p-4 rounded-lg shadow">
        <h1 class="text-2xl font-bold text-indigo-700">Welcome, <%= instructor.getFirstName() %>!</h1>
        <div class="flex space-x-2">
            <a href="manageInstructor?action=edit"
               class="bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded-lg transition">
                Edit Profile
            </a>
            <a href="manageInstructor?action=delete"
               class="bg-red-500 hover:bg-red-600 text-white px-4 py-2 rounded-lg transition">
                Delete Account
            </a>
            <a href="instructorLogout"
               class="bg-gray-500 hover:bg-gray-600 text-white px-4 py-2 rounded-lg transition">
                Logout
            </a>
        </div>
    </div>

    <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
        <div class="bg-white p-6 rounded-2xl shadow-lg">
            <h2 class="text-xl font-semibold text-indigo-600 mb-4">Your Courses</h2>
            <div class="mb-4">
                <a href="manageCourse?action=select"
                   class="bg-purple-500 hover:bg-purple-600 text-white px-4 py-2 rounded-lg inline-block">
                    + Add Courses
                </a>
            </div>
            <div class="space-y-3">
                <% if (courses != null && !courses.isEmpty()) { %>
                <% for (int i = 0; i < courses.size(); i++) {
                    Course course = courses.get(i);
                %>
                <div class="border border-gray-200 rounded-lg p-4 hover:bg-gray-50 transition">
                    <h3 class="font-medium text-lg"><%= course.getTitle() %></h3>
                    <p class="text-gray-500 text-sm mt-1">Course ID: <%= course.getCourseId() %></p>
                    <div class="mt-3 flex space-x-2">
                        <a href="manageCourse?action=viewStudents&courseId=<%= course.getCourseId() %>"
                           class="text-sm bg-green-500 text-white px-3 py-1 rounded hover:bg-green-600">
                            View Students (<%= studentCounts.get(i) %>)
                        </a>
                    </div>
                </div>
                <% } %>
                <% } else { %>
                <p class="text-gray-500">No courses assigned</p>
                <% } %>
            </div>
        </div>

        <div class="bg-white p-6 rounded-2xl shadow-lg">
            <h2 class="text-xl font-semibold text-indigo-600 mb-4">Student Enrollment</h2>
            <div class="space-y-4">
                <% if (courses != null && !courses.isEmpty()) { %>
                <% for (int i = 0; i < courses.size(); i++) { %>
                <div class="border border-gray-200 rounded-lg p-4">
                    <div class="flex justify-between items-center">
                        <h3 class="font-medium"><%= courses.get(i).getTitle() %></h3>
                        <span class="bg-indigo-100 text-indigo-800 px-3 py-1 rounded-full text-sm font-medium">
                                    <%= studentCounts.get(i) %> students
                                </span>
                    </div>
                    <div class="mt-3 bg-gray-200 rounded-full h-2.5">
                        <div class="bg-indigo-600 h-2.5 rounded-full"
                             style="width: <%= (studentCounts.get(i) / 30.0) * 100 %>%"></div>
                    </div>
                </div>
                <% } %>
                <% } else { %>
                <p class="text-gray-500">No enrollment data available</p>
                <% } %>
            </div>
        </div>

        <div class="bg-white p-6 rounded-2xl shadow-lg">
            <h2 class="text-xl font-semibold text-indigo-600 mb-4">Your Profile</h2>
            <div class="flex items-center space-x-4 mb-4">
                <div class="w-16 h-16 rounded-full bg-indigo-100 flex items-center justify-center overflow-hidden">
                    <% if (instructor.getProfilePicture() != null && !instructor.getProfilePicture().isEmpty()) { %>
                    <img src="uploads/<%= instructor.getProfilePicture() %>" alt="Profile" class="w-full h-full object-cover">
                    <% } else { %>
                    <span class="text-indigo-600 text-2xl font-bold">
                            <%= instructor.getFirstName().charAt(0) %><%= instructor.getLastName().charAt(0) %>
                        </span>
                    <% } %>
                </div>
                <div>
                    <h3 class="font-bold text-lg"><%= instructor.getFirstName() %> <%= instructor.getLastName() %></h3>
                    <p class="text-gray-600"><%= instructor.getEmail() %></p>
                </div>
            </div>
            <div class="space-y-3">
                <div>
                    <span class="text-sm text-gray-500">Department</span>
                    <p class="font-medium"><%= instructor.getDepartment() %></p>
                </div>
                <div>
                    <span class="text-sm text-gray-500">Designation</span>
                    <p class="font-medium"><%= instructor.getDesignation() %></p>
                </div>
                <div>
                    <span class="text-sm text-gray-500">Specialization</span>
                    <p class="font-medium"><%= instructor.getSpecialization() %></p>
                </div>
                <div>
                    <span class="text-sm text-gray-500">Experience</span>
                    <p class="font-medium"><%= instructor.getExperience() %> years</p>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>