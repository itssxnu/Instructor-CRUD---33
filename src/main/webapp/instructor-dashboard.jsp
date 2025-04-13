<%--
  Created by IntelliJ IDEA.
  User: sanus
  Date: 4/13/2025
  Time: 7:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Instructor Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <div class="text-center mb-4">
        <h2>Instructor Dashboard</h2>
        <p class="text-muted">Welcome! Choose an action below.</p>
    </div>

    <div class="row text-center">
        <div class="col-md-4 mb-3">
            <div class="card p-3 shadow-sm">
                <h5>Manage Instructors</h5>
                <a href="instructors" class="btn btn-outline-primary mt-2">View All</a>
            </div>
        </div>
        <div class="col-md-4 mb-3">
            <div class="card p-3 shadow-sm">
                <h5>Manage Courses</h5>
                <a href="add-course.jsp" class="btn btn-outline-secondary mt-2">Add Course</a>
            </div>
        </div>
        <div class="col-md-4 mb-3">
            <div class="card p-3 shadow-sm">
                <h5>Student List</h5>
                <a href="students.jsp" class="btn btn-outline-success mt-2">View Students</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>

