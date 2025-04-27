<%--
  Created by IntelliJ IDEA.
  User: sanus
  Date: 4/24/2025
  Time: 10:00 PM
  To change this template use File | Settings | File Templates.
--%><%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%
  List<String> students = (List<String>) request.getAttribute("students");
  String courseId = (String) request.getAttribute("courseId");
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Enrolled Students</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gradient-to-r from-indigo-100 to-purple-100 min-h-screen">
<div class="container mx-auto p-6">
  <div class="bg-white p-6 rounded-2xl shadow-lg max-w-2xl mx-auto">
    <div class="flex justify-between items-center mb-6">
      <h2 class="text-xl font-semibold text-indigo-600">
        Students Enrolled in Course <%= courseId %>
      </h2>
      <a href="instructorDashboard"
         class="bg-gray-500 hover:bg-gray-600 text-white px-4 py-2 rounded-lg">
        Back to Dashboard
      </a>
    </div>

    <% if (students.isEmpty()) { %>
    <p class="text-gray-500">No students enrolled in this course yet.</p>
    <% } else { %>
    <div class="border border-gray-200 rounded-lg overflow-hidden">
      <table class="min-w-full divide-y divide-gray-200">
        <thead class="bg-gray-50">
        <tr>
          <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
            Student ID
          </th>
        </tr>
        </thead>
        <tbody class="bg-white divide-y divide-gray-200">
        <% for (String studentId : students) { %>
        <tr>
          <td class="px-6 py-4 whitespace-nowrap">
            <%= studentId %>
          </td>
        </tr>
        <% } %>
        </tbody>
      </table>
    </div>
    <% } %>
  </div>
</div>
</body>
</html>
