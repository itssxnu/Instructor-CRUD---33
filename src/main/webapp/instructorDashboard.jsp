<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.app.course.instructor.instructor.model.Instructor" %>
<%@ page import="com.app.course.instructor.instructor.model.Course" %>
<%@ page import="com.app.course.instructor.instructor.model.Student" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDateTime" %>
<%
    Instructor instructor = (Instructor) session.getAttribute("instructor");
    List<Course> courses = (List<Course>) request.getAttribute("courses");
    List<Student> students = (List<Student>) request.getAttribute("students");

    // Create date formatters
    DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("MMM dd, yyyy");
    DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("hh:mm a");

    if (instructor == null) {
        response.sendRedirect("instructorLogin.jsp");
        return;
    }

    // Sort students by join date (newest first) if not null
    if (students != null) {
        students.sort((s1, s2) -> {
            LocalDateTime d1 = s1.getCreatedAt();
            LocalDateTime d2 = s2.getCreatedAt();
            return d2.compareTo(d1); // Descending order (newest first)
        });
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Instructor Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        .card-hover:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
        }
        .scrollable-table {
            max-height: 500px;
            overflow-y: auto;
        }
        .sticky-header th {
            position: sticky;
            top: 0;
            background-color: #f3f4f6;
            z-index: 10;
        }
    </style>
</head>
<body class="bg-gray-50 min-h-screen">
<% String success = request.getParameter("success"); %>
<% String error = request.getParameter("error"); %>

<% if (success != null) { %>
<div class="bg-green-100 border-l-4 border-green-500 text-green-700 p-4 mb-6" role="alert">
    <div class="flex items-center">
        <svg class="w-5 h-5 mr-2" fill="currentColor" viewBox="0 0 20 20">
            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
        </svg>
        <p><%= success %></p>
    </div>
</div>
<% } %>

<% if (error != null) { %>
<div class="bg-red-100 border-l-4 border-red-500 text-red-700 p-4 mb-6" role="alert">
    <div class="flex items-center">
        <svg class="w-5 h-5 mr-2" fill="currentColor" viewBox="0 0 20 20">
            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"/>
        </svg>
        <p><%= error %></p>
    </div>
</div>
<% } %>

<div class="container mx-auto px-4 py-6">
    <!-- Header Section -->
    <div class="flex flex-col md:flex-row justify-between items-start md:items-center mb-8 bg-white p-6 rounded-xl shadow-sm">
        <div>
            <h1 class="text-2xl font-bold text-indigo-800">Welcome, <%= instructor.getFirstName() %>!</h1>
            <p class="text-gray-600">Here's your dashboard overview</p>
        </div>
        <div class="flex space-x-2 mt-4 md:mt-0">
            <a href="manageInstructor?action=update"
               class="flex items-center bg-indigo-600 hover:bg-indigo-700 text-white px-4 py-2 rounded-lg transition">
                <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"/>
                </svg>
                Edit Profile
            </a>
            <a href="instructorLogout"
               class="flex items-center bg-gray-600 hover:bg-gray-700 text-white px-4 py-2 rounded-lg transition">
                <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"/>
                </svg>
                Logout
            </a>
        </div>
    </div>

    <!-- Main Content Grid -->
    <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
        <!-- Profile Card -->
        <div class="bg-white p-6 rounded-xl shadow-sm card-hover transition">
            <h2 class="text-xl font-semibold text-indigo-800 mb-4 flex items-center">
                <svg class="w-5 h-5 mr-2 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"/>
                </svg>
                Your Profile
            </h2>
            <div class="flex items-center space-x-4 mb-6">
                <div class="w-16 h-16 rounded-full bg-indigo-100 flex items-center justify-center overflow-hidden border-2 border-indigo-200">
                    <% if (instructor.getProfilePicture() != null && !instructor.getProfilePicture().isEmpty()) { %>
                    <img src="uploads/<%= instructor.getProfilePicture() %>" alt="Profile" class="w-full h-full object-cover">
                    <% } else { %>
                    <span class="text-indigo-600 text-2xl font-bold">
                        <%= instructor.getFirstName().charAt(0) %><%= instructor.getLastName().charAt(0) %>
                    </span>
                    <% } %>
                </div>
                <div>
                    <h3 class="font-bold text-lg text-gray-800"><%= instructor.getFirstName() %> <%= instructor.getLastName() %></h3>
                    <p class="text-gray-600 text-sm"><%= instructor.getEmail() %></p>
                </div>
            </div>
            <div class="space-y-4">
                <div class="bg-gray-50 p-3 rounded-lg">
                    <span class="text-xs font-medium text-gray-500 uppercase tracking-wider">Department</span>
                    <p class="font-medium text-gray-800"><%= instructor.getDepartment() %></p>
                </div>
                <div class="bg-gray-50 p-3 rounded-lg">
                    <span class="text-xs font-medium text-gray-500 uppercase tracking-wider">Designation</span>
                    <p class="font-medium text-gray-800"><%= instructor.getDesignation() %></p>
                </div>
                <div class="bg-gray-50 p-3 rounded-lg">
                    <span class="text-xs font-medium text-gray-500 uppercase tracking-wider">Specialization</span>
                    <p class="font-medium text-gray-800"><%= instructor.getSpecialization() %></p>
                </div>
                <div class="bg-gray-50 p-3 rounded-lg">
                    <span class="text-xs font-medium text-gray-500 uppercase tracking-wider">Experience</span>
                    <p class="font-medium text-gray-800"><%= instructor.getExperience() %> years</p>
                </div>
            </div>
        </div>

        <!-- Courses Card -->
        <div class="bg-white p-6 rounded-xl shadow-sm card-hover transition lg:col-span-2">
            <div class="flex justify-between items-center mb-4">
                <h2 class="text-xl font-semibold text-indigo-800 flex items-center">
                    <svg class="w-5 h-5 mr-2 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"/>
                    </svg>
                    Available Courses
                </h2>
                <span class="bg-indigo-100 text-indigo-800 text-xs font-medium px-2.5 py-0.5 rounded-full">
                    <%= courses != null ? courses.size() : 0 %> courses
                </span>
            </div>

            <% if (courses != null && !courses.isEmpty()) { %>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                <% for (Course course : courses) { %>
                <div class="border border-gray-200 rounded-lg p-4 hover:bg-gray-50 transition">
                    <div class="flex justify-between items-start">
                        <div>
                            <h3 class="font-medium text-lg text-gray-800"><%= course.getTitle() %></h3>
                            <p class="text-gray-500 text-xs mt-1">ID: <%= course.getCourseId() %></p>
                        </div>
                        <span class="bg-green-100 text-green-800 text-xs font-medium px-2.5 py-0.5 rounded-full">
                            $<%= course.getPrice() %>
                        </span>
                    </div>
                    <p class="text-gray-600 text-sm mt-2"><%= course.getDescription() %></p>
                    <div class="mt-3 flex items-center justify-between text-xs text-gray-500">
                        <span>
                            <svg class="w-3 h-3 inline mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                            </svg>
                            <%= course.getStartDate() %>
                        </span>
                        <span>to</span>
                        <span>
                            <svg class="w-3 h-3 inline mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                            </svg>
                            <%= course.getEndDate() %>
                        </span>
                    </div>
                </div>
                <% } %>
            </div>
            <% } else { %>
            <div class="text-center py-8">
                <svg class="mx-auto h-12 w-12 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9.172 16.172a4 4 0 015.656 0M9 10h.01M15 10h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
                </svg>
                <h3 class="mt-2 text-sm font-medium text-gray-900">No courses available</h3>
                <p class="mt-1 text-sm text-gray-500">There are currently no courses to display.</p>
            </div>
            <% } %>
        </div>

        <!-- Students Card -->
        <div class="bg-white p-6 rounded-xl shadow-sm card-hover transition lg:col-span-3">
            <div class="flex justify-between items-center mb-4">
                <h2 class="text-xl font-semibold text-indigo-800 flex items-center">
                    <svg class="w-5 h-5 mr-2 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z"/>
                    </svg>
                    Student Roster (Sorted by Join Date)
                </h2>
                <span class="bg-indigo-100 text-indigo-800 text-xs font-medium px-2.5 py-0.5 rounded-full">
                    <%= students != null ? students.size() : 0 %> students
                </span>
            </div>

            <div class="scrollable-table">
                <table class="min-w-full divide-y divide-gray-200">
                    <thead class="sticky-header">
                    <tr>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">ID</th>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Name</th>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Email</th>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Phone</th>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">School</th>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Grade</th>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Joined On</th>
                    </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200">
                    <% if (students != null && !students.isEmpty()) { %>
                    <% for (Student student : students) { %>
                    <tr class="hover:bg-gray-50">
                        <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900"><%= student.getId() %></td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-800">
                            <%= student.getFirstName() %> <%= student.getLastName() %>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500"><%= student.getEmail() %></td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500"><%= student.getContactNumber() %></td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500"><%= student.getSchool() %></td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500"><%= student.getGrade() %></td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                            <%= student.getCreatedAt().format(dateFormatter) %>
                            <span class="text-xs text-gray-400 block">
                                    <%= student.getCreatedAt().format(timeFormatter) %>
                                </span>
                        </td>
                    </tr>
                    <% } %>
                    <% } else { %>
                    <tr>
                        <td colspan="7" class="px-6 py-4 text-center text-sm text-gray-500">
                            <svg class="mx-auto h-12 w-12 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9.172 16.172a4 4 0 015.656 0M9 10h.01M15 10h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
                            </svg>
                            <h3 class="mt-2 text-sm font-medium text-gray-900">No students found</h3>
                            <p class="mt-1 text-sm text-gray-500">There are currently no students to display.</p>
                        </td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>