<%--
  Created by IntelliJ IDEA.
  User: sanus
  Date: 4/13/2025
  Time: 7:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Instructor Signup</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
  <h2 class="mb-4 text-center">Instructor Signup</h2>
  <form action="InstructorSignupServlet" method="post" class="card p-4 shadow-sm">
    <div class="row">
      <div class="mb-3 col-md-6">
        <label>First Name</label>
        <input type="text" name="firstName" class="form-control" required>
      </div>
      <div class="mb-3 col-md-6">
        <label>Last Name</label>
        <input type="text" name="lastName" class="form-control" required>
      </div>
    </div>

    <div class="row">
      <div class="mb-3 col-md-4">
        <label>Date of Birth</label>
        <input type="date" name="dob" class="form-control" required>
      </div>
      <div class="mb-3 col-md-4">
        <label>Gender</label>
        <select name="gender" class="form-select" required>
          <option value="Male">Male</option>
          <option value="Female">Female</option>
        </select>
      </div>
      <div class="mb-3 col-md-4">
        <label>Nationality</label>
        <input type="text" name="nationality" class="form-control" required>
      </div>
    </div>

    <div class="row">
      <div class="mb-3 col-md-6">
        <label>NIC</label>
        <input type="text" name="nic" class="form-control" required>
      </div>
      <div class="mb-3 col-md-6">
        <label>Phone</label>
        <input type="text" name="phone" class="form-control" required>
      </div>
    </div>

    <div class="mb-3">
      <label>Profile Picture URL</label>
      <input type="text" name="profilePic" class="form-control" placeholder="Enter image URL">
    </div>

    <div class="row">
      <div class="mb-3 col-md-6">
        <label>Qualification</label>
        <input type="text" name="qualification" class="form-control" required>
      </div>
      <div class="mb-3 col-md-6">
        <label>Expertise</label>
        <input type="text" name="expertise" class="form-control" required>
      </div>
    </div>

    <div class="row">
      <div class="mb-3 col-md-6">
        <label>Experience (Years)</label>
        <input type="number" name="experience" class="form-control" required>
      </div>
      <div class="mb-3 col-md-6">
        <label>Department</label>
        <input type="text" name="department" class="form-control" required>
      </div>
    </div>

    <div class="row">
      <div class="mb-3 col-md-6">
        <label>Designation</label>
        <input type="text" name="designation" class="form-control" required>
      </div>
      <div class="mb-3 col-md-6">
        <label>Email</label>
        <input type="email" name="email" class="form-control" required>
      </div>
    </div>

    <div class="mb-3">
      <label>Password</label>
      <input type="password" name="password" class="form-control" required>
    </div>

    <div class="d-grid">
      <button type="submit" class="btn btn-primary">Sign Up</button>
    </div>
  </form>
</div>
</body>
</html>

