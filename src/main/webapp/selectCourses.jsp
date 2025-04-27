<%--
  Created by IntelliJ IDEA.
  User: sanus
  Date: 4/25/2025
  Time: 12:04 PM
  To change this template use File | Settings | File Templates.
--%><%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.app.course.instructor.instructor.model.Course" %>
<%@ page import="java.util.List" %>
<%
  List<Course> predefinedCourses = (List<Course>) request.getAttribute("predefinedCourses");
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Select Courses</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gradient-to-r from-indigo-100 to-purple-100 min-h-screen">
<div class="container mx-auto p-6">
  <div class="bg-white p-6 rounded-2xl shadow-lg max-w-4xl mx-auto">
    <h2 class="text-xl font-semibold text-indigo-600 mb-6">Available Courses</h2>
    <form action="manageCourse" method="post">
      <input type="hidden" name="action" value="addPredefined">

      <div class="space-y-4 mb-6">
        <% for (Course course : predefinedCourses) { %>
        <div class="border border-gray-200 rounded-lg p-4 hover:bg-gray-50">
          <div class="flex items-start">
            <input type="checkbox" name="selectedCourses"
                   value="<%= course.getCourseId() %>"
                   class="mt-1 mr-3">
            <div>
              <h3 class="font-medium text-lg"><%= course.getTitle() %></h3>
              <p class="text-gray-600"><%= course.getDescription() %></p>
              <div class="flex space-x-4 mt-2 text-sm">
                <span>ID: <%= course.getCourseId() %></span>
                <span>Start: <%= course.getStartDate() %></span>
                <span>End: <%= course.getEndDate() %></span>
              </div>
            </div>
          </div>
        </div>
        <% } %>
      </div>

      <button type="submit"
              class="w-full bg-indigo-600 text-white font-semibold py-2 px-4 rounded hover:bg-indigo-700">
        Add Selected Courses
      </button>
    </form>
  </div>
</div>
</body>
</html>