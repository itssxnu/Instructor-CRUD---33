<%--
  Created by IntelliJ IDEA.
  User: sanus
  Date: 4/13/2025
  Time: 7:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@ page import="java.util.*,
com.app.course.instructor.instructor.model.Instructor"
%>

<%
  List<Instructor> instructors = (List<Instructor>) request.getAttribute("instructors");
%>

<!DOCTYPE html>
<html>
<head>
  <title>Instructor List</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
  <h2 class="text-center mb-4">All Instructors</h2>

  <table class="table table-bordered table-striped shadow-sm">
    <thead class="table-dark">
    <tr>
      <th>Name</th>
      <th>NIC</th>
      <th>Email</th>
      <th>Phone</th>
      <th>Department</th>
      <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <%
      if (instructors != null) {
        for (Instructor i : instructors) {
    %>
    <tr>
      <td><%= i.getFirstName() %> <%= i.getLastName() %></td>
      <td><%= i.getNic() %></td>
      <td><%= i.getEmail() %></td>
      <td><%= i.getPhone() %></td>
      <td><%= i.getDepartment() %></td>
      <td>
        <a href="delete-instructor?id=<%= i.getId() %>" class="btn btn-danger btn-sm">Delete</a>
      </td>
    </tr>
    <%
        }
      }
    %>
    </tbody>
  </table>

  <a href="instructor-signup.jsp" class="btn btn-success">Add New Instructor</a>
</div>
</body>
</html>

