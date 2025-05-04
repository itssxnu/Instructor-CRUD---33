<%--
  Created by IntelliJ IDEA.
  User: sanus
  Date: 5/4/2025
  Time: 10:56 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.app.course.instructor.instructor.model.Instructor" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  Instructor instructor = (Instructor) session.getAttribute("instructor");
  if (instructor == null) {
    response.sendRedirect("instructorLogin.jsp");
    return;
  }
%>
<!DOCTYPE html>
<html>
<head>
  <title>Edit Instructor Profile</title>
  <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100">
<div class="max-w-2xl mx-auto p-6 bg-white mt-10 rounded-xl shadow-md">
  <h2 class="text-2xl font-bold mb-4">Edit Profile</h2>
  <form action="manageInstructor" method="post" enctype="multipart/form-data" class="space-y-4">
    <input type="hidden" name="action" value="update">

    <div>
      <label class="block font-medium">First Name</label>
      <input type="text" name="firstName" value="<%= instructor.getFirstName() %>" class="w-full p-2 border rounded" required>
    </div>
    <div>
      <label class="block font-medium">Last Name</label>
      <input type="text" name="lastName" value="<%= instructor.getLastName() %>" class="w-full p-2 border rounded" required>
    </div>
    <div>
      <label class="block font-medium">Date of Birth</label>
      <input type="date" name="dob" value="<%= instructor.getDob() %>" class="w-full p-2 border rounded" required>
    </div>
    <div>
      <label class="block font-medium">Phone</label>
      <input type="text" name="phone" value="<%= instructor.getPhone() %>" class="w-full p-2 border rounded" required>
    </div>
    <div>
      <label class="block font-medium">Qualification</label>
      <input type="text" name="qualification" value="<%= instructor.getQualification() %>" class="w-full p-2 border rounded">
    </div>
    <div>
      <label class="block font-medium">Specialization</label>
      <input type="text" name="specialization" value="<%= instructor.getSpecialization() %>" class="w-full p-2 border rounded">
    </div>
    <div>
      <label class="block font-medium">Experience (years)</label>
      <input type="number" name="experience" value="<%= instructor.getExperience() %>" class="w-full p-2 border rounded" min="0">
    </div>
    <div>
      <label class="block font-medium">Department</label>
      <input type="text" name="department" value="<%= instructor.getDepartment() %>" class="w-full p-2 border rounded">
    </div>
    <div>
      <label class="block font-medium">Designation</label>
      <input type="text" name="designation" value="<%= instructor.getDesignation() %>" class="w-full p-2 border rounded">
    </div>
    <div>
      <label class="block font-medium">Profile Picture</label>
      <input type="file" name="profilePicture" class="w-full p-2 border rounded">
      <% if (instructor.getProfilePicture() != null && !instructor.getProfilePicture().isEmpty()) { %>
      <img src="uploads/<%= instructor.getProfilePicture() %>" alt="Profile Picture" class="mt-2 h-24">
      <% } %>
    </div>

    <div class="flex justify-between items-center pt-4">
      <button type="submit" class="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700">
        Update Profile
      </button>
      <a href="instructorDashboard" class="text-gray-600 hover:underline">Cancel</a>
    </div>
  </form>
</div>
</body>
</html>

